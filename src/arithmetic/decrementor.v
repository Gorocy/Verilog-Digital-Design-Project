module decrementor #(
    parameter N = 4  // N-bitowy (4-8 bitów)
) (
    input wire [N-1:0] in,
    output wire [N-1:0] out
);

    wire [N:0] borrow;
    assign borrow[0] = 1'b1;  // Stała wartość 1 do odjęcia
    
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : dec_logic
            assign out[i] = in[i] ^ borrow[i];
            assign borrow[i+1] = ~in[i] & borrow[i];
        end
    endgenerate

endmodule 