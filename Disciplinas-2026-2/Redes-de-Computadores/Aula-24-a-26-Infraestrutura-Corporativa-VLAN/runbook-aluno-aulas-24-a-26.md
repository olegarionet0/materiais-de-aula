---
tipo: runbook-aluno
disciplina: Redes de Computadores
tags:
  - runbook
  - vlan
  - cisco
---

# 🚀 Laboratório Corporativo: Segmentação com VLANs

Nas redes do mercado de trabalho, não compramos um Switch para cada sala. Nós compramos Switchs grandes (de 48 portas) e "fatiamos" ele virtualmente usando **VLANs** (Virtual LANs).

## 📋 Missão: A Escola Isolada
A EEEP Adolfo Ferreira de Sousa contratou você para garantir que os Alunos não consigam acessar os computadores do Financeiro, mesmo todos estando conectados no mesmo Switch.

### 🛠️ Passo 1: A Topologia Insegura
1. Abra o Packet Tracer e adicione 1 Switch 2960.
2. Adicione 4 Computadores (PC0, PC1, PC2 e PC3).
3. Conecte-os ao Switch usando cabos diretos:
   - PC0 na porta `FastEthernet 0/1`
   - PC1 na porta `FastEthernet 0/2`
   - PC2 na porta `FastEthernet 0/10`
   - PC3 na porta `FastEthernet 0/11`
4. Coloque IP estático em todos: `192.168.10.1` até `192.168.10.4`.
5. **Faça o teste de Ping:** Todo mundo deve conseguir pingar todo mundo.

### 🔐 Passo 2: Criando as VLANs (A Mágica no Switch)
1. Clique no Switch e vá na aba **CLI** (Interface de Linha de Comando).
2. Pressione Enter para começar e digite os comandos de criação:
   ```text
   Switch> enable
   Switch# configure terminal
   Switch(config)# vlan 10
   Switch(config-vlan)# name ALUNOS
   Switch(config-vlan)# exit
   Switch(config)# vlan 20
   Switch(config-vlan)# name FINANCEIRO
   Switch(config-vlan)# exit
   ```

### ✂️ Passo 3: Colocando as Portas nas "Fatias"
Agora vamos dizer ao Switch que as portas 1 e 2 são dos Alunos, e as portas 10 e 11 são do Financeiro.

Na mesma tela CLI, digite:
```text
Switch(config)# interface range fastEthernet 0/1 - 2
Switch(config-if-range)# switchport mode access
Switch(config-if-range)# switchport access vlan 10
Switch(config-if-range)# exit

Switch(config)# interface range fastEthernet 0/10 - 11
Switch(config-if-range)# switchport mode access
Switch(config-if-range)# switchport access vlan 20
```

### ✅ Passo 4: Verificação Final
1. Abra o PC0 (Alunos) e pingue o PC1 (Alunos - `192.168.10.2`). Deve funcionar.
2. Agora pingue o PC2 (Financeiro - `192.168.10.3`). **Deve falhar!**
3. Missão cumprida! Você isolou a rede na Camada 2 usando software, sem gastar R$ 1 a mais com equipamentos.

## 🧠 Reflexão Final
Se os Alunos e o Financeiro quisessem voltar a se comunicar pela rede (agora que estão em VLANs diferentes), qual equipamento de rede de Camada 3 teríamos que adicionar à nossa topologia para permitir isso?
