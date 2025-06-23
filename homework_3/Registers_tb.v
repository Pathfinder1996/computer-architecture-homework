`timescale 1ns / 1ps

module Registers_tb;

    reg clk_i;
    reg [4:0] RS1addr_i;
    reg [4:0] RS2addr_i;
    reg [4:0] RDaddr_i;
    reg [31:0] RDdata_i;
    reg RegWrite_i;
    wire [31:0] RS1data_o;
    wire [31:0] RS2data_o;

    Registers test (
        .clk_i(clk_i), 
        .RS1addr_i(RS1addr_i), 
        .RS2addr_i(RS2addr_i),
        .RDaddr_i(RDaddr_i), 
        .RDdata_i(RDdata_i), 
        .RegWrite_i(RegWrite_i), 
        .RS1data_o(RS1data_o),
        .RS2data_o(RS2data_o));

    always #10 clk_i = ~clk_i;

    initial begin
        $dumpfile("Registers.vcd");
        $dumpvars;
        $display("==========================================================================================");
        $display("Start testing");
        $display("==========================================================================================");

        // initialize signal
        clk_i = 0;
        RS1addr_i = 0;
        RS2addr_i = 0;
        RDaddr_i = 0;
        RDdata_i = 0;
        RegWrite_i = 0;
        #10;

        // write register 1
        RDaddr_i = 5'd1;
        RDdata_i = 32'hFFFF_FFFF;
        RegWrite_i = 1;
        #10;
        RegWrite_i = 0;
        RS1addr_i = 5'd1;
        #10;
        if (RS1data_o == 32'hFFFF_FFFF) begin
            $display("test passed, RS1data_o = %h", RS1data_o);
        end else begin
            $display("test failed, RS1data_o = %h", RS1data_o);
        end

        // write register 0
        RDaddr_i = 5'd0;
        RDdata_i = 32'hAAAA_AAAA;
        RegWrite_i = 1;
        #10;
        RegWrite_i = 0;
        RS1addr_i = 5'd0;
        #10;
        if (RS1data_o == 32'h0000_0000) begin
            $display("test passed, RS1data_o = %h", RS1data_o);
        end else begin
            $display("test failed, RS1data_o = %h", RS1data_o);
        end

        // write register 2
        RDaddr_i = 5'd2;
        RDdata_i = 32'hBBBB_BBBB;
        RegWrite_i = 1;
        #10;
        RegWrite_i = 0;
        RS2addr_i = 5'd2;
        #10;
        if (RS2data_o == 32'hBBBB_BBBB) begin
            $display("test passed, RS2data_o = %h", RS2data_o);
        end else begin
            $display("test failed, RS2data_o = %h", RS2data_o);
        end

        // test register 3 沒被寫過的情況下 值是否為未定義的x
        RS1addr_i = 5'd3;
        #20;
        if (RS1data_o === 32'bx) begin
            $display("test passed, RS1data_o = %h", RS1data_o);
        end else begin
            $display("test failed, RS1data_o = %h", RS1data_o);
        end

        // test register 31
        RDaddr_i = 5'd31;
        RDdata_i = 32'hCCCC_CCCC;
        RegWrite_i = 1;
        #10;
        RegWrite_i = 0;
        RS2addr_i = 5'd31;
        #10;
        if (RS2data_o == 32'hCCCC_CCCC) begin
            $display("test passed, RS2data_o = %h", RS2data_o);
        end else begin
            $display("test failed, RS2data_o = %h", RS2data_o);
        end

        // test register 30 在 clk 上升, 但 RegWrite_i = 0 不給寫入
        RDaddr_i = 5'd30;
        RDdata_i = 32'hDDDD_DDDD;
        RegWrite_i = 0;
        #15;
        RegWrite_i = 1;
        RS2addr_i = 5'd30;
        #5;
        if (RS2data_o === 32'bx) begin
            $display("test passed, RS2data_o = %h", RS2data_o);
        end else begin
            $display("test failed, RS2data_o = %h", RS2data_o);
        end

        // 隨時讀取指定的 register
        #15;
        RS1addr_i = 5'd1;
        RS2addr_i = 5'd30;
        #5;
        if (RS1data_o == 32'hFFFF_FFFF & RS2data_o == 32'hDDDD_DDDD) begin
            $display("test passed, RS1data_o = %h, RS2data_o = %h", RS1data_o, RS2data_o);
        end else begin
            $display("test failed, RS1data_o = %h, RS2data_o = %h", RS1data_o, RS2data_o);
        end

        $display("\n");
        $display("All tests completed.");
        $display("\n");
        $finish;
    end

endmodule
