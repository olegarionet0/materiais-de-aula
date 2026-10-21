---
tipo: runbook-aluno
disciplina: Redes de Computadores
tags:
  - runbook
  - subnetting
  - calculo-ip
---

# 🚀 Laboratório de Papel: O Desafio das Sub-redes

Hoje o laboratório não é no Packet Tracer. Hoje somos nós, o papel e a matemática.
Sua missão é dominar o conteúdo mais temido pelos candidatos de concursos públicos na área de TI.

## 🧮 As Fórmulas Sagradas
1. **Quantidade de IPs totais em uma rede:** `2^n` (Onde 'n' é o número de bits de host, ou seja, 32 menos o valor do CIDR).
2. **Quantidade de Hosts (Máquinas) Válidos:** `(2^n) - 2`.
   - *Por que tira 2?* Porque o primeiro IP é o nome da Rede, e o último é o Broadcast (ninguém pode usar esses dois nas placas de rede).
3. **Tamanho do Bloco (Pulo da Rede):** `256 - (Valor Decimal da Máscara)`.

---

## ⚔️ Exercício Guiado (Siga o Mestre)

**Cenário:** Você tem o IP `192.168.1.50` com a máscara `/26`. Onde essa máquina está?
- **Passo 1:** Descubra os bits livres. A rede vai até o bit 26. Um endereço IP tem 32 bits totais. Sobram **6 bits** de host (32 - 26 = 6).
- **Passo 2:** Quantos IPs totais cabem? `2 elevado a 6 = 64`. A rede pula de 64 em 64!
- **Passo 3:** Monte a tabela dos pulos (As "Fatias da Pizza"):
  - Rede 0: Vai do `.0` até `.63`
  - Rede 1: Vai do `.64` até `.127`
  - Rede 2: Vai do `.128` até `.191`
  - Rede 3: Vai do `.192` até `.255`
- **Passo 4:** Ache seu IP! O IP `192.168.1.50` cai dentro de qual fatia acima? Na Rede 0!

**Conclusão da Máquina `.50`:**
- Endereço da Rede (O começo): `192.168.1.0`
- Primeiro PC que pode ser usado: `192.168.1.1`
- Último PC que pode ser usado: `192.168.1.62`
- Endereço de Broadcast (O final/grito): `192.168.1.63`

---

## 🏆 Desafio Oficial: Torneio de Cálculo

Mão na massa. Para os IPs abaixo, você deve calcular: (A) ID da Rede, (B) Primeiro Host Válido, (C) Último Host Válido, (D) Broadcast.

**Desafio 1 (O clássico):** `192.168.0.100 /24`
- Endereço da Rede: ______________
- Broadcast: ______________
- Máscara Decimal: ______________

**Desafio 2 (O meio a meio):** `10.0.0.130 /25`
- Endereço da Rede: ______________
- Endereço de Broadcast: ______________

**Desafio 3 (Nível FGV Díficil):** `172.16.5.40 /27`
- *Dica:* /27 sobram 5 bits de host. 2^5 = 32. Os pulos são de 32 em 32.
- Endereço da Rede: ______________
- Endereço de Broadcast: ______________
- Intervalo Válido de IPs: do `.______` até o `.______`
