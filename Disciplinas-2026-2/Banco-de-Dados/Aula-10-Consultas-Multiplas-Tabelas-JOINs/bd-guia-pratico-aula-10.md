---
tipo: guia-pratico-aluno
disciplina: Banco de Dados
turma: 2º Ano DS — EEEP-AFS
tema: "Guia Prático: Relacionando Tabelas com INNER JOIN e LEFT JOIN no VS Code"
professor: Olegário Neto
data: 2026-10-21
---

# 💻 Guia de Laboratório: Consultas com JOINs no VS Code

> [!IMPORTANT] **Novo Ambiente Oficial de Banco de Dados**
> A partir de hoje, trabalhamos como desenvolvedores reais: escrevendo scripts SQL no **VS Code** e executando com a extensão **MySQL**.
> 
> **Atalho essencial:** Selecione a query (ou posicione o cursor nela) e tecle **`Ctrl + Enter`** para executar.

---

## 🏛️ 1. Setup Rápido da Conexão no VS Code

1. Abra o **VS Code**.
2. Clique no ícone de banco de dados na barra lateral esquerda (Extensão **MySQL**).
3. Clique no botão **`+` (Add Connection)**:
   * **Host:** `localhost` (ou `127.0.0.1`)
   * **Port:** `3306`
   * **User:** `root`
   * **Password:** *(deixe em branco)*
4. Clique em **Connect**.
5. Crie na sua pasta pessoal um arquivo chamado **`joins_aula10.sql`**.

---

## 🏗️ 2. Script de Inicialização da Base

Copie o script abaixo, cole no seu arquivo `joins_aula10.sql` e execute no VS Code (`Ctrl + Enter`):

```sql
CREATE DATABASE IF NOT EXISTS loja_afs;
USE loja_afs;

-- 1. Tabela de Categorias (Tabela Pai)
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    setor VARCHAR(50) NOT NULL
);

-- 2. Tabela de Produtos (Tabela Filho com FK)
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    categoria_id INT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- 3. Inserção de Categorias
INSERT INTO categorias (nome, setor) VALUES 
('Eletrônicos', 'Tecnologia'),
('Papelaria', 'Escolar'),
('Móveis', 'Escritório');

-- 4. Inserção de Produtos
INSERT INTO produtos (nome, preco, categoria_id) VALUES 
('Teclado Mecânico', 250.00, 1),
('Mouse Gamer', 120.00, 1),
('Monitor 24', 850.00, 1),
('Caderno Universitário', 25.00, 2),
('Resma Papel A4', 32.00, 2),
('Caneta Azul', 2.50, 2),
('Cabo Adaptador USB', 15.00, NULL); -- Produto propositalmente sem categoria!
```

---

## ⚡ 3. Desafios Práticos de Laboratório

Escreva cada consulta abaixo no seu `joins_aula10.sql`, comente e execute:

### Desafio 1: O Primeiro INNER JOIN
> Selecione o nome do produto, o preço e o nome da categoria. Utilize apelidos de tabela (`produtos AS p` e `categorias AS c`).  
> *Observe: O "Cabo Adaptador USB" apareceu no resultado? Por que?*

```sql
-- Escreva sua query aqui abaixo:

```

---

### Desafio 2: Filtrando após o JOIN
> Selecione o nome do produto, o preço e o nome da categoria apenas para os produtos cujo setor seja `'Tecnologia'` e o preço seja maior que `150.00`.

```sql
-- Escreva sua query aqui abaixo:

```

---

### Desafio 3: O Poder do LEFT JOIN
> Execute um `LEFT JOIN` entre `produtos` (esquerda) e `categorias` (direita).  
> *Pergunta: O que apareceu na coluna do nome da categoria para o produto "Cabo Adaptador USB"?*

```sql
-- Escreva sua query aqui abaixo:

```

---

### Desafio 4: Caçando Produtos Órfãos (Auditoria)
> Escreva uma query com `LEFT JOIN` que liste **apenas os produtos que NÃO possuem categoria cadastrada** (`categoria_id IS NULL` ou `c.id IS NULL`).

```sql
-- Escreva sua query aqui abaixo:

```

---

### Desafio 5: Relatório Estatístico Agrupado
> Faça um `INNER JOIN` e calcule:
> * Nome da categoria
> * Quantidade de produtos naquela categoria (`COUNT(p.id)`)
> * Preço médio dos produtos (`AVG(p.preco)`)
> * Ordene da categoria com mais produtos para a que tem menos.

```sql
-- Escreva sua query aqui abaixo:

```

---

## 🏁 Critério de Avaliação
Ao concluir todos os 5 desafios no `joins_aula10.sql`, chame o professor na bancada para conferência das queries no VS Code e concessão do visto.
