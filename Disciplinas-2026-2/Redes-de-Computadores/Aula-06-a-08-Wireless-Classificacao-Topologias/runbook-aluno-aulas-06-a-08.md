---
tipo: runbook
resumo: "Roteiro teórico-prático das Aulas 06 a 08 de Redes de Computadores: tecnologias sem fio, classificação de redes por abrangência e topologias físicas e lógicas."
title: "Guia do Aluno — Aulas 06 a 08: Wireless, Classificação e Topologias de Rede"
disciplina: Redes de Computadores
professor: Olegário Neto
data: 2026-09-22
status: pendente
tags: [redes-de-computadores, eeep-afs, wireless, topologias, runbook]
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Fazer a chamada / frequência.
* [ ] Recuperação ativa: perguntar o que os alunos lembram sobre modos de transmissão (Simplex, Half, Full-Duplex) da aula anterior.
* [ ] Separar 1 controle remoto de TV para a demonstração de Infravermelho.
* [ ] Verificar se o cartão RFID da catraca está disponível para demonstração comparativa com NFC.

</div>

# 📡 Guia do Aluno — Aulas 06 a 08
## Wireless, Classificação e Topologias de Rede
**Redes de Computadores | EEEP-AFS | Prof. Olegário Neto | 2026.2**

> [!info] **Sobre este Guia**
> Este roteiro acompanha as aulas 06, 07 e 08 da disciplina Redes de Computadores. Use-o para anotações, resolução das atividades e estudo posterior. Guarde este material — ele será referência nas avaliações.

---

## 🏛️ 1. Pré-requisitos

Antes de começar, você precisa lembrar dos conteúdos anteriores:

* [ ] Saber o que é um **Switch**, um **Hub** e um **Roteador** e em qual camada do modelo OSI cada um opera.
* [ ] Entender a diferença entre **Unicast**, **Broadcast** e **Multicast**.
* [ ] Saber o que é **Full-Duplex** e **Half-Duplex**.
* [ ] Ter participado da prática de **crimpagem de cabo UTP RJ-45** (Aulas 03 a 05).

---

## 📶 2. Tecnologias de Comunicação Sem Fio (Aula 06)

### 2.1 Por que estudar wireless?

O cabo UTP que você crimpar na aula passada transmite dados de forma estável e rápida — mas exige instalação física. As tecnologias sem fio eliminam o cabo usando ondas eletromagnéticas. Cada tecnologia foi projetada para um alcance e propósito diferente.

---

### 2.2 As 5 tecnologias principais

#### 🔵 Wi-Fi (IEEE 802.11)
- Transmissão de dados via **ondas de rádio** nas faixas de **2,4 GHz** e **5 GHz**.
- **2,4 GHz:** maior alcance, mais interferências (micro-ondas, Bluetooth, paredes).
- **5 GHz:** menor alcance, maior velocidade, menos interferências.
- Opera em **Half-Duplex** — o canal de rádio é compartilhado.
- Principais padrões:

| Padrão | Frequência | Velocidade Máxima Teórica |
|:---:|:---:|:---:|
| 802.11n (Wi-Fi 4) | 2,4 / 5 GHz | 600 Mbps |
| 802.11ac (Wi-Fi 5) | 5 GHz | 3,5 Gbps |
| 802.11ax (Wi-Fi 6) | 2,4 / 5 / 6 GHz | 9,6 Gbps |

> **Atenção:** Velocidade teórica ≠ velocidade real. Na prática, obstáculos, interferências e o número de dispositivos conectados reduzem o desempenho.

---

#### 🔷 Bluetooth (IEEE 802.15.1)
- Faixa de **2,4 GHz**, alcance de **~10 m** (padrão) a **~100 m** (industrial).
- Usa **frequency hopping** (salto de frequência) para evitar interferência — troca de canal 1.600 vezes por segundo.
- **BLE (Bluetooth Low Energy):** versão de baixo consumo para IoT, sensores e wearables.
- Exemplos: fone de ouvido, teclado sem fio, smartwatch, beacons de localização indoor.

---

#### 🔴 Infravermelho (IR — Infrared)
- Transmissão de dados por **luz infravermelha** (invisível ao olho humano, mas visível pela câmera do celular).
- **Simplex:** envia em uma direção apenas, sem retorno.
- **LOS (Line of Sight):** precisa de linha de visão direta entre emissor e receptor.
- Alcance: **1 a 5 metros**.
- Exemplo: controle remoto de TV, ar-condicionado.

