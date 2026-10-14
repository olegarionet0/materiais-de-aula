---
tipo: runbook-aluno
disciplina: Redes de Computadores
tags:
  - runbook
  - nat
  - ip
---

# 🚀 Laboratório: O Segredo do NAT e IPs Privados

## 📋 Tabela de Referência (Obrigatório para Provas)
Existem IPs que **nunca** vão para a internet. Eles existem apenas dentro das casas e empresas.

| Classe | Faixa de IP Privado (Rede Local) |
| :--- | :--- |
| **A** | `10.0.0.0` até `10.255.255.255` |
| **B** | `172.16.0.0` até `172.31.255.255` |
| **C** | `192.168.0.0` até `192.168.255.255` |
| **Loopback** | `127.0.0.1` (É o IP que pinga você mesmo) |
| **APIPA** | `169.254.x.x` (Seu PC ganha esse IP quando falha em achar o Roteador) |

---

## 🛠️ Parte 1: O "Engano" do IP Real

1. Abra o terminal (CMD) e digite `ipconfig`. Anote o seu Endereço IPv4: ______________
2. Pela tabela acima, esse IP é Público (navega livre na internet) ou Privado (preso na rede local)?
3. Agora abra o navegador e acesse: `www.meuip.com.br`. Anote o IP que aparece na tela: ______________
4. **Reflexão:** Por que os IPs são diferentes? Como o site do MeuIP enxerga um número, mas o seu computador jura que tem outro?

---

## 🖥️ Parte 2: Assistindo o NAT em Ação (Packet Tracer)

**Cenário:** O NAT (Network Address Translation) é o "segurança da balada". Ele pega o seu documento interno (IP Privado), guarda, e te dá um crachá de visitante VIP (IP Público) para você ir para a internet.

**Passo 1: A Topologia**
1. Adicione um PC (IP Privado: `192.168.1.10`).
2. Conecte a um Roteador 1941 (Configure a porta G0/0 para `192.168.1.1`).
3. Conecte o Roteador a um Servidor externo simulando a internet (IP Público: `200.100.50.10`).

**Passo 2: Modo Simulação**
1. Entre em *Simulation Mode* (canto inferior direito). Filtre para ver apenas pacotes **ICMP**.
2. Abra o Command Prompt no PC e digite: `ping 200.100.50.10`.
3. Avance a simulação passo a passo até o pacote bater no Roteador.

**Passo 3: A Mágica da Tradução**
1. Clique no envelope que está EM CIMA do roteador.
2. Olhe a aba **Inbound PDU Details** (O pacote que CHEGOU no roteador). Qual é o IP de Origem (Source IP)? (Você verá `192.168.1.10`).
3. Agora olhe a aba **Outbound PDU Details** (O pacote que VAI SAIR para a internet). Qual é o novo Source IP? (Ele mudou para o IP da interface externa do roteador!).

**Missão Cumprida:** O Roteador trocou o remetente da carta. Quando o Servidor responder, responderá ao Roteador, e o Roteador lembrará de devolver para o seu PC. Isso é o NAT!
