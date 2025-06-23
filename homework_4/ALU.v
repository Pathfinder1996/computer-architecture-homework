module ALU 
(
    input [63:0] data1_i,
    input [63:0] data2_i,
    input [3:0] ALUCtrl_i,
    output reg [63:0] data_o
);

always @(*) begin
    if (ALUCtrl_i == 4'b0000) begin
        data_o = data1_i + data2_i; // add
    end else if (ALUCtrl_i == 4'b0001) begin
        data_o = data1_i - data2_i; // sub
    end else if (ALUCtrl_i == 4'b0010) begin
        data_o = data1_i ^ data2_i; // xor
    end else if (ALUCtrl_i == 4'b0011) begin
        data_o = data1_i | data2_i; // or
    end else if (ALUCtrl_i == 4'b0100) begin
        data_o = data1_i & data2_i; // and
    end else if (ALUCtrl_i == 4'b0101) begin
        data_o = data1_i << (data2_i[5:0]); // sll
    end else if (ALUCtrl_i == 4'b0110) begin
        data_o = data1_i >> (data2_i[5:0]); // srl
    end else if (ALUCtrl_i == 4'b0111) begin
        data_o = $signed(data1_i) >>> (data2_i[5:0]); // sra
    end else if (ALUCtrl_i == 4'b1000) begin
        data_o = data1_i + data2_i; // addi
    end else if (ALUCtrl_i == 4'b1001) begin
        data_o = data1_i ^ data2_i; // xori
    end else if (ALUCtrl_i == 4'b1010) begin
        data_o = data1_i | data2_i; // ori
    end else if (ALUCtrl_i == 4'b1011) begin
        data_o = data1_i & data2_i; // andi
    end else if (ALUCtrl_i == 4'b1100) begin
        data_o = data1_i << (data2_i[5:0]); // slli
    end else if (ALUCtrl_i == 4'b1101) begin
        data_o = data1_i >> (data2_i[5:0]); // srli
    end else if (ALUCtrl_i == 4'b1110) begin
        data_o = $signed(data1_i) >>> (data2_i[5:0]); // srai
    end
end

endmodule
