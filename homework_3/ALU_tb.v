`timescale 1ns / 1ps

module ALU_tb;

    reg [31:0] data1_i;
    reg [31:0] data2_i;
    reg [2:0] ALUCtrl_i;
    wire [31:0] data_o;
    wire zero_o;

    ALU test(
        .data1_i(data1_i), 
        .data2_i(data2_i), 
        .ALUCtrl_i(ALUCtrl_i), 
        .data_o(data_o), 
        .zero_o(zero_o));

    initial begin
        $dumpfile("ALU.vcd"); 
        $dumpvars;
        $display("==========================================================================================");
        $display("Start testing");
        $display("==========================================================================================");

        // Addition
        data1_i = 32'h0000_000F;
        data2_i = 32'h0000_0001;
        ALUCtrl_i = 3'b000;
        #10 
        if (data_o == 32'h0000_0010) begin
            $display("test passed, ADD: %h + %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display("ADD test failed, data_o = %d", data_o);
        end

        // Addition 2
        data1_i = 32'hFFFF_FFFF;
        data2_i = 32'h0000_0001;
        ALUCtrl_i = 3'b000;
        #10 
        if (data_o == 32'h0000_0000) begin
            $display("test passed, ADD: %h + %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display("ADD test failed, data_o = %d", data_o);
        end

        // Addition 3
        data1_i = 32'hFFFF_FFFF;
        data2_i = 32'h0000_0002;
        ALUCtrl_i = 3'b000;
        #10 
        if (data_o == 32'h0000_0001) begin
            $display("test passed, ADD: %h + %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display("ADD test failed, data_o = %d", data_o);
        end

        // Subtraction
        data1_i = 32'h0000_000F;
        data2_i = 32'h0000_0001;
        ALUCtrl_i = 3'b001;
        #10
        if (data_o == 32'h0000_000E) begin
            $display("test passed, SUB: %h - %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display("SUB test failed, data_o = %d", data_o);
        end

        // Subtraction 2
        data1_i = 32'h0000_000F;
        data2_i = 32'h0000_000F;
        ALUCtrl_i = 3'b001;
        #10
        if (data_o == 32'h0000_0000) begin
            $display("test passed, SUB: %h - %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display("SUB test failed, data_o = %d", data_o);
        end

        // Subtraction 3
        data1_i = 32'h0000_0000;
        data2_i = 32'h0000_0001;
        ALUCtrl_i = 3'b001;
        #10
        if (data_o == 32'hFFFF_FFFF) begin
            $display("test passed, SUB: %h - %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display("SUB test failed, data_o = %d", data_o);
        end

        // Subtraction 4
        data1_i = 32'h0000_0000;
        data2_i = 32'h0000_0002;
        ALUCtrl_i = 3'b001;
        #10
        if (data_o == 32'hFFFF_FFFE) begin
            $display("test passed, SUB: %h - %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display("SUB test failed, data_o = %d", data_o);
        end

        // Bitwise AND
        data1_i = 32'h0000_00FF;
        data2_i = 32'h0000_0F0F;
        ALUCtrl_i = 3'b010;
        #10
        if (data_o == 32'h0000_000F) begin
            $display("test passed, AND: %h & %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display("AND test failed, data_o = %h", data_o);
        end

        // Bitwise OR
        data1_i = 32'h0000_00FF;
        data2_i = 32'h0000_0F0F;
        ALUCtrl_i = 3'b011;
        #10
        if (data_o == 32'h0000_0FFF) begin
            $display("test passed, OR: %h | %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display(" OR test failed, data_o = %h", data_o);
        end

        // Bitwise XOR
        data1_i = 32'h0000_00FF;
        data2_i = 32'h0000_0F0F;
        ALUCtrl_i = 3'b100;
        #10
        if (data_o == 32'h0000_0FF0) begin
            $display("test passed, XOR: %h ^ %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display("XOR test failed, data_o = %h", data_o);
        end

        // Left Shift
        data1_i = 32'h0000_0001;
        data2_i = 32'h0000_0002;
        ALUCtrl_i = 3'b101;
        #10
        if (data_o == 32'h0000_0004) begin
            $display("test passed, LS: %h << %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display(" LS test failed, data_o = %h", data_o);
        end

        // Arithmetic Right Shift
        data1_i = 32'h8000_0000;
        data2_i = 32'h0000_0001;
        ALUCtrl_i = 3'b110;
        #10
        if (data_o == 32'hC000_0000) begin
            $display("test passed, ARS: %h >>> %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display("ARS test failed, data_o = %h", data_o);
        end

        // Arithmetic Right Shift 2
        data1_i = 32'hF0000000; 
        data2_i = 32'h00000001;
        ALUCtrl_i = 3'b110;   
        #10;
        if (data_o == 32'hF8000000) begin
            $display("test passed, ARS: %h >>> %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display("ARS test failed, data_o = %h", data_o);
        end

        // Logical Right Shift
        data1_i = 32'h8000_0000;
        data2_i = 32'h0000_0001;
        ALUCtrl_i = 3'b111;
        #10
        if (data_o == 32'h4000_0000) begin
            $display("test passed, LRS: %h >> %h = %h, zero_o = %b", data1_i, data2_i, data_o, zero_o);
        end else begin
            $display("LRS test failed, data_o = %h", data_o);
        end

        $display("\n");
        $display("All tests completed.");
        $display("\n");
        $finish;
    end

endmodule
