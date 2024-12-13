module bcd_to_gray_tb;
    reg [3:0] bcd;
    wire [3:0] gray;
    
    bcd_to_gray uut (
        .bcd(bcd),
        .gray(gray)
    );
    
    initial begin
        $dumpfile("bcd_to_gray.vcd");
        $dumpvars(0, bcd_to_gray_tb);
        
        // Test konwersji BCD na kod Graya
        bcd = 4'b0000; #10; // 0 -> 0000
        if (gray !== 4'b0000) $display("Error: 0->0000 failed");
        
        bcd = 4'b0001; #10; // 1 -> 0001
        if (gray !== 4'b0001) $display("Error: 1->0001 failed");
        
        bcd = 4'b0010; #10; // 2 -> 0011
        if (gray !== 4'b0011) $display("Error: 2->0011 failed");
        
        bcd = 4'b0011; #10; // 3 -> 0010
        if (gray !== 4'b0010) $display("Error: 3->0010 failed");
        
        bcd = 4'b0100; #10; // 4 -> 0110
        if (gray !== 4'b0110) $display("Error: 4->0110 failed");
        
        bcd = 4'b1001; #10; // 9 -> 1101
        if (gray !== 4'b1101) $display("Error: 9->1101 failed");
        
        $display("Test completed");
        $finish;
    end
endmodule 