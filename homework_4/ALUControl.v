module ALUControl 
(
    input [1:0] ALUOp_i,
    input [2:0] funct3_i,
    input [6:0] funct7_i,
    output reg [3:0] ALUCtrl_o
);

// ALUOp_i -> 10:R-type 11:I-type

always @(*) begin
    if (ALUOp_i == 2'b10) begin // R-type
        if (funct3_i == 3'b000) begin
            if (funct7_i == 7'b0000000) begin
                ALUCtrl_o = 4'b0000; // add
            end else if (funct7_i == 7'b0100000) begin
                ALUCtrl_o = 4'b0001; // sub
            end
        end
        if (funct3_i == 3'b100) begin
            ALUCtrl_o = 4'b0010; // xor
        end
        if (funct3_i == 3'b110) begin
            ALUCtrl_o = 4'b0011; // or
        end
        if (funct3_i == 3'b111) begin
            ALUCtrl_o = 4'b0100; // and
        end
        if (funct3_i == 3'b001) begin
            ALUCtrl_o = 4'b0101; // sll
        end
        if (funct3_i == 3'b101) begin
            if (funct7_i == 7'b0000000) begin
                ALUCtrl_o = 4'b0110; // srl
            end else if (funct7_i == 7'b0100000) begin
                ALUCtrl_o = 4'b0111; // sra 
            end
        end
    end else if (ALUOp_i == 2'b11) begin // I-type
        if (funct3_i == 3'b000) begin 
            ALUCtrl_o = 4'b1000; // addi
        end
        if (funct3_i == 3'b100) begin
            ALUCtrl_o = 4'b1001; // xori
        end
        if (funct3_i == 3'b110) begin
            ALUCtrl_o = 4'b1010; // ori
        end
        if (funct3_i == 3'b111) begin
            ALUCtrl_o = 4'b1011; // andi
        end
        if (funct3_i == 3'b001) begin
            ALUCtrl_o = 4'b1100; // slli 
        end
        if (funct3_i == 3'b101) begin
            if (funct7_i[6:1] == 6'b000000) begin
                ALUCtrl_o = 4'b1101; // srli
            end else if (funct7_i[6:1] == 6'b010000) begin
                ALUCtrl_o = 4'b1110; // srai
            end
        end
    end
end

endmodule
