module ImmGen
(
    input [31:0] instruction_i,
    output reg [63:0] immediate_o
);

always @(*) begin
    if (instruction_i[6:0] == 7'b0010011) begin
        if (instruction_i[14:12] == 3'b001) begin
            immediate_o = {58'b0, instruction_i[25:20]};
        end else if (instruction_i[14:12] == 3'b101) begin
            immediate_o = {58'b0, instruction_i[25:20]};
        end else begin
            immediate_o = {{52{instruction_i[31]}}, instruction_i[31:20]};
        end
    end
end

endmodule
