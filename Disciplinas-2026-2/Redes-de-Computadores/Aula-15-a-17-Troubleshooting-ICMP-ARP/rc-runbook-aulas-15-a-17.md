---
tipo: runbook-aluno
disciplina: Redes de Computadores
turma: 2º Ano DS — EEEP-AFS
tema: "Laboratório Integrado: Serviços de Rede (DHCP, DNS, HTTP), Roteador Gateway e Diagnóstico (ICMP, ARP, netstat)"
professor: Olegário Neto
tags:
  - runbook
  - packet-tracer
  - dhcp-dns-http
  - gateway-roteador
  - troubleshooting
  - icmp-arp
  - netstat
data: 2026-11-03
---

# 🚀 Laboratório Integrado de Redes: Da Aplicação ao Roteamento e Diagnóstico

> [!IMPORTANT] **Missão Integrada do Técnico em Redes**
> Neste laboratório completo, unificamos duas pontas da infraestrutura:
> 1. **Serviços de Rede e Transporte:** Configuração de servidor com **DHCP**, **DNS** e **HTTP**, inspecionando o aperto de mão de 3 vias (**TCP 3-Way Handshake**) e portas UDP/TCP.
> 2. **Roteador e Gateway da Rede:** Inclusão de um roteador corporativo como gateway padrão (`192.168.1.1`).
> 3. **Troubleshooting Profissional:** Testes de conectividade com **ICMP** (`ping`), resolução de endereços físicos com **ARP** (`arp -a`), simulação de falha de gateway (**Break-Fix**) e auditoria de processos no sistema operacional com **`netstat -ano`**.
>
> 📁 **Arquivo Base do Packet Tracer:** Utilize o arquivo [`pratica-DHCP-DNS-HTTP.pkt`](./pratica-DHCP-DNS-HTTP.pkt) disponível na pasta da aula ou monte a topologia do zero.

---

## 🗺️ 1. Topologia Integrada da Rede

```
[ PC0 ] ────── (Fa0/1) ┐
                       ├── [ Switch 2960 ] ──── (Fa0/24) ──── [ Server-AFS ] (192.168.1.100)
[ PC1 ] ────── (Fa0/2) ┘       │ (Gig0/1)                      (DHCP + DNS + HTTP)
                               │
                               └─────── (Gig0/0) ──── [ R-Borda ] (192.168.1.1)
                                                       (Roteador / Gateway Padrão)
```

### 📋 Tabela de Endereçamento e Conexões

| Dispositivo | Interface | Conectado a | Endereço IP / Máscara | Gateway Padrão | Função / Serviços |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Server-AFS** | FastEthernet0 | Switch (Fa0/24) | `192.168.1.100 / 255.255.255.0` | `192.168.1.1` | DHCP, DNS (`53`) e Web HTTP (`80`) |
| **R-Borda** | GigabitEthernet0/0 | Switch (Gig0/1) | `192.168.1.1 / 255.255.255.0` | — | Roteador / Gateway de Saída |
| **PC0** | FastEthernet0 | Switch (Fa0/1) | Obter via **DHCP** | `192.168.1.1` | Cliente Web / Inspeção de Tráfego |
| **PC1** | FastEthernet0 | Switch (Fa0/2) | Obter via **DHCP** | `192.168.1.1` | Estação de Teste / Simulação Break-Fix |
| **Switch 2960** | 24 Portas | — | — | — | Comutação de Camada 2 (VLAN 1) |

*Nota: Utilize cabos de par trançado direto (**Copper Straight-Through** — cabo preto contínuo).*

---

## ⚙️ 2. Configuração do Servidor Multi-serviços (`Server-AFS`)

Se você estiver abrindo o arquivo `pratica-DHCP-DNS-HTTP.pkt`, confira os parâmetros. Caso esteja montando do zero, configure:

### Passo A: IP Estático do Servidor
1. Abra o **Server-AFS** ➔ **Desktop** ➔ **IP Configuration**.
2. Configure:
   * **IPv4 Address:** `192.168.1.100`
   * **Subnet Mask:** `255.255.255.0`
   * **Default Gateway:** `192.168.1.1` *(O IP do roteador que iremos ligar!)*
   * **DNS Server:** `192.168.1.100`

