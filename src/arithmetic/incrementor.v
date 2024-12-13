module incrementor #(
    parameter N = 4  // N-bitowy (4-8 bitów)
) (
    input wire [N-1:0] in,
    output wire [N-1:0] out
);

    wire [N:0] carry;
    assign carry[0] = 1'b1;  // Stała wartość 1 do dodania
    
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : inc_logic
            assign out[i] = in[i] ^ carry[i];
            assign carry[i+1] = in[i] & carry[i];
        end
    endgenerate

endmodule 