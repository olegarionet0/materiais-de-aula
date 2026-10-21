---
tipo: runbook
resumo: "Guia de aula sobre transações, propriedades ACID e operações CRUD — fundamentos de integridade e operações básicas antes do SQL."
title: "Guia de Aula: ACID e CRUD — Integridade de Dados e Operações Fundamentais"
disciplina: Banco de Dados
professor: Olegário Neto
data: 2026-09-29
status: pendente
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Corrigir rapidamente o desafio da aula anterior (minimundo professor/disciplina).
* [ ] Fazer a chamada / frequência.
* [ ] Ter o cenário da transferência bancária pronto para apresentar como problema motivador.

</div>

# ⚙️ ACID e CRUD — Integridade de Dados e Operações Fundamentais

> [!info] **Sobre esta aula**
> Você já sabe modelar um banco de dados. Mas como o SGBD garante que os dados ficam corretos mesmo com erros, quedas de servidor e vários usuários operando ao mesmo tempo? E quais são as operações básicas que qualquer sistema faz em um banco? As respostas são: **ACID** e **CRUD**.

---

## 🏛️ 1. O Problema: Por que precisamos de Transações?

Imagine um sistema bancário executando uma transferência de R$ 500,00 do João para a Maria:

1. **Passo 1:** Debitar R$ 500 da conta do João → ✅ feito
2. **Passo 2:** Creditar R$ 500 na conta da Maria → ❌ servidor caiu!

**Resultado sem proteção:** João perdeu R$ 500. Maria não recebeu nada. O banco ficou inconsistente.

**Solução:** Agrupar os dois passos em uma **transação** — um bloco que só é confirmado se **tudo** funcionar. Se qualquer passo falhar, tudo é desfeito.

> [!important] **O que é uma Transação?**
> Um conjunto de operações que devem ser executadas como uma **unidade indivisível**:
> - Tudo é concluído com sucesso → **COMMIT** (confirma)
> - Qualquer passo falha → **ROLLBACK** (desfaz tudo)

---

## 🔐 2. As Propriedades ACID

| Letra | Propriedade | Em uma frase |
|:--|:--|:--|
| **A** | Atomicidade | Tudo ou nada |
| **C** | Consistência | Sempre válido |
| **I** | Isolamento | Sem interferência |
| **D** | Durabilidade | Permanente após COMMIT |

---

### A — Atomicidade

A transação é **atômica**: indivisível.

Ou todos os passos executam com sucesso (`COMMIT`), ou todos são revertidos (`ROLLBACK`).

> **Exemplo:** A transferência bancária. Se o crédito na conta da Maria falhar, o débito da conta do João é automaticamente desfeito. O banco volta ao estado original.

---

### C — Consistência

O banco deve passar de um **estado válido** para outro **estado válido**.

Todas as regras definidas (PK, FK, `NOT NULL`, tipos de dados, restrições de valor) precisam ser respeitadas antes e depois de qualquer transação.

> **Exemplo:** Se a regra diz que nota deve estar entre 0 e 10, um `UPDATE` que tente gravar `nota = -5` é rejeitado. A consistência garante que essa regra nunca seja quebrada.

---

### I — Isolamento

Transações simultâneas **não se interferem**.

Uma transação em andamento não enxerga as mudanças de outra transação que ainda não terminou (não fez COMMIT).

> **Exemplo:** Dois caixas de supermercado registrando vendas ao mesmo tempo. O banco gerencia o acesso para que um não sobrescreva os dados do outro sem controle.

---

### D — Durabilidade

Uma transação confirmada (COMMIT) **persiste permanentemente** — mesmo que o servidor caia imediatamente depois.

O SGBD usa **logs de transação** gravados em disco para garantir a recuperação em caso de falha.

> **Exemplo:** Você paga uma compra online e o sistema confirma o pagamento. Se o servidor reiniciar 2 segundos depois, o pagamento continua registrado. O log garante a recuperação.

> [!tip] **Mnemônico ACID**
> **A**tômica — tudo ou nada  
> **C**onsistente — sempre válido  
> **I**solada — sem interferência  
> **D**urável — permanente após commit

---

## 🔄 3. CRUD — As 4 Operações Fundamentais

**CRUD** é o acrônimo das quatro operações que qualquer sistema realiza em um banco de dados:

| Letra | Operação | Comando SQL | O que faz |
|:--|:--|:--|:--|
| **C** | **Create** (Criar) | `INSERT INTO` | Insere um novo registro |
| **R** | **Read** (Ler) | `SELECT` | Consulta registros existentes |
| **U** | **Update** (Atualizar) | `UPDATE` | Modifica registros existentes |
| **D** | **Delete** (Deletar) | `DELETE FROM` | Remove registros |

> [!note] **CRUD está em todo lugar**
> Pense em qualquer tela de sistema que você vai desenvolver:
> - Formulário de cadastro → **C** (INSERT)
> - Lista de alunos → **R** (SELECT)
> - Tela de edição de perfil → **U** (UPDATE)
> - Botão "Excluir" → **D** (DELETE)

---

### CRUD + ACID juntos

Toda operação CRUD executada dentro de uma transação segue as propriedades ACID.

Quando você executa um `INSERT` (C) e algo dá errado no meio, o SGBD faz o ROLLBACK — o registro não fica pela metade no banco.

---

## 🏆 4. Desafio: Quiz de Cenários

Para cada situação abaixo, identifique:
- **(a)** Qual propriedade ACID foi violada? OU
- **(b)** Qual operação CRUD está sendo executada?

1. O servidor caiu durante um `INSERT`. O registro ficou com metade dos campos preenchidos.
2. Um `UPDATE` gravou `nota = -3` em um campo que só aceita valores entre 0 e 10.
3. Dois usuários editaram o mesmo registro ao mesmo tempo e um sobrescreveu os dados do outro sem aviso.
4. O sistema confirmou um pagamento, mas após reinicialização o registro sumiu.
5. O professor está consultando a lista de chamada da turma no sistema.
6. O aluno atualizou o endereço no seu cadastro.
7. O secretário excluiu um aluno transferido do sistema.
8. A diretoria está cadastrando uma nova turma no sistema.

---

## ❓ 5. Perguntas de Revisão

1. O que é uma **transação** em banco de dados?
2. Explique a diferença entre **COMMIT** e **ROLLBACK**.
3. Qual propriedade ACID garante que dados confirmados não são perdidos em caso de queda de energia?
4. Por que o **Isolamento** é necessário em sistemas com múltiplos usuários simultâneos?
5. Associe cada operação CRUD ao comando SQL correspondente.
6. Cite um exemplo do cotidiano (fora de TI) onde o conceito de Atomicidade se aplica naturalmente.
