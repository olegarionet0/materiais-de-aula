<#
.SYNOPSIS
    Script de padronização visual, atalhos didáticos e políticas de laboratório (Windows 11).
.DESCRIPTION
    EEEP Adolfo Ferreira de Sousa - Laboratório de Informática
    Aplica wallpaper oficial, atalhos de materiais de aula, políticas do Chrome/Edge,
    exibição de extensões de arquivo e desativação de hibernação/widgets.
.NOTES
    Executar como Administrador no PowerShell do Windows 11.
#>

if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Execute este script como Administrador!"
    exit
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   EEEP-AFS - PERSONALIZACAO E PADRONIZACAO DO LAB INFO   " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

# 1. ENERGIA E ARMAZENAMENTO (DESATIVAR HIBERNAÇÃO E FAST STARTUP)
Write-Host "[1/6] Otimizando energia (desativando hibernacao para poupar SSD)..." -ForegroundColor Green
powercfg /h off
powercfg /change standby-timeout-ac 0

# 2. EXPLORADOR DE ARQUIVOS (MOSTRAR EXTENSÕES .PY, .SQL, .HTML)
Write-Host "[2/6] Configurando Explorador para SEMPRE mostrar extensoes de arquivos..." -ForegroundColor Green
$regPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
    "Registry::HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
)
foreach ($p in $regPaths) {
    if (Test-Path $p) {
        Set-ItemProperty -Path $p -Name "HideFileExt" -Value 0 -Type DWord -Force
    }
}

# 3. BARRA DE TAREFAS (OCULTAR WIDGETS DE NOTÍCIAS E CHAT)
Write-Host "[3/6] Ocultando widgets de noticias e chat na barra de tarefas..." -ForegroundColor Green
$tbPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $tbPath -Name "TaskbarDa" -Value 0 -Type DWord -ErrorAction SilentlyContinue
Set-ItemProperty -Path $tbPath -Name "TaskbarMn" -Value 0 -Type DWord -ErrorAction SilentlyContinue

# 4. ATALHO NA ÁREA DE TRABALHO PÚBLICA (TODOS OS ALUNOS)
Write-Host "[4/6] Criando atalho dos Materiais de Aula na Area de Trabalho Publica..." -ForegroundColor Green
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

# 5. POLÍTICAS DO NAVEGADOR (CHROME E EDGE) - PÁGINA INICIAL E BARRA DE FAVORITOS
Write-Host "[5/6] Fixando pagina inicial e favoritos institucionais nos navegadores..." -ForegroundColor Green
$policies = @(
    "HKLM:\SOFTWARE\Policies\Google\Chrome",
    "HKLM:\SOFTWARE\Policies\Microsoft\Edge"
)
foreach ($pol in $policies) {
    if (-not (Test-Path $pol)) { New-Item -Path $pol -Force | Out-Null }
    
    # Ativar barra de favoritos sempre visível
    Set-ItemProperty -Path $pol -Name "BookmarkBarEnabled" -Value 1 -Type DWord -Force
    
    # Definir portal de materiais como Homepage e na inicialização
    Set-ItemProperty -Path $pol -Name "HomepageLocation" -Value "https://olegarionet0.github.io/materiais-de-aula/" -Type String -Force
    Set-ItemProperty -Path $pol -Name "HomepageIsNewTabPage" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $pol -Name "RestoreOnStartup" -Value 4 -Type DWord -Force
    
    $urlsDir = "$pol\RestoreOnStartupURLs"
    if (-not (Test-Path $urlsDir)) { New-Item -Path $urlsDir -Force | Out-Null }
    Set-ItemProperty -Path $urlsDir -Name "1" -Value "https://olegarionet0.github.io/materiais-de-aula/" -Type String -Force
}

# 6. WALLPAPER OFICIAL EEEP-AFS
Write-Host "[6/6] Aplicando Wallpaper Oficial EEEP-AFS..." -ForegroundColor Green
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
    # Definir registro do wallpaper para usuário padrão e atual
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Value $wallTarget -Force
    Set-ItemProperty -Path "Registry::HKEY_USERS\.DEFAULT\Control Panel\Desktop" -Name "Wallpaper" -Value $wallTarget -Force
    
    # Forçar aplicação visual imediata via User32
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
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   PERSONALIZACAO E POLITICAS APLICADAS COM SUCESSO!      " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan
