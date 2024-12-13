module adder #(
    parameter N = 4
) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    output wire [N-1:0] sum,
    output wire cout
);

    wire [N:0] carry;
    assign carry[0] = 1'b0;
    
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : full_adder
            assign sum[i] = a[i] ^ b[i] ^ carry[i];
            assign carry[i+1] = (a[i] & b[i]) | (carry[i] & (a[i] ^ b[i]));
        end
    endgenerate
    
    assign cout = carry[N];

endmodule 