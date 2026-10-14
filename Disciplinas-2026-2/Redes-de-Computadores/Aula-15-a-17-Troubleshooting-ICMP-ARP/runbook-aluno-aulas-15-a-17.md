---
tipo: runbook-aluno
disciplina: Redes de Computadores
tags:
  - runbook
  - troubleshooting
  - ping
  - tracert
---

# 🚀 Laboratório: Diagnóstico de Redes e Troubleshooting

## 🛠️ Parte 1: Investigação no Sistema Operacional Real

Nesta fase, você atuará como Analista Nível 1, analisando as conexões do próprio laboratório da escola.

**Passo 1: Descobrindo o ambiente**
1. Abra o `cmd` do Windows.
2. Digite `ipconfig /all` e anote três informações cruciais:
   - Seu Endereço IPv4: ______________
   - A Máscara de Sub-rede: ______________
   - O Gateway Padrão (O Roteador de saída): ______________

**Passo 2: O Teste de Conectividade Local (ICMP)**
1. Digite `ping` seguido do **IP do seu Gateway Padrão** (anotado acima) e dê Enter.
2. O que aconteceu? Se houve respostas, sua conexão física com o roteador da escola está perfeita.

**Passo 3: Mapeando Rotas Externas**
1. Digite `tracert 8.8.8.8` (Servidor do Google).
2. Observe os "saltos" (Hops). O pacote passou pelo seu roteador, depois pelo roteador do provedor de internet, até chegar no Google.
3. Quantos saltos foram necessários para chegar ao Google? ______________

**Passo 4: Verificando a Tabela ARP**
1. O protocolo ARP descobre o MAC (físico) a partir de um IP.
2. Digite `arp -a` no terminal.
3. Olhe na lista o IP do Gateway Padrão. Qual é o Endereço Físico (MAC) vinculado a ele? ______________

---

## 🖥️ Parte 2: O Desafio Packet Tracer (Break-Fix)

**A Missão:** Você foi contratado pela empresa "ACME Corp". O usuário do "PC-Recepção" abriu um chamado dizendo: *"Não consigo acessar o servidor de arquivos nem a internet!"*. Sua missão é achar o problema.

**Passo 1: Montando o Cenário com Erro Proposital**
*(O professor disponibilizará o arquivo .pkt ou vocês montarão rapidamente):*
1. PC-Recepção (IP: `192.168.10.50` / Máscara: `255.255.255.0` / Gateway: `192.168.10.254`)
2. Switch Central.
3. Roteador de Saída (IP da interface LAN: `192.168.10.1`).

**Passo 2: Metodologia de Troubleshooting**
Não mexa nas configurações ainda! Vamos testar metodicamente:
1. Vá no PC-Recepção > Desktop > Command Prompt.
2. **Pingue o próprio PC:** `ping 127.0.0.1` (Se funcionar, a placa de rede está ok).
3. **Pingue o Gateway:** `ping 192.168.10.1`.
   - *Resultado esperado:* Falha (Request timed out).

**Passo 3: Encontrando e Corrigindo o Erro**
1. Abra a configuração de IP do PC-Recepção (Desktop > IP Configuration).
2. Analise os dados que inserimos no Passo 1. Olhe para o IP da interface LAN do roteador (`192.168.10.1`).
3. O que está errado na configuração do Gateway do PC?
4. **Conserte:** Altere o Gateway do PC para o IP correto do Roteador.
5. Volte no Command Prompt e dê o `ping 192.168.10.1` novamente. Sucesso!

## 🧠 Parte 3: Perguntas de Reflexão
1. No laboratório real da escola, se o seu teste do `ping` para o Gateway Padrão der "Tempo limite esgotado" (Request timed out), mas o cabo estiver conectado, cite duas possíveis causas lógicas para o problema.
2. Para que serve o comando `tracert` e em que situação um técnico usaria ele no mercado de trabalho?
