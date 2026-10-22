---
tipo: runbook-aluno
disciplina: Redes de Computadores
turma: 2º Ano DS — EEEP-AFS
tags:
  - runbook
  - troubleshooting
  - ping
  - tracert
  - arp
  - netstat
  - packet-tracer
data: 2026-10-26
---

# 🚀 Laboratório Prático: Diagnóstico de Redes e Troubleshooting

> **Turma:** 2º Ano — Técnico em Desenvolvimento de Sistemas (EEEP-AFS)  
> **Professor:** Olegário Neto  
> **Objetivo:** Dominar a metodologia de diagnóstico de conectividade utilizando ferramentas nativas do sistema operacional (`ipconfig`, `ping`, `tracert`, `arp`, `netstat`) e reproduzir a montagem e correção de problemas no Cisco Packet Tracer.

---

## 🛠️ Parte 1: Investigação no Sistema Operacional Real (CMD do Windows)

Nesta fase, você atuará como Analista de Suporte Nível 1 investigando a estação de trabalho do laboratório.

### Passo 1: Mapeando a Configuração da Placa de Rede
1. Abra o **Prompt de Comando** (`cmd` ou `Terminal`).
2. Digite o comando abaixo e tecle Enter:
   ```cmd
   ipconfig /all
   ```
3. Localize o adaptador de rede ativo (Ethernet ou Wi-Fi) e registre:
   * **Seu Endereço IPv4:** `____________________________`
   * **Máscara de Sub-rede:** `____________________________`
   * **Gateway Padrão (Roteador de Saída):** `____________________________`
   * **Endereço Físico (MAC Address):** `____________________________`
   * **Servidor DNS:** `____________________________`

---

### Passo 2: O Teste de Conectividade Local (ICMP Echo)
1. Execute um teste de conectividade para o seu Gateway Padrão:
   ```cmd
   ping <IP_DO_SEU_GATEWAY>
   ```
2. Analise o retorno:
   * Houve `Resposta de ...` com tempo em milissegundos (`ms`) e `TTL`?
   * *Diagnóstico:* Se o Gateway respondeu, a camada física (cabo/switch) e a camada de rede local estão operacionais.

---

### Passo 3: Rastreando Saltos até a Internet (`tracert`)
1. Vamos verificar por quantos roteadores seu pacote passa até alcançar a nuvem pública:
   ```cmd
   tracert 8.8.8.8
   ```
2. Observe as linhas numeradas (cada linha representa um *salto* ou *hop* por um roteador intermediário).
   * **Quantos saltos foram necessários para chegar ao Google?** `________` saltos.
   * **Qual foi o primeiro IP retornado?** `____________________________` *(Note que coincide com o seu Gateway Padrão!)*

---

### Passo 4: Consultando a Tabela ARP (`arp -a`)
1. O protocolo ARP descobre e armazena o endereço físico (MAC) correspondente a um IP na rede local.
2. Digite:
   ```cmd
   arp -a
   ```
3. Localize na lista a linha correspondente ao IP do seu Gateway Padrão:
   * **Endereço Físico (MAC) vinculado ao Gateway:** `____________________________`
   * **Tipo de alocação:** `(dinâmico / estático)`

---

### Passo 5: Radiografia de Conexões e Portas Ativas (`netstat`)
O comando `netstat` (Network Statistics) exibe o estado de todos os sockets de rede do computador: conexões ativas, portas em escuta (*LISTENING*) e o identificador do processo (*PID*).

1. Execute no terminal:
   ```cmd
   netstat -ano
   ```
2. Entendendo as 5 colunas da saída:
   * **Proto:** Protocolo de transporte (`TCP` ou `UDP`).
   * **Endereço Local:** O seu IP e a porta local aberta (`IP:Porta`).
   * **Endereço Externo:** O IP e a porta do servidor remoto de destino.
   * **Estado:**
     * `LISTENING`: O computador está aguardando conexões nesta porta (comportamento de servidor).
     * `ESTABLISHED`: A conexão está ativa, transmitindo dados após o aperto de mão de 3 vias (*3-Way Handshake*).
     * `TIME_WAIT` / `CLOSE_WAIT`: Conexão em processo ordenado de fechamento.
   * **PID (Process ID):** O número único do programa responsável por aquela conexão no Windows.

3. **Demonstração Prática — Caçando o Programa Dono da Conexão:**
   * Abra o navegador (Edge ou Chrome) e acesse qualquer site seguro (ex: `https://www.google.com`).
   * Volte ao CMD e filtre apenas as conexões seguras na porta 443:
     ```cmd
     netstat -ano | findstr :443
     ```
   * Escolha uma linha com estado `ESTABLISHED`. Anote o número da última coluna (**PID**): `________`.
   * Agora abra o **Gerenciador de Tarefas do Windows** (`Ctrl + Shift + Esc`).
   * Vá na aba **Detalhes**, clique na coluna **PID** para ordenar e localize o número que você anotou.
   * **Qual é o nome do executável (.exe) proprietário dessa conexão?** `____________________________`

---

## 🖥️ Parte 2: Desafio Cisco Packet Tracer — Montagem e Resolução Break-Fix

Em vez de receber uma topologia pré-configurada, você montará a infraestrutura do zero para fixar o papel de cada dispositivo e cabo.

