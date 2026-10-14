---
theme: black
css: slides-eeep-afs
highlightTheme: monokai
slideNumber: "c/t"
---
 
<!-- slide -->
# 🏫 EEEP Adolfo Ferreira de Sousa
## Redes de Computadores · 2º Ano TI
### Equipamentos de Rede, Formas e Modos de Comunicação

**Professor:** Olegário Neto  
**Aulas 03, 04 e 05**

---
<!-- slide -->
## 📋 O que veremos hoje

1. **Equipamentos de Rede:** Do Hub à Fibra Óptica (ONU/OLT).
2. **Arquitetura & Segurança:** Sniffing, Colisão e Broadcast.
3. **Formas de Comunicação:** Unicast, Broadcast, Multicast e Anycast.
4. **Modos de Transmissão:** Simplex, Half-Duplex e Full-Duplex.
5. **Desafio Prático:** Arquiteto de Redes no Papel.

note:
Roteiro do Orador: Apresente a agenda de forma dinâmica destacando que a aula de hoje conecta a infraestrutura física com a segurança da informação que eles utilizam todo dia na internet.

---
<!-- slide -->
## 🎯 O Grande Desafio

> **Cenário:** Você manda um áudio de WhatsApp para um colega conectado no Wi-Fi da escola.
> 
> *Como essa mensagem sai da sua antena, atravessa cabos, passa por roteadores e chega **apenas** no celular dele sem apitar no celular da sala ao lado?*

<!-- Visual Sugerido: Ilustração esquemática de um pacote de dados navegando entre celulares e antenas -->

note:
Roteiro do Orador: Use esse gancho para conectar a curiosidade dos alunos com o papel de cada equipamento na rota de um pacote de dados.

---
<!-- slide -->
## 🔌 Hub vs. Switch: O Salto Tecnológico

| Característica | **HUB (Concentrador)** | **SWITCH (Comutador)** |
|:---|:---|:---|
| **Camada OSI** | Camada 1 (Física) | Camada 2 (Enlace) |
| **Inteligência** | "Burro" (Repete o sinal em todas as portas) | "Inteligente" (Lê a tabela MAC) |
| **Segurança** | ⚠️ **Baixa** (Facilidade para *Sniffing*) | 🔒 **Alta** (Isolamento por porta) |
| **Domínio de Colisão** | 1 único para todas as portas | 1 domínio isolado **por porta** |

note:
Roteiro do Orador: Enfatize que no Hub qualquer computador em modo promíscuo consegue capturar o tráfego dos colegas via Wireshark. O Switch acabou com essa facilidade inicial ao encaminhar quadros apenas para a porta de destino.

---
<!-- slide -->
## 🌉 Bridge & Repetidor: Os Precursores

- 🔁 **Repetidor (Camada 1):**
  - Apenas regenera e amplifica o sinal atenuado pela distância do cabo.
  - Não filtra nada; estende o domínio de colisão.
- 🌉 **Bridge / Ponte (Camada 2):**
  - Conecta dois segmentos de rede e filtra quadros por endereço MAC.
  - **Divide o domínio de colisão** em partes menores.
  - *O Switch nada mais é do que uma Bridge moderna com dezenas de portas em hardware acelerado (ASIC).*

note:
Roteiro do Orador: Explique como a Bridge foi a "mãe" do Switch moderno e como o repetidor é puramente elétrico/físico.

---
<!-- slide -->
## 🌐 Roteador & Gateway: Conectando Mundos

- 🧭 **Roteador (Camada 3):**
  - Interliga **redes diferentes** usando endereços lógicos (**IP**).
  - Consulta a tabela de roteamento para escolher o melhor caminho.
  - **Divide domínios de broadcast** (o broadcast de uma rede não passa para outra).
- 🚪 **Gateway (Porta de Saída):**
  - Conceito de ponto de transição que traduz e interliga redes com protocolos ou sub-redes diferentes.
  - O roteador atua como o *Default Gateway* dos computadores da LAN.

note:
Roteiro do Orador: Diferencie: Switch conecta máquinas dentro da mesma rede (LAN); Roteador conecta redes diferentes (LAN com WAN/Internet).

---
<!-- slide -->
## 📶 Wi-Fi Doméstico vs. Access Point Corporativo

- 🏠 **Roteador Wi-Fi Doméstico (Combo 4-em-1):**
  - Numa só caixa: Modem/ONT + Roteador NAT + Switch 4 portas + Antena Wi-Fi.
- 🏢 **Access Point Corporativo (AP):**
  - Equipamento dedicado exclusivamente a converter a rede cabeada (Ethernet) em ondas de rádio (802.11).
  - Utilizado em escolas, empresas e shoppings gerenciado por controladora central.

note:
Roteiro do Orador: Mostre a diferença entre a infraestrutura doméstica compacta e o modelo profissional com APs no teto da escola.

---
<!-- slide -->
## 💡 Das Linhas de Cobre à Fibra: Modem vs. ONU/OLT

