---
tipo: atividade-aluno
disciplina: Arquitetura e Manutenção de Computadores
turma: 1º Ano DS — EEEP-AFS
tema: "Hierarquia de Memórias (Cache, RAM, ROM), Dual Channel, NVMe e RAID"
professor: Olegário Neto
data: 2026-10-21
---

# 📝 Estudo Dirigido: Memórias, Armazenamento NVMe e RAID

> [!IMPORTANT] **Instrução para a Turma:**
> Responda às 6 questões abaixo diretamente no seu **caderno**. Utilize as tabelas de referência abaixo e os slides projetados em sala. O professor passará conferindo e aplicando o visto.

---

## 📊 1. Resumo de Referência Rápida

### A. A Pirâmide de Memórias (Da mais rápida para a maior capacidade)
1. **Registradores & Cache (L1, L2, L3):** Ficam *dentro* do processador (CPU). Tecnologia **SRAM** (volátil). Velocidade extrema, capacidade em **Kilobytes/Megabytes**.
2. **Memória Principal (RAM):** Pentes DDR4/DDR5 nos slots da placa-mãe. Tecnologia **DRAM** (volátil). Guarda apenas os programas abertos no momento. Capacidade em **Gigabytes (8 GB a 64 GB)**.
3. **Memória ROM / Flash (Chip BIOS/UEFI):** Soldada na placa-mãe. **Não-volátil** (não apaga ao desligar da tomada). Guarda o firmware de inicialização e o autoteste (**POST**).
4. **Armazenamento de Massa (HD / SSD SATA / NVMe):** **Não-volátil**. Guarda o Sistema Operacional e seus arquivos permanentemente (**Centenas de GBs ou Terabytes**).

### B. Comparativo de Armazenamento
| Tecnologia | Barramento / Conexão | Velocidade Média de Leitura | Peças Móveis (Motor/Disco) |
| :--- | :--- | :---: | :---: |
| **HD Tradicional (HDD)** | Cabo SATA III | ~100 a 150 MB/s | **Sim** (Pratos magnéticos a 7.200 RPM) |
| **SSD 2.5" SATA** | Cabo SATA III | ~500 a 550 MB/s | **Não** (Chips Flash) |
| **SSD NVMe M.2** | Slot M.2 (**PCI-Express**) | **3.500 a 7.400 MB/s** | **Não** (Conectado direto na placa-mãe) |

### C. Arranjos de Múltiplos Discos (RAID)
* **RAID 0 (*Striping* / Divisão):** Divide os blocos de dados entre 2 ou mais discos simultaneamente.
  * **Vantagem:** Dobra a velocidade e soma a capacidade total (Ex: 2 SSDs de 500 GB = **1 TB** total).
  * **Risco Crítico:** Zero tolerância a falhas. Se **1 disco queimar**, você perde **100% dos arquivos**.
* **RAID 1 (*Mirroring* / Espelhamento):** Grava exatamente os mesmos dados nos 2 discos ao mesmo tempo (cópia fiel).
  * **Vantagem:** Alta disponibilidade e segurança. Se **1 disco queimar**, o sistema continua rodando normalmente pelo outro disco sem perder nada.
  * **Custo:** A capacidade útil é metade da soma física (Ex: 2 SSDs de 500 GB = **500 GB** úteis, pois o segundo é espelho).

---

## ✍️ 2. Questionário para Responder no Caderno (Avaliação de Sala)

**1.** Qual a principal diferença física e de velocidade de transferência entre um **HD tradicional (disco magnético)**, um **SSD SATA** e um **SSD NVMe M.2**? Por que o NVMe consegue ser até 7 vezes mais rápido que o SSD SATA comum?

**2.** Explique a diferença entre **memória RAM (volátil)** e **memória ROM (não-volátil)**. Onde a memória ROM é utilizada na placa-mãe e qual é o papel da bateria redonda **CR2032 (CMOS)**?

**3.** O que significa a tecnologia **"Dual Channel"** na alocação de memórias RAM? Se uma placa-mãe possui 4 slots (`A1, A2, B1, B2`) e o cliente comprou **2 pentes de 8 GB**, como devemos instalá-los fisicamente e qual a vantagem prática?

**4.** Defina o que é a **Memória Cache (L1, L2, L3)** do processador. Por que o processador precisa dela se o computador já possui vários Gigabytes de memória RAM?

**5.** O que é um arranjo de discos **RAID 0 (Striping)**? Se você montar um PC Gamer com **2 SSDs de 500 GB em RAID 0**, qual será o espaço total disponível no Windows e o que acontecerá com os arquivos se apenas um dos SSDs queimar?

**6.** O que é um arranjo **RAID 1 (Espelhamento)** e em qual cenário (PC doméstico ou Servidor de Banco de Dados/Hospital/Escola) ele é obrigatório? Se usarmos **2 HDs de 2 TB em RAID 1**, qual será o espaço útil disponível para guardar arquivos?
