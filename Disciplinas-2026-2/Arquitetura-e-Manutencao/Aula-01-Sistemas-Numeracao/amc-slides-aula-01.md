---
theme: black
css: slides-eeep-afs
highlightTheme: monokai
slideNumber: "c/t"
---

<!-- slide -->
# 🏫 EEEP Adolfo Ferreira de Sousa
## Disciplina: Arquitetura e Manutenção de Computadores

### Evolução e Sistemas de Numeração
**Professor:** Olegário Neto  
**Data:** 04/08/2026

---
<!-- slide -->
## 📋 Agenda de Hoje

- Breve Histórico da Computação física
- Por que os computadores operam em binário?
- Entendendo a Base Posicional
- Conversão **Binário $\rightarrow$ Decimal**
- Conversão **Decimal $\rightarrow$ Binário**
- Atividade Prática & Desafio

---
<!-- slide -->
## 🏛️ Evolução Física da Computação

- **Válvulas** (1ª Geração): Enormes, lentas e superaqueciam.
- **Transistores** (2ª Geração): Redução drástica de tamanho e aumento de velocidade.
- **Circuitos Integrados (Chips)** (3ª Geração): Milhares de transistores juntos em silício.
- **Microprocessadores** (4ª Geração): O processador moderno completo em um chip.

---
<!-- slide -->
## 🧠 Grandes Nomes da História

- **Ada Lovelace:** Primeira programadora do mundo.
- **Alan Turing:** Pai da computação, formalizou os algoritmos.
- **John von Neumann:** Desenhou a arquitetura de hardware utilizada até hoje.

---
<!-- slide -->
## 🔌 Por que Binário?

Os computadores funcionam com eletricidade.
Biliões de transistores operam como **interruptores**:

- **Ligado** (passa corrente) = **1**
- **Desligado** (não passa corrente) = **0**

> **Conceito:** O **Bit** (Binary Digit) é a menor unidade de informação de um computador.

---
<!-- slide -->
## 🔟 Base Posicional: Decimal

O sistema que usamos no dia a dia é o **Decimal (Base 10)**.
O valor de cada dígito depende da sua **posição**:

$$142_{10} = 1 \times 10^2 + 4 \times 10^1 + 2 \times 10^0$$
$$142_{10} = 100 + 40 + 2$$

Algarismos disponíveis: **0 a 9**

---
<!-- slide -->
## 0️⃣1️⃣ Base Posicional: Binário

O sistema dos computadores é o **Binário (Base 2)**.
Cada posição possui um **peso posicional (potências de 2)**:

$$\dots, 128, 64, 32, 16, 8, 4, 2, 1$$
$$\dots, 2^7, 2^6, 2^5, 2^4, 2^3, 2^2, 2^1, 2^0$$

Algarismos disponíveis: **0 e 1**

---
<!-- slide -->
## 🔄 Binário para Decimal

**Como converter?**
1. Escreva os pesos posicionais acima dos bits.
2. Some os pesos onde o bit for igual a **1**.

**Exemplo:** Converter $1011_{2}$ para decimal:
```text
Pesos:  8   4   2   1
Bits:   1   0   1   1
---------------------
Soma:   8 + 0 + 2 + 1 = 11
```
$1011_{2} = 11_{10}$

---
<!-- slide -->
## 🔄 Decimal para Binário

**Como converter? (Divisões Sucessivas)**
1. Divida o número decimal por 2 sucessivamente.
2. Anote o resto de cada divisão.
3. O número binário é formado pelos restos lidos **de baixo para cima**.

**Exemplo:** Converter $13_{10}$ para binário:
- $13 \div 2 = 6$ (resto **1**)
- $6 \div 2 = 3$ (resto **0**)
- $3 \div 2 = 1$ (resto **1**)
- $1 \div 2 = 0$ (resto **1**)
- **Resultado:** $1101_{2}$

---
<!-- slide -->
## 💻 Prática Guiada

Vamos converter juntos no quadro:
- **Binário $\rightarrow$ Decimal:** $10101_{2}$
- **Decimal $\rightarrow$ Binário:** $25_{10}$

---
<!-- slide -->
## 🏆 Desafio da Aula!

**Como representamos letras em binário?**
- Computadores associam cada caractere a um número (Tabela ASCII).
- A letra **'O'** é o número **79**.
- A letra **'I'** é o número **73**.

**Exercício:** Converta o caractere **'I' ($73_{10}$)** para binário!

---
<!-- slide -->
## ✅ Encerramento

- O bit (0 ou 1) representa a presença ou ausência de sinal elétrico.
- Usamos potências de 2 para converter binário em decimal.
- Usamos divisões por 2 para converter decimal em binário.

> **Próxima Aula:** Como formamos **Bytes** e como o computador representa texto, cores e imagens!
