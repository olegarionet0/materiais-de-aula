---
tipo: runbook
resumo: "Roteiro teórico-prático das Aulas 09 a 11 de Redes de Computadores: modelos de referência OSI e TCP/IP, encapsulamento, PDUs e observação das camadas no Cisco Packet Tracer."
title: "Guia do Aluno — Aulas 09 a 11: Modelos OSI e TCP/IP"
disciplina: Redes de Computadores
professor: Olegário Neto
data: 2026-10-06
status: pendente
tags: [redes-de-computadores, eeep-afs, osi, tcp-ip, encapsulamento, packet-tracer, runbook]
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Fazer a chamada / frequência.
* [ ] Recuperação ativa: perguntar qual equipamento fica no centro da topologia estrela e qual liga a escola à internet.
* [ ] Levar os envelopes (4 por grupo) e bilhetes para a atividade "Correio em Camadas".
* [ ] Bloco 2: conferir login do Packet Tracer nas máquinas e ter o `.pkt` de plano B no pendrive.
* [ ] Avisar sobre o feriado de 12/10 e a data do Bloco 2 (laboratório).

</div>

# 📦 Guia do Aluno — Aulas 09 a 11
## Modelos de Referência OSI e TCP/IP
**Redes de Computadores | EEEP-AFS | Prof. Olegário Neto | 2026.2**

> [!info] **Sobre este Guia**
> Este roteiro acompanha as aulas 09, 10 e 11. A primeira parte é teórica (sala); a segunda é prática, no laboratório, com o Cisco Packet Tracer. Preencha as tabelas durante a aula — elas fazem parte da avaliação.

---

## 🏛️ 1. Pré-requisitos

Antes de começar, relembre:

* [ ] O que fazem o **Hub**, o **Switch** e o **Roteador** (Aulas 03–05).
* [ ] A diferença entre **topologia física** e **topologia lógica** (Aula 08).
* [ ] O que é **Unicast** e **Broadcast**.

---

## 🤔 2. A pergunta da aula

> Você digita `www.youtube.com` e aperta Enter. Seu celular é de uma marca, o roteador de outra, o servidor é do Google e o cabo submarino é de uma quarta empresa. **Como equipamentos de fabricantes diferentes conseguem se entender?**

Anote sua hipótese antes da explicação:

```
Minha hipótese: _____________________________________________
```

---

## ✉️ 3. Atividade "Correio em Camadas" (sala)

Seu grupo de 5 pessoas vai enviar um bilhete para o grupo vizinho. Cada pessoa é uma **camada** e só cuida do **seu envelope**.

| Aluno | Camada | O que escreve no envelope |
|:---:|:---|:---|
| 1 | Aplicação | O bilhete: *"GET /video"* |
| 2 | Transporte | Envelope 1: *"Porta 443 — parte 1 de 1"* |
| 3 | Rede | Envelope 2: *"De: IP do Lab 1 → Para: IP do Servidor"* |
| 4 | Enlace | Envelope 3: *"De: MAC do PC → Para: MAC do Roteador"* |
| 5 | Física | Leva o pacote até o grupo vizinho (o "cabo") |

O grupo que recebe **abre na ordem contrária**: cada aluno lê só o envelope da sua camada e entrega o conteúdo para o colega de cima.

**Responda em grupo:**
1. O aluno "Enlace" do grupo receptor precisou ler o bilhete? Por quê?
   ```
   ____________________________________________________________
   ```
2. Se o aluno "Rede" escrever o IP errado, o que acontece com o bilhete?
   ```
   ____________________________________________________________
   ```

> [!tip] **O nome disso é ENCAPSULAMENTO**
> Ao **enviar**, cada camada coloca um "envelope" (cabeçalho) por fora do que recebeu da camada de cima.
> Ao **receber**, cada camada retira o seu envelope e entrega o conteúdo para a camada de cima (**desencapsulamento**).

---

## 🧱 4. Por que dividir a rede em camadas?

| Motivo | O que significa | Exemplo |
|:---|:---|:---|
| **Padronização** | Todo fabricante segue a mesma regra em cada camada | Celular Samsung conversa com roteador TP-Link |
| **Independência** | Trocar uma camada não obriga a mudar as outras | Trocar Wi-Fi por cabo não muda o navegador |
| **Diagnóstico** | O técnico investiga camada por camada | "O cabo está ligado? Tem IP? O site responde?" |

