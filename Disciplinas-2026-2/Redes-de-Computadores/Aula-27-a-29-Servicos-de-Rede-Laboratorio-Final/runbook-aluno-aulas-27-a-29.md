---
tipo: runbook-aluno
disciplina: Redes de Computadores
tags:
  - runbook
  - dhcp
  - dns
  - projeto-final
---

# 🚀 Laboratório Mestre: Automação com DHCP e DNS

Este é o seu trabalho de conclusão da disciplina. Você montará a infraestrutura completa de uma empresa do zero, sem colocar um único IP manualmente nos computadores.

## 🏢 A Topologia da "StartUp AFS"
1. Adicione 1 Switch.
2. Ligue 3 Computadores (PCs) no Switch.
3. Ligue 2 Servidores no Switch.
   - Renomeie o Servidor 1 para **"Servidor DHCP/DNS"**.
   - Renomeie o Servidor 2 para **"Servidor WEB"**.

---

## 🛠️ Passo 1: Configurar os Servidores (Estáticos)
Servidores precisam ser "pontos de referência" fixos, por isso os IPs deles não podem ser automáticos.
1. Dê um IP Fixo para o **Servidor DHCP/DNS**: `192.168.10.2` (Máscara `/24`).
2. Dê um IP Fixo para o **Servidor WEB**: `192.168.10.3` (Máscara `/24`).

---

## 📡 Passo 2: Ligando o Serviço DHCP
O DHCP é o departamento que "aluga" IPs para os computadores que entram na rede.
1. Clique no **Servidor DHCP/DNS** $\rightarrow$ aba **Services** $\rightarrow$ **DHCP**.
2. Ligue o serviço (Marque *On*).
3. Em *Default Gateway*, digite `192.168.10.1` (Faremos de conta que um roteador existirá aqui no futuro).
4. Em *DNS Server*, digite o IP dele mesmo: `192.168.10.2`.
5. Em *Start IP Address*, mude a última caixinha para `100` (Para entregar IPs só a partir do 100).
6. Clique em **Save**.

*Agora, vá nos 3 PCs da topologia $\rightarrow$ Desktop $\rightarrow$ IP Configuration. Mude a bolinha de "Static" para "DHCP". Observe a mágica acontecendo (Eles devem ganhar IPs como 192.168.10.100, 101, etc).*

---

## 🌍 Passo 3: Criando a Intranet (Servidor WEB)
1. Clique no **Servidor WEB** $\rightarrow$ aba **Services** $\rightarrow$ **HTTP**.
2. Garanta que HTTP e HTTPS estão *On*.
3. Em `index.html`, clique em **Edit**.
4. Mude o texto lá dentro para algo como `<center><h1>Bem Vindo a StartUp AFS</h1></center>`, salve e saia.

---

## 📖 Passo 4: O Tradutor de Nomes (Servidor DNS)
Ninguém memoriza o IP do Servidor WEB (`192.168.10.3`). As pessoas lembram de nomes.
1. Volte ao **Servidor DHCP/DNS** $\rightarrow$ aba **Services** $\rightarrow$ **DNS**.
2. Ligue o serviço (Marque *On*).
3. No campo **Name**, digite: `www.startup.com.br`
4. No campo **Address**, digite o IP do Servidor WEB: `192.168.10.3`.
5. Clique em **Add**.

---

## 🏆 Passo 5: O Grande Teste (A Prova Real)
1. Abra um dos 3 PCs (Ex: PC1).
2. Vá em **Desktop** $\rightarrow$ **Web Browser**.
3. Na barra de URL, digite: `www.startup.com.br` e aperte *Go*.
4. **O que aconteceu?**
   * Se apareceu a página "Bem Vindo a StartUp AFS", parabéns! O DHCP entregou os endereços pro PC, o DNS traduziu o nome para o IP, e a requisição HTTP chegou no Web Server e voltou pra você! Você configurou uma rede local completa.
