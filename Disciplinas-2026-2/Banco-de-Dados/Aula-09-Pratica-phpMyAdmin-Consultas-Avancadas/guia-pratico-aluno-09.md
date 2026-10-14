---
tipo: runbook
resumo: "Roteiro prático para laboratório de Banco de Dados: execução de filtros, ordenação, limites e agregações no phpMyAdmin com persistência local de queries."
title: "Guia de Laboratório: Consultas Avançadas no phpMyAdmin"
disciplina: "Banco de Dados"
professor: "Olegário Neto"
data: 2026-10-14
status: "em andamento"
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Garantir que todos os computadores abriram o editor de código antes do phpMyAdmin.
* [ ] Verificar a criação do arquivo local `queries.sql` nas bancadas.
* [ ] Reforçar a regra de segurança: executar `SELECT` antes de `UPDATE` e `DELETE`.

</div>

# 💻 Guia de Laboratório: Consultas Avançadas no phpMyAdmin

> [!important] **Regra de Engenharia: O Arquivo Local de Scripts**
> O phpMyAdmin roda no navegador e não salva automaticamente seu histórico de digitação caso a aba seja fechada ou recarregada (`F5`).
> 
> **Procedimento obrigatório:**
> 1. Abra o **VS Code** (ou Bloco de Notas).
> 2. Salve um novo arquivo na sua pasta pessoal com o nome `queries.sql` (ou `queries.txt`).
> 3. Digite e salve cada comando no editor antes de colar e executar no phpMyAdmin.

---

## 🏛️ 1. Preparação do Ambiente e Base de Dados

Antes de iniciar os desafios, valide o ambiente de execução:

- [ ] Painel do **XAMPP** com serviços **Apache** e **MySQL** em status verde (*Running*).
- [ ] Navegador aberto no endereço `http://localhost/phpmyadmin`.
- [ ] Editor de texto aberto com o arquivo `queries.sql` salvo.

### Script de Inicialização da Base

Caso precise recriar a tabela da aula anterior ou redefinir os dados para testes, selecione o banco `loja_afs` (ou crie-o na aba SQL) e execute o script abaixo:

```sql
CREATE DATABASE IF NOT EXISTS loja_afs;
USE loja_afs;

DROP TABLE IF EXISTS produtos;

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);

INSERT INTO produtos (nome, preco, categoria, ativo) VALUES 
('Teclado Mecânico', 250.00, 'Eletrônicos', TRUE),
('Mouse Gamer', 120.00, 'Eletrônicos', TRUE),
('Caderno Universitário', 25.00, 'Papelaria', FALSE),
('Monitor 24', 850.00, 'Eletrônicos', TRUE),
('Caneta Azul', 2.50, 'Papelaria', TRUE),
('Headset', 180.00, 'Eletrônicos', FALSE),
('Resma Papel A4', 32.00, 'Papelaria', TRUE),
('Mousepad Speed', 45.00, 'Eletrônicos', TRUE);
```

Valide a carga de dados executando:
```sql
SELECT * FROM produtos;
```
> O retorno deve conter 8 registros com campos `id`, `nome`, `preco`, `categoria` e `ativo`.

---

## 🚀 2. Desafios Práticos no phpMyAdmin

Salve a resolução de cada um dos 8 desafios no seu arquivo `queries.sql` com comentários identificadores (`-- Desafio X`).

---

### 🔹 Bloco 1: Validação de Filtros e DML Seguro

#### Desafio 1 — Filtro Simples por Categoria
O setor de estoque solicitou a lista de todos os itens de papelaria.
* **Requisito:** Selecionar todas as colunas da tabela `produtos` cuja categoria seja exatamente `'Papelaria'`.
* **Comando esperado:** `SELECT` com `WHERE`.

#### Desafio 2 — Filtro Composto com Operadores Relacionais e Lógicos
O setor financeiro precisa analisar os itens em catálogo com valor inferior a R$ 100,00.
* **Requisito:** Selecionar apenas as colunas `nome` e `preco` de produtos que estejam ativos (`ativo = 1`) **E** possuam preço menor que `100.00`.
* **Comando esperado:** `SELECT` utilizando operador lógico `AND` e operador relacional `<`.

