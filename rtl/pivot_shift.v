module pivot_shift #(
    parameter WIDTH = 512
)
(
    input wire [WIDTH-1:0] operand,
    input wire [$clog2(WIDTH)-1:0] shift_amount,
    output wire [WIDTH-1:0] shift_output
);
    assign shift_output = (operand << shift_amount) | (operand  >> (WIDTH - shift_amount));
endmodule