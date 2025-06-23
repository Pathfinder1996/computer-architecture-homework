`define CYCLE_TIME 50
`timescale 1ns/1ps

module Testbench;

integer i;
integer outfile;
integer cycles = 0;
reg     clk = 0;
reg     rst = 1;

CPU CPU(
    .clk_i(clk),
    .rst_i(rst)
);

always #(`CYCLE_TIME/2) clk = ~clk;

initial begin
    outfile = $fopen("output.txt") | 1;

    /* Initialize the instruction memory
       32'h00000013 = NOP (addi x0, x0, 0) */
    for (i = 0; i < 1024; i = i + 1)
        CPU.Instruction_Memory.memory[i] = 32'h00000013;

    $readmemb("instruction.txt", CPU.Instruction_Memory.memory);

    #(`CYCLE_TIME/4) rst = 0;
end

always @(posedge clk) begin
    // Stop after 30 cycles
    if(cycles == 30)
        $finish;

    cycles = cycles + 1;

    $fdisplay(outfile, "PC  = %d", CPU.PC.pc_o);
    $fdisplay(outfile, "x0  = %d, x1  = %d", CPU.Registers.register[0], CPU.Registers.register[1]);
    $fdisplay(outfile, "x2  = %d, x3  = %d", CPU.Registers.register[2], CPU.Registers.register[3]);
    $fdisplay(outfile, "x4  = %d, x5  = %d", CPU.Registers.register[4], CPU.Registers.register[5]);
    $fdisplay(outfile, "x6  = %d, x7  = %d", CPU.Registers.register[6], CPU.Registers.register[7]);
    $fdisplay(outfile, "x8  = %d, x9  = %d", CPU.Registers.register[8], CPU.Registers.register[9]);
    $fdisplay(outfile, "x10 = %d, x11 = %d", CPU.Registers.register[10], CPU.Registers.register[11]);
    $fdisplay(outfile, "x12 = %d, x13 = %d", CPU.Registers.register[12], CPU.Registers.register[13]);
    $fdisplay(outfile, "x14 = %d, x15 = %d", CPU.Registers.register[14], CPU.Registers.register[15]);
    $fdisplay(outfile, "x16 = %d, x17 = %d", CPU.Registers.register[16], CPU.Registers.register[17]);
    $fdisplay(outfile, "x18 = %d, x19 = %d", CPU.Registers.register[18], CPU.Registers.register[19]);
    $fdisplay(outfile, "x20 = %d, x21 = %d", CPU.Registers.register[20], CPU.Registers.register[21]);
    $fdisplay(outfile, "x22 = %d, x23 = %d", CPU.Registers.register[22], CPU.Registers.register[23]);
    $fdisplay(outfile, "x24 = %d, x25 = %d", CPU.Registers.register[24], CPU.Registers.register[25]);
    $fdisplay(outfile, "x26 = %d, x27 = %d", CPU.Registers.register[26], CPU.Registers.register[27]);
    $fdisplay(outfile, "x28 = %d, x29 = %d", CPU.Registers.register[28], CPU.Registers.register[29]);
    $fdisplay(outfile, "x30 = %d, x31 = %d", CPU.Registers.register[30], CPU.Registers.register[31]);
    $fdisplay(outfile, "\n");
end

endmodule
