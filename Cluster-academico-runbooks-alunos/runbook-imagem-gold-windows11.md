# 🛠️ Runbook: Preparação e Captura da Imagem Gold (Windows 11) — Labs EEEP-AFS

> **Guia Operacional de Laboratório**  
> Passo a passo completo para provisionar a estação de referência (Gold Master) do Laboratório de Informática (Windows 11) e realizar a captura via PXE no FOG Project.

---

## ⚡ 1. Execução Rápida do Script de Automação

No computador recém-formatado com Windows 11 Pro:
1. Abra o **PowerShell como Administrador**;
2. Execute o comando de uma linha para baixar e aplicar o script diretamente:

```powershell
irm https://raw.githubusercontent.com/olegarionet0/materiais-de-aula/main/Cluster-academico-runbooks-alunos/setup-win11-gold-master.ps1 | iex
```

*(Ou baixe o arquivo `setup-win11-gold-master.ps1` desta pasta e execute localmente)*.

### O que este script realiza:
- **Softwares via Winget:** VS Code, Python 3.12, Git, Wireshark, VirtualBox, Arduino IDE 2.x, CPU-Z, CrystalDiskInfo, 7-Zip, LibreOffice, Google Chrome e Eclipse Temurin JRE 21.
- **Bibliotecas Python:** `flask`, `requests`, `pytest`, `colorama`.
- **Extensões didáticas do VS Code:** Pacote pt-BR, Material Icon Theme, Error Lens, Indent Rainbow, Prettier, Live Server, Auto Rename Tag, HTML CSS Support, Python, Pylance, MySQL Client 2 e Thunder Client.
- **Configurações didáticas (`settings.json`):** Salvar automático (`afterDelay`), formatar ao salvar (`Prettier`) e guias de parênteses ativos — aplicados ao usuário atual e propagados para `C:\Users\Default\AppData\Roaming\Code\User\settings.json`.

---

## 🔑 2. Procedimentos Manuais Complementares

Após a conclusão do script:

### A. Cisco Packet Tracer (Bypass de Autenticação para 90 dias)
1. Abra o **Cisco Packet Tracer**;
2. Marque obrigatoriamente a opção: **"Keep me logged in (3 months)"**;
3. Faça o login com a conta institucional da escola e feche o programa;
4. No PowerShell como Administrador, copie o token para novos perfis:
   ```powershell
   Copy-Item -Path "$env:LOCALAPPDATA\Cisco Packet Tracer*" -Destination "C:\Users\Default\AppData\Local\" -Recurse -Force
   ```

### B. Ferramentas Didáticas Adicionais
1. **brModelo 3.0:** Copie a pasta do executável para `C:\Program Files\brModelo\` e crie um atalho na área de trabalho pública (`C:\Users\Public\Desktop`). *(O Java JRE 21 já foi instalado pelo script)*.
2. **Portugol Studio:** Conclua a instalação se aplicável.
3. **Veyon Service (Cliente):** Instale em modo **Service** e importe a chave pública do professor (`eeep-prof`).

---

## 🧹 3. Atualizações e Limpeza de Componentes (Enxugamento)

1. Abra o **Windows Update**, execute a verificação e instale todas as atualizações até exibir *"Você está atualizado"*. Reinicie o computador se solicitado;
2. No PowerShell como Administrador, execute a limpeza de componentes antigos do Windows para reduzir o tamanho da imagem no FOG:
   ```powershell
   Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
   ```
3. Limpe pastas temporárias:
   ```powershell
   Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
   Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
   ```
4. **Verificação de rede:** Certifique-se de que o computador **NÃO** está ingressado no domínio `EEEP.LAN` (o ingresso será automático via FOG Client pós-deploy).

---

## 🔒 4. Generalização com Sysprep

No prompt de comando elevado (CMD ou PowerShell como Administrador):

```cmd
C:\Windows\System32\Sysprep\sysprep.exe /generalize /oobe /shutdown
```

> [!TIP] Se o Sysprep falhar com "não pôde validar a instalação":
> No PowerShell como Administrador, execute o script de correção automática de pacotes AppX:
> ```powershell
> irm https://raw.githubusercontent.com/olegarionet0/materiais-de-aula/main/Cluster-academico-runbooks-alunos/corrigir-sysprep.ps1 | iex
> ```
> Para o guia detalhado, consulte [[como-resolver-erro-sysprep|como-resolver-erro-sysprep.md]].

> [!WARNING] Atenção Crítica
> O computador será desligado automaticamente ao término do Sysprep. **Não ligue a máquina no boot convencional pelo disco local**, pois isso iniciará o assistente do Windows e cancelará a generalização.

---

## 🚀 5. Captura PXE no Servidor FOG

1. No servidor FOG (`http://10.30.0.11/fog` ou `http://20.20.0.208/fog`):
   - Verifique se a imagem `Win11-LabTI` (Image ID `1`) está definida como `Single Disk - Resizable`;
   - Crie a tarefa de **Capture** associada ao computador de bancada.
2. Conecte a estação via cabo de rede na porta do laboratório;
3. Ligue o computador pressionando a tecla de boot de rede (**F12**);
4. O FOG iniciará a captura e gravação dos blocos em `/images/Win11LabTI/`.
