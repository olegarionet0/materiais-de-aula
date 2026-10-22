---
tipo: runbook-aluno
disciplina: Redes de Computadores
turma: 2º Ano DS — EEEP-AFS
tema: "Laboratório Hands-On: Packet Tracer com DHCP, DNS, TCP Handshake e HTTP"
professor: Olegário Neto
tags:
  - runbook
  - tcp-udp
  - packet-tracer
  - dhcp-dns
---

# 🚀 Laboratório de Redes: Tráfego Real no Cisco Packet Tracer

> [!IMPORTANT] **Missão do Técnico em Redes**
> Hoje vamos ver com nossos próprios olhos o que acontece "por baixo do capô" da internet. Vamos inspecionar os pacotes viajando na rede em câmera lenta: desde a máquina recebendo IP via **DHCP**, passando pela tradução de nomes com **DNS**, a montagem do **3-Way Handshake do TCP**, até a entrega da página web via **HTTP**.

---

## 🗺️ 1. Topologia da Rede

Monte a seguinte rede simples no Cisco Packet Tracer:

```
[ PC0 ] ─── (Fa0/1) ┐
                    ├─── [ Switch 2960 ] ─── (Fa0/24) ─── [ Server-AFS ]
[ PC1 ] ─── (Fa0/2) ┘                                      (DHCP + DNS + HTTP)
```

### 📋 Tabela de Endereçamento e Conexões

| Dispositivo | Interface | Conectado a | Endereçamento IP | Função / Serviços |
| :--- | :--- | :--- | :--- | :--- |
| **Server-AFS** | FastEthernet0 | Switch (Fa0/24) | `192.168.1.100` / `255.255.255.0` | DHCP, DNS e Servidor Web HTTP |
| **PC0** | FastEthernet0 | Switch (Fa0/1) | Configurar via **DHCP** | Cliente Web 1 |
| **PC1** | FastEthernet0 | Switch (Fa0/2) | Configurar via **DHCP** | Cliente Web 2 |
| **Switch0** | 2960-24TT | — | — | Comutação de Camada 2 |

*Obs: Utilize cabos de rede diretos (**Copper Straight-Through** - linha contínua preta).*

---

## ⚙️ 2. Configuração do Servidor Multi-serviços (`Server-AFS`)

Clique no **Server-AFS** e realize as configurações abaixo:

### Passo A: IP Estático da Interface
1. Vá na aba **Desktop** ➔ **IP Configuration**.
2. Defina:
   * **IPv4 Address:** `192.168.1.100`
   * **Subnet Mask:** `255.255.255.0`
   * **Default Gateway:** `192.168.1.1`
   * **DNS Server:** `192.168.1.100`

### Passo B: Ativar o Serviço DHCP (Portas UDP 67/68)
1. Vá na aba **Services** ➔ clique em **DHCP**.
2. Deixe o serviço marcado como **ON**.
3. Configure os parâmetros da pool:
   * **Pool Name:** `serverPool`
   * **Default Gateway:** `192.168.1.1`
   * **DNS Server:** `192.168.1.100`
   * **Start IP Address:** `192.168.1.10`
   * **Subnet Mask:** `255.255.255.0`
   * **Maximum number of Users:** `50`
4. Clique em **Save**.

### Passo C: Ativar o Serviço DNS (Porta UDP 53)
1. Na mesma aba **Services**, clique em **DNS**.
2. Deixe o serviço marcado como **ON**.
3. Crie o registro de domínio:
   * **Name:** `www.eeep.afs`
   * **Type:** `A Record`
   * **Address:** `192.168.1.100`
4. Clique no botão **Add**.

### Passo D: Serviço Web HTTP (Porta TCP 80)
1. Na aba **Services**, clique em **HTTP**.
2. Certifique-se de que **HTTP** está marcado como **ON**.
3. Localize o arquivo `index.html`, clique em **(edit)** e altere o texto para:
   ```html
   <html>
     <center>
       <h1 style="color: green;">EEEP Adolfo Ferreira de Sousa</h1>
       <h3>Laboratório de Redes: Servidor Web em Funcionamento!</h3>
       <p>TCP 3-Way Handshake concluído com sucesso na Porta 80.</p>
     </center>
   </html>
   ```