```
┌─────────────────┐           ┌─────────────────┐           ┌─────────────────┐
│   PC-Recepção   │ ◄───────► │   SW-Central    │ ◄───────► │     R-Borda     │
│ 192.168.10.50   │  Cabo     │   Switch 2960   │  Cabo     │  Roteador 1941  │
│  FastEth 0      │  Direto   │   Portas Fa0/1  │  Direto   │    GigEth 0/0   │
└─────────────────┘           └─────────────────┘           └─────────────────┘
```

### Etapa 1: Seleção e Posicionamento dos Dispositivos
1. Abra o **Cisco Packet Tracer**.
2. Na barra inferior esquerda, selecione e arraste para a área de trabalho:
   * **1 Computador:** `End Devices` $\rightarrow$ `PC`. Dê dois cliques no nome do rótulo e renomeie para **`PC-Recepcao`**.
   * **1 Switch:** `Network Devices` $\rightarrow$ `Switches` $\rightarrow$ modelo **`2960`**. Renomeie para **`SW-Central`**.
   * **1 Roteador:** `Network Devices` $\rightarrow$ `Routers` $\rightarrow$ modelo **`1941`** (ou `2911`). Renomeie para **`R-Borda`**.

---

### Etapa 2: Cabeamento Físico
1. Clique no ícone de conexões (o raio laranja).
2. Escolha o cabo **Copper Straight-Through** (Cabo Direto de Par Trançado — ícone da linha preta contínua).
3. Conecte:
   * Da porta **`FastEthernet0`** do `PC-Recepcao` para a porta **`FastEthernet0/1`** do `SW-Central`.
   * Da porta **`GigabitEthernet0/1`** do `SW-Central` para a porta **`GigabitEthernet0/0`** do `R-Borda`.
4. *Pergunta de observação:* As luzes do lado do roteador ficaram verdes ou vermelhas?  
   *Explicação:* As interfaces de roteadores Cisco vêm desativadas de fábrica por segurança (*administratively down*) e precisam ser ligadas manualmente.

---

### Etapa 3: Configuração do Roteador (Gateway da Rede)
1. Clique sobre o roteador **`R-Borda`** e acesse a aba **`CLI`** (Linha de Comando).
2. Se aparecer a pergunta `Would you like to enter the initial configuration dialog? [yes/no]:`, digite **`no`** e tecle Enter.
3. Digite a sequência de comandos abaixo para ligar a porta e atribuir o IP do Gateway:
   ```text
   enable
   configure terminal
   interface gigabitEthernet 0/0
   ip address 192.168.10.1 255.255.255.0
   no shutdown
   exit
   exit
   ```
4. Observe na tela: os triângulos de link da porta `Gig0/0` mudarão para **verde**!

---

### Etapa 4: Configuração do PC com Erro Proposital (Simulação de Incidente)
1. Clique no **`PC-Recepcao`** $\rightarrow$ aba **`Desktop`** $\rightarrow$ **`IP Configuration`**.
2. Preencha os campos exatamente como abaixo:
   * **IPv4 Address:** `192.168.10.50`
   * **Subnet Mask:** `255.255.255.0`
   * **Default Gateway:** Digite propositalmente **`192.168.10.254`** *(Simulando um erro de digitação do técnico anterior)*.
3. Feche a janela de configuração de IP.

---

### Etapa 5: Metodologia Profissional de Troubleshooting (Identificando a Falha)
1. No `PC-Recepcao`, abra a opção **`Command Prompt`**.
2. **Teste 1 — A placa de rede e a pilha TCP/IP local respondem?**
   ```cmd
   ping 127.0.0.1
   ```
   *Resultado:* Sucesso (Pilha de protocolos do SO instalada e funcional).
3. **Teste 2 — O próprio endereço IP configurado responde?**
   ```cmd
   ping 192.168.10.50
   ```
   *Resultado:* Sucesso (A placa de rede reconhece sua própria identidade IPv4).
4. **Teste 3 — O PC consegue falar com o Gateway configurado?**
   ```cmd
   ping 192.168.10.254
   ```
   *Resultado:* **`Request timed out` (Esgotado o tempo limite do pedido)**.

---

### Etapa 6: Resolução do Chamado
1. Por que o ping para `192.168.10.254` falhou se os cabos estão todos conectados e verdes?
   * *Diagnóstico:* O IP `192.168.10.254` não existe na rede. O roteador real foi configurado com o IP `192.168.10.1`.
2. Volte em **`Desktop > IP Configuration`** do `PC-Recepcao`.
3. Altere o campo **Default Gateway** para **`192.168.10.1`**.
4. Volte ao `Command Prompt` e execute:
   ```cmd
   ping 192.168.10.1
   ```
5. *Resultado:* **Sucesso com 100% de pacotes recebidos!**
6. Digite `arp -a` no Command Prompt do Packet Tracer e verifique que o PC agora aprendeu dinamicamente o MAC do roteador.

---

## 🧠 Parte 3: Questões de Fixação e Concurso

1. Qual é a diferença fundamental entre uma porta TCP em estado **`LISTENING`** e uma porta em estado **`ESTABLISHED`** no resultado do comando `netstat`?
2. Em um ambiente corporativo com centenas de máquinas, por que o comando `netstat -an` é mais rápido na exibição dos resultados do que o comando `netstat -a` sem parâmetros?
3. Se um computador consegue pingar com sucesso o IP `127.0.0.1`, mas não consegue pingar o Gateway da rede nem acessar a internet, qual camada do modelo OSI podemos afirmar com certeza que NÃO é a causa do defeito?