- 📞 **Modem Tradicional:**
  - **MO**dulador / **DEM**odulador: Converte sinal analógico da linha telefônica em sinal digital.
- ⚡ **OLT (Optical Line Terminal):**
  - Equipamento central que fica no provedor de internet (ISP).
- 🏠 **ONU / ONT (Optical Network Unit / Terminal):**
  - O "aparelho da fibra" na casa do cliente/escola que converte os **pulsos de luz** em sinal elétrico de rede.

<!-- Visual Sugerido: Diagrama de uma rede FTTH mostrando Provedor (OLT) -> Fibra -> Casa/Escola (ONU) -->

note:
Roteiro do Orador: Conecte com a realidade de Redenção e provedores locais de fibra óptica (GPON/FTTH).

---
<!-- slide -->
## 📡 Formas de Comunicação de Dados (Aula 04)

- 🎯 **Unicast (1 para 1):**
  - De uma origem direta para um destino único (Ex: navegação web, download, SSH).
- 📢 **Broadcast (1 para Todos):**
  - Enviado para todas as máquinas do domínio local (Ex: ARP Request, DHCP Discover).
- 👥 **Multicast (1 para um Grupo):**
  - Entregue apenas aos membros inscritos num grupo (Ex: IPTV, reuniões com transmissão de vídeo corporativo).
- 🌍 **Anycast (1 para o Mais Próximo):**
  - Múltiplos servidores com o mesmo IP; a rede entrega a requisição ao servidor com menor latência (Ex: CDNs Cloudflare, DNS `1.1.1.1` e `8.8.8.8`).

note:
Roteiro do Orador: Compare o Anycast com pedir uma pizza: você liga para o número da rede, e a franquia mais próxima entrega. Explique como isso mitiga ataques DDoS.

---
<!-- slide -->
## 🔄 Modos de Transmissão de Dados (Aula 05)

| Modo | Direção do Fluxo | Simultaneidade | Analogia do Cotidiano | Exemplo em TI |
|:---|:---:|:---:|:---|:---|
| **Simplex** | Unidirecional (A $\rightarrow$ B) | Apenas envio | 📻 Rádio FM / TV aberta | Teclado $\rightarrow$ CPU, Sensores |
| **Half-Duplex** | Bidirecional (A $\leftrightarrow$ B) | ❌ Um de cada vez | 🗣️ Walkie-Talkie ("Câmbio") | Rede com HUB, Wi-Fi padrão |
| **Full-Duplex** | Bidirecional (A $\leftrightarrow$ B) | ✅ Simultâneo | 📞 Chamada Telefônica | Switch Ethernet moderno, Fibra |

note:
Roteiro do Orador: Explique que no Half-Duplex é necessário evitar colisões (CSMA/CD), enquanto no Full-Duplex temos canais físicos separados para transmitir (TX) e receber (RX).

---
<!-- slide -->
## 🧠 Quiz Rápido & Fixação Ativa

1. **Segurança:** *Por que é perigoso usar um Hub em uma empresa hoje em dia?*
2. **Equipamento:** *O que a caixinha ONU faz quando a fibra óptica chega na escola?*
3. **Tráfego:** *Quando seu PC envia um ARP para descobrir o Gateway, o envio é Unicast ou Broadcast?*
4. **Duplex:** *Uma conversa no Walkie-talkie é Simplex, Half-Duplex ou Full-Duplex?*

note:
Roteiro do Orador: Faça uma rodada rápida de 5 minutos pedindo respostas dos alunos para checar o nível de fixação antes do desafio em papel.

---
<!-- slide -->
## 📝 Desafio Prático: O Diagrama do Laboratório

Em **duplas**, desenhem no papel uma topologia para a EEEP-AFS contendo:

1. A chegada do link de fibra da operadora (**OLT $\rightarrow$ ONU**).
2. O **Roteador/Firewall** central da escola.
3. A distribuição para **Lab 1** e **Lab 2** usando **Switches**.
4. A conexão de 1 **Access Point** em cada laboratório.
5. Marcar no diagrama:
   - Onde o tráfego é **Full-Duplex**;
   - Uma situação de tráfego **Broadcast**;
   - Uma situação de tráfego **Unicast**.

note:
Roteiro do Orador: Circule pelas carteiras avaliando como os alunos posicionam a ONU, o roteador e os switches.

---
<!-- slide -->
## ✅ Resumo & Fechamento

- **Equipamentos:** Hub (Camada 1 / Colisão), Switch (Camada 2 / MAC), Roteador (Camada 3 / IP / Broadcast), ONU/OLT (Luz/Fibra).
- **Tipos de Tráfego:** Unicast (1:1), Broadcast (1:Todos), Multicast (1:Grupo), Anycast (1:Mais Próximo).
- **Modos de Transmissão:** Simplex (1 via), Half-Duplex (alternado), Full-Duplex (simultâneo).

> **Para a Próxima Aula:** Investigar qual equipamento sua operadora instalou na sua casa e trazer anotado o modelo!

**Dúvidas?** 🚀
