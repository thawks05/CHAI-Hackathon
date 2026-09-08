module hamming_distance #(
    parameter WIDTH = 512
)
(
    input wire [WIDTH-1:0] operand_a,
    input wire [WIDTH-1:0] operand_b,
    output reg [$clog2(WIDTH+1)-1:0] hamming_distance_output
);
    wire [WIDTH-1:0] diff;
    assign diff = operand_a ^ operand_b;
    
    //Recall, define i outside of always
    integer i; 
    always @(*) begin
        hamming_distance_output = 0;
        for (i = 0; i < WIDTH; i = i + 1) begin
            hamming_distance_output = hamming_distance_output + diff[i];
        end
    end
endmodule