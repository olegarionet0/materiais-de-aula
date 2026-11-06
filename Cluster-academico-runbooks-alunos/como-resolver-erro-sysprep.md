# 🔧 Como Resolver o Erro de Validação do Sysprep (Windows 11)

> **Guia Rápido de Solução de Problemas — Labs EEEP-AFS**  
> Se ao executar o Sysprep você recebeu a mensagem:  
> *"O Sysprep não pôde validar a instalação do Windows. Examine o arquivo de log em %WINDIR%\System32\Sysprep\Panther\setupact.log para obter detalhes."*  
> Siga os passos abaixo para corrigir em segundos.

---

## 🔍 Causa do Erro

No Windows 11, o Sysprep falha por dois motivos principais:
1. **Pacote AppX Atualizado em Segundo Plano:** O Windows Update ou a Microsoft Store atualiza silenciosamente um aplicativo moderno (AppX) apenas para o perfil do usuário logado, mas não o provisiona para todos os usuários do sistema. O Sysprep bloqueia a generalização para não corromper o catálogo.
2. **BitLocker Automático:** Em instalações limpas do Windows 11 em máquinas modernas, a criptografia BitLocker pode vir ativada silenciosamente.

---

## ⚡ Passo 1: Executar a Correção Automática (Recomendado)

No computador modelo, abra o **PowerShell como Administrador** e cole o comando abaixo:

```powershell
irm https://raw.githubusercontent.com/olegarionet0/materiais-de-aula/main/Cluster-academico-runbooks-alunos/corrigir-sysprep.ps1 | iex
```

### O que o script faz automaticamente:
* Lê o arquivo de log `setupact.log`;
* Extrai o nome exato do pacote AppX causador do bloqueio;
* Remove o pacote de todos os usuários (`-AllUsers`) e remove seu provisionamento online;
* Limpa pacotes residuais conhecidos que causam travamentos semelhantes;
* Verifica se o BitLocker está ativado e desativa se necessário;
* Verifica se há reinicialização pendente do Windows Update.

---

## 🛠️ Passo 2 (Opcional): Diagnóstico Manual

Se preferir inspecionar o erro manualmente no PowerShell (Admin):

### Ver a linha exata do erro no log:
```powershell
Get-Content C:\Windows\System32\Sysprep\Panther\setupact.log | Select-String -Pattern "was installed for a user"
```

*Exemplo de retorno do log:*
```text
Error SYSPRP Package Microsoft.LanguageExperiencePackpt-BR_22621.43.219.0_neutral__8wekyb3d8bbwe was installed for a user, but not provisioned for all users.
```

### Remover o pacote identificado manualmente:
Substitua pelo nome do aplicativo mostrado no log (por exemplo, `*LanguageExperiencePack*`):

```powershell
Get-AppxPackage -Name "*LanguageExperiencePack*" -AllUsers | Remove-AppxPackage -AllUsers
```

---

## 🚀 Passo 3: Reexecutar o Sysprep

Após a execução do script (ou remoção manual), rode o comando do Sysprep:

```cmd
C:\Windows\System32\Sysprep\sysprep.exe /generalize /oobe /shutdown
```

*(Ou no PowerShell elevated: `& C:\Windows\System32\Sysprep\sysprep.exe /generalize /oobe /shutdown`)*

> [!IMPORTANT]
> O computador desligará automaticamente ao terminar. **NÃO ligue a máquina no boot normal pelo disco**. Ligue pressionando **F12** para fazer o boot via PXE na rede do laboratório e capturar a imagem no FOG Server (`Win11-LabTI`).
