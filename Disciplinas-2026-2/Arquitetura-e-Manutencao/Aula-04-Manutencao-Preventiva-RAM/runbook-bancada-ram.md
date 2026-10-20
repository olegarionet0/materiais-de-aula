---
tipo: runbook-aluno
disciplina: Arquitetura e Manutenção de Computadores
turma: 1º Ano DS — EEEP-AFS
tema: "Procedimento Operacional Padrão (POP): Limpeza e Manutenção de Memória RAM"
professor: Olegário Neto
data: 2026-10-20
---

# 🛠️ Guia de Bancada: Procedimento de Limpeza e Manutenção de Memória RAM

> [!CAUTION] **Regra 0 de Segurança em Bancada**
> 1. **NUNCA** mexa em componentes com o cabo de força conectado na tomada.
> 2. Pressione o botão **Power por 5 segundos** com o cabo fora da tomada para drenar a carga dos capacitores da placa-mãe.
> 3. Encoste as duas mãos em uma parte metálica não pintada do chassi do gabinete por 5 segundos para **descarregar a eletricidade estática (ESD)** do seu corpo antes de tocar no pente de memória.

---

## 🔍 Passo 1: Localização e Anatomia do Módulo

1. Remova a tampa lateral esquerda do gabinete (lado oposto à chapa da placa-mãe).
2. Localize os **slots de memória RAM** (normalmente 2 ou 4 ranhuras próximas ao processador).
3. Observe a anatomia do módulo:
   * **Bordas verdes/pretas (PCB):** Onde você deve segurar.
   * **Chips pretos (SMD):** Circuitos integrados de armazenamento volátil.
   * **Contatos dourados:** Área de contato com o barramento da placa-mãe.
   * **Chanfro (Notch):** O rasgo no meio dos contatos. Ele **não fica no centro exato**, impedindo que a memória seja encaixada ao contrário.

---

## ⚙️ Passo 2: Extração Correta da Memória

1. Localize as **alavancas plásticas (travas)** nas extremidades do slot:
   * Em algumas placas, apenas um lado abre; em outras, ambos os lados abrem.
2. Pressione a trava para fora e para baixo suavemente.
   * Ao destravar, a memória será ejetada ligeiramente para cima.
3. **Puxe o pente em linha reta para cima**, segurando exclusivamente pelas bordas superiores/laterais do circuito.
   * ❌ **PROIBIDO:** Colocar os dedos nos contatos dourados (o suor e a oleosidade dos dedos aceleram a oxidação).

---

## 🧼 Passo 3: Limpeza dos Contatos Dourados

1. Apoie o pente de memória sobre a bancada limpa ou sobre a própria tampa do gabinete.
2. Passe a **borracha branca escolar macia** sobre os contatos dourados:
   * Movimento suave, sempre em **sentido único** (de dentro para fora).
   * ⚠️ **Atenção:** Não esfregue com força excessiva para não arrancar componentes minúsculos soldados acima dos contatos.
   * Faça o mesmo procedimento no outro lado dos contatos.
3. Com o **pincel seco e macio**, varra completamente todas as fagulhas e farelos de borracha do pente.
4. Use o pincel para varrer levemente o interior do **slot da placa-mãe**, removendo qualquer poeira acumulada.

---

## 🔄 Passo 4: Reinstalação e o "Duplo Clique"

1. Olhe para o slot e identifique a posição do pino guia (saliência plástica).
2. Alinhe o **chanfro (notch)** da memória com o pino guia do slot:
   * Se não encaixar perfeitamente, **não force!** Vire o pente no sentido correto.
3. Posicione as duas pontas da memória no slot em ângulo reto (90 graus).
4. Com os dois polegares (um em cada extremidade superior do pente), aplique uma **pressão firme e uniforme para baixo**.
5. **Critério de Sucesso:** Você deve ouvir ou sentir as travas plásticas fecharem sozinhas (**dois cliques firmes**).
   * Verifique visualmente se a trava abraçou o chanfro lateral da placa de circuito.

---

## 🖥️ Passo 5: Teste de POST e Visto do Professor

1. Conecte o cabo de vídeo (VGA/HDMI) e o cabo de força.
2. Ligue o computador no botão frontal:
   - [ ] Os coolers giraram?
   - [ ] O monitor acendeu e exibiu a tela da BIOS/POST ou sistema operacional?
3. Se a máquina ligar sem dar vídeo ou bipar continuamente:
   * Desligue imediatamente da tomada.
   * Abra as travas, retire a memória e repita o encaixe com mais firmeza.
4. Chame o professor na bancada para validar o funcionamento e conceder o **Visto de Bancada**.
