module bcd_to_7seg_tb;
    reg [3:0] bcd;
    wire [6:0] seg;
    
    bcd_to_7seg uut (
        .bcd(bcd),
        .seg(seg)
    );
    
    initial begin
        $dumpfile("bcd_to_7seg.vcd");
        $dumpvars(0, bcd_to_7seg_tb);
        
        // Test wszystkich cyfr 0-9
        bcd = 4'b0000; #10; // 0
        if (seg !== 7'b1111110) $display("Error: 0 display failed");
        
        bcd = 4'b0001; #10; // 1
        if (seg !== 7'b0110000) $display("Error: 1 display failed");
        
        bcd = 4'b0010; #10; // 2
        if (seg !== 7'b1101101) $display("Error: 2 display failed");
        
        bcd = 4'b0011; #10; // 3
        if (seg !== 7'b1111001) $display("Error: 3 display failed");
        
        bcd = 4'b0100; #10; // 4
        if (seg !== 7'b0110011) $display("Error: 4 display failed");
        
        bcd = 4'b0101; #10; // 5
        if (seg !== 7'b1011011) $display("Error: 5 display failed");
        
        bcd = 4'b0110; #10; // 6
        if (seg !== 7'b1011111) $display("Error: 6 display failed");
        
        bcd = 4'b0111; #10; // 7
        if (seg !== 7'b1110000) $display("Error: 7 display failed");
        
        bcd = 4'b1000; #10; // 8
        if (seg !== 7'b1111111) $display("Error: 8 display failed");
        
        bcd = 4'b1001; #10; // 9
        if (seg !== 7'b1111011) $display("Error: 9 display failed");
        
        $display("Test completed");
        $finish;
    end
endmodule 