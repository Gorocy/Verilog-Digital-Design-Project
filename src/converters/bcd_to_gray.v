module bcd_to_gray (
    input wire [3:0] bcd,
    output wire [3:0] gray
);
    
    // Konwersja BCD na kod Graya
    assign gray[3] = bcd[3];
    assign gray[2] = bcd[3] ^ bcd[2];
    assign gray[1] = bcd[2] ^ bcd[1];
    assign gray[0] = bcd[1] ^ bcd[0];

endmodule 