> **Demonstração:** Aponte o controle remoto para a câmera do seu celular e pressione um botão. Você verá a luz IR piscando na tela — ela é invisível para o olho, mas o sensor da câmera a enxerga.

---

#### 🟢 NFC (Near Field Communication — ISO/IEC 14443)
- Opera em **13,56 MHz**, alcance máximo de **~4 cm** (máx. 10 cm).
- Baseado em tecnologia RFID de alta frequência (HF).
- **Modos de operação:**
  - **Leitura/Escrita:** celular lê uma tag NFC passiva.
  - **Ponto a Ponto (P2P):** dois dispositivos trocam dados (ex: compartilhar contato).
  - **Emulação de Cartão:** celular se comporta como um cartão bancário.
- Exemplos: Pix por aproximação (Google Pay / Apple Pay), passagem de ônibus/metrô, chaves de hotel inteligentes.

---

#### 🟡 RFID (Radio Frequency Identification)
- Identificação automática por radiofrequência. A tag não precisa estar visível — apenas dentro do alcance do leitor.
- **Tag Passiva:** sem bateria, alimentada pelo campo eletromagnético do leitor. Custo baixo.
- **Tag Ativa:** tem bateria própria, maior alcance (metros a centenas de metros). Custo maior.
- **Faixas de frequência:**
  - **LF (125 kHz):** catraca, controle de acesso de animais.
  - **HF (13,56 MHz):** NFC, cartões de biblioteca.
  - **UHF (860–960 MHz):** rastreamento de mercadorias em armazéns, pedágio eletrônico (Free Way).

> **Conexão com o projeto da escola:** O módulo **RC522** do projeto Frequência Biométrica com ESP32 usa RFID na faixa HF (13,56 MHz) — a mesma do NFC!

---

### 2.3 Tabela Comparativa Rápida

| Tecnologia | Frequência | Alcance | Modo | Exemplo Real |
|:---|:---:|:---:|:---:|:---|
| **Wi-Fi** | 2,4 / 5 GHz | 30–200 m | Half-Duplex | Internet na escola |
| **Bluetooth** | 2,4 GHz | 10–100 m | Full-Duplex | Fone de ouvido |
| **Infravermelho** | Luz IR | 1–5 m | Simplex | Controle remoto |
| **NFC** | 13,56 MHz | ≤ 10 cm | Half-Duplex | Pix por aproximação |
| **RFID** | 125 kHz / 13,56 MHz / UHF | cm – centenas de m | Simplex/Duplex | Catraca, estoque |

---

## 🌍 3. Classificação das Redes por Abrangência (Aula 07)

Redes são classificadas pelo **alcance geográfico** que cobrem. Conheça da menor para a maior:

### PAN — Personal Area Network (Rede Pessoal)
- **Alcance:** ~1 a 10 metros.
- **Objetivo:** conectar dispositivos pessoais de um único usuário.
- **Exemplos:** celular ↔ smartwatch (Bluetooth), notebook ↔ fone sem fio.

### LAN — Local Area Network (Rede Local)
- **Alcance:** um prédio ou conjunto de prédios próximos (~1 km).
- **Objetivo:** conectar dispositivos de uma mesma organização localmente.
- **Exemplos:** rede do laboratório de informática, rede Wi-Fi doméstica.

### CAN — Campus Area Network (Rede de Campus)
- **Alcance:** campus universitário, escola, condomínio industrial (~alguns km).
- **Objetivo:** interligar múltiplos edifícios de um mesmo campus com infraestrutura própria.
- **Exemplos:** rede da EEEP-AFS interligando o bloco de informática, a secretaria e a quadra.

### MAN — Metropolitan Area Network (Rede Metropolitana)
- **Alcance:** uma cidade ou região metropolitana (~até 50 km).
- **Objetivo:** interligar múltiplas LANs de uma cidade.
- **Exemplos:** rede de provedores de internet de Redenção-CE; rede de câmeras de segurança pública.

### WAN — Wide Area Network (Rede de Longa Distância)
- **Alcance:** países, continentes ou o mundo inteiro.
- **Objetivo:** interligar redes geograficamente distantes.
- **Exemplos:** A própria Internet; links MPLS entre filiais de uma empresa em estados diferentes.