### Passo B: Ativação do Serviço DHCP (Portas UDP 67/68)
1. Vá na aba **Services** ➔ **DHCP**.
2. Marque o serviço como **ON**.
3. Defina os parâmetros da pool:
   * **Pool Name:** `serverPool`
   * **Default Gateway:** `192.168.1.1`
   * **DNS Server:** `192.168.1.100`
   * **Start IP Address:** `192.168.1.10`
   * **Subnet Mask:** `255.255.255.0`
   * **Maximum number of Users:** `50`
4. Clique em **Save**.

### Passo C: Ativação do Serviço DNS (Porta UDP 53)
1. Na aba **Services** ➔ **DNS**.
2. Marque o serviço como **ON**.
3. Adicione o registro do site da escola:
   * **Name:** `www.eeep.afs`
   * **Type:** `A Record`
   * **Address:** `192.168.1.100`
4. Clique em **Add**.

### Passo D: Serviço Web HTTP (Porta TCP 80)
1. Na aba **Services** ➔ **HTTP**.
2. Certifique-se de que **HTTP** está **ON**.
3. Edite o arquivo `index.html` com o texto da escola:
   ```html
   <html>
     <center>
       <h1 style="color: green;">EEEP Adolfo Ferreira de Sousa</h1>
       <h3>Laboratório de Redes: Servidor Web em Funcionamento!</h3>
       <p>TCP 3-Way Handshake concluído com sucesso na Porta 80.</p>
     </center>
   </html>
   ```
4. Clique em **Save**.

---

## 🔌 3. Inclusão e Configuração do Roteador (`R-Borda` — Gateway Real)

O servidor DHCP entrega para os computadores o Gateway `192.168.1.1`. Vamos agora conectar e configurar o dispositivo físico correspondente:

1. Na barra de dispositivos do Packet Tracer, vá em **Network Devices** ➔ **Routers** e arraste um modelo **1941** (ou `2911`).
2. Renomeie o rótulo para **`R-Borda`**.
3. Com o cabo direto (**Copper Straight-Through**), conecte:
   * Da porta **`GigabitEthernet0/1`** do Switch para a porta **`GigabitEthernet0/0`** do `R-Borda`.
4. Clique no roteador **`R-Borda`** e acerte a aba **`CLI`**:
   * Se perguntar `Would you like to enter the initial configuration dialog?`, digite **`no`** e tecle Enter.
   * Digite a sequência de comandos para configurar o Gateway:
   ```text
   enable
   configure terminal
   hostname R-Borda
   interface gigabitEthernet 0/0
   description Gateway da Rede Local AFS
   ip address 192.168.1.1 255.255.255.0
   no shutdown
   exit
   exit
   ```
5. Observe que as luzes da interface `Gig0/0` mudarão de vermelho para **verde**. O Gateway da rede agora está vivo!

---

## 🕵️ 4. Inspeção de Protocolos no Modo Simulação

Alterne do modo **Realtime** para **Simulation** (canto inferior direito). Em **Edit Filters**, filtre apenas:
`DHCP`, `DNS`, `TCP`, `HTTP`, `ICMP` e `ARP`.

### 🧪 Teste 1: Obtenção de IP via DHCP
1. No **PC0**, vá em **Desktop** ➔ **IP Configuration** e marque **DHCP**.
2. Avance os passos no botão **Play/Forward (►|)**.
3. Observe as 4 mensagens do protocolo (**DORA**): *Discover* (Broadcast) ➔ *Offer* ➔ *Request* ➔ *ACK*.
4. Clique no envelope e veja as portas UDP: Origem `68` e Destino `67`.
5. Confirme que o PC0 recebeu o IP `192.168.1.10`, Máscara `255.255.255.0` e Gateway `192.168.1.1`.

### 🧪 Teste 2: Resolução de Nomes com DNS e 3-Way Handshake do TCP
1. No **PC0**, abra o **Web Browser**, digite `www.eeep.afs` e clique em **Go**.
2. **Envelope Azul (DNS):** Veja o pacote indo primeiro na porta UDP `53` para buscar o IP `192.168.1.100`.
3. **Envelope Verde (TCP):** Observe os 3 pacotes trocados antes da página carregar:
   * **1. SYN:** PC0 envia solicitação de sincronização.
   * **2. SYN-ACK:** Servidor confirma e solicita sincronização mútua.
   * **3. ACK:** PC0 confirma o canal aberto.
