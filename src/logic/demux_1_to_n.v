module demux_1_to_n #(
    parameter N = 8  // N może być od 2 do 8
) (
    input wire data_in,
    input wire [$clog2(N)-1:0] sel,
    output wire [N-1:0] out
);
    
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : demux_gen
            wire [($clog2(N)-1):0] sel_match;
            
            // Sprawdzanie każdego bitu adresu
            for (genvar j = 0; j < $clog2(N); j = j + 1) begin : sel_check
                assign sel_match[j] = (sel[j] == ((i >> j) & 1'b1));
            end
            
            // Wyjście aktywne tylko gdy wszystkie bity się zgadzają
            wire sel_ok;
            assign sel_ok = &sel_match;
            assign out[i] = data_in & sel_ok;
        end
    endgenerate

endmodule 