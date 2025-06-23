module Registers (
    input clk_i,
    input [4:0] RS1addr_i,
    input [4:0] RS2addr_i,
    input [4:0] RDaddr_i,
    input [31:0] RDdata_i,
    input RegWrite_i,
    output reg [31:0] RS1data_o,
    output reg [31:0] RS2data_o);

    reg [31:0] registers_array [0:31];

    initial begin
    registers_array[0] = 32'd0; // register 0 = 0
    end

    always @(posedge clk_i) begin
        if (RegWrite_i) begin
            if (RDaddr_i != 5'd0) begin // 不是 register 0 才能被寫入
                registers_array[RDaddr_i] <= RDdata_i;
            end
        end
    end

    always @(*) begin
        if (RS1addr_i == 5'd0) begin
            RS1data_o = 32'd0;
        end else begin
            RS1data_o = registers_array[RS1addr_i];
        end

        if (RS2addr_i == 5'd0) begin
            RS2data_o = 32'd0;
        end else begin
            RS2data_o = registers_array[RS2addr_i];
        end
    end

endmodule
