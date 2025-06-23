module Control 
(
    input [6:0] opcode_i, // 7 bits opcode
    output reg [1:0] ALUOp_o, // 10:R-type 11:I-type
    output reg ALUSrc_o, // 0:register 1:imm
    output reg RegWrite_o // 1:WB register
);

always @(*) begin
    if (opcode_i == 7'b0110011) begin // R-type
        ALUOp_o = 2'b10;
        ALUSrc_o = 1'b0;
        RegWrite_o = 1'b1;
    end else if (opcode_i == 7'b0010011) begin // I-type
        ALUOp_o = 2'b11;
        ALUSrc_o = 1'b1;
        RegWrite_o = 1'b1;
    end
end

endmodule
