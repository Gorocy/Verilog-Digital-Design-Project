module two_complement #(
    parameter N = 4
) (
    input wire [N-1:0] in,
    output wire [N-1:0] out
);

    wire [N-1:0] inverted;
    wire [N:0] carry;
    
    // Negacja bitów
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : invert
            assign inverted[i] = ~in[i];
        end
    endgenerate
    
    // Dodanie 1
    assign carry[0] = 1'b1;
    
    generate
        for (i = 0; i < N; i = i + 1) begin : add_one
            assign out[i] = inverted[i] ^ carry[i];
            assign carry[i+1] = inverted[i] & carry[i];
        end
    endgenerate

endmodule 