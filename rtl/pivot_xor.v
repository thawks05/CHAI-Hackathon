module pivot_xor #(
    parameter WIDTH = 512,
    parameter N     = 8
)
(
    input  wire                clk,
    input  wire                rst,
    input  wire [WIDTH-1:0]    operand_a,
    input  wire [WIDTH-1:0]    operand_b,
    input  wire [N*WIDTH-1:0]  vectors_in,
    output wire [WIDTH-1:0]    xor_output
);
    // clk/rst/vectors_in unused: xor is purely combinational on the
    // operand_a/operand_b pair.
    assign xor_output = operand_a ^ operand_b;
endmodule