---

## 🗂️ 5. Modelo OSI — 7 camadas

O **OSI** (*Open Systems Interconnection*) foi publicado pela **ISO em 1984**. É um **modelo de referência**: serve para estudar, ensinar e diagnosticar redes.

| Nº | Camada | O que faz | PDU | Equipamento / Exemplo |
|:---:|:---|:---|:---:|:---|
| 7 | **Aplicação** | Conversa com o programa do usuário | Dados | Navegador (HTTP), DNS |
| 6 | **Apresentação** | Formata, criptografa e comprime | Dados | TLS, JPEG, UTF-8 |
| 5 | **Sessão** | Abre, mantém e encerra a conversa | Dados | Login que "expira" |
| 4 | **Transporte** | Entrega fim a fim, usa portas | **Segmento** | TCP / UDP |
| 3 | **Rede** | Endereço lógico (IP) e escolha da rota | **Pacote** | **Roteador** |
| 2 | **Enlace** | Endereço físico (MAC) na rede local | **Quadro** | **Switch**, placa de rede |
| 1 | **Física** | Transforma tudo em sinal: elétrico, luz ou rádio | **Bits** | **Hub**, cabo UTP, fibra |

> [!tip] **Mnemônicos**
> - **Camadas (de baixo para cima):** **F**iz **E**sse **R**esumo **T**entando **S**alvar **A** **A**ula
>   → Física, Enlace, Rede, Transporte, Sessão, Apresentação, Aplicação
> - **PDUs (de cima para baixo):** **D**ados **S**eguem **P**elo **Q**uadro em **B**its
>   → Dados, Segmento, Pacote, Quadro, Bits

> [!note] **PDU = Protocol Data Unit**
> É o nome que o "pacote de dados" recebe em cada camada. É a mesma informação, só que com envelopes diferentes por fora.

---

## 🌐 6. Modelo TCP/IP — 4 camadas

O **TCP/IP** é a pilha que a internet usa **na prática** — é o que está implementado no Windows, no Linux, no Android e no iOS.

| TCP/IP | Equivale no OSI | Exemplos |
|:---|:---|:---|
| **Aplicação** | 7 + 6 + 5 | HTTP, DNS, SMTP |
| **Transporte** | 4 | TCP, UDP |
| **Internet** | 3 | IP, ICMP |
| **Acesso à Rede** | 2 + 1 | Ethernet, Wi-Fi |

```
      OSI                     TCP/IP
 ┌──────────────┐        ┌──────────────┐
 │ 7 Aplicação  │        │              │
 │ 6 Apresent.  │  ───►  │  Aplicação   │
 │ 5 Sessão     │        │              │
 ├──────────────┤        ├──────────────┤
 │ 4 Transporte │  ───►  │  Transporte  │
 ├──────────────┤        ├──────────────┤
 │ 3 Rede       │  ───►  │  Internet    │
 ├──────────────┤        ├──────────────┤
 │ 2 Enlace     │  ───►  │ Acesso à Rede│
 │ 1 Física     │        │              │
 └──────────────┘        └──────────────┘
```

> [!warning] **Não confunda**
> **OSI** = mapa para estudar (7 camadas). **TCP/IP** = o que roda de verdade (4 camadas).

---

## 🖥️ 7. Laboratório — Encapsulamento no Packet Tracer

### Passo 1: Abrir o Packet Tracer
- Abra o **Cisco Packet Tracer**. Se pedir login, chame o professor.

### Passo 2: Montar a topologia
Arraste os dispositivos e ligue com os cabos indicados:

```
💻 [PC0] ── 🔀 [Switch 2960] ── 🌐 [Router 1941] ══ 🗄️ [Server0]
   Fa0        Fa0/1   Fa0/2        G0/0    G0/1          Fa0
```

| Ligação | Cabo no Packet Tracer |
|:---|:---|
| PC0 ↔ Switch | **Copper Straight-Through** (linha preta contínua) |
| Switch ↔ Router | **Copper Straight-Through** |
| Router ↔ Server0 | **Copper Cross-Over** (linha preta tracejada) |

> [!tip] Lembra da crimpagem? **Switch ↔ PC/Roteador/Servidor** = cabo direto. Ligação **entre dois do mesmo grupo** (PC, Roteador, Servidor) = cabo cruzado.

