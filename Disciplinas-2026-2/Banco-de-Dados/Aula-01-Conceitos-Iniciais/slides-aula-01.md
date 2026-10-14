---
theme: black
css: slides-eeep-afs
highlightTheme: monokai
slideNumber: "c/t"
---

<!-- slide -->
# 🏫 EEEP Adolfo Ferreira de Sousa
## Disciplina: Banco de Dados
### Tema: Conceitos Iniciais

**Professor:** Olegário Neto  
**Data:** 04/08/2026

---
<!-- slide -->
## 📋 Agenda de Hoje

- Dado, Informação, Fato e Metadados
- Histórico dos bancos de dados
- O que é Banco de Dados e SGBD?
- Abstração de dados (ANSI/SPARC)
- Atividade prática

---
<!-- slide -->
# 🔍 Parte 1: Dado, Informação, Fato e Metadados

*A base de todo sistema de informação.*

---
<!-- slide -->
## 🔢 O que é um Dado?

- É um elemento em seu **estado bruto**.
- Não possui contexto associado.
- Sozinho, não transmite significado ou conhecimento.

> **Exemplo:**  
> `35` (Número solto)  
> `Maria` (Nome solto)

---
<!-- slide -->
## 💡 O que é Informação?

- É o dado **contextualizado**.
- Possui significado e utilidade direta.
- Diminui a incerteza e apoia a tomada de decisão.

> **Exemplo:**  
> "A temperatura em Redenção agora é **35°C**."  
> "A aluna da informática se chama **Maria**."

---
<!-- slide -->
## 📌 O que é um Fato?

- É um acontecimento ou situação **real e comprovada**.
- Um dado histórico registrado que não pode ser alterado.

> **Exemplo:**  
> "Fez **35°C** em Redenção no dia **04/08/2026**."  
> "A aluna **Maria** obteve média **10** no semestre."

---
<!-- slide -->
## 🏷️ O que são Metadados?

- São **dados sobre os dados**.
- Descrevem a estrutura, restrições e propriedades dos dados.
- Servem como o "molde" ou "receita" do banco.

> **Exemplo:**  
> O campo `temperatura` deve ser um **número decimal** com **1 casa decimal**.  
> O campo `nome_aluno` deve ser um texto de no máximo **100 caracteres**.

---
<!-- slide -->
# ⏳ Parte 2: Histórico e Evolução

*Como chegamos até aqui?*

---
<!-- slide -->
## 📂 A Era dos Arquivos Planos (Flat Files)

- Armazenamento em arquivos de texto simples ou planilhas isoladas.
- **Grandes problemas:**
  - ❌ Redundância (dados repetidos)
  - ❌ Inconsistência (dados desatualizados em um arquivo e corretos em outro)
  - ❌ Dificuldade de acesso e segurança frágil

---
<!-- slide -->
## 🚀 O Modelo Relacional (1970)

- Proposto por **Edgar F. Codd (IBM)**.
- Organiza dados em **tabelas (relações)** com linhas e colunas.
- Introduziu a linguagem SQL para consultas.
- Tornou-se o padrão da indústria devido à sua simplicidade e robustez matemática.

---
<!-- slide -->
# 🗄️ Parte 3: Bancos de Dados e SGBDs

*Entendendo a infraestrutura.*

---
<!-- slide -->
## 🖥️ O que é um Banco de Dados?

> **Definição:**  
> Coleção lógica, coerente e integrada de dados correlacionados que representa algum aspecto do **mundo real** (Mini-mundo).

- Possui um propósito específico.
- É projetado para atender a um grupo de usuários.

---
<!-- slide -->
## ⚙️ O que é um SGBD?

- **Sistema Gerenciador de Banco de Dados** (DBMS).
- Software que facilita a criação, manipulação, proteção e compartilhamento de bancos de dados.
- Garante segurança, controle de concorrência e backups.

> **Exemplos populares:**  
> MySQL, PostgreSQL, SQLite, SQL Server, Oracle.

---
<!-- slide -->
# 🪜 Parte 4: Abstração de Dados

*Como ocultar a complexidade física do armazenamento.*

---
<!-- slide -->
## 🏗️ Arquitetura de 3 Níveis (ANSI/SPARC)

1. **Nível Externo (Visão)**: O que o usuário/aplicativo vê (views, telas).
2. **Nível Conceitual (Lógico)**: A estrutura de tabelas, campos e relacionamentos.
3. **Nível Interno (Físico)**: Como os arquivos e índices são gravados no disco físico.

---
<!-- slide -->
## 🔄 Independência de Dados

- **Física**: Alterar a estrutura física (ex: trocar HD por SSD) não afeta o nível lógico (tabelas e código).
- **Lógica**: Alterar tabelas (ex: adicionar uma coluna) não quebra as aplicações se criarmos visões compatíveis.

---
<!-- slide -->
## 💻 Prática Guiada: O Diário Escolar (SICE)

Vamos identificar no quadro:
1. Os **Dados** brutos de um estudante.
2. A **Informação** gerada para os pais.
3. Os **Metadados** das notas e nomes.
4. Os **Níveis de Visão** (Professor vs. Aluno vs. Diretor).

---
<!-- slide -->
## 🏆 Desafio Prático

- Abra o seu [Runbook de Laboratório](file:///c:/Users/olega/Documents/EEEPAFS/DEV/Segundo-Cerebro/01_Projetos/01_EEEP-AFS/2026-2-Aulas/Banco%20de%20Dados/runbook-2026-08-04-conceitos-iniciais.md).
- Realize as classificações e resolva as perguntas de fixação no seu ambiente.
- Tempo estimado: **10 a 15 minutos**.

---
<!-- slide -->
## ✅ Resumo da Aula

- **Dado** (bruto) $\rightarrow$ **Informação** (contexto) $\rightarrow$ **Fato** (registro real).
- **Metadado** é a estrutura descritiva.
- **SGBD** gerencia o acesso e a consistência.
- A **Abstração** (ANSI/SPARC) garante que o código não quebre quando o hardware muda.

> **Próxima aula:** O Modelo Relacional (Tabelas, Chaves Primárias e Estrangeiras)
