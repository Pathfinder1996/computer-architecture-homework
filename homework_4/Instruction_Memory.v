module Instruction_Memory
(
    input  [63:0] addr_i,
    output [31:0] instr_o
);

// Instruction memory
// DO NOT MODIFY THIS MODULE

reg [31:0] memory [0:1024];

assign  instr_o = memory[addr_i >> 2];

endmodule
