---
tipo: runbook
resumo: "Roteiro prático para consolidação de conceitos iniciais de bancos de dados: dado, informação, fato, metadados e níveis de abstração ANSI/SPARC."
title: "Guia de Laboratório: Conceitos Iniciais de Banco de Dados"
disciplina: Banco de Dados
professor: Olegário Neto
data: 2026-08-04
status: pendente
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Fazer a chamada / frequência no SIGE.
* [ ] Conectar os conceitos de dados aos sistemas operacionais (que os alunos já viram no semestre passado), mostrando que arquivos em disco possuem metadados gerenciados pelo SO.
* [ ] Monitorar a atividade de inspeção de propriedades de arquivos para garantir que entendam a relação direta de metadado como "propriedade de estrutura".

</div>

# 💻 Guia de Laboratório: Conceitos Iniciais de Banco de Dados

> [!info] **Sobre este Guia**
> Este roteiro contém instruções práticas e atividades teóricas de fixação para consolidar nossa primeira aula. Siga as instruções passo a passo no seu computador ou caderno e submeta as respostas conforme orientado pelo professor.

---

## 🏛️ 1. Pré-requisitos e Preparação
Antes de iniciar, verifique se você possui:
* [ ] Um smartphone (Android ou iPhone) com uma foto tirada por você na galeria (ou tire uma foto rápida da sala agora).
* [ ] Um editor de texto (Obsidian, VS Code) ou caderno para registrar suas respostas.

---

## 🚀 2. Passo a Passo do Laboratório: Entendendo Metadados no seu Próprio Celular

Vamos realizar um experimento prático rápido para observar como o seu celular utiliza metadados para organizar suas memórias e fotos no dia a dia.

### Passo 1: Escolhendo uma foto da galeria
1. Pegue o seu celular e abra o aplicativo de galeria padrão (Google Fotos, Galeria Samsung, ou Fotos da Apple).
2. Escolha qualquer foto que você tenha tirado com a câmera do seu celular (de preferência em ambiente externo ou na própria escola).

### Passo 2: Inspecionando os Detalhes da Imagem (EXIF)
* **No Android (Google Fotos / Galeria)**: Abra a foto, deslize o dedo de baixo para cima na tela ou clique nos três pontinhos no canto superior direito $\rightarrow$ selecione **Detalhes** ou toque no ícone de informação `(i)`.
* **No iOS (iPhone)**: Abra a foto, deslize a imagem para cima ou toque no ícone redondo de informação `(i)` no menu inferior.

Compare o que você está vendo com o conceito de metadados visto em sala:
> [!tip] **O que observar (Metadados EXIF):**
> O arquivo físico da sua foto contém a imagem visualizada (os pixels e cores, os dados brutos). No entanto, o seu celular e a câmera salvam de forma invisível os **metadados** estruturados no padrão **EXIF** (*Exchangeable Image File Format*):
> * **Data e Hora exatas** em que o clique ocorreu.
> * **Marca e Modelo** do aparelho (ex: *Samsung Galaxy A54*, *iPhone 13*).
> * **Propriedades da Lente** (abertura `f/1.8`, velocidade do obturador, ISO, megapixels).
> * **Resolução e tamanho** do arquivo (ex: `4032 x 3024`, `2.4 MB`, formato `.jpg`).
> * **Localização geográfica (GPS)**: Se a sua localização estava ativada, as coordenadas de latitude e longitude de onde você estava estão salvas como metadados na foto!

---

## 🏆 3. Desafio da Aula (Atividade Prática)

### Desafio 1: A Tabela de Classificação
Com base nos conceitos de **Dado**, **Informação**, **Fato** e **Metadado**, classifique cada um dos elementos da tabela abaixo escrevendo o conceito correto na coluna correspondente:

| Item | Conteúdo do Item | Classificação (Dado / Informação / Fato / Metadado) |
| :--- | :--- | :--- |
| **1** | `decimal(4,2)` (como tipo do campo nota) | |
| **2** | `17` | |
| **3** | "O aluno Pedro tem 17 anos." | |
| **4** | "Pedro registrou sua entrada pela biometria às 07:02:15 do dia 04/08/2026." | |
| **5** | `varchar(100)` (tipo do campo nome) | |
| **6** | `Redenção` | |
| **7** | "A EEEP Adolfo Ferreira de Sousa fica na cidade de Redenção." | |
| **8** | "O livro 'Banco de Dados Relacional' foi emprestado para o aluno João em 01/08/2026." | |

### Desafio 2: Mapeamento de um Mini-Mundo
Imagine o sistema de uma **Biblioteca Escolar**. O professor pediu para você desenhar o molde de um livro para cadastrar no sistema.

1. Liste pelo menos **4 metadados** necessários para definir o cadastro de um livro (ex: Título do livro, tipo texto de 150 caracteres).
2. Forneça um exemplo de **informação** gerada com base nos dados reais deste livro no sistema.

---

## ❓ 4. Perguntas de Revisão (Estudo Teórico)

Responda brevemente no seu caderno ou arquivo markdown de respostas:

1. **A Dor do Passado**: Por que o armazenamento de informações em arquivos planos (flat files), como planilhas separadas por professor ou arquivos `.txt`, costuma gerar **inconsistência de dados**? Dê um exemplo prático dessa ocorrência.
2. **O Papel do SGBD**: Explique com suas palavras por que precisamos de um SGBD (como o PostgreSQL ou MySQL) em vez de escrevermos nós mesmos um código que lê e escreve em arquivos de texto direto no HD.
3. **ANSI/SPARC**: Diga qual nível da arquitetura de abstração (Físico, Conceitual ou Visão) é afetado em cada uma das seguintes situações:
   * **Situação A**: O administrador de banco de dados decide mudar o armazenamento físico dos dados de um servidor local para a nuvem AWS (Amazon S3), alterando o diretório e indexação dos arquivos em disco.
   * **Situação B**: A equipe de desenvolvimento cria uma tela exclusiva para os pais de alunos no aplicativo mobile, mostrando apenas as notas consolidadas e faltas.
   * **Situação C**: O designer do banco de dados decide adicionar um campo chamado `telefone_emergencia` na tabela de Alunos.
4. **Independência de Dados**: O que é independência física de dados e qual a sua importância prática para os desenvolvedores de software que criam aplicativos conectados a bancos de dados?
