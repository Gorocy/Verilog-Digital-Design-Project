module decoder_1of8_to_bcd_tb;
    reg [7:0] one_of_8;
    wire [3:0] bcd;
    
    decoder_1of8_to_bcd uut (
        .one_of_8(one_of_8),
        .bcd(bcd)
    );
    
    initial begin
        $dumpfile("decoder_1of8_to_bcd.vcd");
        $dumpvars(0, decoder_1of8_to_bcd_tb);
        
        // Test wszystkich możliwych wejść
        one_of_8 = 8'b00000001; #10; // 0
        if (bcd !== 4'b0000) $display("Error: 0 failed");
        
        one_of_8 = 8'b00000010; #10; // 1
        if (bcd !== 4'b0001) $display("Error: 1 failed");
        
        one_of_8 = 8'b00000100; #10; // 2
        if (bcd !== 4'b0010) $display("Error: 2 failed");
        
        one_of_8 = 8'b00001000; #10; // 3
        if (bcd !== 4'b0011) $display("Error: 3 failed");
        
        one_of_8 = 8'b00010000; #10; // 4
        if (bcd !== 4'b0100) $display("Error: 4 failed");
        
        one_of_8 = 8'b00100000; #10; // 5
        if (bcd !== 4'b0101) $display("Error: 5 failed");
        
        one_of_8 = 8'b01000000; #10; // 6
        if (bcd !== 4'b0110) $display("Error: 6 failed");
        
        one_of_8 = 8'b10000000; #10; // 7
        if (bcd !== 4'b0111) $display("Error: 7 failed");
        
        $display("Test completed");
        $finish;
    end
endmodule 