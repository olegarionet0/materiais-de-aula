---
tipo: runbook
resumo: "Roteiro prático para exploração física do laboratório e identificação de componentes básicos de redes."
title: "Guia de Laboratório: Introdução a Redes e Componentes Básicos (Aulas 1 e 2)"
disciplina: Redes de Computadores
professor: Olegário Neto
data: 2026-08-10
status: pendente
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Fazer chamada e organizar as duplas de trabalho.
* [ ] Conectar os alunos na realidade da aula com a pergunta-gatilho de Redenção sem internet (Engage).
* [ ] Explicar a regra da fase de exploração: eles devem apenas listar e desenhar usando nomes informais e o que observam de fato nas bancadas (Explore).
* [ ] Proteger o rack com switches/roteadores do laboratório, permitindo que eles olhem e identifiquem a distância, sem mexer na fiação ativa.

</div>

# 💻 Guia de Laboratório: Introdução a Redes e Componentes Básicos

> [!info] **Sobre este Guia**
> Este roteiro contém instruções práticas para você explorar a infraestrutura física do nosso laboratório de informática da EEEP-AFS. A missão de hoje é entender como os computadores se comunicam e identificar os componentes reais de uma rede de computadores. Siga os passos e resolva o desafio em dupla!

---

## 🏛️ 1. Pré-requisitos e Preparação
Antes de iniciar, verifique se você possui:
* [ ] Lápis/Caneta e caderno de anotações (ou bloco de notas digital).
* [ ] Uma bancada de laboratório ativa com computador conectado à rede escolar.
* [ ] Espírito de detetive de infraestrutura!

---

## 🚀 2. Passo a Passo do Laboratório

### Passo 1: Caça aos Fios (Exploração Física da Bancada)
Com o computador ligado, examine a parte física dele:
1. Olhe na parte traseira ou lateral do gabinete.
2. Identifique qual cabo o conecta à rede escolar. *(Dica: costuma ser um cabo azul ou cinza com uma trava plástica na ponta, chamado conector RJ-45).*
3. Anote no seu caderno qual a cor desse cabo, a qual porta ele está conectado (placa de rede) e para onde ele segue (canaletas na bancada, tomadas na parede, etc.).

### Passo 2: O Caminho da Mensagem
1. Siga visualmente o cabo de rede que sai da sua bancada. Aonde ele vai morrer?
2. Procure na sala de aula por tomadas fêmeas instaladas na parede ou canaleta.
3. Quantas tomadas de rede existem próximas à sua bancada? Elas têm alguma identificação por letras ou números (etiquetas de identificação de portas)? Anote-as.

### Passo 3: O Ponto de Encontro (Identificação de Dispositivos Intermediários)
1. Olhe ao redor da sala de laboratório e localize um armário de metal com porta de vidro ou gradeado preso à parede (chamado Rack).
2. Olhe através do vidro (sem abrir ou mexer nos cabos):
   * Identifique uma caixa metálica com várias portas piscando LEDs verdes. *(Dica: este é o Switch do laboratório).*
   * Procure por algum equipamento com antenas na sala ou no teto. *(Dica: este é o Access Point/Roteador sem fio).*
3. Anote em seu caderno a quantidade estimada de conexões que estão saindo desse Rack de metal.

---

## 🏆 3. Desafio da Aula (Atividade Prática)

### O Mapeador de Redes
Em duplas, vocês deverão desenhar um fluxograma ou mapa lógico que demonstre o caminho de dados entre a sua máquina e o site do GitHub na internet.

1. **Requisito 1**: O desenho deve representar:
   - O seu computador.
   - O switch do laboratório (Rack).
   - O roteador sem fio / Gateway da escola.
   - O cabo/conexão wireless que une cada um deles.
   - Um servidor de internet (ex: GitHub).
2. **Requisito 2**: Adicione setas indicando o fluxo de ida e volta de uma mensagem.
3. **Requisito 3**: Rotule cada item no desenho classificando-o obrigatoriamente em uma destas três categorias oficiais estudadas na teoria:
   * **Dispositivo Final** (Host)
   * **Dispositivo Intermediário**
   * **Meio de Transmissão**
4. **Entrega**: Mostre o mapa para o professor durante a aula para obter o visto prático.

---

## ❓ 4. Perguntas de Revisão (Estudo Teórico)
Responda brevemente no seu caderno ou repositório:
1. *Pergunta 1*: Por que o Switch e o Roteador são classificados como dispositivos **intermediários** e não como dispositivos finais? Qual papel eles desempenham que justifica esse nome?
2. *Pergunta 2*: Se o cabo de rede azul RJ-45 conectado atrás do seu computador for rompido ou desconectado, qual componente da tríade de redes foi cortado? Como isso afeta a comunicação da sua bancada com os outros hosts e com a internet?
