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
**Tema:** SQL Desplugado ⚡ Dominando o WHERE
**Data:** 2026-10-07

---
<!-- slide -->
## 📋 Como vai funcionar hoje?

- Sem laboratório, mas com muito código!
- Simularemos uma **Entrevista Técnica (Whiteboard Coding)**.
- O gerente pede a regra de negócio $\rightarrow$ Você codifica no caderno $\rightarrow$ Nós "compilamos" na lousa.

> **Regra:** Não esqueçam da pontuação! Aspas para textos (`'texto'`) e ponto-e-vírgula (`;`) no final!

---
<!-- slide -->
## 📊 O Estado Atual da nossa Tabela

| id | nome | preco | categoria | ativo |
|----|------|-------|-----------|-------|
| 1 | Teclado Mecânico | 250.00 | Eletrônicos | 1 |
| 2 | Mouse Gamer | 120.00 | Eletrônicos | 1 |
| 3 | Caderno Universitário | 25.00 | Papelaria | 0 |
| 4 | Monitor 24 | 850.00 | Eletrônicos | 1 |
| 5 | Caneta Azul | 2.50 | Papelaria | 1 |
| 6 | Headset | 180.00 | Eletrônicos | 0 |

*(Obs: `1` significa TRUE, `0` significa FALSE)*

---
<!-- slide -->
## 🎯 Nível 1: Aquecimento (SELECT)

**O Pedido do Gerente:**
> "Preciso de um relatório simples. Mostre **TODAS** as colunas, mas **SOMENTE** dos produtos que pertencem à categoria 'Papelaria'."

Tempo: 3 minutos no caderno! ⏱️

---
<!-- slide -->
## ✅ Resposta: Nível 1

```sql
SELECT * FROM produtos 
WHERE categoria = 'Papelaria';
```
*(Linhas retornadas no teste de mesa: Caderno Universitário e Caneta Azul)*

---
<!-- slide -->
## 🎯 Nível 2: Limpeza de Dados (DELETE)

**O Pedido do Gerente:**
> "O sistema está pesado. Apague do banco de dados definitivamente todos os produtos que estão desativados (ativo = 0)."

Tempo: 4 minutos no caderno! ⏱️

---
<!-- slide -->
## ✅ Resposta: Nível 2

```sql
DELETE FROM produtos 
WHERE ativo = 0;
```
*(Cuidado: sem o WHERE, você apagaria o banco inteiro!)*

---
<!-- slide -->
## 🎯 Nível 3: Matemática (UPDATE)

**O Pedido do Gerente:**
> "A inflação bateu. Aumente em 10% o preço de todos os produtos que são 'Eletrônicos'."

*(Dica matemática: `preco = preco * 1.10`)*

Tempo: 5 minutos no caderno! ⏱️

---
<!-- slide -->
## ✅ Resposta: Nível 3

```sql
UPDATE produtos 
SET preco = preco * 1.10 
WHERE categoria = 'Eletrônicos';
```

---
<!-- slide -->
## 🎯 Nível 4: O Chefe Exigente (Operador AND)

**O Pedido do Gerente:**
> "Preciso de um SELECT que me mostre o Nome e o Preço dos Eletrônicos que custam MENOS de 200 reais."

Tempo: 5 minutos no caderno! ⏱️

---
<!-- slide -->
## ✅ Resposta: Nível 4

```sql
SELECT nome, preco FROM produtos
WHERE categoria = 'Eletrônicos' AND preco < 200.00;
```
*(Quais itens retornariam? R: Mouse Gamer e Headset)*

---
<!-- slide -->
## 🎯 Nível 5: A Promoção Louca (Operador OR)

**O Pedido do Gerente:**
> "Sexta-feira de promoção! Dê um desconto de 5 reais (`preco - 5`) se o produto for da categoria 'Papelaria' **OU** se o nome for exatamente 'Mouse Gamer'."

Tempo: 5 minutos no caderno! ⏱️

---
<!-- slide -->
## ✅ Resposta: Nível 5

```sql
UPDATE produtos
SET preco = preco - 5
WHERE categoria = 'Papelaria' OR nome = 'Mouse Gamer';
```

---
<!-- slide -->
## 🐛 Code Review (Caça ao Bug!)

O estagiário precisava dar 50% de desconto nos **Monitores**. Ele escreveu isso:

```sql
UPDATE produtos 
SET preco = preco * 0.5;
```

**No seu caderno, responda:**
1. Onde está o erro?
2. Qual será a consequência para a empresa?
3. Como seria o código correto?

---
<!-- slide -->
## ✅ Code Review (Correção)

1. **O Erro:** Faltou a cláusula `WHERE`.
2. **Consequência:** A empresa dará 50% de desconto em **TODOS** os produtos do banco. O estagiário causou um prejuízo enorme!
3. **Código Correto:**
```sql
UPDATE produtos 
SET preco = preco * 0.5 
WHERE nome = 'Monitor 24';
```

---
<!-- slide -->
## 🏆 Conclusão

- A sintaxe é rigorosa: falhar em uma aspa estraga o código.
- O Operador **AND** exige que as DUAS coisas sejam verdade.
- O Operador **OR** exige que apenas UMA seja verdade.
- **Dever de Casa:** Levem esses códigos do caderno para testar no XAMPP na próxima aula prática!

**Dúvidas?**
