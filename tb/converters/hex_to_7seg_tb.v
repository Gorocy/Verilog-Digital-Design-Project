module hex_to_7seg_tb;
    reg [3:0] hex;
    wire [6:0] seg;
    
    hex_to_7seg uut (
        .hex(hex),
        .seg(seg)
    );
    
    initial begin
        $dumpfile("hex_to_7seg.vcd");
        $dumpvars(0, hex_to_7seg_tb);
        
        // Test cyfr hex A-F
        hex = 4'b1010; #10; // A
        if (seg !== 7'b1110111) $display("Error: A display failed");
        
        hex = 4'b1011; #10; // B
        if (seg !== 7'b0011111) $display("Error: B display failed");
        
        hex = 4'b1100; #10; // C
        if (seg !== 7'b1001110) $display("Error: C display failed");
        
        hex = 4'b1101; #10; // D
        if (seg !== 7'b0111101) $display("Error: D display failed");
        
        hex = 4'b1110; #10; // E
        if (seg !== 7'b1001111) $display("Error: E display failed");
        
        hex = 4'b1111; #10; // F
        if (seg !== 7'b1000111) $display("Error: F display failed");
        
        $display("Test completed");
        $finish;
    end
endmodule 