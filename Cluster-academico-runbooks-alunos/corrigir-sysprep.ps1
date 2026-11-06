<#
.SYNOPSIS
    Diagnóstico e correção automática profunda de falhas no Sysprep (Windows 11).
.DESCRIPTION
    EEEP Adolfo Ferreira de Sousa - Laboratório de Informática
    - Remove pacotes bloqueadores conhecidos (Microsoft.VisualStudioCode, Microsoft.Winget.Source, etc.)
    - Remove qualquer pacote AppX instalado para usuário que não esteja provisionado
    - Lê e limpa pacotes registrados no Panther\setupact.log
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
Write-Host "   EEEP-AFS - CORRECAO TOTAL DE PACOTES PARA SYSPREP (WIN11)    " -ForegroundColor Yellow
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$logPath = "C:\Windows\System32\Sysprep\Panther\setupact.log"
$pacoteRemovido = $false

# 1. REMOVER PACOTES BLOQUEADORES NOTORIOS DO WINGET / STORE (VS Code, Winget Source, etc.)
Write-Host "[1/5] Removendo pacotes de controle do Winget e VS Code (o programa Win32 continua intacto)..." -ForegroundColor Green
$knownBlockers = @(
    "*VisualStudioCode*",
    "*Winget.Source*",
    "*LanguageExperiencePack*",
    "*OneDriveSync*",
    "*Clipchamp*",
    "*BingNews*",
    "*BingWeather*",
    "*GetHelp*",
    "*Getstarted*",
    "*Xbox*",
    "*Teams*",
    "*PowerAutomate*"
)

foreach ($pattern in $knownBlockers) {
    $found = Get-AppxPackage -Name $pattern -AllUsers -ErrorAction SilentlyContinue
    if ($found) {
        foreach ($pkg in $found) {
            if ($pkg.IsFramework -or $pkg.NonRemovable) { continue }
            Write-Host " -> Removendo: $($pkg.PackageFullName)" -ForegroundColor Cyan
            try {
                Remove-AppxPackage -Package $pkg.PackageFullName -AllUsers -ErrorAction SilentlyContinue
                Remove-AppxPackage -Package $pkg.PackageFullName -ErrorAction SilentlyContinue
                $pacoteRemovido = $true
            } catch {}
        }
    }
}

# 2. REMOVER QUALQUER PACOTE NAO PROVISIONADO DETECTADO PELO DISM
Write-Host ""
Write-Host "[2/5] Varrendo pacotes instalados por usuario sem provisionamento de imagem..." -ForegroundColor Green
try {
    $provisioned = (Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue).PackageName
    if ($provisioned) {
        $userApps = Get-AppxPackage -AllUsers -ErrorAction SilentlyContinue | Where-Object {
            (-not $_.IsFramework) -and
            (-not $_.NonRemovable) -and
            ($_.SignatureKind -ne "System") -and
            ($provisioned -notcontains $_.PackageFullName)
        }
        foreach ($app in $userApps) {
            # Nao remover apps essenciais da shell
            if ($app.Name -match "SecHealthUI|ShellExperience|DesktopAppInstaller|WindowsStore") { continue }
            Write-Host " -> Removendo app nao-provisionado: $($app.Name)" -ForegroundColor Yellow
            Remove-AppxPackage -Package $app.PackageFullName -AllUsers -ErrorAction SilentlyContinue
            Remove-AppxPackage -Package $app.PackageFullName -ErrorAction SilentlyContinue
            $pacoteRemovido = $true
        }
    }
} catch {
    Write-Warning "Nao foi possivel consultar provisionamento via DISM: $_"
}

# 3. ANALISAR O LOG PANTHER/SETUPACT.LOG DIRETAMENTE
Write-Host ""
Write-Host "[3/5] Verificando se resta algum erro no log Panther\setupact.log..." -ForegroundColor Green
if (Test-Path $logPath) {
    $lines = Get-Content $logPath
    $errors = $lines | Select-String -Pattern "was installed for a user"
    
    if ($errors) {
        foreach ($err in $errors) {
            if ($err.Line -match "Package\s+([^\s]+)\s+was installed") {
                $pkg = $matches[1]
                $pkgBase = $pkg.Split('_')[0]
                Write-Host " -> Limpando referencia do log: $pkg..." -ForegroundColor Cyan
                Remove-AppxPackage -Package $pkg -AllUsers -ErrorAction SilentlyContinue
                Remove-AppxPackage -Package $pkg -ErrorAction SilentlyContinue
                Get-AppxPackage -Name "*$pkgBase*" -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
                $pacoteRemovido = $true
            }
        }
    } else {
        Write-Host " -> Nenhum erro novo encontrado no log (OK)." -ForegroundColor Gray
    }
}

# 4. VERIFICAR STATUS DO BITLOCKER
Write-Host ""
Write-Host "[4/5] Verificando status do BitLocker..." -ForegroundColor Green
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

# 5. VERIFICAR REINICIALIZAÇÃO PENDENTE DO WINDOWS UPDATE
Write-Host ""
Write-Host "[5/5] Verificando se ha reinicializacao pendente..." -ForegroundColor Green
$rebootPending = $false
if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending") { $rebootPending = $true }
if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired") { $rebootPending = $true }

if ($rebootPending) {
    Write-Warning "ATENCAO: Ha atualizacoes do Windows aguardando reinicializacao!"
    Write-Warning "Recomendado reiniciar o computador antes de rodar o Sysprep."
} else {
    Write-Host " -> Nenhuma reinicializacao pendente detectada (OK)." -ForegroundColor Gray
}

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "   LIMPEZA CONCLUIDA! AGORA EXECUTE O SYSPREP:                 " -ForegroundColor Green
Write-Host ""
Write-Host "   C:\Windows\System32\Sysprep\sysprep.exe /generalize /oobe /shutdown" -ForegroundColor Yellow
Write-Host "================================================================" -ForegroundColor Cyan
