---
tipo: runbook
resumo: "Roteiro de pesquisa independente para a estação de Sala de Aula durante a prática de Troubleshooting Externo."
title: "Guia de Pesquisa: Troubleshooting Básico e Conexões Externas"
disciplina: Arquitetura e Manutenção de Computadores
professor: Olegário Neto
data: 2026-09-22
status: planejado
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Orientar que as respostas devem ser anotadas nos cadernos ou digitadas.
* [ ] Lembrar os alunos que os conceitos pesquisados aqui serão testados no laboratório futuramente.

</div>

# 💻 Guia de Pesquisa: Troubleshooting Básico Nível 2

> [!info] **Sobre este Guia**
> Bem-vindos à Estação de Pesquisa! Enquanto a outra metade da turma diagnostica fisicamente os equipamentos no laboratório, sua equipe assumirá o papel de Investigação (Nível 2). Um bom técnico de suporte atua com lógica e pesquisa antes de tentar "adivinhar" o problema. 

---

## 🚀 1. Pesquisa Guiada: Casos Práticos de Suporte

Respondam de forma clara às questões abaixo simulando o atendimento a um cliente.

### Caso A: A Conexão Fantasma
Um cliente afirma que o computador desktop informa estar "Conectado, mas sem internet", embora a rede Wi-Fi nos celulares funcione normalmente. O cabo de rede azul (RJ-45) está encaixado e a luz traseira da placa-mãe pisca.
1. Nas configurações de rede do Sistema Operacional (Windows), quais são os passos iniciais para investigar se a placa de rede foi acidentalmente desativada?
2. Procure sobre o comando `ping` no Prompt de Comando (CMD). Para que ele serve e como você usaria o comando `ping 8.8.8.8` para diagnosticar esse cliente?

### Caso B: Os Monitores Desobedientes
Uma profissional utiliza um notebook conectado a um monitor externo. Após remover o notebook da mesa, a usuária relata que a configuração foi perdida: "tudo o que faço na minha tela, repete na tela maior", e além disso a "imagem está esticada e embaçada".
1. Qual atalho no teclado do Windows exibe instantaneamente o menu projetar e permite mudar de "Duplicar" para "Estender"?
2. Pesquise por que uma imagem aparece "embaçada" ou "esticada" em um monitor LCD moderno. Qual o nome da configuração específica de vídeo no sistema operacional que deve ser ajustada para corresponder ao monitor?

### Caso C: A Impressora Invisível
Um novo colaborador ligou uma impressora na porta USB frontal do gabinete, mas o Windows não apresenta nenhuma notificação ou sinal sonoro de equipamento detectado.
1. O que é o "Gerenciador de Dispositivos" no ambiente Windows? 
2. Como você utilizaria essa ferramenta para verificar se a porta USB do painel frontal daquele computador está efetivamente instalada, ou se o driver do dispositivo genérico reporta falha de reconhecimento?

---

## 🏆 2. Desafio Especial (As Cores Importam)

Frequentemente as portas USB na traseira da placa-mãe possuem pequenos plásticos internos em cores variadas (Preto, Azul, Vermelho/Amarelo). O cliente afirma que conectou o HD Externo de alta velocidade em qualquer porta.
**Desafio:** Pesquise e monte um sumário técnico:
1. Qual a diferença em capacidade de tráfego de dados entre as portas padrão **Preto (USB 2.0)** e as portas padrão **Azul (USB 3.0 ou 3.1)**?
2. Em várias fabricantes, algumas portas possuem o miolo **Amarelo ou Vermelho** (conhecidas tecnicamente como portas *Sleep-and-Charge*). Qual a funcionalidade extra dessas portas em relação ao fornecimento de energia, mesmo com o computador desligado?

---

## ❓ 3. Check-list de Revisão 
*   Em um cenário real, se a chave física traseira da Fonte de Alimentação for posicionada de '1' para '0', algum LED da placa-mãe permanece aceso?
*   Cite três verificações primárias que devem ser efetuadas **antes** de pegar uma chave de fenda para abrir o gabinete de um desktop que não está exibindo vídeo na tela.
