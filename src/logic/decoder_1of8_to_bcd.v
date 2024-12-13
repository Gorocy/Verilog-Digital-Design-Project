module decoder_1of8_to_bcd (
    input wire [7:0] one_of_8,
    output wire [3:0] bcd
);
    
    // Konwersja kodu 1 z 8 na BCD
    assign bcd[0] = one_of_8[1] | one_of_8[3] | one_of_8[5] | one_of_8[7];
    assign bcd[1] = one_of_8[2] | one_of_8[3] | one_of_8[6] | one_of_8[7];
    assign bcd[2] = one_of_8[4] | one_of_8[5] | one_of_8[6] | one_of_8[7];
    assign bcd[3] = 1'b0;  // Zawsze 0, bo liczby 0-7

endmodule 