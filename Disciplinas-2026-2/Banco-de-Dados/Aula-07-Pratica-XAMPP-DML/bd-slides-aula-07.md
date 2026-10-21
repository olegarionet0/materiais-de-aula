---
theme: black
css: slides-eeep-afs
highlightTheme: monokai
slideNumber: "c/t"
---

<!-- slide -->
# 🏫 EEEP Adolfo Ferreira de Sousa
## Disciplina: Banco de Dados

**Professor:** Olegário Neto
**Tema:** Prática no XAMPP (DML) e Cláusula WHERE
**Data:** 2026-10-06

---
<!-- slide -->
## 📋 Agenda da Aula

- Motivação: O perigo dos comandos DML
- Preparando o ambiente (XAMPP / phpMyAdmin)
- Prática Guiada: CREATE, INSERT, SELECT
- Prática Independente: UPDATE, DELETE e a regra de segurança

---
<!-- slide -->
## ⚠️ A história do Estagiário de TI...

*"O estagiário que zerou o banco"*

O que acontece quando você executa um `UPDATE` ou um `DELETE` sem a cláusula **WHERE**?

> **Nota:** Diferente do `SELECT`, erros de DML são **destrutivos** e frequentemente **irreversíveis**. Na vida real, a cláusula WHERE salva o seu emprego!

---
<!-- slide -->
## 💻 Mão na massa! (We Do)

Abram o **XAMPP**, iniciem Apache e MySQL, e acessem o **phpMyAdmin**.

Vamos criar nossa tabela de teste na aba **SQL**:

```sql
CREATE DATABASE loja_afs;
USE loja_afs;

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    categoria VARCHAR(50),
    ativo BOOLEAN DEFAULT TRUE
);
```

---
<!-- slide -->
## 💻 Inserindo Dados

```sql
INSERT INTO produtos (nome, preco, categoria, ativo) VALUES 
('Teclado Mecânico', 250.00, 'Eletrônicos', TRUE),
('Mouse Gamer', 120.00, 'Eletrônicos', TRUE),
('Caderno Universitário', 25.00, 'Papelaria', FALSE),
('Monitor 24', 850.00, 'Eletrônicos', TRUE),
('Caneta Azul', 2.50, 'Papelaria', TRUE),
('Headset', 180.00, 'Eletrônicos', FALSE);
```

Para conferir, nosso primeiro SELECT:
```sql
SELECT * FROM produtos;
```

---
<!-- slide -->
## 🚀 Desafio Prático (You Do)

**A Regra de Ouro (Dev/DBA):**
*Sempre execute um `SELECT` com a mesmíssima condição do `WHERE` antes de rodar o `UPDATE` ou `DELETE` real.*

**Tarefas:**
1. Aumentar em 10% o preço apenas dos **Eletrônicos**.
2. Excluir **somente** os produtos desativados.
3. Fazer um `SELECT *` final provando que deu tudo certo!

> **Dica:** O Runbook da aula no Classroom tem os detalhes do laboratório.

---
<!-- slide -->
## ✅ Encerramento

- **Revisão:** A cláusula `WHERE` funciona como um filtro.
- O que acontece se a gente esquecer o `WHERE`?
- Por que simular o comando com um `SELECT` antes de modificar o banco de dados?
- **Próxima aula:** Aprofundando em Consultas (Operadores e Ordenação).

**Dúvidas? Sucesso na prática!**
