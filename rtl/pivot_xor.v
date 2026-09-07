module pivot_xor #(parameter WIDTH = 512)
    (input wire [WIDTH-1:0] operand_a,
    input wire [WIDTH-1:0] operand_b,
    output wire [WIDTH-1:0] xor_output);

    assign xor_output = operand_a ^ operand_b;
endmodule