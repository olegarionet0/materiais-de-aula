---
tipo: runbook
resumo: "Roteiro prático de conversão de bases numéricas (Binário e Decimal) com exercícios e desafio para a disciplina de Arquitetura e Manutenção de Computadores."
title: "Guia de Laboratório: Sistemas de Numeração (Binário e Decimal)"
disciplina: Arquitetura e Manutenção de Computadores
professor: Olegário Neto
data: 2026-08-04
status: pendente
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Certifique-se de passar nas mesas para acompanhar a resolução das primeiras questões e garantir que nenhum aluno está com dificuldades no conceito básico.
* [ ] Monitore o tempo: reserve pelo menos 15 minutos finais para os alunos responderem às perguntas de revisão no caderno ou entregarem a resposta no Git.
* [ ] Se algum aluno terminar muito rápido, peça para ele ajudar os colegas ou converter o próprio primeiro nome usando a tabela ASCII (fornecendo os valores decimais).

</div>

# 💻 Guia de Laboratório: Sistemas de Numeração

> [!info] **Sobre este Guia**
> Este roteiro contém instruções práticas e teóricas passo a passo para compreender e aplicar a representação lógica da informação em binário. Realize os cálculos em uma folha de papel ou no caderno, digite as respostas finais e envie para o seu portfólio Git ou anote para avaliação.

---

## 🏛️ 1. Pré-requisitos e Preparação
Antes de iniciar, verifique se você possui:
* [ ] Seu caderno ou folhas de rascunho para realizar os cálculos manuais.
* [ ] Lápis, borracha e caneta.
* [ ] Acesso à tabela ASCII simples (incluída neste guia na seção do desafio).
* [ ] *Nota:* É proibido o uso de calculadoras científicas ou conversores online durante a realização deste roteiro, pois o objetivo é dominar o processo aritmético básico!

---

## 🚀 2. Passo a Passo do Laboratório

### Passo 1: Compreensão dos Pesos Posicionais
Antes de converter, preencha mentalmente ou no papel a tabela de potências de 2 até o oitavo bit (da direita para a esquerda):

| Potência | $2^7$ | $2^6$ | $2^5$ | $2^4$ | $2^3$ | $2^2$ | $2^1$ | $2^0$ |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Peso Decimal** | **128** | **64** | **32** | **16** | **8** | **4** | **2** | **1** |

> [!tip] **O que observar:**
> Cada peso é exatamente o dobro do peso anterior localizado à sua direita. Usaremos estes valores para converter qualquer número binário de até 8 bits (1 Byte) para decimal.

---

### Passo 2: Conversão de Binário para Decimal
Converta os números abaixo mapeando seus bits sob a tabela de pesos.

*   **Exemplo Resolvido:** Converter $10011_{2}$ para decimal.
    1. Alinhar o número binário sob a tabela de pesos:
       * Peso 16 $\rightarrow$ Bit 1
       * Peso 8 $\rightarrow$ Bit 0
       * Peso 4 $\rightarrow$ Bit 0
       * Peso 2 $\rightarrow$ Bit 1
       * Peso 1 $\rightarrow$ Bit 1
    2. Somar os pesos onde temos o bit **1**:
       * $16 + 2 + 1 = 19_{10}$

**Agora é sua vez!** Converta os seguintes números para decimal e registre os cálculos:
*   a) $101_{2}$
*   b) $1110_{2}$
*   c) $10000_{2}$
*   d) $10110_{2}$

---

### Passo 3: Conversão de Decimal para Binário
Aplique o método das divisões sucessivas por 2 para converter números da nossa base convencional (decimal) para a base da máquina (binário).

*   **Exemplo Resolvido:** Converter $14_{10}$ para binário.
    1. Dividir 14 por 2: quociente **7**, resto **0** (este é o primeiro resto).
    2. Dividir 7 por 2: quociente **3**, resto **1**.
    3. Dividir 3 por 2: quociente **1**, resto **1**.
    4. Dividir 1 por 2: quociente **0** (fim do processo), resto **1**.
    5. Juntar os restos de baixo para cima (do último quociente até o primeiro): **$1110_{2}$**.
    *   *Verificação rápida:* $8 + 4 + 2 = 14$. Correto!

**Agora é sua vez!** Converta os decimais abaixo para binário registrando os passos da divisão:
*   a) $15_{10}$
*   b) $22_{10}$
*   c) $45_{10}$
*   d) $64_{10}$ (Dica: pense nos pesos do Passo 1!).

---

## 🏆 3. Desafio da Aula (Texto em Binário)

Como o computador converte os nossos textos em binários? Ele usa tabelas de conversão como a **Tabela ASCII**. Cada letra do alfabeto corresponde a um número decimal:

*   Letra **'O'** = **$79_{10}$**
*   Letra **'I'** = **$73_{10}$**

**Seu Desafio:** 
1. Converta o decimal $79$ para binário.
2. Converta o decimal $73$ para binário.
3. Escreva a mensagem **"OI"** completa representada na linguagem de bits das máquinas (juntando os dois binários de 8 bits cada).

---

## ❓ 4. Perguntas de Revisão (Estudo Teórico)

Responda brevemente em seu caderno para fixação cognitiva:
1. *Pergunta 1*: Por que a eletrônica dos computadores modernos utiliza apenas os dígitos **0** e **1** (binário) em vez dos dígitos de **0 a 9** (decimal)? Qual componente físico é responsável por essa escolha?
2. *Pergunta 2*: O que acontece com o valor de um dígito em um número (seja ele decimal ou binário) quando o deslocamos uma casa para a esquerda? Dê um exemplo prático.
3. *Pergunta 3*: Se o maior peso de 1 Byte (8 bits) é 128 (representado pela posição $2^7$), qual é o maior número decimal inteiro que conseguimos representar usando exatamente 1 Byte completo (de $00000000_{2}$ a $11111111_{2}$)?
