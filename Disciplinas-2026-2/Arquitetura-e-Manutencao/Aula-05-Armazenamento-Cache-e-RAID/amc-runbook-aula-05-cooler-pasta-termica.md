---
tipo: runbook-aluno
disciplina: Arquitetura e Manutenção de Computadores
turma: 1º Ano DS — EEEP-AFS
tema: "Manutenção Preventiva do Subsistema Térmico: Limpeza de Cooler e Troca de Pasta Térmica"
professor: Olegário Neto
tags:
  - runbook
  - cooler
  - pasta-termica
  - manutencao-preventiva
  - hardware
---

# 🛠️ Runbook de Bancada: Limpeza de Cooler e Aplicação de Pasta Térmica

> [!CAUTION] **Regra de Ouro da Bancada de Hardware**
> 1. O computador deve estar **100% desligado da tomada** antes de abrir a tampa.
> 2. Pressione o botão *Power* por 5 segundos com a máquina desplugada para descarregar os capacitores da fonte.
> 3. Toque na parte metálica sem pintura do gabinete para descarregar a **eletricidade estática (ESD)** antes de tocar na placa-mãe.

---

## 🎯 Objetivo da Prática
Realizar a manutenção preventiva do subsistema de refrigeração da CPU: desmontar o cooler do processador, remover resíduos de poeira nas aletas, limpar a pasta térmica antiga ressecada com álcool isopropílico, aplicar uma nova camada de pasta térmica e validar a montagem no monitor de temperatura da BIOS/UEFI.

---

## 🧰 Materiais por Bancada
* Chave Philips (tamanho médio).
* Pincel macio antiestático.
* Pedaços de papel toalha ou filtro de papel (não soltam fiapos).
* Frasco de **Álcool Isopropílico** (99.8%).
* Tubo de **Pasta Térmica** (composto à base de prata ou silicone).
* Cabo de força, monitor e teclado para teste de POST.

---

## 📋 Passo a Passo de Execução

### Etapa 1: Acesso e Desconexão do Cooler
1. Deite o gabinete na bancada com a placa-mãe voltada para cima.
2. Localize o cabo do cooler conectado à placa-mãe.
   * Procure a inscrição impressa na placa: **`CPU_FAN`** (conector de 4 pinos com trava).
   * Puxe cuidadosamente pelo conector de plástico (nunca puxe pelos fios coloridos!).
3. Identifique o tipo de fixação do cooler:
   * **Cooler Box Intel (Travas Push-Pin de pressão):** Gire as 4 presilhas plásticas 90° no sentido indicado pela setinha antes de puxar para cima.
   * **Cooler Box AMD (Garras de alavanca ou parafusos):** Solte a alavanca metálica lateral ou desparafuse em "X" (cruzado) meia volta por vez.
4. **CUIDADO AO DESCOLAR:** A pasta térmica ressecada age como cola! Nunca puxe o cooler com força bruta para cima (risco de arrancar o processador AMD do socket e entortar os pinos). Faça um movimento suave de torção leve (girar 2 milímetros para a esquerda e para a direita) até descolar da CPU.

---

### Etapa 2: Higienização do Dissipador e Ventoinha
1. Com o cooler fora do gabinete, utilize o **pincel macio** para espanar a poeira acumulada entre as aletas de alumínio.
2. Segure as pás da ventoinha com o dedo para que ela não gire livremente enquanto você sopra ou pincela (evita induzir corrente estática no motor do cooler).
3. Se houver crostas grossas de poeira, use o ar comprimido ou pincel seco nas bordas.

---

### Etapa 3: Limpeza da Pasta Térmica Ressecada
1. Umedeça levemente a ponta do papel toalha com **Álcool Isopropílico**.
2. Limpe a base de contato de cobre/alumínio do cooler até remover 100% da pasta cinza/branca velha.
3. No processador (que permanece travado com segurança no socket):
   * Passe o papel com álcool suavemente sobre a tampa metálica da CPU (**IHS - Integrated Heat Spreader**).
   * Movimento do centro para fora, cuidando para não deixar resíduo de pasta escorrer para os componentes SMD da placa-mãe.
4. Aguarde 30 segundos (o álcool isopropílico evapora quase instantaneamente e não deixa umidade).

---

### Etapa 4: Aplicação da Nova Pasta Térmica
1. **Menos é Mais:** A pasta térmica serve apenas para preencher as ranhuras microscópicas entre o metal da CPU e o metal do cooler. O excesso de pasta atua como **isolante térmico** e pode vazar para os lados!
2. **Método da Gota / Grão de Ervilha:**
   * Aplique uma única gota no **centro exato** do processador (tamanho de um grão de arroz ou pequena ervilha).
   * **NÃO precisa espalhar com o dedo nem com espátula:** a própria pressão uniforme do cooler ao ser parafusado espalhará a pasta em círculo perfeito.

---

### Etapa 5: Remontagem e Conexão Elétrica
1. Posicione o cooler sobre o processador alinhando os 4 furos da placa-mãe.
2. Trave os 4 pontos de fixação sempre em **cruz / padrão diagonal (X)**:
   * Aperte primeiro o pino superior esquerdo, depois o inferior direito; depois o superior direito e por fim o inferior esquerdo. Isso garante que a pasta seja esmagada com pressão homogênea.
3. **PASSO OBRIGATÓRIO:** Reconecte o conector de 4 pinos no plugue **`CPU_FAN`** da placa-mãe!
   *(Se esquecer esse cabo, a ventoinha não gira e a máquina desliga por superaquecimento em 15 segundos).*

---

### Etapa 6: Teste de POST e Monitoramento Térmico
1. Conecte o cabo de vídeo (VGA/HDMI), teclado e cabo de força.
2. Ligue a máquina e pressione repetidamente a tecla **`DEL`** ou **`F2`** para entrar na **BIOS / UEFI Setup**.
3. Navegue até a aba **Hardware Monitor**, **PC Health Status** ou **Power**:
   * Verifique o campo **CPU Temperature:**
     * Em repouso (idle) na BIOS, a temperatura normal deve ficar entre **32°C e 45°C**.
     * Acima de 75°C na BIOS indica cooler mal encaixado ou pasta insuficiente.
   * Verifique a rotação: **CPU Fan Speed** (~1.200 a 2.500 RPM).
4. Chame o professor para avaliar a temperatura na tela e conceder o visto da bancada!
