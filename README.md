## Computer Organization and Design RISC-V
作業學習內容如下:

1. 使用 RISC-V assembly 實現簡單的 quick sort (Hoare’s partition)。

2. 使用 Verilog 實現部分指令的 RV64I RISC-V single-cycle processor。

### 1131 NTU CSIE Computer Architecture Programming Homework
- 課程代碼: CSIE3340(三校聯盟課程代碼: 3T1684701)
  
- 授課老師: Prof. Shih-Hao Hung(洪士灝 教授)
  
- 課程用書: Computer Organization and Design Risc-V Edition: The Hardware Software Interface, by David A. Patterson and John L. Hennessy

- 注意: 因助教未公布 Homework2 的所有測資，雖然 Github 上是我修改過的，但可能還是有錯，請自行設計更多測資測試，Verilog 作業部分都沒問題。
  
- 如果想要手寫/程式作業和期中期末考古題，歡迎來信: daiyan.6666@gmail.com

## 壓縮檔內容

## Homework 2 如何使用 (點擊縮圖可放大)

<table border="1" cellspacing="0" cellpadding="6">
  <tr>
    <th>Homework 2</th>
    <th>Description</th>
    <th>Input</th>
    <th>Output</th>
  </tr>
  <tr>
    <td>使用 RISC-V assembly (RV64I)</td>
    <td>實現簡單的Quick Sort (Hoare partition)，了解組合語言中的陣列與指標，以及遞迴呼叫時堆疊區應該保存的上下文資訊。</td>
    <td><img src="image/1.PNG" width="300"/></td>
    <td><img src="image/2.PNG" width="300"/></td>
  </tr>
</table>

資料夾結構如下:
```
homework_2
├── main.s
├── rars-1.7.jar
└── sort.s
```

從右側連結 [點此下載](https://github.com/rarsm/rars/releases/download/v1.7/rars-1.7.jar) 下載 RARS 1.7

使用以下指令執行程式:
```
java -jar rars-1.7.jar rv64 sm main.s sort.s
```

## Homework 3 如何使用 (點擊縮圖可放大)

<table border="1" cellspacing="0" cellpadding="6">
  <tr>
    <th>Homework 3</th>
    <th>Description</th>
    <th>Output 1 (ALU Wave)</th>
    <th>Output 2 (Register Wave)</th>
  </tr>
  <tr>
    <td>使用 Verilog</td>
    <td>設置verilog開發環境，學習基礎verilog語法，按照作業規範實現ALU Design與RISC-V Register File Design，並寫testbench測試邏輯是否正確。</td>
    <td><img src="image/3.PNG" width="300"/></td>
    <td><img src="image/4.png" width="300"/></td>
  </tr>
</table>

資料夾結構如下:
```
homework_3
├── ALU.v
├── ALU_tb.v
├── Registers.v
└── Registers_tb.v
```
設置 verilog environment:

右側連結下載 Icarus Verilog 與 GTKWave [點此下載](https://bleyer.org/icarus/)

使用以下指令執行:
```
iverilog -o alu ALU.v ALU_tb.v
vvp alu
gtkwave ALU.vcd
```

以及:
```
iverilog -o reg Registers.v Registers_tb.v
vvp reg
gtkwave Registers.vcd
```

## Homework 4 如何使用 (點擊縮圖可放大)

<table border="1" cellspacing="0" cellpadding="6">
  <tr>
    <th>Homework 4</th>
    <th>Description</th>
    <th>CPU Data Path</th>
    <th>Input</th>
    <th>Output (CPU Wave)</th>
  </tr>
  <tr>
    <td>使用 Verilog</td>
    <td>實現部分指令的RV64I RISC-V single-cycle processor，參考The RISC-V Instruction Set Manual並設計出與作業規範相符的single-cycle processor，最後通過助教給的testbench。</td>
    <td><img src="image/6.png" width="300"/></td>
    <td>instruction.txt</td>
    <td><img src="image/5.PNG" width="300"/></td>
  </tr>
</table>

資料夾結構如下:
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

使用以下指令執行:
```
iverilog -o CPU.out *.v
vvp CPU.out
gtkwave CPU.vcd
```
