## 📝 Computer Organization and Design RISC-V
Implement a simple quick sort (Hoare’s partition) in RISC-V assembly. 

Also, implement part of a single-cycle RISC-V CPU in Verilog.

### 🔗 1131 NTU CSIE Computer Architecture Programming Homework
- Course code: CSIE3340 (三校聯盟課程代碼: 3T1684701)
- Instructor: Prof. Shih-Hao Hung(洪士灝 教授)
- Textbook: Computer Organization and Design Risc-V Edition: The Hardware Software Interface, by David A. Patterson and John L. Hennessy

## 📁 Contents

## 🚀 Homework 2 Getting Started

<table border="1" cellspacing="0" cellpadding="6">
  <tr>
    <th>Homework 2</th>
    <th>Description</th>
    <th>Input</th>
    <th>Output</th>
  </tr>
  <tr>
    <td>RISC-V assembly (RV64I)</td>
    <td>實現簡單的Quick Sort (Hoare partition)，了解組合語言中的陣列與指標，以及遞迴呼叫時堆疊區應該保存的上下文資訊。</td>
    <td><img src="image/1.PNG" width="300"/></td>
    <td><img src="image/2.PNG" width="300"/></td>
  </tr>
</table>

Directory structure shown below:
```
homework_2
├── main.s
├── rars-1.7.jar
└── sort.s
```

You can download RARS 1.7 from [this link](https://github.com/rarsm/rars/releases/download/v1.7/rars-1.7.jar)

Using this command:
```
java -jar rars-1.7.jar rv64 sm main.s sort.s
```

## 🚀 Homework 3 Getting Started

<table border="1" cellspacing="0" cellpadding="6">
  <tr>
    <th>Homework 3</th>
    <th>Description</th>
    <th>Output 1 (ALU Wave)</th>
    <th>Output 2 (Register Wave)</th>
  </tr>
  <tr>
    <td>Verilog</td>
    <td>設置verilog開發環境，學習基礎verilog語法，按照作業規範實現ALU Design與RISC-V Register File Design，並寫testbench測試邏輯是否正確。</td>
    <td><img src="image/3.PNG" width="300"/></td>
    <td><img src="image/4.png" width="300"/></td>
  </tr>
</table>

Directory structure shown below:
```
homework_3
├── ALU.v
├── ALU_tb.v
├── Registers.v
└── Registers_tb.v
```
Setting up the verilog environment:

Download prebuilt Icarus Verilog and GTKWave [here](https://bleyer.org/icarus/)

Using command:
```
iverilog -o alu ALU.v ALU_tb.v
vvp alu
gtkwave ALU.vcd
```

and
```
iverilog -o reg Registers.v Registers_tb.v
vvp reg
gtkwave Registers.vcd
```

## 🚀 Homework 4 Getting Started

<table border="1" cellspacing="0" cellpadding="6">
  <tr>
    <th>Homework 4</th>
    <th>Description</th>
    <th>Data Path</th>
    <th>Input</th>
    <th>Output (CPU Wave)</th>
  </tr>
  <tr>
    <td>Verilog</td>
    <td>實現部分指令的RV64I RISC-V single-cycle processor，參考The RISC-V Instruction Set Manual並設計出與作業規範相符的single-cycle processor，最後通過助教給的testbench。</td>
    <td><img src="image/6.png" width="300"/></td>
    <td>instruction.txt</td>
    <td><img src="image/5.PNG" width="300"/></td>
  </tr>
</table>

Directory structure shown below:
```
homework_4
├── ALU.v
├── ALUControl.v
├── CPU.v
├── ImmGen.v
├── instruction.txt
├── Instruction_Memory.v
├── PC.v
├── Registers.v
└── Testbench.v
```

Using command:
```
iverilog -o CPU.out *.v
vvp CPU.out
gtkwave CPU.vcd
```
