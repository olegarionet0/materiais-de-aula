<#
.SYNOPSIS
    Script de otimizacao profunda, debloat, padronizacao visual e politicas para o Lab Info (Windows 11).
.DESCRIPTION
    EEEP Adolfo Ferreira de Sousa - Laboratorio de Informatica
    - Remove bloatware, pacotes de jogos (Xbox, Solitaire), noticias e apps de consumo
    - Remove pacotes provisionados (impede que novos alunos recebam bloatware ao logar)
    - Desativa Game DVR, telemetria excessiva, sugestoes de propaganda e widgets
    - Aplica wallpaper institucional e atalhos didaticos na area de trabalho publica
    - Fixa pagina inicial e favoritos institucionais no Chrome e Edge
    - Configura Explorador para mostrar extensoes (.py, .sql, .html)
    - Desativa hibernacao e Fast Startup (poupa espaco no SSD e evita dirty bit no FOG)
.NOTES
    Autor: Prof. Olegario Neto
    Executar como Administrador no PowerShell do Windows 11.
#>

if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Este script precisa ser executado como Administrador!"
    exit
}

Clear-Host
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "   EEEP-AFS - OTIMIZACAO, DEBLOAT E PADRONIZACAO (LAB INFO)     " -ForegroundColor Yellow
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# -------------------------------------------------------------
# 1. ENERGIA E ARMAZENAMENTO (DESATIVAR HIBERNAÇÃO E FAST STARTUP)
# -------------------------------------------------------------
Write-Host "[1/8] Desativando hibernacao e suspend timeout (economia de SSD e compatibilidade FOG)..." -ForegroundColor Green
powercfg /h off
powercfg /change standby-timeout-ac 0

# -------------------------------------------------------------
# 2. REMOÇÃO DE BLOATWARE E JOGOS (APPX ATUAIS E PROVISIONADOS)
# -------------------------------------------------------------
Write-Host ""
Write-Host "[2/8] Removendo bloatware, jogos e apps inuteis para o ensino..." -ForegroundColor Green

$bloatList = @(
    "*Microsoft.GamingApp*",
    "*Microsoft.XboxApp*",
    "*Microsoft.XboxGamingOverlay*",
    "*Microsoft.XboxIdentityProvider*",
    "*Microsoft.XboxSpeechToTextOverlay*",
    "*Microsoft.Xbox.TCUI*",
    "*Microsoft.MicrosoftSolitaireCollection*",
    "*Microsoft.BingNews*",
    "*Microsoft.BingWeather*",
    "*Microsoft.BingFinance*",
    "*Microsoft.BingSports*",
    "*Microsoft.GetHelp*",
    "*Microsoft.Getstarted*",
    "*Microsoft.WindowsFeedbackHub*",
    "*Microsoft.YourPhone*",
    "*Microsoft.People*",
    "*Microsoft.SkypeApp*",
    "*Microsoft.Todos*",
    "*Microsoft.549981C3F5F10*", # Cortana
    "*Microsoft.MicrosoftOfficeHub*",
    "*SpotifyAB.SpotifyMusic*",
    "*Disney*",
    "*Clipchamp.Clipchamp*",
    "*TikTok*",
    "*Amazon*",
    "*Facebook*",
    "*Instagram*",
    "*Netflix*"
)

foreach ($app in $bloatList) {
    # 1. Remover dos usuarios atuais
    $installed = Get-AppxPackage -AllUsers -Name $app -ErrorAction SilentlyContinue
    if ($installed) {
        Write-Host " -> Removendo AppX instalado: $($installed.Name -join ', ')..." -ForegroundColor Gray
        $installed | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
    }
    
    # 2. Remover do provisionamento do Windows (crucial para novos alunos do dominio nao receberem)
    $provisioned = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like $app }
    if ($provisioned) {
        Write-Host " -> Desprovisionando da imagem base: $($provisioned.DisplayName -join ', ')..." -ForegroundColor DarkGray
        $provisioned | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Out-Null
    }
}

# -------------------------------------------------------------
# 3. DESATIVAR RECURSOS DE JOGOS E SERVIÇOS INÚTEIS
# -------------------------------------------------------------
Write-Host ""
Write-Host "[3/8] Desativando Game DVR, barra de jogos e servicos de Xbox..." -ForegroundColor Green

