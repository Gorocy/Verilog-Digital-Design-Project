module decrementor_tb;
    parameter N = 4;
    reg [N-1:0] in;
    wire [N-1:0] out;
    
    // Instancja testowanego modułu
    decrementor #(N) uut (
        .in(in),
        .out(out)
    );
    
    initial begin
        $dumpfile("decrementor.vcd");
        $dumpvars(0, decrementor_tb);
        
        // Test cases
        in = 4'b0001; #10; // 1 -> 0
        if (out !== 4'b0000) $display("Error: 1->0 failed");
        
        in = 4'b0010; #10; // 2 -> 1
        if (out !== 4'b0001) $display("Error: 2->1 failed");
        
        in = 4'b0000; #10; // 0 -> 15
        if (out !== 4'b1111) $display("Error: 0->15 failed");
        
        $display("Test completed");
        $finish;
    end
endmodule 