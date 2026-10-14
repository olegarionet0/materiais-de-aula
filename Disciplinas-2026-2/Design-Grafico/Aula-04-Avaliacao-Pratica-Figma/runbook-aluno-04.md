---
tipo: runbook
title: "Briefing de Design: App StreamVibe"
disciplina: "Design Gráfico"
professor: "Olegário Neto"
data: 2026-10-07
status: "concluído"
---

<div class="teacher-only">

### 📋 Notas do Professor
* [ ] Projetar a imagem do wireframe de referência na lousa.
* [ ] Lembrar os alunos que a tela de Login e Cadastro são similares (eles devem copiar/colar blocos para ganhar tempo).
* [ ] Reforçar que o bônus do "Content Reel" é independente e só deve ser feito após a estrutura das 3 telas estar pronta.

</div>

# 🎨 Briefing de Projeto: StreamVibe App

> [!info] **Sua Missão como UI Designer**
> A startup **StreamVibe** contratou você para finalizar o design do novo aplicativo de filmes e séries da empresa. O time de Experiência do Usuário (UX) já aprovou o esqueleto das telas (wireframes). Sua função é reproduzir esse esqueleto no Figma e aplicar o Guia de Estilos Visuais para criar a versão de Alta Fidelidade.

---

## 📱 As Telas Solicitadas
Você precisará entregar 3 telas principais no formato Mobile (recomenda-se o frame *iPhone 14/15 Pro*):

1. **Tela de Login**: Logo, campos de E-mail/Senha, botão "Entrar" e link "Criar Conta".
2. **Tela de Cadastro**: Muito semelhante ao Login, mas com campo de "Nome" e confirmação de senha. Botão "Cadastrar".
3. **Home Principal**: Banner de destaque (Hero) de um filme no topo, botão "Assistir" e um carrossel horizontal de capas de filmes (Retângulos verticais) separados por categorias (ex: "Em Alta", "Ação").

*(Observe o modelo de wireframe que o professor está projetando na lousa para saber exatamente onde posicionar cada elemento!)*

---

## 🎨 Guia de Estilos (Design System Básico)

A identidade visual do StreamVibe é moderna, cinematográfica e escura (Dark Mode). Aplique estas regras nas suas telas:

* **Cores de Fundo (Background)**:
  * Fundo Principal: `#0F1115` (Quase preto)
  * Fundo de Campos de Texto/Cards: `#1C1F26` (Cinza muito escuro)
* **Cores de Destaque (Botões e Links)**:
  * Primária (Botões principais): `#E50914` (Vermelho vibrante) ou `#6C5CE7` (Roxo Neon) — *escolha uma*.
* **Tipografia**:
  * Utilize a fonte **Inter** ou **Roboto** para todos os textos.
  * *Títulos*: Bold (Negrito), cor Branca (`#FFFFFF`).
  * *Textos secundários/Dicas*: Regular, cor Cinza Claro (`#A0A0A0`).
* **Imagens**:
  * Use o plugin **Unsplash** para buscar imagens reais de filmes, séries ou pipoca/cinema para preencher os blocos cinzas do banner e do carrossel.

---

## 📏 Especificações Técnicas (Redline)

Para garantir o alinhamento perfeito, construa o seu wireframe respeitando exatamente as seguintes medidas:

* **Tamanho da Tela (Frame)**: `390 x 844` (iPhone 14/15 Pro)
* **Margens Laterais (Padding)**: Deixe um espaço vazio de `24px` nas margens esquerda e direita de todas as telas.
* **Inputs de Texto (Campos de E-mail/Senha)**: 
  * Altura (`Height`): `56px`
  * Arredondamento (`Corner Radius`): `8px`
  * Distância entre os campos (`Gap`): `16px`
* **Botões Principais**: 
  * Altura (`Height`): `56px`
  * Margem superior (`Espaçamento acima do botão`): `32px`
  * Arredondamento maior (`Corner Radius`): `12px`
* **Hero Banner (Destaque da Home)**: 
  * Altura: `400px` (ocupando toda a largura da tela)
  * Arredondamento APENAS na parte de baixo (`Radius Bottom`): `24px`
* **Carrossel de Filmes (Cards menores)**:
  * Proporção da Capa: `120 x 180`
  * Arredondamento: `8px`
  * Distância entre os filmes (`Gap`): `16px`

---

## 🚀 PASSO A PASSO (Desafio Bônus: +10% na nota)

Preencher texto por texto em um carrossel de filmes dá muito trabalho. Os melhores designers usam automação. O bônus desta avaliação é aprender uma ferramenta nova **sozinho**: o plugin **Content Reel**.

Siga o tutorial abaixo para automatizar o preenchimento de nomes de usuários ou títulos:

1. Vá em **Resources** (ícone de 4 quadrados no menu superior do Figma) > **Plugins**.
2. Digite **Content Reel** na barra de pesquisa e clique em "Run" (Executar).
3. Na sua tela, crie 3 ou 4 blocos de texto provisórios (ex: "Nome do Filme") e selecione todos eles ao mesmo tempo segurando `Shift`.
4. Com os textos selecionados e o plugin aberto, clique na aba **Text** no plugin e procure por "Movies" ou "Titles". Clique em uma das opções.
5. *Mágica!* O plugin substituirá os seus textos repetidos por nomes de filmes reais aleatórios. 
6. (Opcional) Você pode fazer o mesmo com imagens: selecione vários retângulos vazios, vá na aba **Images** do plugin e clique em "Avatars" ou "Posters" para preencher todos de uma vez.

> [!tip] **Critérios de Sucesso da Prova**
> A prioridade não é terminar o bônus, e sim entregar as 3 telas legíveis, organizadas, com bom contraste (texto claro no fundo escuro) e imagens aplicadas. Boa sorte!

---

## 📤 Instruções de Entrega

A entrega da avaliação será feita diretamente pelo **Servidor Local do Laboratório** (não precisa de internet externa):

1. **Arquivo PDF com as telas**: No Figma, selecione os frames (telas) que você criou, vá no menu principal superior esquerdo (**File**) e escolha **"Export frames to PDF..."**. Salve o arquivo no computador.
2. **Link do Projeto no Figma**: Clique no botão **Share** no topo direito do Figma, configure a permissão para **"Anyone with the link can view"** (Qualquer pessoa com o link pode visualizar) e clique em **"Copy link"**.
3. **Envio pelo Portal Local**:
   - Abra o navegador e acesse: **`http://20.20.7.53:8000`** *(ou `http://20.20.10.5:8000` pelo Wi-Fi)*.
   - Na seção **"Enviar Minha Avaliação"**:
     - Digite seu **Nome Completo** (ou nome da dupla).
     - Cole o **Link do Figma**.
     - Selecione o arquivo **PDF exportado**.
     - Clique em **"Enviar Avaliação"** e aguarde a confirmação de recebimento na tela.
