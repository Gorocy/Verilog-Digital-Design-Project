module inc_dec #(
    parameter N = 4
) (
    input wire [N-1:0] in,
    input wire mode,     // 0 - increment, 1 - decrement
    output wire [N-1:0] out
);
    
    wire [N-1:0] inc_out, dec_out;
    wire [N:0] carry, borrow;
    
    // Increment logic
    assign carry[0] = 1'b1;
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : inc_logic
            assign inc_out[i] = in[i] ^ carry[i];
            assign carry[i+1] = in[i] & carry[i];
        end
    endgenerate
    
    // Decrement logic
    assign borrow[0] = 1'b1;
    generate
        for (i = 0; i < N; i = i + 1) begin : dec_logic
            assign dec_out[i] = in[i] ^ borrow[i];
            assign borrow[i+1] = ~in[i] & borrow[i];
        end
    endgenerate
    
    // Output selection based on mode
    assign out = mode ? dec_out : inc_out;

endmodule 