module subtractor_tb;
    parameter N = 4;
    reg [N-1:0] a, b;
    wire [N-1:0] diff;
    wire bout;
    
    subtractor #(N) uut (
        .a(a),
        .b(b),
        .diff(diff),
        .bout(bout)
    );
    
    initial begin
        $dumpfile("subtractor.vcd");
        $dumpvars(0, subtractor_tb);
        
        // Test podstawowych operacji
        a = 4'b0010; b = 4'b0001; #10; // 2 - 1 = 1
        if ({bout, diff} !== 5'b00001) $display("Error: 2-1 failed");
        
        a = 4'b0001; b = 4'b0010; #10; // 1 - 2 = -1 (z pożyczką)
        if ({bout, diff} !== 5'b11111) $display("Error: 1-2 failed");
        
        a = 4'b1111; b = 4'b1111; #10; // 15 - 15 = 0
        if ({bout, diff} !== 5'b00000) $display("Error: 15-15 failed");
        
        a = 4'b0000; b = 4'b0001; #10; // 0 - 1 = -1
        if ({bout, diff} !== 5'b11111) $display("Error: 0-1 failed");
        
        $display("Test completed");
        $finish;
    end
endmodule 