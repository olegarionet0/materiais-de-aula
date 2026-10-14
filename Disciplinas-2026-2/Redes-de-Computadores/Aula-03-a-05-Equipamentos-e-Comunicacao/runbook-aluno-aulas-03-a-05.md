---
tipo: runbook
resumo: "Guia prático e teórico cobrindo Ativos de Rede (Hub, Switch, Roteador, AP, ONU/OLT), Formas (Unicast, Multicast, Broadcast, Anycast) e Modos de Transmissão (Simplex, Half-Duplex, Full-Duplex)."
title: "Guia de Estudos e Prática: Equipamentos e Comunicação em Redes"
disciplina: Redes de Computadores
professor: Olegário Neto
data: 2026-08-17
status: concluido
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [x] Fazer chamada e conferir os líderes de bancada. ✅ 2026-09-21
* [x] Distribuir folhas A4 para o desafio de diagramação de redes. ✅ 2026-09-21
* [x] Conduzir a dinâmica do "Carteiro da Sala" antes de iniciar a teoria de Hub vs Switch. ✅ 2026-09-21

</div>

# 📡 Guia de Estudos e Prática: Infraestrutura e Comunicação de Dados

> [!info] **Sobre este Guia**
> Este material complementa as Aulas 03, 04 e 05 da disciplina de **Redes de Computadores**. Aqui você encontrará o resumo dos conceitos essenciais, tabelas comparativas, perguntas de fixação e o roteiro do desafio prático de arquitetura no papel.

---

## 🧭 1. Resumo Conceitual Rápido

### A. Equipamentos de Interconexão (Quem é quem na rede?)
* **Hub (Camada 1):** Repetidor multiportas "burro". Replica todo sinal elétrico que entra por uma porta em todas as outras. Compartilha um único **domínio de colisão** e facilita ataques de interceptação (*sniffing*).
* **Switch (Camada 2):** Comutador inteligente. Aprende os endereços físicos (**MAC**) dos dispositivos conectados e encaminha o quadro apenas para a porta de destino. Cada porta é um **domínio de colisão isolado**.
* **Bridge (Ponte - Camada 2):** Antecessora do switch. Segmenta uma rede Ethernet em dois ou poucos domínios de colisão via software/hardware antigo.
* **Repetidor (Camada 1):** Regenera sinais atenuados pela distância.
* **Roteador (Camada 3):** Conecta redes lógicas distintas utilizando endereços **IP**. Isole e **bloqueia transmissões em broadcast** de passar para outras redes.
* **Access Point (AP):** Converte a rede cabeada Ethernet em ondas de rádio (802.11). Em empresas e escolas, é instalado no teto e gerenciado centralmente.
* **Modem vs ONU/OLT:** 
  - *Modem:* Modula/demodula sinais em linhas telefônicas de cobre.
  - *OLT:* Fica no provedor de internet gerenciando a rede de fibra (GPON).
  - *ONU / ONT:* Fica no cliente (ou escola), convertendo **pulsos de luz da fibra** em sinal elétrico Ethernet.
* **Gateway & Firewall:**
  - *Gateway:* Ponto/porta de saída padrão de uma rede local para a Internet.
  - *Firewall:* Barreira de proteção que filtra pacotes suspeitos.

---

### B. Formas de Comunicação
* **Unicast (1 : 1):** Comunicação direta entre um transmissor e um receptor (ex: navegação web HTTP, SSH, download).
* **Broadcast (1 : Todos):** Um emissor transmite para todos os nós da rede local (ex: ARP Request, DHCP Discover).
* **Multicast (1 : Grupo):** Transmissão direcionada a múltiplos nós inscritos em uma lista específica (ex: IPTV corporativo, streaming em rede local).
* **Anycast (1 : Mais Próximo):** Múltiplos servidores compartilham o mesmo IP público na Internet; o protocolo de roteamento BGP direciona a requisição ao datacenter com menor latência (ex: Servidores de DNS 1.1.1.1, Cloudflare CDN para proteção contra DDoS).

---

### C. Modos de Transmissão de Dados
* **Simplex (Sentido Único):** Apenas um transmite, os outros apenas recebem (ex: Rádio FM, TV aberta, teclado para CPU).
* **Half-Duplex (Bidirecional Alternado):** Ambos transmitem e recebem, mas **um de cada vez** (ex: Walkie-talkie com "câmbio", redes antigas com Hub e protocolo CSMA/CD, Wi-Fi padrão).
* **Full-Duplex (Bidirecional Simultâneo):** Transmissão e recepção simultâneas por canais independentes (ex: Ligação telefônica, conexões com Switch Ethernet moderno, cabos de fibra óptica TX/RX).

---

## 🏆 2. Desafio Prático: "Arquiteto de Redes EEEP-AFS"

> **Instruções:** Em duplas, desenhem em uma folha A4 a arquitetura de rede proposta para o bloco de laboratórios da nossa escola.

### Requisitos do Projeto:
1. **Ponto de Entrada:** Indique a chegada da fibra óptica da operadora e conecte à **ONU**.
2. **Núcleo (Core):** Conecte a ONU ao **Roteador/Firewall Principal** da escola.
3. **Distribuição:** A partir do Roteador, faça a distribuição cabeada para **dois Switches**:
   - Switch do **Lab de Informática 1** (atendendo 20 PCs).
   - Switch do **Lab de Informática 2** (atendendo 20 PCs).
4. **Rede Sem Fio:** Instale 1 **Access Point (AP)** em cada laboratório conectado ao respectivo Switch.
5. **Mapeamento de Tráfego:** No diagrama, sinalize com setas coloridas:
   - 🔵 Uma ligação operando em modo **Full-Duplex**.
   - 🔴 Uma situação onde ocorrerá envio em **Broadcast** (ex: ARP).
   - 🟢 Uma rota de tráfego **Unicast** (ex: um aluno acessando o servidor web).

---

## ❓ 3. Perguntas de Fixação & Estudo

Responda no seu caderno:

1. *Por que a substituição de Hubs por Switches aumentou tanto o desempenho quanto a segurança nas empresas?*
2. *Qual a função da OLT no provedor e da ONU na escola?*
3. *Se um servidor DNS utiliza Anycast, o que acontece se o datacenter mais próximo de Fortaleza ficar fora do ar por manutenção?*
4. *Por que o modo Full-Duplex elimina a necessidade de controle de colisões em portas de um Switch?*
5. *Diferencie Broadcast de Multicast através de um exemplo prático do cotidiano.*
