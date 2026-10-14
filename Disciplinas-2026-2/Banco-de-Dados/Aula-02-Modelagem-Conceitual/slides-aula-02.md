---
theme: black
css: slides-eeep-afs
highlightTheme: monokai
slideNumber: "c/t"
---

<!-- slide -->
# 🏫 EEEP Adolfo Ferreira de Sousa
## Disciplina: Banco de Dados
### Tema: Abstração, Modelo Relacional e Modelo Conceitual

**Professor:** Olegário Neto  
**Data:** 11/08/2026

---
<!-- slide -->
## 📋 Agenda de Hoje

- Correção do exercício da aula anterior
- Níveis de Abstração (ANSI/SPARC)
- O que é o Modelo Relacional?
- O que é Modelagem de Dados?
- Introdução ao Modelo Conceitual
- Dinâmica prática: Identificando componentes

---
<!-- slide -->
# ✍️ Parte 1: Correção do Exercício

*Ajustando as velas e revendo os conceitos iniciais.*

---
<!-- slide -->
## 1) O que é um Banco de Dados?

- É uma **coleção lógica e coerente de dados correlacionados**.
- Representa um aspecto do mundo real (Mini-mundo).
- Organizado para facilitar a consulta e a persistência.

> **Sua resposta foi:**  
> *"Uma forma digital de armazenar dados de forma organizada."* (Excelente!)

---
<!-- slide -->
## 2) Principais tipos e suas diferenças

- **Bancos de Dados Relacionais**: Dados salvos em estruturas de linhas e colunas (tabelas rígidas).
- **Bancos de Dados Não Relacionais (NoSQL)**: Flexibilidade de formatos (chave-valor, documentos, grafos, etc.).

> **Sua resposta foi:**  
> *"Os Relacionais e os Não Relacionais."* (Correto!)

---
<!-- slide -->
## 3) A Diferença Estrutural (SQL vs. NoSQL)

- **Relacionais**: Seguem estruturas fixas ligadas por regras.
- **Não Relacionais**: Organizados de forma flexível (ex: coleções ou documentos tipo JSON).

> **Sua resposta foi:**  
> *Relacional organiza em tabelas com colunas e linhas. Não Relacional armazena em pastas/documentos (NoSQL).* (Muito bom!)

---
<!-- slide -->
## 4) O que é um SGBD?

- **Sistema Gerenciador de Banco de Dados**.
- Software que atua como intermediário entre a aplicação e o banco físico.
- Fornece segurança, backups e controle de concorrência.

> **Sua resposta foi:**  
> *"O sistema que irá gerenciar os dados armazenados."* (Perfeito!)

---
<!-- slide -->
## 5) Cite alguns SGBDs

- **SGBDs Relacionais populares**:
  - MySQL, PostgreSQL, **MariaDB** (fork open source do MySQL), **SQLite**, SQL Server, Oracle.

> **Sua resposta foi:**  
> *"SQL SERVER, MARIA BD e SQLITE."* (Correto! Apenas atente para a grafia correta: *MariaDB*)

---
<!-- slide -->
# 🪜 Parte 2: Abstração e Modelo Relacional

*Ocultando complexidade e estruturando em tabelas.*

---
<!-- slide -->
## 🏗️ Níveis de Abstração (ANSI/SPARC)

1. **Nível Externo (Visão)**: O que o app e o usuário enxergam (telas específicas).
2. **Nível Conceitual (Lógico)**: A estrutura de tabelas, chaves e relacionamentos do banco.
3. **Nível Interno (Físico)**: Como os arquivos estão alocados nos HDs/SSDs do servidor.

> **Objetivo**: Garantir a Independência de Dados (mudar o hardware sem quebrar o código).

---
<!-- slide -->
## 🚀 O Modelo Relacional (Edgar Codd, 1970)

- O dado é percebido pelo usuário como **tabelas** (relações).
- Uma tabela possui **linhas** (tuplas/registros) e **colunas** (atributos).
- Tabelas se conectam e se relacionam através de campos em comum (**chaves**).

---
<!-- slide -->
# 📐 Parte 3: Introdução à Modelagem de Dados

*Projetando antes de construir.*

---
<!-- slide -->
## ✏️ Por que modelar?

> **A analogia da engenharia civil:**  
> Nenhum engenheiro começa a erguer as paredes de um prédio sem ter em mãos a **planta arquitetônica** aprovada.

- Modelar dados evita **retrabalho**.
- Garante que as regras de negócio do cliente serão atendidas.
- Serve de documentação para o time de desenvolvimento.

---
<!-- slide -->
## 🗺️ O Modelo Conceitual (Aula 06)

- É a **planta conceitual** do banco.
- Alto nível de abstração.
- Não depende de tecnologia (não importa se usaremos MySQL, Postgres ou MongoDB).
- Focado na comunicação com o cliente e nas regras de negócio.

---
<!-- slide -->
## 🧱 Elementos do Modelo Conceitual

- **Entidade**: O objeto/conceito do mundo real que queremos mapear (ex: `Aluno`, `Carro`, `Curso`). Representada por um **retângulo**.
- **Atributo**: As características da entidade (ex: `nome`, `ano`, `placa`). Representado por uma **elipse/círculo**.
- **Relacionamento**: Como as entidades se associam (ex: `Aluno` *estuda em* `Curso`). Representado por um **losango**.

---
<!-- slide -->
## 💻 Prática Guiada: A Livraria

Identifique no quadro as **Entidades** e seus **Atributos** para uma livraria fictícia:

1. Quais as entidades fundamentais do negócio?
2. Quais as características (atributos) que descrevem um `Livro`?
3. Como o `Cliente` se relaciona com a entidade `Livro`?

---
<!-- slide -->
## ✅ Resumo de Hoje

- **Abstração (ANSI/SPARC)** esconde detalhes físicos para proteger a aplicação.
- **Modelo Relacional** estrutura dados em tabelas ligadas por chaves.
- **Modelagem Conceitual** é o projeto lógico, independente de tecnologia, composto por **Entidades**, **Atributos** e **Relacionamentos**.

> **Próxima aula**: Aula 07 — Identificando Entidades em requisitos práticos.
