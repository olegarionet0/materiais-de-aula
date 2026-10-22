---
tipo: guia-pratico-aluno
disciplina: Banco de Dados
turma: 2º Ano DS — EEEP-AFS
tema: "Guia de Laboratório: Agrupamentos e Funções de Agregação (COUNT, SUM, AVG, GROUP BY, HAVING) no VS Code"
professor: Olegário Neto
data: 2026-10-28
---

# 💻 Guia de Laboratório: Agrupamento de Dados e Estatísticas em SQL

> [!IMPORTANT] **Ambiente Oficial de Prática**
> Ambiente: **VS Code** com extensão **MySQL** conectada ao servidor local (`localhost:3306`).
> 
> Arquivo de trabalho da aula: **`agrupamentos_aula11.sql`**.  
> Atalho de execução de consulta: Selecione a query e tecle **`Ctrl + Enter`**.

---

## 🏛️ 1. Carga de Dados Complementar (`loja_afs`)

Caso você já tenha a base `loja_afs` criada na Aula 10, basta executar o bloco abaixo para atualizar os dados e criar a tabela de histórico de vendas (`vendas_produtos`):

```sql
USE loja_afs;

-- 1. Criação da tabela de Vendas
DROP TABLE IF EXISTS vendas_produtos;

CREATE TABLE vendas_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    data_venda DATE NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- 2. Inserção de dados de movimentação
INSERT INTO vendas_produtos (produto_id, quantidade, valor_unitario, data_venda) VALUES
(1, 2, 250.00, '2026-10-01'), -- Teclado Mecânico
(1, 1, 250.00, '2026-10-05'), -- Teclado Mecânico
(2, 5, 120.00, '2026-10-02'), -- Mouse Gamer
(3, 1, 850.00, '2026-10-03'), -- Monitor 24
(4, 10, 25.00, '2026-10-04'), -- Caderno Universitário
(5, 4, 32.00, '2026-10-04'),  -- Resma Papel A4
(6, 30, 2.50, '2026-10-05'),  -- Caneta Azul
(2, 3, 120.00, '2026-10-10'); -- Mouse Gamer
```

---

## ⚡ 2. Desafios Práticos de Laboratório

Escreva as queries abaixo no seu arquivo `agrupamentos_aula11.sql`, comente cada desafio e execute no VS Code:

### Desafio 1: Funções de Agregação Globais
> Escreva uma consulta que retorne do cadastro de produtos:
> 1. A quantidade total de produtos cadastrados (`COUNT`).
> 2. O preço médio geral dos produtos (`AVG`).
> 3. O produto mais barato (`MIN`) e o mais caro (`MAX`).
> 4. A soma total dos preços unitários (`SUM`).
> *Dica: Renomeie cada coluna usando apelidos legíveis com `AS`.*

```sql
-- Escreva a query do Desafio 1 aqui:

```

---

### Desafio 2: Agrupamento Simples por Categoria
> Relacione a tabela de `categorias` com a tabela de `produtos` via `INNER JOIN`.
> Agrupe os registros pelo nome da categoria (`GROUP BY c.nome`) e exiba:
> * Nome da Categoria
> * Quantidade de produtos pertencentes à categoria
> * Preço médio dos produtos daquela categoria
> * Ordene da categoria com maior quantidade de itens para a menor.

```sql
-- Escreva a query do Desafio 2 aqui:

```

---

### Desafio 3: Relatório de Faturamento por Venda
> Na tabela `vendas_produtos`, cada linha registra uma quantidade vendida e o valor unitário.
> Calcule:
> 1. A quantidade total de itens vendidos no geral (`SUM(quantidade)`).
> 2. O faturamento bruto total de todas as vendas somadas (`SUM(quantidade * valor_unitario)`).

```sql
-- Escreva a query do Desafio 3 aqui:

```

---

### Desafio 4: Faturamento por Produto com JOIN e GROUP BY
> Junte as tabelas `produtos` e `vendas_produtos`.
> Exiba o nome do produto, o total de unidades comercializadas e o valor financeiro total faturado por aquele produto. Ordene do mais lucrativo para o menos lucrativo.

```sql
-- Escreva a query do Desafio 4 aqui:

```

---

### Desafio 5: O Filtro de Agrupamento — Cláusula HAVING
> Imagine que a gerência queira ver apenas as categorias que possuem **mais de 2 produtos cadastrados**.
> 1. Tente escrever essa restrição utilizando a cláusula `WHERE COUNT(...) > 2` e anote o erro retornado pelo MySQL.
> 2. Reescreva a query de forma correta utilizando a cláusula **`HAVING COUNT(p.id) > 2`**.

```sql
-- Escreva a query do Desafio 5 aqui:

```

---

## 🏁 Critério de Avaliação e Visto
Chame o professor na sua estação de trabalho assim que concluir os 5 desafios no VS Code para validação das consultas e atribuição de visto.
