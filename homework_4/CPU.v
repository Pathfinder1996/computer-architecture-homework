module CPU
(
    input clk_i, 
    input rst_i
);

// TODO: Implement your CPU here
wire [63:0] ProgramCounter, NextPc, Immediate, ALUresult, RS1data, RS2data;
wire [31:0] Instruction;
wire [3:0] ALUCtrl;
wire [1:0] ALUOp;
wire ALUSrc, RegWrite;

// Do not change the name of these module instances.
Instruction_Memory Instruction_Memory(
    .addr_i     (ProgramCounter), 
    .instr_o    (Instruction)
);

PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .pc_i       (NextPc),
    .pc_o       (ProgramCounter)
);

Registers Registers(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .RS1addr_i  (Instruction[19:15]),
    .RS2addr_i  (Instruction[24:20]),
    .RDaddr_i   (Instruction[11:7]), 
    .RDdata_i   (ALUresult),
    .RegWrite_i (RegWrite), 
    .RS1data_o  (RS1data), 
    .RS2data_o  (RS2data) 
);

// Control
Control Control(
    .opcode_i(Instruction[6:0]),
    .ALUOp_o(ALUOp),
    .ALUSrc_o(ALUSrc),
    .RegWrite_o(RegWrite)
);

// ImmGen
ImmGen ImmGen(
    .instruction_i(Instruction),
    .immediate_o(Immediate)
);

// ALUControl
ALUControl ALUControl(
    .ALUOp_i(ALUOp),
    .funct3_i(Instruction[14:12]),
    .funct7_i(Instruction[31:25]),
    .ALUCtrl_o(ALUCtrl)
);

// ALU
ALU ALU(
    .data1_i(RS1data),
    .data2_i(ALUSrc ? Immediate : RS2data),
    .ALUCtrl_i(ALUCtrl),
    .data_o(ALUresult)
);

assign NextPc = ProgramCounter + 64'd4;

endmodule
