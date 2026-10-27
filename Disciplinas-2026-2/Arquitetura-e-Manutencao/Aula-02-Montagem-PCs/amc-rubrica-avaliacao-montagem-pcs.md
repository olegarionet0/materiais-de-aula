---
tipo: rubrica
resumo: "Matriz analítica de avaliação para a atividade prática de montagem de PCs e análise de custo-benefício contra notebooks."
disciplina: Arquitetura e Manutenção de Computadores
turma: 1º Informática (1º I)
semestre: 2026-2
professor: Olegário Neto
data: 2026-09-08
escala_total: 10.0
tags:
  - eeep-afs
  - amc
  - avaliacao
  - rubrica
  - hardware
---

# 📋 Rubrica de Avaliação: Projeto de Montagem de Computadores

Esta rubrica estabelece os critérios objetivos e a pontuação para a avaliação do projeto prático de especificação, orçamento de computadores e análise comparativa com notebooks, aplicado na disciplina de **Arquitetura e Manutenção de Computadores (AMC)** para o **1º Informática**.

---

## 🎯 Estrutura da Avaliação

A pontuação total da atividade é de **10,0 pontos**, distribuída em **5 critérios analíticos**:

| Critério | Foco da Avaliação | Peso / Pontuação |
|:---|:---|:---:|
| **C1. Compatibilidade Técnica e Dimensionamento** | Soquete, chipset, TDP/potência de fonte, barramento de memória e espaço físico | **2,5 pts** |
| **C2. Aderência ao Perfil e Teto Orçamentário** | Escolha balanceada para o cenário designado e cumprimento do teto estipulado | **2,0 pts** |
| **C3. O Desafio do Notebook (Custo x Benefício)** | Seleção de modelo equivalente, justificativa comparativa e veredito técnico | **2,0 pts** |
| **C4. Qualidade dos Artefatos de Entrega** | Planilha de orçamento preenchida com links reais e slides técnicos estruturados | **1,5 pts** |
| **C5. Apresentação Oral e Pitch Executivo** | Clareza técnica, articulação da equipe, convencimento do cliente e tempo | **2,0 pts** |
| **Total** | **Avaliação Global da Atividade** | **10,0 pts** |

---

## 📊 Matriz Analítica de Critérios

### C1. Compatibilidade Técnica e Dimensionamento do Hardware (2,5 pontos)
Avalia a viabilidade física, elétrica e lógica do conjunto de componentes cotados.

* **Excelente (2,5 pts):** Todas as peças são plenamente compatíveis entre si. O soquete da placa-mãe corresponde à CPU (ex: AM4/AM5 ou LGA1700); o padrão da memória RAM (DDR4/DDR5) é suportado por ambos; a fonte de alimentação atende ao consumo com margem mínima de 20%; o gabinete comporta as dimensões da placa-mãe (ATX/mATX) e da GPU; o sistema de refrigeração (cooler/fans) é condizente com o TDP da CPU.
* **Bom (1,8 pts):** Componentes principais compatíveis, mas com inconsistência secundária menor (ex: fonte sem certificação clara, gabinete sem fluxo de ar especificado, ou barramento de memória com frequência não suportada nativamente sem XMP).
* **Regular (1,0 pt):** Apresenta erro técnico relevante de dimensionamento (ex: fonte subdimensionada para o consumo da placa de vídeo dedicada, ou placa-mãe sem suporte ao processador sem atualização prévia de BIOS não justificada).
* **Insuficiente (0,0 - 0,4 pt):** Incompatibilidade crítica direta (ex: processador incompatível fisicamente com o soquete da placa-mãe, tipo incorreto de memória RAM, ou ausência de componentes vitais como cooler ou fonte).

---

### C2. Aderência ao Perfil e Gestão Orçamentária (2,0 pontos)
Avalia se a máquina atende às necessidades reais do cliente designado sem desperdício de recursos e sem estouro de orçamento.

* **Excelente (2,0 pts):** O setup atende rigorosamente ao perfil (Office, Gamer, Dev, Workstation ou Entusiasta). Não há gargalos evidentes (ex: CPU fraca com GPU de topo, ou 8GB de RAM para máquina de Dev/VMs). O valor total do setup completo (incluindo monitor, teclado e mouse) ficou dentro do teto estipulado (máx R$ 2.500, R$ 4.500, R$ 6.000 ou R$ 8.500). Para a Equipe 1 (Livre), todas as peças de topo de linha foram fundamentadas.
* **Bom (1,5 pts):** A máquina atende ao perfil com leve desbalanceamento (ex: monitor básico demais para setup gamer ou RAM ligeiramente acima do necessário para escritório), mantendo-se dentro do orçamento.
* **Regular (1,0 pt):** Desbalanceamento relevante de prioridades para o perfil (ex: escolha de GPU dedicada em setup de escritório estourando margem útil, ou processador com vídeo integrado fraco para edição de vídeo profissional), ou valor total excedendo ligeiramente o orçamento (até 5%).
* **Insuficiente (0,0 - 0,4 pt):** Configuração inadequada ao perfil do cliente e/ou extrapolação grosseira do teto de orçamento sem justificativa de mercado.

