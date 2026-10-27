---
tipo: avaliacao-pratica
disciplina: Redes de Computadores
turma: 2º Informática (2I)
ano_letivo: 2026.2
professor: Olegário
tema: Montagem e Crimpagem de Cabo de Par Trançado UTP (RJ-45)
padroes: ANSI/TIA-568-C.2 (T568A / T568B)
data: 2026-09-08
tags:
  - redes-de-computadores
  - eeep-afs
  - avaliacao-pratica
  - crimpagem-utp
  - cabeamento-estruturado
---

# Rubrica de Avaliação Prática: Crimpagem de Cabos UTP Cat5e/Cat6

Esta rubrica estabelece critérios objetivos para a avaliação da montagem de cabos de rede de par trançado não blindado (UTP) com conectores RJ-45 macho de 8 vias.

A atividade é realizada em duplas, onde cada estudante é responsável pela confecção de uma das extremidades do cabo (Ponta A e Ponta B).

---

## 1. Estrutura de Pontuação

A nota final é individual, calculada pela soma dos **Critérios Individuais da Extremidade (7,0 pontos)** com os **Critérios Compartilhados da Dupla (3,0 pontos)**.

$$\text{Nota Individual} = \text{Critérios Individuais (7,0)} + \text{Critérios Compartilhados (3,0)}$$

```
Nota Máxima: 10,0 pontos
├── Critérios Individuais (Ponta do Estudante): 7,0 pontos
│   ├── C1. Integridade dos condutores na decapagem: 1,5 pt
│   ├── C2. Fixação e retenção da capa externa (azul): 2,0 pt
│   ├── C3. Ordenação de pinos e taxa de destrançamento: 2,0 pt
│   └── C4. Nivelamento dos fios e crimpagem das lâminas: 1,5 pt
└── Critérios Compartilhados (Dupla / Cabo Funcional): 3,0 pontos
    ├── C5. Teste de continuidade elétrica (Testador RJ-45): 2,0 pt
    └── C6. Organização da bancada, descarte e uso de ferramentas: 1,0 pt
```

---

## 2. Matriz de Critérios e Indicadores de Desempenho

### 2.1. Critérios Individuais (Extremidade A ou B) — Máx. 7,0 pontos