#### Desafio 3 — DML Seguro: Atualização com Cláusula WHERE
Houve reajuste de 10% nos custos dos componentes de tecnologia.
* **Requisito:** Aumentar em 10% o preço de todos os produtos da categoria `'Eletrônicos'`.
* **Protocolo de Segurança Obrigatório:**
  1. Escreva e execute primeiro uma consulta `SELECT` com o filtro `WHERE categoria = 'Eletrônicos'` para conferir quais linhas serão atingidas.
  2. Após validar os registros retornados, execute o comando `UPDATE produtos SET preco = preco * 1.10 WHERE categoria = 'Eletrônicos';`.

#### Desafio 4 — DML Seguro: Exclusão com Cláusula WHERE
O sistema precisa purgar produtos descontinuados do catálogo.
* **Requisito:** Remover definitivamente os registros onde o campo `ativo` seja igual a `0` (ou `FALSE`).
* **Protocolo de Segurança Obrigatório:**
  1. Execute primeiro o `SELECT * FROM produtos WHERE ativo = 0;` para checar quais itens serão eliminados.
  2. Em seguida, execute a instrução `DELETE FROM produtos WHERE ativo = 0;`.

---

### 🔹 Bloco 2: Ordenação e Paginação de Registros

#### Desafio 5 — Ordenação por Preço Decrescente
A equipe de vendas precisa de uma listagem dos produtos ordenados a partir do item mais caro até o mais barato.
* **Requisito:** Projetar as colunas `nome`, `categoria` e `preco`, ordenando o resultado pelo campo `preco` em ordem decrescente.
* **Comando esperado:** Uso da cláusula `ORDER BY` com o modificador `DESC`.

#### Desafio 6 — Paginação e Top 3 Produtos Mais Caros
O portal de e-commerce precisa exibir um banner de destaque com os 3 produtos de maior valor da loja.
* **Requisito:** Retornar o `nome` e o `preco` dos 3 produtos de maior preço cadastrados.
* **Comando esperado:** Combinação das cláusulas `ORDER BY` e `LIMIT`.

---

### 🔹 Bloco 3: Funções Agregadoras, Apelidos e Agrupamento

#### Desafio 7 — Métricas Gerais da Loja (Agregações e Apelidos)
A gerência necessita de um sumário financeiro consolidado de toda a base.
* **Requisito:** Em uma única consulta SQL, calcule:
  - Quantidade total de registros (`COUNT`) com apelido `total_produtos`.
  - Média aritmética dos preços (`AVG`) com apelido `media_precos`.
  - Menor preço registrado (`MIN`) com apelido `menor_preco`.
  - Maior preço registrado (`MAX`) com apelido `maior_preco`.
  - Valor total acumulado de todos os preços (`SUM`) com apelido `soma_precos`.
* **Comando esperado:** `SELECT` agregador com renomeação de colunas via palavra-chave `AS`.

#### Desafio 8 — Relatório Agrupado por Categoria (GROUP BY)
O relatório executivo demanda um resumo de indicadores distribuído por tipo de produto.
* **Requisito:** Retornar a coluna `categoria`, o número de produtos pertencentes à categoria (`COUNT(*) AS quantidade`) e o preço médio daquela categoria (`AVG(preco) AS media_categoria`).
* **Regras:**
  - Agrupar os resultados pela coluna `categoria` utilizando a cláusula `GROUP BY`.
  - Ordenar o resultado final pela quantidade de forma decrescente (`ORDER BY quantidade DESC`).

---

## 🏆 3. Verificação Final e Entrega

Ao finalizar os 8 desafios:
1. Certifique-se de que o arquivo local `queries.sql` contém todos os 8 comandos organizados e comentados.
2. Salve o arquivo na sua pasta de trabalho individual.
3. Demonstre a execução do Desafio 8 no phpMyAdmin para o professor registrar o visto de laboratório.
