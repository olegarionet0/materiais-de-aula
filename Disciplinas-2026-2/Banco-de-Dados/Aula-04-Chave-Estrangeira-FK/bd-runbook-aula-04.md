---
tipo: runbook
resumo: "Guia de aula sobre Chave Estrangeira (FK): como os relacionamentos do DER viram colunas nas tabelas relacionais, com os três cenários de cardinalidade."
title: "Guia de Aula: Chave Estrangeira (FK) — Os Relacionamentos Viram Colunas"
disciplina: Banco de Dados
professor: Olegário Neto
data: 2026-09-23
status: pendente
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Recuperar o DER da turma (Aluno/Livro ou Escola) das aulas anteriores para usar nos exemplos.
* [ ] Fazer a chamada / frequência.
* [ ] Retrieval rápido: pedir a 3 alunos que respondam sobre PK sem consultar o caderno.

</div>

# 🔗 Chave Estrangeira (FK) — Os Relacionamentos Viram Colunas

> [!info] **Sobre esta aula**
> Na aula anterior você aprendeu a converter entidades em tabelas e atributos em colunas. Mas ficou uma pergunta aberta: o losango do DER — o relacionamento — como ele aparece no banco? A resposta é a **Chave Estrangeira**.

---

## 🏛️ 1. O que é uma Chave Estrangeira?

A **Foreign Key (FK)** — em português, **Chave Estrangeira** — é uma coluna em uma tabela que **guarda o valor da Chave Primária de outra tabela**.

Ela é a implementação concreta do losango do DER no banco de dados relacional.

> [!tip] **Metáfora da Ficha de Empréstimo**
> Em uma biblioteca física, a ficha de empréstimo contém:
> - O **RA do aluno** (referência ao aluno)
> - O **código do livro** (referência ao livro)
>
> Essa ficha, no banco de dados, é exatamente a tabela que contém duas FKs.

---

## 🔒 Integridade Referencial

O SGBD garante que uma FK **nunca pode apontar para um registro que não existe**.

Se você tentar inserir um empréstimo com `id_aluno = 999` e não existir nenhum aluno com esse ID, o banco **rejeita a operação**.

Isso se chama **Integridade Referencial** — e é uma das proteções mais importantes de um banco relacional.

---

## 📐 2. Regras de Mapeamento por Cardinalidade

| Cardinalidade | Regra | Onde vai a FK |
|:--|:--|:--|
| **1:N** (um para muitos) | FK vai para o lado **N** | Na tabela do "muitos" |
| **1:1** (um para um) | FK vai para qualquer lado + `UNIQUE` | Em um dos dois lados |
| **N:N** (muitos para muitos) | Criar **tabela associativa** com duas FKs | Nova tabela intermediária |

---

## 🔧 3. Os Três Cenários na Prática

### Cenário 1 — Relacionamento 1:N

> *"Um professor leciona muitas turmas. Uma turma tem exatamente um professor."*

**DER:** `Professor` —1:N— `Turma`

**Regra:** A FK vai para a tabela do lado N → `turma` recebe `id_professor`.

**Tabela `professor`:**
| Coluna | Tipo | Restrição |
|:--|:--|:--|
| `id_professor` | `INT` | `PK, AUTO_INCREMENT` |
| `nome` | `VARCHAR(100)` | `NOT NULL` |
| `email` | `VARCHAR(100)` | `UNIQUE` |

**Tabela `turma`:**
| Coluna | Tipo | Restrição |
|:--|:--|:--|
| `id_turma` | `INT` | `PK, AUTO_INCREMENT` |
| `nome` | `VARCHAR(20)` | `NOT NULL` |
| `turno` | `VARCHAR(10)` | — |
| `id_professor` | `INT` | **FK → professor(id_professor)** |

---

### Cenário 2 — Relacionamento 1:1

> *"Cada funcionário tem um crachá único. Cada crachá pertence a um funcionário."*

**DER:** `Funcionario` —1:1— `Cracha`

**Regra:** A FK vai para um dos lados + restrição `UNIQUE` (garante o 1:1).

**Tabela `cracha`:**
| Coluna | Tipo | Restrição |
|:--|:--|:--|
| `id_cracha` | `INT` | `PK, AUTO_INCREMENT` |
| `numero_serie` | `VARCHAR(20)` | `UNIQUE, NOT NULL` |
| `id_funcionario` | `INT` | **FK → funcionario(id_funcionario), UNIQUE** |

> [!note]
> O `UNIQUE` na FK garante que nenhum funcionário apareça em mais de um crachá — implementando o 1:1.

---

### Cenário 3 — Relacionamento N:N (Tabela Associativa)

> *"Um aluno pode pegar emprestado vários livros ao longo do tempo. Um livro pode ser emprestado por vários alunos em momentos diferentes."*

**DER:** `Aluno` —N:N— `Livro`

**Regra:** Criar uma **terceira tabela** (`emprestimo`) com duas FKs. Os atributos do relacionamento (datas) também ficam nessa tabela.

**Tabela `emprestimo`:**
| Coluna | Tipo | Restrição |
|:--|:--|:--|
| `id_emprestimo` | `INT` | `PK, AUTO_INCREMENT` |
| `id_aluno` | `INT` | **FK → aluno(id_aluno)** |
| `id_livro` | `INT` | **FK → livro(id_livro)** |
| `data_retirada` | `DATE` | `NOT NULL` |
| `data_devolucao` | `DATE` | — (NULL = ainda não devolveu) |

> [!warning] **Regra de ouro do N:N**
> Um relacionamento N:N **sempre** gera uma tabela nova. Nunca tente colocar a FK diretamente em uma das tabelas existentes.

---

## 🏆 4. Desafio da Aula

**Minimundo:** *Uma escola tem professores e disciplinas. Um professor pode lecionar várias disciplinas. Uma disciplina pode ser lecionada por vários professores (em turmas diferentes). Cada professor tem: nome, CPF e email. Cada disciplina tem: nome e carga horária (em horas).*

**Faça no caderno:**
1. Identifique as **entidades** e a **cardinalidade** do relacionamento entre elas.
2. Monte as **tabelas** com todas as colunas, tipos de dados e restrições (PK, FK, NOT NULL).
3. Se necessário, crie a **tabela associativa** com os atributos corretos.

---

## ❓ 5. Perguntas de Revisão

1. O que é uma **Chave Estrangeira** e qual é a sua função?
2. Em um relacionamento **1:N** entre `Pedido` e `Item_Pedido`, em qual tabela a FK deve ficar? Por quê?
3. O que é **integridade referencial**? O que acontece se você tentar inserir uma FK com valor inexistente?
4. Por que um relacionamento **N:N** exige a criação de uma terceira tabela?
5. No relacionamento **1:1**, qual restrição adicional precisa ser aplicada à FK?
