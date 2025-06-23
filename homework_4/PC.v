module PC
(   // Do not modify port names
    input             clk_i,
    input             rst_i,
    input      [63:0] pc_i,
    output reg [63:0] pc_o
);

// TODO: Implement your PC here.
// PC should be reset to 0 when rst_i is high.
always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
        pc_o <= 64'b0;
    end else begin
        pc_o <= pc_i;
    end
end

endmodule