### SAN — Storage Area Network (Rede de Armazenamento)
- **Alcance:** geralmente dentro de um datacenter.
- **Objetivo:** conectar servidores a dispositivos de armazenamento dedicados (storages/arrays de disco) com altíssima velocidade e baixa latência.
- **Tecnologias:** Fibre Channel (FC) ou iSCSI (sobre Ethernet).
- **Exemplo:** infraestrutura de servidores de grandes empresas e nuvem.

> **Mnemônico de abrangência crescente:**
> **P**equeno → **L**ocal → **C**ampus → **M**etropolitano → **W**orld → **S**torage
> **PAN < LAN < CAN < MAN < WAN** (SAN é especial — não é geográfica, mas funcional)

---

## 🔀 4. Topologias de Rede (Aula 08)

### 4.1 Física vs. Lógica

| Tipo | O que descreve | Exemplo |
|:---|:---|:---|
| **Topologia Física** | Como os cabos e dispositivos estão conectados no mundo real | Todos os computadores ligados por cabo a um Switch central |
| **Topologia Lógica** | Como os dados trafegam entre os dispositivos | Mesmo com Switch, dados mais antigos circulavam como num barramento lógico |

> **Regra prática:** Uma rede pode ter topologia física em **Estrela** (todos os cabos vão ao Switch) mas operar logicamente como um **Barramento** (protocolos antigos). São conceitos independentes!

---

### 4.2 As 6 Topologias Principais

#### 🟠 Barramento (Bus)
- Todos os dispositivos conectados em um **único cabo principal**.
- Dados trafegam por todo o cabo — todos os dispositivos "ouvem" a transmissão.
- **Vantagem:** simples e barato.
- **Desvantagens:** falha no cabo central derruba tudo; colisões frequentes; difícil diagnosticar falha.
- **Tecnologia histórica:** Ethernet 10BASE-2 (cabo coaxial).

```
[PC1] ──┬── [PC2] ──┬── [PC3] ──┬── [PC4]
        │           │           │
    ════════════════════════════════  ← Cabo Backbone (Bus)
```

---

#### 🟣 Anel (Ring)
- Dispositivos formam um **anel fechado**; dados circulam em uma direção (ou duas em anel duplo).
- Controle de acesso por **token**: só quem tem o token pode transmitir — sem colisões.
- **Vantagem:** desempenho previsível, sem colisões.
- **Desvantagem:** falha em um nó pode interromper o anel inteiro.
- **Tecnologias:** Token Ring (IBM), FDDI (fibra óptica).

```
    [PC1]
   ↗     ↘
[PC4]   [PC2]
   ↖     ↙
    [PC3]
```

---

#### 🔵 Estrela (Star) ⭐ — A mais usada hoje
- Todos os dispositivos conectados a um **ponto central** (Switch ou Hub).
- **Vantagens:** falha em um cabo/nó não afeta os demais; fácil diagnóstico; fácil expansão.
- **Desvantagem:** falha no dispositivo central (Switch) derruba toda a rede; maior uso de cabo.
- **Topologia dominante** nas redes LAN modernas com Switch.

```
     [PC1]  [PC2]
         ↘  ↙
        [SWITCH]
         ↗  ↖
     [PC3]  [PC4]
```

---

#### 🟢 Árvore (Tree / Hierárquica)
- **Estrelas conectadas em hierarquia:** Switch de Acesso → Switch de Distribuição → Switch Core.
- **Vantagem:** escala bem; segmenta o tráfego por camada.
- **Desvantagem:** falha em um switch de distribuição isola um segmento inteiro.
- **Uso:** redes corporativas e institucionais (hospitais, universidades, escolas grandes).

```
              [Switch Core]
             ↙             ↘
   [Sw. Distribuição A]   [Sw. Distribuição B]
      ↙       ↘               ↙       ↘
[Sw. Acesso] [Sw. Acesso] [Sw. Acesso] [Sw. Acesso]
```

---

#### 🔴 Malha (Mesh)
- Cada dispositivo conectado a **múltiplos outros** (ou a todos).
- **Full Mesh:** cada nó conectado a todos os outros.
- **Partial Mesh:** nós críticos têm caminhos redundantes.
- **Vantagem:** altíssima tolerância a falhas — sempre há um caminho alternativo.
- **Desvantagem:** custo alto de cabos e configuração complexa.
- **Usos:** backbone da Internet (BGP), redes militares, Wi-Fi Mesh doméstico (ex: Google Nest).

