module ALU (
    input [31:0] data1_i,
    input [31:0] data2_i,
    input [2:0] ALUCtrl_i,
    output reg [31:0] data_o,
    output reg zero_o);

    always @(*) begin
        if (ALUCtrl_i == 3'b000) begin // Addition
            data_o = data1_i + data2_i;                    
        end else if (ALUCtrl_i == 3'b001) begin
            data_o = data1_i - data2_i; // Subtraction
        end else if (ALUCtrl_i == 3'b010) begin
            data_o = data1_i & data2_i; // Bitwise AND
        end else if (ALUCtrl_i == 3'b011) begin
            data_o = data1_i | data2_i; // Bitwise OR
        end else if (ALUCtrl_i == 3'b100) begin
            data_o = data1_i ^ data2_i; // Bitwise XOR
        end else if (ALUCtrl_i == 3'b101) begin
            data_o = data1_i << data2_i[4:0]; // Left Shift
        end else if (ALUCtrl_i == 3'b110) begin
            data_o = $signed(data1_i) >>> data2_i[4:0]; // Arithmetic Right Shift
        end else if (ALUCtrl_i == 3'b111) begin
            data_o = data1_i >> data2_i[4:0]; // Logical Right Shift
        end else begin
            data_o = 32'b0;
        end

        if (data_o == 32'b0) begin
            zero_o = 1;
        end else begin
            zero_o = 0;
        end
    end

endmodule
