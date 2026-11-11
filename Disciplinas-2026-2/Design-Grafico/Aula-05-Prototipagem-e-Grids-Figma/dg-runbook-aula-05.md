---
tipo: runbook
resumo: "Guia prático de prototipagem interativa e criação de Layout Grids no Figma para o projeto StreamVibe."
title: "Guia Prático: Prototipagem e Layout Grids no Figma"
disciplina: "Design Gráfico"
professor: "Olegário Neto"
data: "2026-11-11"
status: "ativo"
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Fazer a chamada e recuperar rapidamente os pontos de melhoria da Aula 04 (camadas fora do Frame e cadeado no background).
* [ ] Garantir que todos abriram o arquivo do *StreamVibe* da avaliação passada (quem não tiver o arquivo salvo deve duplicar um modelo rápido para acompanhar).
* [ ] Na Parte 1, enfatizar que o `Scroll Horizontal` só funciona se o container dos filmes for um **Frame** com `Clip content` ativado e menor que a largura total dos cards.
* [ ] Na Parte 2, conectar o conceito de **Grid de 12 colunas** diretamente com o CSS Grid / Bootstrap que eles veem em desenvolvimento Web.

</div>

# 🚀 Guia Prático: Prototipagem e Layout Grids (StreamVibe)

> [!info] **Sobre este Guia**
> Na aula passada você construiu as telas estáticas do aplicativo **StreamVibe**. Hoje vamos cumprir duas etapas de trabalho de um UI Designer profissional:
> 1. **Dar vida ao app** conectando botões e criando navegação real (Prototipagem).
> 2. **Expandir para a Web (Desktop)** organizando a tela com matemática usando **Layout Grids**.

---

## 🛠️ 1. Pré-requisitos e Preparação

