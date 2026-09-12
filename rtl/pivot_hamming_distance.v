module pivot_hamming #(
    parameter WIDTH = 512,
    parameter N     = 8
)
(
    input  wire                         clk,
    input  wire                         rst,
    input  wire [WIDTH-1:0]             operand_a,
    input  wire [WIDTH-1:0]             operand_b,
    input  wire [N*WIDTH-1:0]           vectors_in,
    output reg  [N*$clog2(WIDTH+1)-1:0] distance_output
);
    // clk/rst/operand_b unused: operand_a is the query vector, compared
    // bitwise against each of the N candidate vectors in vectors_in.
    localparam DIST_WIDTH = $clog2(WIDTH+1);

    integer vec_idx;
    integer bit_pos;
    integer count;
    reg [WIDTH-1:0] diff;

    always @(*) begin
        for (vec_idx = 0; vec_idx < N; vec_idx = vec_idx + 1) begin
            diff = operand_a ^ vectors_in[vec_idx*WIDTH +: WIDTH];
            count = 0;
            for (bit_pos = 0; bit_pos < WIDTH; bit_pos = bit_pos + 1) begin
                count = count + diff[bit_pos];
            end
            distance_output[vec_idx*DIST_WIDTH +: DIST_WIDTH] = count;
        end
    end
endmodule
