---
tipo: atividade-aluno
disciplina: Arquitetura e Manutenção de Computadores
turma: 1º Ano DS — EEEP-AFS
tema: "Estudo Dirigido: Diagnóstico de Falhas de Memória e Bips da BIOS"
professor: Olegário Neto
data: 2026-10-20
---

# 📝 Atividade de Sala: Diagnóstico e Troubleshooting de Memória RAM

> [!IMPORTANT] **Instrução para a Turma:**
> Copie as tabelas e escreva todas as respostas diretamente no seu **caderno**. O professor passará nas carteiras conferindo e concedendo o visto.  

---

## 🎯 Parte 1: Gerações de Memória DDR

Pesquise ou consulte os materiais de referência e preencha a tabela comparativa:

| Geração DDR | Tensão Padrão (Volts) | Quantidade de Pinos (DIMM Desktop) | Característica do Chanfro (Notch) |
| :---: | :---: | :---: | :---: |
| **DDR3** | | 240 pinos | Chanfro mais deslocado para a esquerda |
| **DDR4** | 1.2 V | 288 pinos | Contatos ligeiramente curvados no centro |
| **DDR5** | 1.1 V | 288 pinos | Circuito regulador de tensão (PMIC) no próprio pente |

> **Pergunta:** É possível fisicamente encaixar um pente de memória DDR3 em um slot de placa-mãe DDR4? Justifique tecnicamente.
> 
> *Resposta:* __________________________________________________________________________________
> _____________________________________________________________________________________________

---

## 🔊 Parte 2: O Código de Bips da BIOS (POST)

Quando o computador é ligado, a BIOS executa a rotina de autoteste **POST (Power-On Self-Test)**. Se houver falha de hardware antes de inicializar o vídeo, o alto-falante interno (*Buzzer/Beeper*) emite sinais sonoros.

Relacione o padrão de bips com o diagnóstico provável (padrão BIOS AMI/Award):

1. **Bips curtos contínuos e repetitivos sem parar**
2. **1 bip longo e 2 ou 3 bips curtos**
3. **1 bip curto único**

( &nbsp;&nbsp; ) **Sucesso do POST:** Todos os circuitos básicos foram aprovados, o sistema vai carregar o SO.  
( &nbsp;&nbsp; ) **Falha na Placa de Vídeo:** Placa de vídeo ausente, mal encaixada ou com defeito.  
( &nbsp;&nbsp; ) **Falha de Memória RAM:** Memória não detectada, mal encaixada no slot ou contatos oxidados.  

---

## 💼 Parte 3: Casos Reais de Suporte Técnico

Analise as situações abaixo como um técnico em informática do suporte de nível 1 e prescreva a solução:

### Caso 1: O Escritório da Escola
> Um funcionário da secretaria relata que o computador ligou hoje de manhã, as ventoinhas (coolers) estão girando forte, o LED do gabinete acendeu, mas o monitor fica em modo de economia de energia (*Sem Sinal*). O computador não emite nenhum bip.
> 
> **Qual é a primeira hipótese física a ser investigada no interior do gabinete antes de condenar a placa-mãe ou a fonte? Descreva o procedimento que você executaria.**
> 
> *Solução Proposta:* __________________________________________________________________________
> _____________________________________________________________________________________________
> _____________________________________________________________________________________________

### Caso 2: O Upgrade de Memória
> Um estudante comprou um pente novo de memória de 8 GB para fazer dual channel com seu pente de 4 GB já existente. Ao instalar o pente no segundo slot, o computador passou a reiniciar em loop a cada 5 segundos. Ao retirar o pente novo, a máquina volta a ligar normalmente.
> 
> **Cite duas possíveis causas para essa incompatibilidade ou comportamento anômalo.**
> 
> *Causa A:* ___________________________________________________________________________________  
> *Causa B:* ___________________________________________________________________________________  

---

## 🧼 Parte 4: Boas Práticas de Limpeza
Por que técnicos qualificados **não** devem utilizar borrachas plásticas abrasivas ou álcool comum (70%) na limpeza de placas de circuito eletrônico?

*Resposta:* __________________________________________________________________________________
_____________________________________________________________________________________________