Antes de iniciar os passos abaixo:
* [ ] Abra o [Figma](https://www.figma.com/) e carregue o seu projeto da Aula 04 (**App StreamVibe** com as telas *Login*, *Cadastro* e *Home*).
* [ ] Confira na barra lateral esquerda (*Layers*) se **todos os botões e textos estão dentro dos respectivos Frames** (e não flutuando fora deles).

> [!tip] **Perdeu ou não encontrou o arquivo da Aula 04?**
> Abra o arquivo **`modelo-streamvibe-base.html`** na pasta desta aula no portal de materiais. Clique em **"Copiar Todas as 3 Telas para o Figma"**, cole no seu arquivo em branco (`Ctrl + V`), desagrupe (`Ctrl + Shift + G`) e transforme cada tela em Frame (`Ctrl + Alt + G`). Em 30 segundos você já estará pronto para prototipar!

---

## 📱 2. Parte 1: Prototipagem Interativa (8º Tempo)

Agora vamos transformar suas imagens paradas em um aplicativo clicável para testar no modo celular.

### Passo 1: Ativar o Modo Prototype
1. Olhe para o topo do painel direito. Você verá três abas: `Design`, `Prototype` e `Inspect/Dev`.
2. Clique em **Prototype** (ou use o atalho `Shift + E`).
3. Em **Prototype Settings** (ainda no painel direito), selecione em *Device* o mesmo modelo dos seus frames (ex: **iPhone 14 & 15 Pro**). Isso coloca uma moldura realista de celular na sua apresentação.

### Passo 2: Conectar Login ➔ Home
1. Na tela de **Login**, dê um clique duplo (ou use `Ctrl + Clique`) para selecionar o botão **"Entrar"**.
2. Observe que aparece uma bolinha branca com um sinal `+` na borda direita do botão.
3. Clique nessa bolinha, segure e arraste a linha azul até encostar na borda do Frame **Home**.
4. Na janela de configuração (*Interaction details*) que se abrir, confira os ajustes:
   * **Trigger (Gatilho):** `On click` (Ao clicar)
   * **Action (Ação):** `Navigate to` → `Home`
   * **Animation (Transição):** Escolha `Dissolve` ou `Slide in` (Duração: `300 ms`).

### Passo 3: Fluxo entre Login e Cadastro
1. Selecione o texto ou link **"Criar Conta"** (ou "Cadastre-se") na tela de Login.
2. Arraste a linha azul dele até o Frame **Cadastro**.
3. Na tela de **Cadastro**, selecione o botão **"Cadastrar"** e ligue-o ao Frame **Home**.
4. Se você tiver um botão ou seta de **"Voltar"** no Cadastro:
   * Selecione o ícone/texto de voltar e clique no `+` de *Interactions* no painel direito.
   * Escolha `On click` → mude de `Navigate to` para **`Back`** (Voltar). Isso retorna automaticamente para a tela anterior.

### Passo 4: Carrossel Deslizante (Scroll Horizontal)
Quer fazer as capas dos filmes deslizarem para o lado no dedo?
1. Volte brevemente para a aba **Design**.
2. Selecione todas as capas de filmes do seu carrossel e pressione `Ctrl + Alt + G` (**Frame Selection**) para colocar tudo dentro de um único sub-frame chamado `Carrossel`.
3. Reduza a largura desse sub-frame `Carrossel` até ela bater na margem direita da tela do iPhone (`390 px`), deixando os filmes de fora "escondidos" além da borda.
4. No painel direito (aba Design), marque a caixa **Clip content** (Recortar conteúdo).
5. Volte à aba **Prototype** (`Shift + E`), clique no sub-frame `Carrossel` e, em **Scroll behavior** → *Overflow*, mude de *No scrolling* para **`Horizontal`**.

### Passo 5: Testar no Play (▶)
1. Clique no ícone de **Play (Present)** no canto superior direito do Figma (ou pressione `Ctrl + Alt + Enter`).
2. Clique nos botões do celular simulado e teste deslizar o carrossel de filmes para o lado!

> [!tip] **Dica de Ouro — Fluxo Incompleto?**
> Se você der Play e um botão sumir da tela ou não aparecer no celular, feche o Play, selecione o botão perdido na aba *Design*, aperte `Ctrl + X`, clique no **título** do Frame correto e aperte `Ctrl + V`.

---

## 💻 3. Parte 2: Layout Grids e Versão Web (9º Tempo)

Softwares profissionais não posicionam caixas "no olhômetro". No desenvolvimento Web (HTML/CSS), usamos grades matemáticas de colunas para manter tudo alinhado.

### Passo 1: Criar o Frame Desktop
1. Pressione `F` para criar um novo Frame ao lado das suas telas mobile (ou em uma nova página no painel esquerdo).
2. No painel direito, expanda a categoria **Desktop** e escolha **`Desktop` (`1440 x 1024 px`)**.
3. Renomeie esse Frame para **`Web - Home`**.
4. Mude o preenchimento (*Fill*) para o mesmo fundo escuro do *StreamVibe*: **`#0F1115`**.

### Passo 2: Configurar o Grid de 12 Colunas
1. Com o Frame `Web - Home` selecionado, procure a seção **Layout grid** no painel direito e clique no botão **`+`**.
2. Clique no ícone de quadradinhos que apareceu à esquerda de *Grid* para abrir as configurações.
3. Mude o tipo de `Grid` para **`Columns`** e preencha exatamente:
   * **Count (Colunas):** `12`
   * **Type:** `Stretch`
   * **Margin (Margens laterais):** `80` (ou `120` para telas mais centralizadas)
   * **Gutter (Espaço entre colunas):** `24`

> [!tip] **Atalho para Ligar/Desligar as Linhas Vermelhas**
> As linhas vermelhas do grid ajudam a alinhar, mas atrapalham na hora de enxergar as cores reais. Pressione **`Shift + G`** sempre que quiser esconder ou mostrar o grid rapidamente!

### Passo 3: Montar a Barra de Navegação (Navbar)
Construa o cabeçalho no topo do Frame Desktop alinhado exatamente às colunas:
1. **Logo (`StreamVibe`):** Coloque na esquerda, começando exatamente na borda da **Coluna 1** (largura até a Coluna 2).
2. **Menu de Links:** Crie textos como `Início`, `Filmes`, `Séries`, `Minha Lista` (`16 px`, espaçamento `32 px` entre eles) centralizados no topo.
3. **Botão "Entrar":** Desenhe o botão vermelho (`#E50914`) ou roxo (`#6C5CE7`) alinhado à direita, terminando exatamente na borda final da **Coluna 12**.

### Passo 4: Montar o Hero Banner Web
1. Crie um retângulo no topo (abaixo ou atrás da Navbar) com altura de `560 px` e largura total (`1440 px`). Preencha com uma imagem de filme usando o plugin **Unsplash** e escureça com um degradê preto para dar leitura ao texto.
2. **Bloco de Texto do Destaque:** Posicione o título do filme em destaque (`48 px` Bold), uma breve sinopse (`18 px`, cinza `#A0A0A0`) e o botão **"▶ Assistir Agora"** ocupando da **Coluna 1 até a Coluna 6** (metade esquerda da tela).

### Passo 5: Fileira de Filmes Alinhada ao Grid
Logo abaixo do Hero Banner:
1. Adicione o título de categoria: `"Em Alta no StreamVibe"` alinhado à **Coluna 1**.
2. Crie **6 cards de filmes** lado a lado.
   * **A regra de ouro do Grid:** Cada card deve ocupar exatamente **2 colunas de largura** (Colunas 1–2, Colunas 3–4, Colunas 5–6, e assim por diante).
   * Veja como o espaço entre todos os cards fica automaticamente igual ao `Gutter` de `24 px`!

---

## 🏆 4. Desafio Extra e Microatividade (Componentes com Variantes)

Se você finalizou a prototipagem mobile e a base da tela Web:

### Desafio A — Microatividade: Botão Web com Estado Hover (Variantes)
Na Web, botões reagem quando o usuário passa o mouse por cima (*Hover*). Vamos criar isso sem código usando **Component Variants**:
1. Na página Desktop (`Web - Home`), selecione o botão **"▶ Assistir Agora"** (ou **"Entrar"**) e transforme-o em Componente pressionando `Ctrl + Alt + K`.
2. Com o componente selecionado (ele ficará roxo), clique no ícone **`+` (Add variant)** na barra superior (ou no painel direito em *Properties → Variant*).
3. Você terá duas versões dentro de uma caixa tracejada roxa:
   * **Variante 1 (`Default`):** Mantenha a cor original (`#E50914`).
   * **Variante 2 (`Hover`):** Altere a cor para um vermelho mais vivo (`#FF2A36`), aumente levemente o brilho ou adicione uma borda branca sutil.
4. Mude para a aba **Prototype** (`Shift + E`), puxe a seta azul da **Variante 1** para a **Variante 2** e configure:
   * **Trigger:** `While hovering` (Enquanto o mouse estiver sobre)
   * **Animation:** `Smart animate` (`200 ms`, `Ease out`).
5. Dê Play no protótipo Desktop e passe o mouse sobre o botão para ver a transição suave funcionando!

### Desafio B — Auditoria de Grid no Mobile + Tela de Detalhes
1. **Grid no Mobile também:** Selecione suas telas antigas de iPhone (`390 x 844 px`) e adicione um **Layout Grid** de **`4 colunas`**, **`Margin: 24`** e **`Gutter: 16`**. Confira se seus botões de Login e Cadastro estavam alinhados perfeitamente entre as colunas 1 e 4!
2. **Tela de Detalhes do Filme:** No protótipo mobile, duplique a tela Home (`Ctrl + D`), troque o conteúdo para mostrar informações de um filme específico (sinopse, duração, botão "Reproduzir") e conecte uma das capas do carrossel para abrir essa tela ao clicar.

---

## ❓ 5. Checkpoint Rápido de Revisão

Antes de fechar o navegador, verifique se você domina estes 4 pontos:
1. Qual atalho alterna rapidamente entre os painéis *Design* e *Prototype*? (`Shift + E`)
2. Qual atalho liga e desliga a visualização das colunas do *Layout Grid*? (`Shift + G`)
3. Por que usamos **12 colunas** no Desktop e **4 colunas** no Mobile? *(Porque o número 12 é divisível por 2, 3, 4 e 6, facilitando dividir a página em metades, terços ou quartos iguais no CSS).*
4. O que precisa estar marcado no Frame de um carrossel para o scroll horizontal funcionar? *(`Clip content` no modo Design + `Overflow: Horizontal` no modo Prototype).*
