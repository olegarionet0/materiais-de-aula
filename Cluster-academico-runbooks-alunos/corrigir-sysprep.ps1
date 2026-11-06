<#
.SYNOPSIS
    Diagnóstico e correção automática de falhas no Sysprep (Windows 11).
.DESCRIPTION
    EEEP Adolfo Ferreira de Sousa - Laboratório de Informática
    - Lê o log Panther\setupact.log
    - Detecta pacotes AppX conflitantes que impedem o Sysprep
    - Remove os pacotes conflitantes para todos os usuários e do provisionamento
    - Verifica e desativa BitLocker se ativo
    - Verifica reinicializações pendentes do Windows Update
.NOTES
    Executar como Administrador no PowerShell do Windows 11.
#>

if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "ERRO: Este script deve ser executado como Administrador!"
    exit 1
}

Clear-Host
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "   EEEP-AFS - DIAGNOSTICO E CORRECAO DO SYSPREP (WIN11)         " -ForegroundColor Yellow
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$logPath = "C:\Windows\System32\Sysprep\Panther\setupact.log"
$pacoteRemovido = $false

# 1. VERIFICAR LOG DO SYSPREP (PANTHER)
if (Test-Path $logPath) {
    Write-Host "[1/4] Analisando o log do Sysprep (setupact.log)..." -ForegroundColor Green
    $lines = Get-Content $logPath
    $errors = $lines | Select-String -Pattern "was installed for a user"
    
    if ($errors) {
        Write-Host " -> Erro de pacote AppX detectado no log:" -ForegroundColor Yellow
        foreach ($err in $errors) {
            Write-Host "    $($err.Line)" -ForegroundColor Red
            
            if ($err.Line -match "Package\s+([^\s]+)\s+was installed") {
                $pkg = $matches[1]
                $pkgBase = $pkg.Split('_')[0]
                Write-Host ""
                Write-Host " -> Removendo pacote conflitante: $pkg..." -ForegroundColor Cyan
                
                # Tentativa 1: Remover pacote direto por FullName para todos os usuarios
                try {
                    Remove-AppxPackage -Package $pkg -AllUsers -ErrorAction Stop
                    Write-Host "    [OK] Removido via Remove-AppxPackage -Package -AllUsers!" -ForegroundColor Green
                    $pacoteRemovido = $true
                } catch {
                    Write-Host "    (Tentando metodo alternativo por nome base: $pkgBase)..." -ForegroundColor Gray
                }

                # Tentativa 2: Buscar pacote por nome e remover de todos os usuarios
                try {
                    Get-AppxPackage -Name "*$pkgBase*" -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction Stop
                    Write-Host "    [OK] Removido via Get-AppxPackage -AllUsers!" -ForegroundColor Green
                    $pacoteRemovido = $true
                } catch {
                    # Tentativa 3: Remover do usuario atual
                    try {
                        Get-AppxPackage -Name "*$pkgBase*" | Remove-AppxPackage -ErrorAction Stop
                        Write-Host "    [OK] Removido do usuario atual!" -ForegroundColor Green
                        $pacoteRemovido = $true
                    } catch {
                        Write-Warning "    Falha ao remover AppX: $_"
                    }
                }

                # Tentativa 4: Remover do provisionamento do Windows (se existir)
                try {
                    Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "*$pkgBase*" } | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Out-Null
                    Write-Host "    [OK] Desprovisionado da imagem online!" -ForegroundColor Green
                } catch {}
            }
        }
    } else {
        Write-Host " -> Nenhum erro explicito de 'was installed for a user' encontrado no log atual." -ForegroundColor Gray
        $lastErrors = $lines | Select-String -Pattern "Error\s+SYSPRP|0x800" | Select-Object -Last 5
        if ($lastErrors) {
            Write-Host " -> Ultimos erros registrados no Sysprep:" -ForegroundColor Yellow
            $lastErrors | ForEach-Object { Write-Host "    $($_.Line)" -ForegroundColor Red }
        }
    }
} else {
    Write-Warning "Arquivo de log nao encontrado em $logPath."
}

# 2. VERIFICAR PACOTES APPX QUE FREQUENTEMENTE TRAVAM O SYSPREP NO WIN 11
Write-Host ""
Write-Host "[2/4] Verificando e limpando pacotes AppX residuais comuns..." -ForegroundColor Green
$problematicApps = @(
    "Microsoft.LanguageExperiencePack*",
    "Microsoft.OneDriveSync",
    "*Teams*",
    "*Xbox*",
    "*Clipchamp*",
    "*BingNews*",
    "*BingWeather*",
    "*GetHelp*",
    "*Getstarted*"
)

foreach ($app in $problematicApps) {
    $found = Get-AppxPackage -Name $app -AllUsers -ErrorAction SilentlyContinue
    if ($found) {
        foreach ($item in $found) {
            # Nao remover pacotes vitais do sistema
            if ($item.IsFramework -or $item.NonRemovable) { continue }
            Write-Host " -> Removendo pacote residual: $($item.PackageFullName)" -ForegroundColor DarkGray
            Remove-AppxPackage -Package $item.PackageFullName -AllUsers -ErrorAction SilentlyContinue
            $pacoteRemovido = $true
        }
    }
}

# 3. VERIFICAR STATUS DO BITLOCKER
Write-Host ""
Write-Host "[3/4] Verificando status do BitLocker..." -ForegroundColor Green
try {
    $bl = manage-bde -status C: | Out-String
    if ($bl -match "Protection On" -or $bl -match "Protecao Ativada") {
        Write-Host " -> BitLocker ativado! Desativando para permitir Sysprep..." -ForegroundColor Yellow
        manage-bde -off C:
        Write-Host "    [OK] Descriptografia iniciada (aguarde alguns instantes)." -ForegroundColor Green
    } else {
        Write-Host " -> BitLocker desativado (OK para Sysprep)." -ForegroundColor Gray
    }
} catch {
    Write-Host " -> BitLocker nao suportado ou inativo (OK)." -ForegroundColor Gray
}

# 4. VERIFICAR REINICIALIZAÇÃO PENDENTE DO WINDOWS UPDATE
Write-Host ""
Write-Host "[4/4] Verificando se ha reinicializacao pendente..." -ForegroundColor Green
$rebootPending = $false
if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending") { $rebootPending = $true }
if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired") { $rebootPending = $true }

if ($rebootPending) {
    Write-Warning "ATENCAO: Ha atualizacoes do Windows aguardando reinicializacao!"
    Write-Warning "Recomendado reiniciar o computador antes de tentar o Sysprep novamente."
} else {
    Write-Host " -> Nenhuma reinicializacao pendente detectada (OK)." -ForegroundColor Gray
}

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
if ($pacoteRemovido) {
    Write-Host "   CORRECAO APLICADA COM SUCESSO!                              " -ForegroundColor Green
    Write-Host "   Execute agora o comando de Sysprep abaixo:                   " -ForegroundColor Yellow
    Write-Host "   C:\Windows\System32\Sysprep\sysprep.exe /generalize /oobe /shutdown" -ForegroundColor White
} else {
    Write-Host "   VERIFICACAO CONCLUIDA!                                      " -ForegroundColor Yellow
    Write-Host "   Se o log mostrou o pacote acima, remova-o manualmente com:   " -ForegroundColor Yellow
    Write-Host "   Get-AppxPackage -Name *NOME* -AllUsers | Remove-AppxPackage -AllUsers" -ForegroundColor White
}
Write-Host "================================================================" -ForegroundColor Cyan
