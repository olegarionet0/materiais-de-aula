<#
.SYNOPSIS
    Script de automação para preparação da Máquina Modelo (Gold Master) Windows 11.
.DESCRIPTION
    EEEP Adolfo Ferreira de Sousa (EEEP-AFS) - Laboratório de Informática
    Instala softwares base via Winget, pacotes Python, extensões e settings do VS Code,
    configura persistência do Cisco Packet Tracer e prepara o sistema para o Sysprep/FOG.
.NOTES
    Autor: Prof. Olegário Neto (Coordenador do Eixo de TI)
    Executar como Administrador no PowerShell do Windows 11 recém-instalado.
#>

# Forçar execução como Administrador
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Este script precisa ser executado como Administrador. Reiniciando com privilegios elevados..."
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Clear-Host
Write-Host "===============================================================" -ForegroundColor Cyan
Write-Host "   EEEP-AFS - SETUP DA MAQUINA MODELO (GOLD IMAGE WIN11)       " -ForegroundColor Yellow
Write-Host "===============================================================" -ForegroundColor Cyan
Write-Host ""

# -------------------------------------------------------------
# 1. INSTALAÇÃO DE SOFTWARES VIA WINGET
# -------------------------------------------------------------
Write-Host "[1/5] Instalando softwares essenciais via Winget..." -ForegroundColor Green

$packages = @(
    "Microsoft.VisualStudioCode",
    "Python.Python.3.12",
    "Git.Git",
    "WiresharkFoundation.Wireshark",
    "Oracle.VirtualBox",
    "Arduino.IDE",
    "CPUID.CPU-Z",
    "CrystalDewWorld.CrystalDiskInfo",
    "7zip.7zip",
    "TheDocumentFoundation.LibreOffice",
    "Google.Chrome",
    "EclipseAdoptium.Temurin.21.JRE"
)

foreach ($pkg in $packages) {
    Write-Host " -> Instalando $pkg..." -ForegroundColor Gray
    winget install --id $pkg -e --silent --accept-package-agreements --accept-source-agreements --disable-interactivity
}

# -------------------------------------------------------------
# 2. BIBLIOTECAS PYTHON PARA AULAS
# -------------------------------------------------------------
Write-Host ""
Write-Host "[2/5] Atualizando Pip e instalando bibliotecas Python..." -ForegroundColor Green
try {
    & python -m pip install --upgrade pip --quiet
    & pip install flask requests pytest colorama --quiet
    Write-Host " -> Pacotes Python instalados com sucesso!" -ForegroundColor Gray
} catch {
    Write-Warning "Falha ao instalar pacotes Python via CLI direto. Execute apos reiniciar o terminal."
}

# -------------------------------------------------------------
# 3. EXTENSÕES DO VS CODE
# -------------------------------------------------------------
Write-Host ""
Write-Host "[3/5] Instalando extensoes didaticas no VS Code..." -ForegroundColor Green

$extensions = @(
    "MS-CEINTL.vscode-language-pack-pt-BR",
    "PKief.material-icon-theme",
    "usernamehw.errorlens",
    "oderwat.indent-rainbow",
    "esbenp.prettier-vscode",
    "ritwickdey.LiveServer",
    "formulahendry.auto-rename-tag",
    "ecmel.vscode-html-css",
    "ms-python.python",
    "ms-python.vscode-pylance",
    "cweijan.vscode-mysql-client2",
    "rangav.vscode-thunder-client"
)

# Adicionar temporariamente o VS Code ao PATH da sessão caso o instalador não tenha atualizado
$codePaths = @(
    "$env:ProgramFiles\Microsoft VS Code\bin",
    "$env:LOCALAPPDATA\Programs\Microsoft VS Code\bin"
)
foreach ($cp in $codePaths) {
    if (Test-Path $cp) { $env:PATH += ";$cp" }
}

foreach ($ext in $extensions) {
    Write-Host " -> Instalando extensao: $ext..." -ForegroundColor Gray
    code --install-extension $ext --force
}

# -------------------------------------------------------------
# 4. CONFIGURAÇÕES DIDÁTICAS DO VS CODE (SETTINGS.JSON)
# -------------------------------------------------------------
Write-Host ""
Write-Host "[4/5] Aplicando settings.json padronizado (autoSave, formatOnSave)..." -ForegroundColor Green

$settingsContent = @'
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.bracketPairColorization.enabled": true,
  "editor.guides.bracketPairs": "active",
  "workbench.iconTheme": "material-icon-theme",
  "files.autoSave": "afterDelay",
  "files.autoSaveDelay": 1000
}
'@

# Aplicar para o usuario admin atual
$userSettingsPath = "$env:APPDATA\Code\User"
New-Item -Path $userSettingsPath -ItemType Directory -Force | Out-Null
Set-Content -Path "$userSettingsPath\settings.json" -Value $settingsContent -Encoding UTF8

# Aplicar para o perfil Default User (para que qualquer aluno do dominio herde)
$defaultSettingsPath = "C:\Users\Default\AppData\Roaming\Code\User"
New-Item -Path $defaultSettingsPath -ItemType Directory -Force | Out-Null
Set-Content -Path "$defaultSettingsPath\settings.json" -Value $settingsContent -Encoding UTF8
Write-Host " -> Settings configurados para Admin e Default User!" -ForegroundColor Gray

# -------------------------------------------------------------
# 5. INSTRUÇÕES FINAIS E LIMPEZA
# -------------------------------------------------------------
Write-Host ""
Write-Host "===============================================================" -ForegroundColor Cyan
Write-Host "   INSTALACAO BASE CONCLUIDA! PROCEDIMENTOS MANUAIS RESTANTES: " -ForegroundColor Yellow
Write-Host "===============================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. PACKET TRACER:" -ForegroundColor Yellow
Write-Host "   - Abra o Cisco Packet Tracer 8.x, marque 'Keep me logged in (3 months)' e faca login."
Write-Host "   - Feche o programa e rode no PowerShell:"
Write-Host "     Copy-Item -Path `"`$env:LOCALAPPDATA\Cisco Packet Tracer*`" -Destination `"C:\Users\Default\AppData\Local\`" -Recurse -Force" -ForegroundColor White
Write-Host ""
Write-Host "2. DEMAIS SOFTWARES:" -ForegroundColor Yellow
Write-Host "   - Instale Portugol Studio, brModelo (C:\Ferramentas\brModelo\) e Affinity Designer."
Write-Host "   - Instale o Veyon Client (modo servico)."
Write-Host ""
Write-Host "3. WINDOWS UPDATE E LIMPEZA PRE-SYSPREP:" -ForegroundColor Yellow
Write-Host "   - Execute o Windows Update ate dizer 'Voce esta atualizado' e reinicie."
Write-Host "   - Em seguida, rode a limpeza profunda de componentes:"
Write-Host "     Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase" -ForegroundColor White
Write-Host ""
Write-Host "4. FECHAMENTO PARA CAPTURA NO FOG:" -ForegroundColor Yellow
Write-Host "   - Execute o Sysprep:"
Write-Host "     C:\Windows\System32\Sysprep\sysprep.exe /generalize /oobe /shutdown" -ForegroundColor White
Write-Host "   - De boot via rede (PXE) e selecione a tarefa de Capture no FOG."
Write-Host ""
Write-Host "Pressione qualquer tecla para finalizar este script..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
