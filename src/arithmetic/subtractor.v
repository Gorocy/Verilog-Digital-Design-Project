module subtractor #(
    parameter N = 4
) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    output wire [N-1:0] diff,
    output wire bout
);

    wire [N:0] borrow;
    assign borrow[0] = 1'b0;
    
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : full_subtractor
            assign diff[i] = a[i] ^ b[i] ^ borrow[i];
            assign borrow[i+1] = (b[i] & ~a[i]) | (b[i] & borrow[i]) | (~a[i] & borrow[i]);
        end
    endgenerate
    
    assign bout = borrow[N];

endmodule 