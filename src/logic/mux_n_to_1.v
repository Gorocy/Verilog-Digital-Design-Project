module mux_n_to_1 #(
    parameter N = 8  // N = 2 do 8
) (
    input wire [N-1:0] data_in,
    input wire [$clog2(N)-1:0] sel,
    output wire out
);
    
    wire [N-1:0] selected;
    
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : mux_gen
            wire [($clog2(N)-1):0] sel_match;
            
            // Sprawdzanie każdego bitu adresu
            for (genvar j = 0; j < $clog2(N); j = j + 1) begin : sel_check
                assign sel_match[j] = (sel[j] == ((i >> j) & 1'b1));
            end
            
            // Wybór wejścia
            assign selected[i] = data_in[i] & (&sel_match);
        end
    endgenerate
    
    // Łączenie wszystkich wybranych wejść
    assign out = |selected;

endmodule 