---

### C3. O Desafio do Notebook: Comparativo Custo x Benefício (2,0 pontos)
Avalia a capacidade de pesquisa e análise crítica de mercado ao contrapor a montagem própria a uma máquina pronta portátil.

* **Excelente (2,0 pts):** O notebook selecionado possui especificações diretamente comparáveis ao PC montado (CPU e GPU de mesma categoria de desempenho, volume de RAM e SSD equivalentes). A análise aborda com propriedade técnica: preço bruto, portabilidade, eficiência térmica/refrigeração e capacidade de upgrades futuros. O veredito final é lógico e sustentado por dados.
* **Bom (1,5 pts):** Notebook adequado com especificações próximas, mas a argumentação foca apenas na diferença de preço bruto, com análise superficial sobre dissipação térmica ou limites de expansão.
* **Regular (1,0 pt):** Notebook selecionado com disparidade acentuada de desempenho em relação ao desktop cotado (ex: notebook de entrada comparado com desktop gamer intermediário), enfraquecendo o comparativo.
* **Insuficiente (0,0 - 0,4 pt):** Não cotou notebook equivalente, escolheu modelo arbitrário sem dados de preço/loja, ou não apresentou conclusão/veredito.

---

### C4. Qualidade dos Artefatos Técnicos: Planilha e Slides (1,5 pontos)
Avalia a documentação técnica entregue em conformidade com os modelos fornecidos.

* **Excelente (1,5 pts):**
  * **Planilha (.csv/planilha):** Todos os 10 itens obrigatórios presentes (CPU, Placa-Mãe, RAM, Armazenamento, GPU, Fonte, Gabinete, Cooler, Monitor, Teclado/Mouse). Especificações técnicas resumidas preenchidas corretamente, valores numéricos exatos, links ativos e verificáveis de lojas nacionais confiáveis, e notebook registrado.
  * **Slides de Apresentação:** Seguiu a estrutura do modelo técnico (perfil, peças com justificativa, resumo financeiro, versus notebook e veredito). Texto legível, sem poluição visual.
* **Bom (1,1 pts):** Artefatos completos com pequenas omissões de especificações (ex: faltou indicar velocidade da RAM ou modelo exato do cooler) ou links genéricos da página inicial da loja.
* **Regular (0,7 pt):** Planilha incompleta (faltando periféricos ou itens essenciais) ou slides fora da ordem lógica do roteiro de vendas/consultoria.
* **Insuficiente (0,0 - 0,3 pt):** Não entregou a planilha nos moldes requeridos ou slides ausentes/completamente desestruturados.

---

### C5. Apresentação Oral e Pitch Executivo (2,0 pontos)
Avalia a postura, comunicação técnica e participação do grupo durante a exposição para a turma.

* **Excelente (2,0 pts):** Todos os integrantes presentes participaram da fala. A equipe comunicou o porquê de cada decisão técnica em linguagem compreensível para o cliente sem apenas ler especificações secas. Postura profissional, resposta segura a questionamentos do professor/colegas e respeito rigoroso ao tempo estipulado (5 a 8 minutos).
* **Bom (1,5 pts):** Apresentação consistente e domínio do assunto, porém com concentração da fala em apenas um ou dois membros da equipe, ou ligeira ultrapassagem do tempo.
* **Regular (1,0 pt):** Apresentação limitada à leitura de slides, com dificuldade em responder sobre a função das peças escolhidas ou desorganização na troca de fala entre integrantes.
* **Insuficiente (0,0 - 0,4 pt):** Equipe despreparada, postura dispersa, incapacidade de justificar as peças cotadas ou recusa em apresentar.

---

## ⚖️ Tabela Resumo para Pontuação Rápida

| Faixa de Desempenho | C1 (2,5) | C2 (2,0) | C3 (2,0) | C4 (1,5) | C5 (2,0) | Nota Final |
|:---|:---:|:---:|:---:|:---:|:---:|:---:|
| **Nível 4 (Excelente)** | 2,5 | 2,0 | 2,0 | 1,5 | 2,0 | **10,0** |
| **Nível 3 (Bom)** | 1,8 | 1,5 | 1,5 | 1,1 | 1,5 | **7,4** |
| **Nível 2 (Regular)** | 1,0 | 1,0 | 1,0 | 0,7 | 1,0 | **4,7** |
| **Nível 1 (Insuficiente)** | 0,4 | 0,4 | 0,4 | 0,3 | 0,4 | **1,9** |

---

## 🚫 Penalidades e Bonificações Objetivas

* **Penalidade por atraso na submissão digital (-1,0 pt):** Entrega da planilha ou slides após o prazo estipulado.
* **Penalidade por ausência de periféricos (-0,5 pt por item ausente):** Deixar de orçar monitor, teclado ou mouse.
* **Bonificação por Custo-Benefício Notável (+0,5 pt):** Equipe que conseguiu montar uma configuração superior tecnicamente mantendo uma folga orçamentária maior que 10% do teto estipulado.
