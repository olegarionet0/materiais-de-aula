<#
.SYNOPSIS
    Script rapido para instalar o brModelo e aplicar o Wallpaper Oficial EEEP-AFS.
.DESCRIPTION
    Aproveita os arquivos que ja estao na pasta Downloads (ou baixa do GitHub se necessario).
    Cria atalho publico para todos os alunos e aplica o fundo de tela corporativo.
.NOTES
    Executar como Administrador no PowerShell do Windows 11.
#>

if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Execute este script como Administrador!"
    exit
}

Clear-Host
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   EEEP-AFS - SETUP BRMODELO E WALLPAPER OFICIAL          " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

# 1. INSTALAR BRMODELO 3.0
Write-Host "[1/2] Configurando brModelo 3.0..." -ForegroundColor Green
$brmodeloDest = "C:\Program Files\brModelo"
if (-not (Test-Path $brmodeloDest)) { New-Item -Path $brmodeloDest -ItemType Directory -Force | Out-Null }

$brmodeloDownloads = "$env:USERPROFILE\Downloads\brModelo.jar"
if (Test-Path $brmodeloDownloads) {
    Copy-Item $brmodeloDownloads "$brmodeloDest\brModelo.jar" -Force
    Write-Host " -> Copiado de Downloads para $brmodeloDest" -ForegroundColor Gray
} else {
    Write-Host " -> Baixando do GitHub..." -ForegroundColor Gray
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/olegarionet0/materiais-de-aula/main/Cluster-academico-runbooks-alunos/brModelo.jar" -OutFile "$brmodeloDest\brModelo.jar"
}

# Criar atalho na Área de Trabalho Pública
try {
    $wsh = New-Object -ComObject WScript.Shell
    $sc = $wsh.CreateShortcut("C:\Users\Public\Desktop\brModelo 3.0.lnk")
    $sc.TargetPath = "$brmodeloDest\brModelo.jar"
    $sc.WorkingDirectory = $brmodeloDest
    $sc.Save()
    Write-Host " -> Atalho 'brModelo 3.0' criado com sucesso em C:\Users\Public\Desktop!" -ForegroundColor Green
} catch {
    Write-Warning "Falha ao criar atalho de brModelo."
}

# 2. APLICAR WALLPAPER OFICIAL
Write-Host ""
Write-Host "[2/2] Aplicando Wallpaper Oficial EEEP-AFS..." -ForegroundColor Green
$wallDir = "C:\Windows\Web\Wallpaper\EEEP-AFS"
if (-not (Test-Path $wallDir)) { New-Item -Path $wallDir -ItemType Directory -Force | Out-Null }
$wallTarget = "$wallDir\wallpaper-eeepafs-labinfo.jpeg"

$wallDownloads = "$env:USERPROFILE\Downloads\wallpaper-eeepafs-labinfo.jpeg"
if (Test-Path $wallDownloads) {
    Copy-Item $wallDownloads $wallTarget -Force
    Write-Host " -> Copiado de Downloads para $wallTarget" -ForegroundColor Gray
} else {
    Write-Host " -> Baixando do GitHub..." -ForegroundColor Gray
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/olegarionet0/materiais-de-aula/main/Cluster-academico-runbooks-alunos/wallpaper-eeepafs-labinfo.jpeg" -OutFile $wallTarget
}

if (Test-Path $wallTarget) {
    # Definir registro para usuario atual e Default User
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Value $wallTarget -Force
    Set-ItemProperty -Path "Registry::HKEY_USERS\.DEFAULT\Control Panel\Desktop" -Name "Wallpaper" -Value $wallTarget -Force
    
    # Atualizar na tela imediatamente
    $csharpSig = @"
using System.Runtime.InteropServices;
public class WallpaperSetup {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
    Add-Type -TypeDefinition $csharpSig -ErrorAction SilentlyContinue
    [WallpaperSetup]::SystemParametersInfo(0x0014, 0, $wallTarget, 0x01 -bor 0x02) | Out-Null
    Write-Host " -> Wallpaper oficial aplicado na tela com sucesso!" -ForegroundColor Green
}

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   CONFIGURACAO CONCLUIDA COM SUCESSO!                    " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan
