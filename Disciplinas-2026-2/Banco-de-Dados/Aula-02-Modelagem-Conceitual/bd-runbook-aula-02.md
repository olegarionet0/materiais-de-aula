---
tipo: runbook
resumo: "Gabarito de correção da folha de exercícios anterior e atividade prática de iniciação ao Modelo Conceitual utilizando cenários práticos de TI."
title: "Guia de Laboratório: Correção e Iniciação ao Modelo Conceitual"
disciplina: Banco de Dados
professor: Olegário Neto
data: 2026-08-11
status: pendente
---

<div class="teacher-only">

### 👨‍🏫 Notas do Professor (Lembretes)
* [ ] Conduzir a correção coletiva nos primeiros 10 minutos de aula para tirar as dúvidas remanescentes da aula 1.
* [ ] Certifique-se de fazer a chamada e cobrar que todos corrijam suas respostas baseados no gabarito oficial deste runbook.
* [ ] Na dinâmica de modelagem conceitual (Campeonato de E-sports), reforce que as entidades representam substantivos (coisas) e os atributos representam características das entidades.

</div>

# 💻 Guia de Laboratório: Correção e Iniciação à Modelagem

> [!info] **Sobre este Guia**
> Este roteiro contém a chave de correção do nosso primeiro exercício de banco de dados e uma atividade rápida de laboratório para iniciarmos a modelagem conceitual do nosso próprio banco.

---

## 🏛️ 1. Gabarito de Correção (Exercício Anterior)

Use as diretrizes abaixo para revisar e corrigir as respostas do seu exercício no caderno ou repositório:

### Questão 1: O que é um banco de dados?
* **Correção Esperada**: Coleção lógica e integrada de dados inter-relacionados estruturada de forma coerente para simular um cenário real.
* *Nota do Professor*: A resposta da turma estava excelente, associando a palavra "digital" e "organizada".

### Questão 2: Quais os principais bancos de dados e suas diferenças?
* **Correção Esperada**: Classificam-se em **Bancos de Dados Relacionais** (armazenamento estruturado em tabelas com forte integridade e uso de SQL) e **Não Relacionais ou NoSQL** (estruturas flexíveis como documentos JSON, chave-valor, grafos e famílias de colunas).

### Questão 3: Qual a diferença entre um banco de dados relacional e não relacional?
* **Correção Esperada**: 
  * O Relacional possui esquema fixo (tabelas rígidas). Cada dado tem seu tipo e coluna predefinida.
  * O Não Relacional é flexível. Em bancos orientados a documentos, por exemplo, os dados são armazenados como coleções de arquivos estruturados (documentos) que podem ter campos diferentes para cada registro.

### Questão 4: O que é um SGBD?
* **Correção Esperada**: O Sistema Gerenciador de Banco de Dados é um software especializado que gerencia o acesso físico dos dados, provendo segurança, recuperação de falhas (backup), controle de usuários e otimização de consultas. Ele impede que as aplicações manipulem os dados físicos no HD diretamente.

### Questão 5: Cite alguns SGBDs
* **Correção Esperada**: MySQL, PostgreSQL, **MariaDB** (escrito junto e com "D" e "B" maiúsculos!), **SQLite**, Oracle e SQL Server.

---

## 🚀 2. Passo a Passo do Laboratório: Mapeando uma Planta Baixa de Dados

Antes de construir o banco físico em MySQL, nós precisamos aprender a esboçar os conceitos fundamentais em papel ou software de diagramação (brModelo).

### Cenário de Prática: Campeonato de E-sports da EEEP
A coordenação da EEEP-AFS solicitou um banco de dados para controlar os times do próximo campeonato interno de e-sports (Counter-Strike / League of Legends). 

As regras iniciais passadas pelo coordenador de informática são:
1. Queremos cadastrar os **Jogadores** que participarão do campeonato. De cada jogador, precisamos guardar o seu *nome*, *nickname* (apelido de jogo), *idade* e *CPF*.
2. Também queremos cadastrar as **Equipes** (times). De cada equipe, precisamos guardar o *nome do time* e a *data de fundação*.
3. Um jogador deve obrigatoriamente estar associado a uma única equipe, e uma equipe possui vários jogadores associados.

---

## 🏆 3. Desafio da Aula (Atividade Prática)

Com base nas regras do Campeonato de E-sports descritas acima, execute as seguintes tarefas em seu editor de notas (Obsidian) ou caderno:

### Tarefa 1: Identificação de Entidades
* **O que fazer**: Identifique e escreva o nome das **duas principais Entidades** descritas no cenário (Dica: representam objetos ou "coisas" independentes no mundo real).
  * Entidade 1: ________________________
  * Entidade 2: ________________________

### Tarefa 2: Mapeamento de Atributos
* **O que fazer**: Para cada uma das Entidades identificadas acima, liste os seus **Atributos** (suas características ou propriedades descritas no texto do campeonato).
  * Atributos da Entidade 1: __________________________________________________
  * Atributos da Entidade 2: __________________________________________________

### Tarefa 3: Identificação do Relacionamento
* **O que fazer**: Identifique o verbo ou ação que conecta as duas entidades (como elas se relacionam?).
  * O/A [Entidade 1] _______________________ o/a [Entidade 2].

---

## ❓ 4. Perguntas de Revisão (Estudo Teórico)

Responda no seu caderno ou arquivo markdown de respostas:

1. **Abstração (ANSI/SPARC)**: Diga qual o nível de abstração (Físico, Lógico ou Visão) que o professor de redes de computadores acessa quando consulta apenas a lista de presença dos seus alunos no SICE (sem poder alterar as notas ou ver a estrutura da tabela de banco de dados).
2. **Planta Baixa**: Por que o Modelo Conceitual é considerado "independente de tecnologia"? Dê um exemplo de como essa característica ajuda na reunião com clientes não técnicos de TI.
