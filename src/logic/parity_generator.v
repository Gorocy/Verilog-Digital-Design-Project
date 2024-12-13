module parity_generator #(
    parameter N = 4
) (
    input wire [N-1:0] data,
    output wire parity,    // 0 dla parzystej liczby jedynek, 1 dla nieparzystej
    output wire odd       // 1 dla nieparzystej liczby jedynek, 0 dla parzystej
);
    
    wire [N-1:0] xor_chain;
    assign xor_chain[0] = data[0];
    
    genvar i;
    generate
        for (i = 1; i < N; i = i + 1) begin : parity_calc
            assign xor_chain[i] = xor_chain[i-1] ^ data[i];
        end
    endgenerate
    
    assign parity = xor_chain[N-1];
    assign odd = ~parity;

endmodule 