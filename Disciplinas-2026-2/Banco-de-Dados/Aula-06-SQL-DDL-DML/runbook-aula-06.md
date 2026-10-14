---
tipo: runbook
resumo: "Guia passo a passo de comandos iniciais SQL abordando a criação de bancos (DDL), tabelas e a inserção/consulta básica (DML)."
title: "Guia de Laboratório: Primeiros Passos com SQL (DDL e DML)"
disciplina: Banco de Dados
professor: Olegário Neto
data: 2026-09-30
status: pendente
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Garantir que o ambiente de teste SQL (online ou local) está acessível antes do início do laboratório.
* [ ] Reforçar a regra do uso de aspas simples ('texto') em SQL, pois o uso de aspas duplas pode gerar erros em alguns motores.
* [ ] Validar individualmente na tela dos alunos se o `SELECT` retornou as 3 linhas exigidas no fim da atividade.

</div>

# 💻 Guia de Laboratório: Primeiros Passos com SQL

> [!info] **Sobre este Guia**
> Este roteiro orientará você em seus primeiros comandos reais na linguagem SQL. Você assumirá o papel de DBA (Database Administrator) encarregado de criar a base de dados de uma nova biblioteca.

---

## 🏛️ 1. Ambiente de Execução

Selecione a ferramenta de banco de dados orientada pelo professor:
* Opção Local: Abra o cliente do MySQL/MariaDB no computador.
* Opção Online: Acesse [DB Fiddle](https://www.db-fiddle.com/) ou [SQL Fiddle](http://sqlfiddle.com/) (selecione MySQL).

---

## 🚀 2. Prática Guiada: A Estrutura (DDL)

Vamos preparar o "terreno" (banco de dados) e construir a primeira "casa" (tabela).

### Passo 2.1: Criar e usar o banco de dados
Digite e execute os comandos abaixo, um de cada vez:
```sql
CREATE DATABASE sistema_biblioteca;
USE sistema_biblioteca;
```
*Atenção: Se estiver utilizando ferramentas online como DB Fiddle, o banco já é criado por padrão, você pode pular direto para a criação da tabela no painel de 'Schema'.*

### Passo 2.2: Criar a tabela `livro`
Queremos registrar os livros. Quais são as colunas necessárias? Identificador (id), título, nome do autor e o ano de lançamento.
Digite a instrução a seguir:
```sql
CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano_publicacao INT
);
```

> [!tip] Dica de Ouro
> Veja que a instrução tem vírgula (`,`) após cada coluna definida, exceto na última. Esquecer essa vírgula é o erro número 1 dos iniciantes!

---

## 📝 3. Prática Guiada: Os Dados (DML)

Com a tabela pronta, vamos povoá-la e visualizá-la usando comandos do acrônimo CRUD.

### Passo 3.1: Inserir Registros (C - Create)
Utilize o comando `INSERT INTO` para adicionar livros. Repare no uso de **aspas simples** para textos.

```sql
INSERT INTO livro (titulo, autor, ano_publicacao) 
VALUES ('Dom Casmurro', 'Machado de Assis', 1899);

INSERT INTO livro (titulo, autor, ano_publicacao) 
VALUES ('1984', 'George Orwell', 1949);
```

### Passo 3.2: Consultar Registros (R - Read)
Agora, vamos conferir se os livros realmente foram salvos. Use o comando de seleção global `SELECT *`.

```sql
SELECT * FROM livro;
```
> O símbolo `*` significa "todas as colunas". 

Se quiser visualizar apenas os títulos e anos:
```sql
SELECT titulo, ano_publicacao FROM livro;
```

---

## 🏆 4. Desafio Autônomo da Aula

Agora é a sua vez de testar o que aprendeu sem copiar o código pronto. Resolva as etapas a seguir e mostre a tela final ao professor:

1. **(DDL)** Crie uma nova tabela chamada `leitor` no mesmo banco de dados. 
   - A tabela deve ter um `id_leitor` (chave primária auto incremento).
   - Deve ter uma coluna `nome` (texto obrigatório).
   - Deve ter uma coluna `email` (texto).
2. **(DML)** Insira **três leitores** diferentes (amigos ou familiares) usando o `INSERT INTO`.
3. **(DML)** Realize um `SELECT` que mostre todos os dados dos três leitores inseridos.

> [!warning] Atenção à integridade
> Você percebeu que, nos comandos INSERT, nós não digitamos o número do `id` manualmente? Isso acontece porque configuramos o campo como `AUTO_INCREMENT`. O banco gerencia a numeração sequencial automaticamente, garantindo que não haja repetições (respeitando a regra de PK).

---

## ❓ 5. Check de Aprendizagem

Responda oralmente ou no seu material de anotações:
1. Qual a diferença entre um comando DDL e um comando DML?
2. Por que o número (como o ano 1899) não vai entre aspas simples no comando `INSERT`?