# Desativar Game DVR nas politicas
$gameDvrPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR"
if (-not (Test-Path $gameDvrPath)) { New-Item -Path $gameDvrPath -Force | Out-Null }
Set-ItemProperty -Path $gameDvrPath -Name "AllowGameDVR" -Value 0 -Type DWord -Force

# Desativar Game DVR no registro do usuario atual e padrao
$gameConfigPaths = @(
    "HKCU:\System\GameConfigStore",
    "Registry::HKEY_USERS\.DEFAULT\System\GameConfigStore"
)
foreach ($gcp in $gameConfigPaths) {
    if (Test-Path $gcp) {
        Set-ItemProperty -Path $gcp -Name "GameDVR_Enabled" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
    }
}

# Desativar servicos de Xbox
$xboxServices = @("XblAuthManager", "XblGameSave", "XboxGipSvc", "XboxNetApiSvc")
foreach ($svc in $xboxServices) {
    if (Get-Service -Name $svc -ErrorAction SilentlyContinue) {
        Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
        Set-Service -Name $svc -StartupType Disabled -ErrorAction SilentlyContinue
    }
}

# -------------------------------------------------------------
# 4. DESATIVAR SUGESTÕES DE CONSUMO, ANÚNCIOS E TELEMETRIA
# -------------------------------------------------------------
Write-Host ""
Write-Host "[4/8] Desativando instalacao silenciosa de patrocinados e sugestoes..." -ForegroundColor Green

# Bloquear download de apps de consumo (Candy Crush, etc.)
$cloudContent = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
if (-not (Test-Path $cloudContent)) { New-Item -Path $cloudContent -Force | Out-Null }
Set-ItemProperty -Path $cloudContent -Name "DisableWindowsConsumerFeatures" -Value 1 -Type DWord -Force
Set-ItemProperty -Path $cloudContent -Name "DisableConsumerAccountStateContent" -Value 1 -Type DWord -Force
Set-ItemProperty -Path $cloudContent -Name "DisableCloudOptimizedContent" -Value 1 -Type DWord -Force
Set-ItemProperty -Path $cloudContent -Name "DisableSoftLanding" -Value 1 -Type DWord -Force

# Content Delivery Manager (desativar sugestoes no Iniciar)
$cdmPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager",
    "Registry::HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
)
foreach ($cdm in $cdmPaths) {
    if (-not (Test-Path $cdm)) { New-Item -Path $cdm -Force | Out-Null }
    Set-ItemProperty -Path $cdm -Name "ContentDeliveryAllowed" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $cdm -Name "OemPreInstalledAppsEnabled" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $cdm -Name "PreInstalledAppsEnabled" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $cdm -Name "SilentInstalledAppsEnabled" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $cdm -Name "SystemPaneSuggestionsEnabled" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $cdm -Name "SubscribedContent-338388Enabled" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $cdm -Name "SubscribedContent-338389Enabled" -Value 0 -Type DWord -Force
}

# Reduzir telemetria para o nivel minimo aceito
$dataCol = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
if (-not (Test-Path $dataCol)) { New-Item -Path $dataCol -Force | Out-Null }
Set-ItemProperty -Path $dataCol -Name "AllowTelemetry" -Value 1 -Type DWord -Force

# Desativar DiagTrack se estiver rodando
if (Get-Service -Name "DiagTrack" -ErrorAction SilentlyContinue) {
    Stop-Service -Name "DiagTrack" -Force -ErrorAction SilentlyContinue
    Set-Service -Name "DiagTrack" -StartupType Manual -ErrorAction SilentlyContinue
}

# -------------------------------------------------------------
# 5. EXPLORADOR DE ARQUIVOS (MOSTRAR EXTENSÕES .PY, .SQL, .HTML)
# -------------------------------------------------------------
Write-Host ""
Write-Host "[5/8] Configurando Explorador para SEMPRE exibir extensoes de arquivos..." -ForegroundColor Green
$regPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
    "Registry::HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
)
foreach ($p in $regPaths) {
    if (Test-Path $p) {
        Set-ItemProperty -Path $p -Name "HideFileExt" -Value 0 -Type DWord -Force
    }
}

# -------------------------------------------------------------
# 6. BARRA DE TAREFAS (OCULTAR WIDGETS E CHAT)
# -------------------------------------------------------------
Write-Host ""
Write-Host "[6/8] Ocultando widgets de noticias e chat na barra de tarefas..." -ForegroundColor Green
$tbPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
    "Registry::HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
)
foreach ($tb in $tbPaths) {
    if (Test-Path $tb) {
        Set-ItemProperty -Path $tb -Name "TaskbarDa" -Value 0 -Type DWord -ErrorAction SilentlyContinue # Widgets
        Set-ItemProperty -Path $tb -Name "TaskbarMn" -Value 0 -Type DWord -ErrorAction SilentlyContinue # Chat
    }
}