4. **Envelope Roxo (HTTP):** Requisição `GET /` e carregamento da página HTML no navegador.

---

## 🛠️ 5. Diagnóstico de Infraestrutura, ICMP, Tabela ARP e Cenário Break-Fix

Volte para o modo **Realtime**.

### Teste de Conectividade com o Roteador (ICMP):
1. No **PC0**, abra o **Command Prompt**.
2. Execute o ping para o Gateway recém-configurado:
   ```cmd
   ping 192.168.1.1
   ```
3. *Resultado:* Resposta de `192.168.1.1` com sucesso (`0% loss`). O pacote ICMP Echo Request / Reply alcançou o roteador com êxito.

### Inspeção da Tabela ARP:
1. No mesmo Command Prompt do PC0, digite:
   ```cmd
   arp -a
   ```
2. Analise a tabela:
   * O PC0 aprendeu dinamicamente o endereço físico (MAC) do Servidor (`192.168.1.100`).
   * O PC0 também aprendeu o endereço físico (MAC) da interface do Roteador (`192.168.1.1`).

---

### 🚨 Desafio Break-Fix no PC1 (Simulação de Incidente de Suporte)

1. No **PC1**, abra **Desktop ➔ IP Configuration**.
2. Mude para **Static** e insira de propósito:
   * **IP Address:** `192.168.1.50`
   * **Subnet Mask:** `255.255.255.0`
   * **Default Gateway:** Digite propositalmente **`192.168.1.254`** *(Simulando erro de cadastro ou gateway inexistente)*.
   * **DNS Server:** `192.168.1.100`
3. Abra o **Command Prompt** do PC1 e aplique a metodologia de suporte:
   * **Passo 1 (Loopback):** `ping 127.0.0.1` ➔ *Sucesso* (Pilha TCP/IP funcional).
   * **Passo 2 (Local Server):** `ping 192.168.1.100` ➔ *Sucesso* (O switch comuta pacotes locais da mesma sub-rede normalmente!).
   * **Passo 3 (Gateway Inexistente):** `ping 192.168.1.254` ➔ **`Request timed out`** (Falha!).
4. **Resolução do Chamado:**
   * Corrija o Default Gateway do PC1 para **`192.168.1.1`** (ou volte a selecionar **DHCP**).
   * Repita o comando `ping 192.168.1.1` e confirme a restauração da conectividade.

---

## 💻 6. Investigação no Sistema Operacional Real (CMD do Windows)

Agora aplique os mesmos princípios no computador físico do laboratório da escola:

1. Abra o `cmd` do Windows e execute:
   ```cmd
   ipconfig /all
   ```
   Anote o seu IPv4, Gateway Padrão e Servidor DNS.

2. Teste o caminho de rede até o Google:
   ```cmd
   tracert 8.8.8.8
   ```
   Verifique que o **primeiro salto** corresponde exatamente ao IP do Gateway Padrão da escola.

3. **Radiografia de Conexões com `netstat -ano`:**
   * Abra o navegador e acesse um site seguro (`https://...`).
   * No terminal, execute:
     ```cmd
     netstat -ano | findstr :443
     ```
   * Identifique uma conexão com estado **`ESTABLISHED`** e anote o número da última coluna (**PID**): `________`.
   * Abra o **Gerenciador de Tarefas** (`Ctrl + Shift + Esc`), vá na aba **Detalhes**, ordene por **PID** e encontre o programa (.exe) proprietário dessa conexão.

---

## 📝 7. Questões de Fixação para o Caderno

1. Na topologia montada, por que o PC1 conseguiu pingar com sucesso o servidor `192.168.1.100` mesmo estando com o Gateway configurado errado (`192.168.1.254`)?
2. Em que situação específica um computador precisa consultar o Default Gateway para enviar um pacote?
3. Qual a diferença de função entre o protocolo **ARP** (Camada 2/3) e o protocolo **DNS** (Camada 7)?
4. No comando `netstat`, qual a diferença entre uma porta em estado **`LISTENING`** e uma em estado **`ESTABLISHED`**?
