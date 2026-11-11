#!/usr/bin/env bash
# ==============================================================================
# EEEP Adolfo Ferreira de Sousa (EEEP-AFS) - Laboratório de Línguas
# Script de Correção do Python e Code Runner (Linux Mint 22 - Imagem Gold)
# Autor: Prof. Olegário Neto (Coordenador do Eixo de TI)
# ==============================================================================
# Este script resolve definitivamente o problema do play no VS Code:
# 1. Instala python-is-python3 (cria o symlink oficial /usr/bin/python -> python3).
# 2. Configura o VS Code e a extensão Code Runner para:
#    - Usar /usr/bin/python3 como interpretador nativo.
#    - Executar scripts no terminal integrado (permitindo uso de input()).
#    - Salvar automaticamente antes de rodar e limpar saídas anteriores.
# 3. Propaga a configuração para todos os usuários (/home/*) e /etc/skel.
# ==============================================================================

set -e

# 1. Checagem de privilégios de root
if [ "$EUID" -ne 0 ]; then
    echo "❌ Erro: Este script precisa ser executado como root (sudo)."
    echo "Uso: sudo bash $0"
    exit 1
fi

echo "==============================================================="
echo "   EEEP-AFS - FIX PYTHON & CODE RUNNER (LINUX MINT 22)        "
echo "==============================================================="
echo ""

# 2. Instalar python-is-python3
echo "[1/4] Instalando python-is-python3 via apt..."
apt-get update -y
apt-get install -y python-is-python3 python3-pip

# 3. Validar symlink
echo ""
echo "[2/4] Validando versão do Python no sistema..."
echo " -> python:  $(python --version 2>&1)"
echo " -> python3: $(python3 --version 2>&1)"

# 4. Atualizar settings.json do VS Code no perfil atual, usuários e no esqueleto (/etc/skel)
echo ""
echo "[3/4] Padronizando configurações do VS Code e Code Runner..."

python3 - << 'EOF'
import json
import os
import shutil

targets = ["/etc/skel/.config/Code/User/settings.json"]

# Localizar todas as homes existentes
if os.path.exists("/home"):
    for user_name in os.listdir("/home"):
        user_home = os.path.join("/home", user_name)
        if os.path.isdir(user_home):
            targets.append(os.path.join(user_home, ".config", "Code", "User", "settings.json"))

# Usuário logado via sudo, se houver
sudo_user = os.environ.get("SUDO_USER")
if sudo_user and sudo_user != "root":
    sudo_home = os.path.expanduser(f"~{sudo_user}")
    p = os.path.join(sudo_home, ".config", "Code", "User", "settings.json")
    if p not in targets:
        targets.append(p)

updates = {
    "python.defaultInterpreterPath": "/usr/bin/python3",
    "code-runner.executorMap": {
        "python": "python3 -u"
    },
    "code-runner.runInTerminal": True,
    "code-runner.clearPreviousOutput": True,
    "code-runner.saveFileBeforeRun": True
}

for file_path in targets:
    dir_path = os.path.dirname(file_path)
    os.makedirs(dir_path, exist_ok=True)
    
    data = {}
    if os.path.exists(file_path):
        try:
            with open(file_path, "r", encoding="utf-8") as f:
                data = json.load(f)
        except Exception:
            data = {}
            
    # Mesclar com preservação de outras chaves
    for k, v in updates.items():
        if isinstance(v, dict) and isinstance(data.get(k), dict):
            data[k].update(v)
        else:
            data[k] = v
            
    with open(file_path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
        f.write("\n")
        
    print(f" -> Atualizado: {file_path}")

    # Ajustar dono dos arquivos na home dos usuários
    if file_path.startswith("/home/"):
        parts = file_path.split("/")
        user = parts[2]
        try:
            shutil.chown(os.path.join("/home", user, ".config"), user, user)
            shutil.chown(os.path.join("/home", user, ".config", "Code"), user, user)
            shutil.chown(os.path.join("/home", user, ".config", "Code", "User"), user, user)
            shutil.chown(file_path, user, user)
        except Exception:
            pass
EOF

echo ""
echo "[4/4] Concluído com sucesso!"
echo "---------------------------------------------------------------"
echo "O VS Code agora executará normalmente pelo botão de Play e"
echo "os alunos poderão executar scripts tanto com 'python' quanto 'python3'."
echo "---------------------------------------------------------------"
echo ""
echo "Se você estiver na Máquina Modelo e for recapturar no FOG, execute:"
echo "  sudo truncate -s 0 /etc/machine-id"
echo "  sudo rm -f /var/lib/dbus/machine-id /etc/ssh/ssh_host_*"
echo "  sudo ln -s /etc/machine-id /var/lib/dbus/machine-id"
echo "  sudo apt clean && history -c && sudo poweroff"
echo "E depois dê boot via PXE para o Capture da Imagem Gold!"
