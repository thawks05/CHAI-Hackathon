module pivot_shift #(
    parameter WIDTH = 512,
    parameter N     = 8
)
(
    input  wire                clk,
    input  wire                rst,
    input  wire [WIDTH-1:0]    operand_a,
    input  wire [WIDTH-1:0]    operand_b,
    input  wire [N*WIDTH-1:0]  vectors_in,
    output wire [WIDTH-1:0]    shift_output
);
    // clk/rst/vectors_in unused: shift rotates operand_a using the low bits
    // of operand_b as the (wrapped) rotate amount.
    wire [$clog2(WIDTH)-1:0] shift_amount = operand_b[$clog2(WIDTH)-1:0];

    assign shift_output = (operand_a << shift_amount) | (operand_a >> (WIDTH - shift_amount));
endmodule
