module pivot_counter #(
    parameter WIDTH = 512,
    parameter N     = 8
)
(
    input  wire                         clk,
    input  wire                         rst,
    input  wire [WIDTH-1:0]             operand_a,
    input  wire [WIDTH-1:0]             operand_b,
    input  wire [N*WIDTH-1:0]           vectors_in,
    output reg  [WIDTH*$clog2(N+1)-1:0] counter_output
);
    // clk/rst/operand_a/operand_b unused: counter tallies per-bit votes
    // across vectors_in only.
    localparam COUNT_WIDTH = $clog2(N+1);

    integer bit_pos;
    integer vec_idx;
    integer count;

    always @(*) begin
        for (bit_pos = 0; bit_pos < WIDTH; bit_pos = bit_pos + 1) begin
            count = 0;
            for (vec_idx = 0; vec_idx < N; vec_idx = vec_idx + 1) begin
                if (vectors_in[vec_idx*WIDTH + bit_pos])
                    count = count + 1;
            end
            counter_output[bit_pos*COUNT_WIDTH +: COUNT_WIDTH] = count;
        end
    end
endmodule