# -------------------------------------------------------------
# 7. ATALHO PÚBLICO E POLÍTICAS DE NAVEGADOR (CHROME E EDGE)
# -------------------------------------------------------------
Write-Host ""
Write-Host "[7/8] Criando atalhos e configurando politicas de navegador..." -ForegroundColor Green

# Criar atalho na Área de Trabalho Pública
try {
    $wsh = New-Object -ComObject WScript.Shell
    $shortcutPath = "C:\Users\Public\Desktop\Materiais de Aula (EEEP-AFS).url"
    $shortcut = $wsh.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = "https://olegarionet0.github.io/materiais-de-aula/"
    $shortcut.Save()
    Write-Host " -> Atalho criado com sucesso em C:\Users\Public\Desktop!" -ForegroundColor Gray
} catch {
    Write-Warning "Falha ao criar atalho .url na area publica."
}

# Políticas de Navegador (Chrome e Edge)
$policies = @(
    "HKLM:\SOFTWARE\Policies\Google\Chrome",
    "HKLM:\SOFTWARE\Policies\Microsoft\Edge"
)
foreach ($pol in $policies) {
    if (-not (Test-Path $pol)) { New-Item -Path $pol -Force | Out-Null }
    
    # Barra de favoritos sempre visivel
    Set-ItemProperty -Path $pol -Name "BookmarkBarEnabled" -Value 1 -Type DWord -Force
    
    # Pagina inicial padrao no portal de materiais
    Set-ItemProperty -Path $pol -Name "HomepageLocation" -Value "https://olegarionet0.github.io/materiais-de-aula/" -Type String -Force
    Set-ItemProperty -Path $pol -Name "HomepageIsNewTabPage" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $pol -Name "RestoreOnStartup" -Value 4 -Type DWord -Force
    
    $urlsDir = "$pol\RestoreOnStartupURLs"
    if (-not (Test-Path $urlsDir)) { New-Item -Path $urlsDir -Force | Out-Null }
    Set-ItemProperty -Path $urlsDir -Name "1" -Value "https://olegarionet0.github.io/materiais-de-aula/" -Type String -Force
}

# -------------------------------------------------------------
# 8. WALLPAPER OFICIAL EEEP-AFS
# -------------------------------------------------------------
Write-Host ""
Write-Host "[8/8] Aplicando Wallpaper Oficial EEEP-AFS..." -ForegroundColor Green
$wallDir = "C:\Windows\Web\Wallpaper\EEEP-AFS"
if (-not (Test-Path $wallDir)) { New-Item -Path $wallDir -ItemType Directory -Force | Out-Null }
$wallTarget = "$wallDir\wallpaper-eeepafs-labinfo.jpeg"

$wallSourceLocal = Join-Path $PSScriptRoot "wallpaper-eeepafs-labinfo.jpeg"
if (Test-Path $wallSourceLocal) {
    Copy-Item $wallSourceLocal $wallTarget -Force
} else {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/olegarionet0/materiais-de-aula/main/Cluster-academico-runbooks-alunos/wallpaper-eeepafs-labinfo.jpeg" -OutFile $wallTarget
}

if (Test-Path $wallTarget) {
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Value $wallTarget -Force
    Set-ItemProperty -Path "Registry::HKEY_USERS\.DEFAULT\Control Panel\Desktop" -Name "Wallpaper" -Value $wallTarget -Force
    
    $csharpSig = @"
using System.Runtime.InteropServices;
public class WallpaperUtil {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
    Add-Type -TypeDefinition $csharpSig -ErrorAction SilentlyContinue
    [WallpaperUtil]::SystemParametersInfo(0x0014, 0, $wallTarget, 0x01 -bor 0x02) | Out-Null
    Write-Host " -> Wallpaper oficial aplicado com sucesso!" -ForegroundColor Gray
}

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "   OTIMIZACAO E DEBLOAT DO LAB CONCLUIDOS COM SUCESSO!          " -ForegroundColor Yellow
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Proximo passo: Concluir Packet Tracer, rodar DISM e Sysprep." -ForegroundColor White