4. Clique em **Save** e confirme.

---

## 🕵️ 3. A Espionagem dos Pacotes (Modo Simulação)

Agora entra a parte de detetive de tráfego. No canto inferior direito da tela, mude do modo **Realtime** para o modo **Simulation** (ícone de cronômetro com lista).

### Filtro de Eventos:
No painel *Simulation*, clique em **Show All/None** para desmarcar tudo. Em seguida, clique em **Edit Filters** e selecione estritamente:
* Camada de Aplicação: `DHCP`, `DNS`, `HTTP`
* Camada de Transporte: `TCP`

---

### 🧪 Experimento 1: O Pedido de Socorro do DHCP (UDP)
1. No **PC0**, abra a aba **Desktop** ➔ **IP Configuration**.
2. Mude a opção de *Static* para **DHCP**.
3. Observe que um envelope verde/amarelo surge no PC0.
4. No painel de simulação, clique no botão **Play/Forward (►|)** passo a passo:
   * Veja o pacote viajar até o Switch e alcançar o servidor.
   * O servidor responde com a oferta de IP (*DHCP Offer*).
   * O PC requisita (*DHCP Request*) e o servidor confirma (*DHCP ACK*).
5. Clique no envelope do pacote:
   * Vá em **Inbound/Outbound PDU Details**.
   * Procure a seção **UDP**: Observe as portas: **Source Port 68** e **Destination Port 67**!
6. O PC0 agora recebeu automaticamente o IP `192.168.1.10` e o DNS `192.168.1.100`.

---

### 🧪 Experimento 2: A Resolução de Nomes com DNS (UDP 53)
1. No **PC0**, abra **Desktop** ➔ **Web Browser**.
2. Na barra de URL, digite: `www.eeep.afs` e clique em **Go**.
3. **PARE E OBSERVE:** O PC0 NÃO gerou um pacote HTTP de cara!
4. O primeiro envelope gerado é azul claro: **DNS**.
5. Clique no envelope:
   * Na seção **UDP**, observe: **Destination Port: 53**!
   * Por que UDP? Porque a resolução de nomes é rápida (uma única pergunta e uma resposta).
6. Dê passos no botão **Forward (►|)** até o pacote DNS ir ao servidor e voltar para o PC0 com o IP `192.168.1.100`.

---

### 🧪 Experimento 3: O "Aperto de Mão" de 3 Vias do TCP (Porta 80)
Assim que o PC0 descobre o IP do servidor através do DNS, um envelope verde escuro aparece: **TCP**.

1. Avance o botão de simulação passo a passo e conte os 3 pacotes trocados antes da página abrir:
   * **Passo 1 (SYN):** PC0 envia um pacote TCP com a flag `SYN = 1` para o servidor.
   * **Passo 2 (SYN-ACK):** O Servidor responde ao PC0 com `SYN = 1, ACK = 1` dizendo "Estou pronto!".
   * **Passo 3 (ACK):** O PC0 confirma com `ACK = 1` dizendo "Conexão estabelecida!".
2. Clique no envelope TCP e abra **Inbound PDU Details**:
   * **Porta de Destino:** `80` (Porta padrão do servidor HTTP).
   * **Porta de Origem:** Um número aleatório alto (ex: `1025`, `1026` — porta efêmera da aba do navegador).

---

### 🧪 Experimento 4: O Conteúdo HTTP Chegando
1. Logo após o terceiro pacote do TCP, finalmente surge o pacote roxo: **HTTP**.
2. O PC0 envia o comando `GET /` e o servidor devolve a página HTML.
3. Volte para o modo **Realtime** e veja a página da escola renderizada no navegador do PC0!

---

## 📝 4. Perguntas de Fixação para o Caderno

Responda no caderno com base no que você viu na tela:
1. Por que o **DHCP** e o **DNS** utilizam o protocolo de transporte **UDP**, enquanto a navegação web **HTTP** utiliza obrigatoriamente o **TCP**?
2. Qual a função exata da porta efêmera (ex: porta `1026`) gerada pelo computador do aluno na requisição web? Por que ela não pode ser fixa na porta 80 também?
3. O que aconteceria se o servidor web estivesse desligado quando o PC0 tentasse fazer o 3-Way Handshake? O navegador conseguiria exibir a página?
