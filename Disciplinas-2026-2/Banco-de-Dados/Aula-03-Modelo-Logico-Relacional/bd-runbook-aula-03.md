---
tipo: runbook
resumo: "Guia prático para converter um Diagrama Entidade-Relacionamento (DER) em tabelas do Modelo Lógico Relacional, identificando chaves primárias e tipos de dados."
title: "Guia de Aula: Modelo Lógico Relacional — Do DER para Tabelas"
disciplina: Banco de Dados
professor: Olegário Neto
data: 2026-09-22
status: pendente
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Recuperar o DER da turma do BR Modelo (print ou arquivo) para projetar no início.
* [ ] Fazer a chamada / frequência.
* [ ] Revisão rápida: pedir a um aluno para desenhar rapidamente no quadro o que é uma entidade e o que é um atributo identificador.

</div>

# 🗄️ Do DER para Tabelas: Modelo Lógico Relacional

> [!info] **Sobre esta aula**
> Você já sabe montar um Diagrama Entidade-Relacionamento (DER). Hoje vamos dar o próximo passo: transformar esse diagrama em tabelas que o banco de dados realmente entende.

---

## 🏛️ 1. Os Três Níveis de Modelagem

Antes de criar um banco de dados, passamos por três fases:

| Nível | Nome | O que é | Quem usa |
|:--|:--|:--|:--|
| 1 | **Conceitual (DER)** | Diagrama de entidades e relacionamentos | Cliente + Desenvolvedor |
| 2 | **Lógico Relacional** | Tabelas, colunas, chaves | Desenvolvedor |
| 3 | **Físico (SQL)** | Código SQL executado no SGBD | Desenvolvedor |

> [!tip] **Metáfora**
> O modelo conceitual é o croqui do arquiteto. O lógico é a planta técnica com medidas. O físico é a obra construída com tijolos e cimento.

Hoje estamos no **nível 2 — Modelo Lógico**.

---

## 📐 2. As Regras de Mapeamento

### Regra 1 — Entidade → Tabela

Cada **entidade** do DER vira uma **tabela** no banco de dados.

```
DER:         [ Aluno ]        →    Banco: tabela  aluno
DER:         [ Livro ]        →    Banco: tabela  livro
DER:         [ Professor ]    →    Banco: tabela  professor
```

> [!note] **Convenção de nomenclatura**
> - Use letras minúsculas e `snake_case` (sem espaços, palavras separadas por `_`).
> - Prefira o singular: `aluno`, não `alunos`.

---

### Regra 2 — Atributo → Coluna

Cada **atributo** da entidade vira uma **coluna** da tabela.

Cada coluna precisa de um **tipo de dado**. Os mais comuns:

| Tipo | O que guarda | Exemplo |
|:--|:--|:--|
| `VARCHAR(n)` | Texto de até n caracteres | `nome VARCHAR(100)` |
| `INT` | Número inteiro | `idade INT` |
| `DATE` | Data (ano-mês-dia) | `data_nascimento DATE` |
| `DECIMAL(p,s)` | Número decimal | `nota DECIMAL(4,2)` |
| `BOOLEAN` | Verdadeiro ou falso | `ativo BOOLEAN` |

---

### Regra 3 — Atributo Identificador → Chave Primária (PK)

O atributo identificador (aquele sublinhado no DER) vira a **Chave Primária (PK)**.

**Uma Chave Primária precisa ser:**
- ✅ **Única** — dois registros não podem ter o mesmo valor
- ✅ **Não nula** — todo registro deve ter uma PK (nunca vazia)
- ✅ **Estável** — o valor não deve mudar ao longo do tempo

> [!warning] **Por que CPF é uma PK ruim?**
> - Pode conter erros de digitação
> - Nem todo aluno tem CPF (ex.: menor de idade no cadastro)
> - Uma correção no CPF obrigaria atualizar todas as tabelas ligadas a ele
>
> **Solução preferida:** usar um ID numérico gerado automaticamente pelo banco.
> ```
> id_aluno INT AUTO_INCREMENT PRIMARY KEY
> ```

---

## 🔧 3. Atividade: Convertendo o DER em Tabelas

**Minimundo:** *Uma biblioteca possui livros e alunos. Um aluno pode pegar emprestado vários livros.*

**DER (já conhecido):**
```
[ Aluno ] ——— empresta ——— [ Livro ]
```

### Passo 1 — Identifique as entidades e crie as tabelas

**Entidade: Aluno → Tabela `aluno`**

| Coluna            | Tipo           | Restrição                     | Observação       |
| :---------------- | :------------- | :---------------------------- | :--------------- |
| `id_aluno`        | `INT`          | `PRIMARY KEY, AUTO_INCREMENT` | PK sintética     |
| `nome`            | `VARCHAR(100)` | `NOT NULL`                    | —                |
| `matricula`       | `VARCHAR(20)`  | `UNIQUE, NOT NULL`            | Alternativa à PK |
| `data_nascimento` | `DATE`         | —                             | —                |

**Entidade: Livro → Tabela `livro`**

| Coluna | Tipo | Restrição | Observação |
|:--|:--|:--|:--|
| `id_livro` | `INT` | `PRIMARY KEY, AUTO_INCREMENT` | PK sintética |
| `titulo` | `VARCHAR(200)` | `NOT NULL` | — |
| `isbn` | `VARCHAR(20)` | `UNIQUE` | — |
| `ano_publicacao` | `INT` | — | — |

---

### Passo 2 — E o relacionamento "empresta"?

Olhe para o losango no DER. O relacionamento **não desaparece** — ele precisa ser representado de alguma forma nas tabelas.

> [!important] **Reflexão para a próxima aula**
> Como o banco de dados sabe que o aluno **João** pegou o livro **"Dom Casmurro"**?
> A resposta tem nome: **Chave Estrangeira (Foreign Key)**. Veremos isso na próxima aula.

---

## 🏆 4. Desafio da Aula

Use o **minimundo abaixo** e construa no caderno (ou no computador) as tabelas do modelo lógico.

**Minimundo:** *Uma escola possui turmas e alunos. Cada aluno pertence a uma turma. Cada turma tem um nome, um turno (manhã ou tarde) e um ano escolar.*

**Faça:**
1. Identifique as **entidades**.
2. Liste os **atributos** de cada entidade.
3. Defina qual atributo será a **Chave Primária (PK)** de cada tabela.
4. Desenhe as tabelas no formato de colunas com tipo de dado.

---

## ❓ 5. Perguntas de Revisão

Responda no caderno:

1. O que acontece com uma **entidade** quando passamos do modelo conceitual para o lógico?
2. Quais são as **três características obrigatórias** de uma Chave Primária?
3. Por que usamos `id_aluno INT AUTO_INCREMENT` em vez do CPF como PK?
4. O que é um **tipo de dado**? Dê dois exemplos com situações reais onde você usaria cada um.
