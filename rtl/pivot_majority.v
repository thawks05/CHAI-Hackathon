module pivot_majority #(
    parameter WIDTH = 512,
    parameter N     = 4
)(
    input  wire [N*WIDTH-1:0]        vector_input,
    input  wire [$clog2(N+1)-1:0]    threshold,
    output reg  [WIDTH-1:0]          majority_output
);
    integer bit_pos;
    integer vec_idx;
    integer count;

    always @(*) begin
        for (bit_pos = 0; bit_pos < WIDTH; bit_pos = bit_pos + 1) begin
            count = 0;
            for (vec_idx = 0; vec_idx < N; vec_idx = vec_idx + 1) begin
                if (vector_input[vec_idx*WIDTH + bit_pos])
                    count = count + 1;
            end
            majority_output[bit_pos] = (count >= threshold);
        end
    end
endmodule