| Critério | Excelente (100%) | Parcial (50%) | Insuficiente (0%) |
|:---|:---|:---|:---|
| **C1. Integridade dos Condutores (Decapagem)**<br>*(Peso: 1,5 pt)* | **1,5 pt**: Capa externa removida sem cortes, fissuras ou marcas nos isolamentos dos 8 condutores internos. Cobre 100% isolado. Fio de rasgo (nylon) aparado rente. | **0,8 pt**: Marcas superficiais na capa de algum condutor sem corte do cobre condutor, ou comprimento de decapagem superior ao dobro do necessário. | **0,0 pt**: Um ou mais condutores cortados, com cobre exposto por ação da lâmina de corte, ou condutor rompido internamente. |
| **C2. Retenção Mecânica da Capa Externa**<br>*(Peso: 2,0 pt)* | **2,0 pt**: A capa externa azul avança pelo menos 5 mm para o interior do conector RJ-45 e fica travada sob a presilha plástica interna de alívio de tração. Nenhum condutor individual visível externamente. | **1,0 pt**: A capa azul alcançou o conector, mas não ficou sob a trava mecânica com pressão suficiente, permitindo folga ou giro do cabo. | **0,0 pt**: Capa externa azul finalizada fora do conector, deixando condutores internos e tranças expostos fora do corpo plástico do RJ-45. |
| **C3. Padrão de Cores e Destrançamento**<br>*(Peso: 2,0 pt)* | **2,0 pt**: Sequência exata de pinos conforme o padrão determinado (T568A ou T568B). Destrançamento dos pares restrito ao trecho estritamente necessário para alinhamento ($\le 13\text{ mm}$ / $0{,}5"$). | **1,0 pt**: Sequência correta de cores, porém com destrançamento excessivo dos pares antes da entrada das canaletas internas ($> 15\text{ mm}$). | **0,0 pt**: Erro na ordem dos fios (pares invertidos, condutores trocados) ou quebra de padrão de pinagem. |
| **C4. Inserção Frontal e Cravação das Lâminas**<br>*(Peso: 1,5 pt)* | **1,5 pt**: Os 8 condutores atingem o batente frontal transparente sob os contatos metálicos. Todas as 8 lâminas douradas cravadas com penetração completa e uniforme, sem amassar a carcaça. | **0,8 pt**: Os fios atingiram a frente, mas a pressão do alicate foi irregular, deixando lâminas desniveladas ou conector com ranhuras mecânicas por desalinhamento. | **0,0 pt**: Um ou mais fios recuados (não alcançaram as lâminas de contato), ou conector quebrado/esmagado por excesso ou ângulo inadequado de força. |

---

### 2.2. Critérios Compartilhados (Dupla) — Máx. 3,0 pontos

| Critério | Pleno (100%) | Parcial (50%) | Nulo (0%) |
|:---|:---|:---|:---|
| **C5. Continuidade Elétrica (Testador RJ-45)**<br>*(Peso: 2,0 pt)* | **2,0 pt**: Os 8 LEDs acendem em ciclo sequencial (1 a 8) correspondente no Master e no Remote do testador, sem interrupção, curto-circuito ou pares cruzados indevidos. | **1,0 pt**: Falha em exatamente 1 pino (necessita identificação de qual extremidade causou a perda de sinal e retrabalho). | **0,0 pt**: Cabo aberto em dois ou mais pinos, curto-circuito entre vias ou pinagem incompatível entre as extremidades. |
| **C6. Segurança, Uso de Ferramentas e Bancada**<br>*(Peso: 1,0 pt)* | **1,0 pt**: Uso exclusivo do decapador e do alicate de crimpagem nas funções projetadas; sobras de fios e capas descartadas no cesto; bancada entregue limpa e ferramentas organizadas. | **0,5 pt**: Uso parcial das ferramentas ou resíduos de cobre e plástico deixados na mesa de trabalho após a conclusão. | **0,0 pt**: Uso de ferramentas cortantes de maneira insegura, danos a equipamentos de bancada ou abandono de resíduos cortantes na área de circulação. |

---

## 3. Padrões de Pinagem de Referência

```
Padrão ANSI/TIA-568A:
[Pino 1]: Branco do Verde
[Pino 2]: Verde
[Pino 3]: Branco do Laranja
[Pino 4]: Azul
[Pino 5]: Branco do Azul
[Pino 6]: Laranja
[Pino 7]: Branco do Marrom
[Pino 8]: Marrom

Padrão ANSI/TIA-568B:
[Pino 1]: Branco do Laranja
[Pino 2]: Laranja
[Pino 3]: Branco do Verde
[Pino 4]: Azul
[Pino 5]: Branco do Azul
[Pino 6]: Verde
[Pino 7]: Branco do Marrom
[Pino 8]: Marrom
```

> [!IMPORTANT]
> **Checklist Visual Obrigatório antes do Testador:**
> 1. Olhar a ponta transparente de frente: todos os 8 condutores de cobre encostam na parede frontal plástica?
> 2. Olhar a lateral do conector: a barra plástica transversal está prensada firmemente sobre a capa externa azul?
> 3. Olhar por cima: os fios estão na ordem exata solicitada (A ou B)?

---

## 4. Planilha de Avaliação da Turma (2º Informática — 2026.2)

> Total de alunos matriculados ativos: **43** (desligadas: Ana Savila e Emyle Lavigne).
> Formato operacional: 20 duplas + 2 individuais (Gabriel Benevides e Vinícius Gabriel) + 1 estudante pendente de parceiro. Total: 43 estudantes ativos.

| Eq. | Lado | Matrícula | Nome do(a) Estudante | C1 (1,5) | C2 (2,0) | C3 (2,0) | C4 (1,5) | C5 (2,0) | C6 (1,0) | Nota Final | Situação |
|:---:|:---:|:---:|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **01** | **A** | 3647606 | JOSUE HERMENSON FONSECA SILVA DE CASTRO | 1,5 | 1,0 | 1,0 | 1,0 | 0,5 | 1,0 | **6,0** | **AP** |
| **01** | **B** | 2876925 | JANDERSON GOUVEIA DE SOUSA | 1,5 | 1,0 | 1,0 | 1,0 | 0,5 | 1,0 | **6,0** | **AP** |
| **02** | **A** | 5418187 | ANTONIO SIDRONIO SILVA DE AQUINO NETO | 1,5 | 2,0 | 2,0 | 1,5 | 0,0 | 0,5 | **7,0** | **AP** |
| **02** | **B** | 5418130 | FRANCISCO DE ASSIS DA SILVA NETO | 1,5 | 2,0 | 2,0 | 1,5 | 0,0 | 0,5 | **7,0** | **AP** |
| **03** | **A** | 2872277 | CHRISTIAN EMANUEL BONFIM OLIVEIRA | 1,5 | 2,0 | 0,5 | 1,0 | 1,0 | 1,0 | **7,0** | **AP** (após reteste) |
| **03** | **B** | 3591768 | LAYLA VICTORIA SILVA LIMA | 1,5 | 2,0 | 0,5 | 1,0 | 1,0 | 1,0 | **7,0** | **AP** (após reteste) |
| **04** | **A** | 2861105 | EDUARDO SANTOS DA SILVA | 1,0 | 1,0 | 2,0 | 1,0 | 2,0 | 1,0 | **8,0** | **AP** |
| **04** | **B** | 5418198 | FERNANDA LIS DA SILVA SOARES | 1,0 | 1,0 | 2,0 | 1,0 | 2,0 | 1,0 | **8,0** | **AP** |
| **05** | **A** | 2945509 | FABRICIO FRANCA PEREIRA | 1,5 | 2,0 | 2,0 | 1,5 | 2,0 | 1,0 | **10,0** | **AP** |
| **05** | **B** | 2872420 | JULIO FERNANDO DA MATA VIANA | 1,5 | 2,0 | 2,0 | 1,5 | 2,0 | 1,0 | **10,0** | **AP** |
| **06** | **A** | 2334164 | ANNA ELISE MIRANDA DA SILVA | 1,5 | 1,5 | 2,0 | 1,0 | 2,0 | 1,0 | **9,0** | **AP** |
| **06** | **B** | 3740428 | KAROL PEREIRA ALVES | 1,5 | 1,5 | 2,0 | 1,0 | 2,0 | 1,0 | **9,0** | **AP** |
| **07** | **A** | 5418239 | IANARA VITORIA DOS SANTOS AQUINO | 1,5 | 1,5 | 1,0 | 1,0 | 1,0 | 1,0 | **7,0** | **AP** |
| **07** | **B** | 3386182 | FRANCISCO LAENIO DE OLIVEIRA FIRMINO | 1,5 | 1,5 | 1,0 | 1,0 | 1,0 | 1,0 | **7,0** | **AP** |
| **08** | **A** | 2854724 | HEDLYN EVANGELISTA BONFIM | 0,5 | 2,0 | 2,0 | 1,5 | 2,0 | 1,0 | **9,0** | **AP** |
| **08** | **B** | 3477009 | MYLENNA MACIEL SOUSA | 0,5 | 2,0 | 2,0 | 1,5 | 2,0 | 1,0 | **9,0** | **AP** |
| **09** | **A** | 4898499 | HIARLLEY TAYSSON DA SILVA SANTOS | 1,5 | 1,0 | 2,0 | 1,0 | 1,0 | 1,0 | **7,5** | **AP** |
| **09** | **B** | 3369971 | MARIA DAVYLA CORREIA ANDRADE | 1,5 | 1,0 | 2,0 | 1,0 | 1,0 | 1,0 | **7,5** | **AP** |
| **10** | **A+B** | 2864442 | GABRIEL BENEVIDES DA SILVA | 1,0 | 1,0 | 2,0 | 1,0 | 2,0 | 1,0 | **8,0** | **AP** (Individual) |
| **11** | **A** | 2975516 | JOAO KALEBY OLIVEIRA MIRANDA | 1,5 | 2,0 | 2,0 | 1,0 | 1,5 | 1,0 | **9,0** | **AP** (após reteste) |
| **11** | **B** | 5418110 | JOAO LUCAS JACO TEIXEIRA | 1,5 | 2,0 | 2,0 | 1,0 | 1,5 | 1,0 | **9,0** | **AP** (após reteste) |
| **12** | **A** | 2860434 | MARIA DOMINICK COSTA DE SOUSA | 1,5 | 2,0 | 1,0 | 1,0 | 0,5 | 1,0 | **7,0** | **AP** (após reteste) |
| **12** | **B** | 3053965 | JENNIFER LARA OLIVEIRA DE ARAUJO | 1,5 | 2,0 | 1,0 | 1,0 | 0,5 | 1,0 | **7,0** | **AP** (após reteste) |
| **13** | **A** | 4173040 | LARA MELYSSA SOUSA SILVA | 1,5 | 1,5 | 2,0 | 1,0 | 2,0 | 1,0 | **9,0** | **AP** |
| **13** | **B** | 2855246 | LARISSA DA SILVA SANTANA | 1,5 | 1,5 | 2,0 | 1,0 | 2,0 | 1,0 | **9,0** | **AP** |
| **14** | **A** | 2882743 | LARA THAYLA LIMA TEIXEIRA | 1,5 | 2,0 | 1,0 | 1,0 | 1,0 | 1,0 | **7,5** | **AP** (após reteste) |
| **14** | **B** | 3896030 | JOAO LEVY DA SILVA LIMA SANTOS | 1,5 | 2,0 | 0,5 | 1,0 | 1,0 | 1,0 | **7,0** | **AP** (após reteste) |
| **15** | **A** | 2537651 | MAIANNY DE SOUSA LIMA | 1,0 | 2,0 | 2,0 | 1,0 | 0,5 | 1,0 | **7,5** | **AP** |
| **15** | **B** | 5307477 | SAFYRA MIRANDA DA SILVA | 1,0 | 2,0 | 2,0 | 1,0 | 0,5 | 1,0 | **7,5** | **AP** |
| **16** | **A** | 2368546 | MARCOS ARTHUR XAVIER SANTOS | 1,5 | 1,5 | 1,0 | 0,5 | 0,5 | 1,0 | **6,0** | **AP** (após reteste) |
| **16** | **B** | 3636886 | PEDRO LUCAS SANTOS SALES | 1,5 | 1,5 | 1,0 | 0,5 | 0,5 | 1,0 | **6,0** | **AP** (após reteste) |
| **17** | **A** | 2848417 | FRANCISCO AGOSTINHO DE SOUZA NETO | 1,5 | 1,5 | 1,0 | 1,0 | 1,0 | 1,0 | **7,0** | **AP** |
| **17** | **B** | 5418219 | GABRIEL DA SILVA RODRIGUES | 1,5 | 1,5 | 1,0 | 1,0 | 1,0 | 1,0 | **7,0** | **AP** |
| **18** | **A** | 5418064 | MARIANA JULIAO DA SILVA | 1,5 | 2,0 | 2,0 | 1,5 | 2,0 | 1,0 | **10,0** | **AP** |
| **18** | **B** | 2508065 | MARIA EDUARDA DA COSTA SILVA RODRI | 1,5 | 2,0 | 2,0 | 1,5 | 2,0 | 1,0 | **10,0** | **AP** |
| **19** | **A** | 2856824 | RUAN RIKELMY BEZERRA DE BRITO | 1,5 | 1,5 | 2,0 | 1,0 | 2,0 | 1,0 | **9,0** | **AP** |
| **19** | **B** | 2855315 | YNGRID MARCILLA PEREIRA DA SILVA | 1,5 | 1,5 | 2,0 | 1,0 | 2,0 | 1,0 | **9,0** | **AP** |
| **20** | **A** | 3220488 | DIEGO PEREIRA DA SILVA | 1,5 | 1,5 | 1,0 | 1,0 | 1,0 | 1,0 | **7,0** | **AP** |
| **20** | **B** | 3197691 | SILVANIA BARROS DE SOUSA | 1,5 | 1,5 | 1,0 | 1,0 | 1,0 | 1,0 | **7,0** | **AP** |
| **21** | **A** | 3156847 | VITOR HUGO ALMEIDA DA SILVA | 1,5 | 1,5 | 1,0 | 1,0 | 1,0 | 1,0 | **7,0** | **AP** |
| **21** | **B** | 5418156 | HERMINIO SILVA MUNIS | 1,5 | 1,5 | 1,0 | 1,0 | 1,0 | 1,0 | **7,0** | **AP** |
| **22** | **A+B** | 2861041 | VINICIUS GABRIEL ABREU DE OLIVEIRA | 1,5 | 2,0 | 2,0 | 1,5 | 2,0 | 1,0 | **10,0** | **AP** (Individual) |
| **23** | **A** | 3189682 | ALEHANDRO VICTOR ALVES DE OLIVEIRA | — | — | — | — | — | — | **—** | **AUS** (Não realizou / 2ª chamada) |

> **Legenda de Situação:**
> - **AP** (Aprovado): Nota $\ge 6{,}0$ e teste elétrico 100% funcional.
> - **RT** (Retrabalho): Falha mecânica ou elétrica que exige corte e nova crimpagem.
> - **REP** (Reprovado): Danos reiterados aos componentes ou incapacidade de execução após reteste.
> - **AUS** (Ausente): Não compareceu / não realizou a prática (pendente de 2ª chamada).