### Passo 3: Configurar os endereços (copie exatamente)
> Endereçamento IP será estudado mais adiante (Aulas 39–45 do cronograma). Por enquanto, apenas copie.

| Dispositivo | Onde configurar | IP | Máscara | Gateway |
|:---|:---|:---|:---|:---|
| PC0 | Desktop → IP Configuration | 192.168.1.10 | 255.255.255.0 | 192.168.1.1 |
| Router G0/0 | Config → GigabitEthernet0/0 (marcar **On**) | 192.168.1.1 | 255.255.255.0 | — |
| Router G0/1 | Config → GigabitEthernet0/1 (marcar **On**) | 10.0.0.1 | 255.255.255.0 | — |
| Server0 | Desktop → IP Configuration | 10.0.0.10 | 255.255.255.0 | 10.0.0.1 |

- No **Server0** → aba **Services** → **HTTP**: confirme que está **On**.
- Aguarde as luzes dos cabos ficarem **verdes**.

### Passo 4: Entrar no modo Simulação
1. Clique em **Simulation** (canto inferior direito).
2. Em **Edit Filters**, deixe marcados apenas **HTTP** e **ARP**.

### Passo 5: Gerar o tráfego
1. PC0 → **Desktop** → **Web Browser**.
2. Digite `10.0.0.10` e clique em **Go**.
3. Clique em **Capture / Forward** (▶|) várias vezes e veja o envelope andar.

### Passo 6: Abrir o envelope
- Clique no envelope quando ele estiver **em cada dispositivo**.
- Na aba **OSI Model**:
  - **In Layers** = camadas que o dispositivo abriu ao **receber** (desencapsulamento).
  - **Out Layers** = camadas que ele montou ao **enviar** (encapsulamento).

> [!tip] **O que observar**
> Repare até qual camada cada dispositivo "sobe". Isso mostra em que camada ele trabalha.

---

## 📝 8. Tabela de Observação (entregar)

Preencha com o que você viu no **In Layers** de cada dispositivo durante o acesso HTTP:

| Dispositivo | Até qual camada ele abriu? | Que endereço ele precisa ler? (MAC / IP / nenhum) | Nome da PDU que ele trata |
|:---|:---:|:---|:---|
| Switch | | | |
| Roteador | | | |
| Server0 | | | |

**Conclusão da dupla** (1 frase):
```
Os equipamentos intermediários não precisam abrir todas as camadas porque ______
_______________________________________________________________________________
```

---

## 🏆 9. Desafio Extra

1. **Ping x HTTP:** troque o filtro para **ICMP** e, no PC0 → *Command Prompt*, digite `ping 10.0.0.10`. Abra o envelope no Server0: quais camadas **deixaram de aparecer** em comparação com o HTTP? Por quê?
2. **O mistério do ARP:** na primeira tentativa aparece um envelope **ARP** antes do HTTP. Que endereço o PC0 está tentando descobrir? Em que camada ele é usado?

---

## 🔧 10. Diagnóstico por Camadas

Um colega não consegue abrir o site da escola. **Em qual camada OSI está cada problema?**

| Sintoma | Camada (nº e nome) |
|:---|:---|
| O cabo de rede está desconectado | |
| O PC está com MAC duplicado na rede local | |
| O PC está com o gateway errado | |
| O firewall bloqueia a porta 443 | |
| O certificado HTTPS do site expirou | |
| O servidor web está desligado | |

---

## ❓ 11. Perguntas de Revisão

Responda no caderno:

1. Por que as redes são organizadas em camadas? Cite 2 motivos.
2. Escreva as 7 camadas do OSI, da 1 à 7.
3. Qual o nome da PDU nas camadas 4, 3, 2 e 1?
4. Quais camadas do OSI ficam juntas na camada **Aplicação** do TCP/IP?
5. Em qual camada trabalham o **Hub**, o **Switch** e o **Roteador**?
6. Explique com suas palavras o que é **encapsulamento**.

---

## 📚 Referências
- Cronograma oficial SEDUC-CE — Redes de Computadores, Aula 15: *Modelos de referência ISO/OSI e TCP/IP*.
- KUROSE, J.; ROSS, K. *Redes de Computadores e a Internet: uma abordagem top-down*. Pearson.
- TANENBAUM, A. S. *Redes de Computadores*. Pearson.
- Cisco Networking Academy — *Packet Tracer* (netacad.com).