---

#### ⚪ Híbrida
- Combinação de **duas ou mais topologias** em uma só rede.
- **Exemplo:** Árvore (interligação de prédios) + Estrela (dentro de cada prédio) + Malha parcial (links redundantes entre os switches core).
- **Realidade:** a maioria das redes corporativas e institucionais modernas é híbrida.

---

### 4.3 Tabela Comparativa de Topologias

| Topologia | Dispositivo Central | Tolerância a Falhas | Custo Relativo | Uso Típico |
|:---|:---:|:---:|:---:|:---|
| **Barramento** | Nenhum | Baixa | Muito Baixo | Redes históricas coaxiais |
| **Anel** | Nenhum (token) | Média | Médio | FDDI, Token Ring (legado) |
| **Estrela** | Switch / Hub | Alta (sem o centro) | Médio | LAN moderna com Switch |
| **Árvore** | Switches em camadas | Média-Alta | Alto | Redes corporativas |
| **Malha** | Nenhum (todos interligados) | Muito Alta | Muito Alto | Internet, Wi-Fi Mesh |
| **Híbrida** | Variável | Alta | Alto | Redes empresariais reais |

---

## 🏆 5. Desafio da Aula — "Projete a Rede da EEEP-AFS"

**Cenário:** A EEEP-AFS vai expandir sua rede para conectar 4 ambientes:
- **Bloco A:** Laboratório 1 (20 computadores) + Laboratório 2 (20 computadores)
- **Bloco B:** 4 Salas de aula (10 computadores cada)
- **Secretaria:** 5 computadores + impressora de rede
- **Pátio/Quadra:** Ponto de acesso Wi-Fi para 60 dispositivos móveis simultâneos

**Sua missão (em grupo de 3 alunos):**

1. Desenhe o diagrama de rede no papel identificando:
   - A topologia interna de cada bloco (qual a melhor opção e por quê?).
   - Como os blocos se interligam (qual topologia para o backbone?).
   - Onde entra o link de internet da operadora (ONU/OLT) e o Roteador/Firewall.
   - Onde posicionar os Access Points para cobrir o pátio.

2. No diagrama, marque com setas coloridas:
   - 🔵 Um link que opera em **Full-Duplex**.
   - 🟡 Uma situação onde ocorre transmissão em **Broadcast**.
   - 🟢 Uma situação de tráfego **Unicast**.

3. Identifique **pelo menos 1 ponto de falha crítica** e proponha como eliminar com redundância.

4. Classifique a rede resultante: **LAN ou CAN?** Justifique.

**Desafio extra:** Como você transformaria a interligação entre blocos em topologia **Malha parcial** para eliminar o ponto de falha central?

---

## ❓ 6. Perguntas de Revisão

Responda no caderno após as aulas:

1. Qual tecnologia sem fio você usaria para um sistema de pagamento por aproximação em uma loja? E para rastrear paletes de mercadoria em um armazém? Por quê são tecnologias diferentes?

2. Explique com suas palavras a diferença entre **topologia física** e **topologia lógica**. Dê um exemplo de cada.

3. Por que a topologia em **Estrela** é a mais usada em redes locais modernas, mesmo sendo mais cara em cabeamento do que a topologia em Barramento?

4. Uma empresa tem escritórios em Fortaleza, Redenção e Juazeiro do Norte, todos interligados por links de internet. Que tipo de rede ela possui: LAN, MAN ou WAN? Justifique.

5. O Wi-Fi opera em Half-Duplex mesmo parecendo simultâneo. Explique como isso é possível e qual a consequência disso quando muitos dispositivos tentam transmitir ao mesmo tempo.

---

## 📚 7. Referências e Próximos Passos

- **Próxima sequência (Aulas 09+):** Modelo OSI e TCP/IP — as 7 camadas que explicam como todos os equipamentos e topologias se comunicam.
- **Para pesquisar antes da próxima aula:** O que são as 7 camadas do modelo OSI? Qual a função de cada uma?
- **Ferramenta para explorar redes:** Cisco Packet Tracer (disponível gratuitamente com cadastro no Cisco NetAcad).
