---
tipo: runbook-aluno
disciplina: Redes de Computadores
tags:
  - runbook
  - tcp-udp
  - netstat
---

# 🚀 Laboratório: Transporte e Portas Lógicas

## 📋 Tabela de Portas Conhecidas (Well-Known Ports)
| Serviço | Protocolo Padrão | Porta Lógica | Uso Comum |
| :--- | :--- | :--- | :--- |
| **FTP** | TCP | 20 e 21 | Transferência de Arquivos |
| **SSH** | TCP | 22 | Acesso remoto seguro (Linux) |
| **DNS** | UDP (e TCP) | 53 | Resolução de nomes (Ex: www.google.com -> IP) |
| **HTTP** | TCP | 80 | Navegação Web sem criptografia |
| **HTTPS** | TCP | 443 | Navegação Web segura |

---

## 🛠️ Parte 1: Investigação no Sistema Operacional Real

Nesta fase, você será um analista de infraestrutura investigando quais portas seu próprio computador do laboratório está usando agora.

**Passo 1: Abrir o terminal**
1. Pressione `Win + R`, digite `cmd` e pressione Enter.
2. No terminal, digite o comando: `netstat -ano` e pressione Enter.

**Passo 2: Análise dos Dados**
1. Procure na coluna **Estado** por conexões que digam `ESTABLISHED` (Estabelecida).
2. Olhe a coluna **Endereço Externo**. Você verá um IP seguido de dois pontos e um número (Ex: `142.250.218.14:443`).
3. Anote o número final (a Porta) e o número da última coluna (**PID** - Identificador do Processo).

**Passo 3: Quem é o dono do tráfego?**
1. Pressione `Ctrl + Shift + Esc` para abrir o Gerenciador de Tarefas.
2. Vá na aba **Detalhes**.
3. Procure o número do **PID** que você anotou. Qual aplicativo está rodando nele? (Provavelmente o navegador).

---

## 🖥️ Parte 2: Análise de Tráfego no Packet Tracer

**Cenário:** Vamos visualizar como o protocolo TCP garante que o servidor está pronto para conversar antes de enviar os dados (O famoso 3-Way Handshake).

**Passo 1: Preparar a Topologia**
1. Abra o Packet Tracer.
2. Insira 1 PC e 1 Servidor, conectados por um Switch genérico.
3. Configure o IP do PC como `192.168.1.10` e do Servidor como `192.168.1.100`.

**Passo 2: Modo de Simulação**
1. No canto inferior direito, mude do modo *Realtime* para *Simulation*.
2. Clique em **Show All/None** e filtre apenas os pacotes **TCP** e **HTTP**.

**Passo 3: Gerando o Tráfego**
1. Clique no PC, vá em *Desktop* > *Web Browser*.
2. Digite a URL: `192.168.1.100` e clique em *Go*.
3. Note que o primeiro pacote gerado NÃO é o HTTP. É um pacote **TCP**.
4. Clique em *Forward* no painel de simulação. Observe os 3 primeiros pacotes trocados entre o PC e o Servidor (SYN -> SYN-ACK -> ACK).
5. Clique no quadrado colorido (PDU) do pacote. Vá na aba *Outbound PDU Details*.
6. Encontre a seção TCP. Qual é a *Source Port* (Porta de Origem)? E qual é a *Destination Port* (Porta de Destino)?

## 🧠 Parte 3: Perguntas de Reflexão
1. Por que a Porta de Destino era a 80, mas a sua Porta de Origem era um número alto e aleatório (como 51324)?
2. Se você estivesse jogando um jogo online rápido (como CS:GO ou Valorant), faria sentido usar TCP, que exige a verificação de todos os pacotes, ou UDP? Por quê?
