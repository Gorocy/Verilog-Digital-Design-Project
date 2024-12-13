module inc_dec_tb;
    parameter N = 4;
    reg [N-1:0] in;
    reg mode;
    wire [N-1:0] out;
    
    inc_dec #(N) uut (
        .in(in),
        .mode(mode),
        .out(out)
    );
    
    initial begin
        $dumpfile("inc_dec.vcd");
        $dumpvars(0, inc_dec_tb);
        
        // Test trybu inkrementacji
        mode = 0;
        in = 4'b0000; #10; // 0 -> 1
        if (out !== 4'b0001) $display("Error: inc 0->1 failed");
        
        in = 4'b1111; #10; // 15 -> 0
        if (out !== 4'b0000) $display("Error: inc 15->0 failed");
        
        // Test trybu dekrementacji
        mode = 1;
        in = 4'b0001; #10; // 1 -> 0
        if (out !== 4'b0000) $display("Error: dec 1->0 failed");
        
        in = 4'b0000; #10; // 0 -> 15
        if (out !== 4'b1111) $display("Error: dec 0->15 failed");
        
        $display("Test completed");
        $finish;
    end
endmodule 