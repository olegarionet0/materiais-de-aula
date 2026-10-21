---
tipo: runbook
resumo: "Guia prático para execução de comandos DML e uso da cláusula WHERE no XAMPP (phpMyAdmin)."
title: "Guia de Laboratório: SQL DML com WHERE no XAMPP"
disciplina: Banco de Dados
professor: Olegário Neto
data: 2026-10-06
status: pendente
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Fazer a chamada / frequência.
* [ ] Garantir que o XAMPP foi inicializado corretamente em todas as máquinas.
* [ ] Contar a história do estagiário que deu UPDATE sem WHERE para criar a motivação.

</div>

# 💻 Guia de Laboratório: SQL DML com WHERE no XAMPP

> [!info] **Sobre este Guia**
> Este roteiro contém instruções práticas e teóricas passo a passo para a realização da nossa atividade de laboratório de Banco de Dados. Siga cada etapa com atenção e teste seus comandos na aba SQL do **phpMyAdmin**.

---

## 🏛️ 1. Pré-requisitos e Preparação
Antes de iniciar, verifique se você possui:
* [ ] XAMPP Control Panel aberto.
* [ ] Apache e MySQL iniciados (Start).
* [ ] Acesso ao painel do phpMyAdmin via navegador (`http://localhost/phpmyadmin`).

---

## 🚀 2. Passo a Passo do Laboratório

### Passo 1: Criação do Banco e Tabela (DDL)
No phpMyAdmin, clique na aba **SQL** geral e execute o comando abaixo para criar nossa estrutura inicial. Depois, atualize a árvore lateral para ver o banco `loja_afs`.

```sql
CREATE DATABASE loja_afs;
USE loja_afs;

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50),
    ativo BOOLEAN DEFAULT TRUE
);
```

### Passo 2: Inserção de Dados (INSERT)
Na aba **SQL** referente ao banco `loja_afs`, cadastre nossos produtos de teste:

```sql
INSERT INTO produtos (nome, preco, categoria, ativo) VALUES 
('Teclado Mecânico', 250.00, 'Eletrônicos', TRUE),
('Mouse Gamer', 120.00, 'Eletrônicos', TRUE),
('Caderno Universitário', 25.00, 'Papelaria', FALSE),
('Monitor 24', 850.00, 'Eletrônicos', TRUE),
('Caneta Azul', 2.50, 'Papelaria', TRUE),
('Headset', 180.00, 'Eletrônicos', FALSE);
```

### Passo 3: Verificação de Funcionamento (SELECT)
Para testar se tudo foi inserido corretamente, execute:
```sql
SELECT * FROM produtos;
```
> [!tip] **O que observar:**
> Você deve ver uma grade com 6 produtos cadastrados, contendo os campos `id`, `nome`, `preco`, `categoria` e `ativo`. Os produtos inativos estarão com o valor `0` na coluna `ativo`.

---

## 🏆 3. Desafio da Aula (Atividade Prática)

Agora é a sua vez! Tente modificar os dados da tabela, seguindo a nossa **Regra de Ouro**:
> ⚠️ **NUNCA DELETA OU ATUALIZA SEM O WHERE!**
> Para simular um ambiente profissional seguro, **antes** de rodar qualquer `UPDATE` ou `DELETE`, rode um `SELECT` com a mesmíssima condição do `WHERE` para visualizar se o banco retornou exatamente os registros que você deseja modificar.

1. **Desafio 1 (UPDATE)**: Devido à inflação, aumente o preço de todos os produtos da categoria `Eletrônicos` em 10% (dica: `preco * 1.10`).
   - *Passo de Segurança*: Faça um `SELECT` para listar os eletrônicos.
   - *Passo Efetivo*: Faça o `UPDATE` usando o `WHERE`.
2. **Desafio 2 (DELETE)**: O gerente pediu para remover do banco de dados definitivamente todos os itens que estão fora de linha (ou seja, `ativo = 0` / FALSE).
   - *Passo de Segurança*: Faça um `SELECT` dos desativados.
   - *Passo Efetivo*: Faça o `DELETE` com o respectivo `WHERE`.
3. **Desafio Final**: Rode um `SELECT * FROM produtos;` geral para demonstrar para o professor a sua tabela final limpa e atualizada.

---

## ❓ 4. Perguntas de Revisão (Estudo Teórico)
Responda brevemente:
1. *Pergunta 1*: O que aconteceria se você executasse `UPDATE produtos SET preco = 0;` sem a cláusula WHERE?
2. *Pergunta 2*: Por que a prática de fazer um `SELECT` antes de um comando destrutivo é recomendada nas empresas?
