---
tipo: runbook
resumo: "Lista de exercícios de fixação para aula desplugada de Banco de Dados."
title: "Guia de Exercícios: SQL Desplugado"
disciplina: Banco de Dados
professor: Olegário Neto
data: 2026-10-07
status: pendente
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [x] Fazer a chamada. ✅ 2026-10-09
* [x] Projetar a estrutura base da tabela para consulta constante. ✅ 2026-10-09
* [x] Pode imprimir esta lista ou copiar no quadro se achar necessário, mas a projeção dos slides guiando o ritmo costuma ser melhor para o formato Quiz. ✅ 2026-10-09

</div>

# 💻 Guia de Exercícios: SQL Desplugado

> [!info] **Como Resolver**
> A ideia desta lista é simular uma etapa clássica de entrevistas de emprego de TI: o **Whiteboard Coding** (codificação no quadro/papel). Escreva as queries no seu caderno sem consultar o computador. Preste muita atenção na sintaxe: aspas simples, vírgulas e ponto-e-vírgula!

---

## 🏛️ A Nossa Base de Dados Atual

Considere que o banco de dados possui a tabela `produtos` com os exatos registros inseridos ontem:

| id | nome | preco | categoria | ativo |
|----|------|-------|-----------|-------|
| 1 | Teclado Mecânico | 250.00 | Eletrônicos | 1 |
| 2 | Mouse Gamer | 120.00 | Eletrônicos | 1 |
| 3 | Caderno Universitário | 25.00 | Papelaria | 0 |
| 4 | Monitor 24 | 850.00 | Eletrônicos | 1 |
| 5 | Caneta Azul | 2.50 | Papelaria | 1 |
| 6 | Headset | 180.00 | Eletrônicos | 0 |

---

## 🚀 Desafios: O Pedido do Gerente

### Nível 1: Consulta Básica
1. Escreva o comando para listar todos os produtos cadastrados da categoria `'Papelaria'`.

### Nível 2: Limpeza (DML Definitivo)
2. Escreva o comando que deleta permanentemente os produtos inativos (`ativo = 0`). 

### Nível 3: Matemática no SQL
3. Escreva o comando que ajusta o preço dos `'Eletrônicos'` aumentando o valor atual em 10%. *(Dica: Use `preco * 1.10`)*.

### Nível 4: Filtros Combinados (AND)
4. O gerente quer saber quais produtos de papelaria custam menos de R$ 10,00. Escreva uma query que retorne apenas o `nome` e o `preco` desses produtos. *(Você usará o operador `AND`)*.

### Nível 5: Condição Alternativa (OR)
5. A empresa decidiu dar desconto nos mouses e nas canetas. Diminua em R$ 2.00 o valor de qualquer produto que pertença à categoria `'Papelaria'` **OU** que tenha o nome exato `'Mouse Gamer'`.

---

## 🐛 Code Review: Consertando Bugs

Na equipe de Banco de Dados, o estagiário foi encarregado de dar 50% de desconto no Monitor 24. Ele enviou para aprovação o seguinte código:

```sql
UPDATE produtos 
SET preco = preco * 0.5;
```

**Responda no caderno:**
1. Há um erro conceitual gigantesco nessa query. Qual é?
2. Faça o Teste de Mesa e diga o que essa query vai causar de estrago na empresa se for executada.
3. Reescreva o código correto que o estagiário deveria ter feito.
