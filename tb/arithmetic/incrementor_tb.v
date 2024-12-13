module incrementor_tb;
    parameter N = 4;
    reg [N-1:0] in;
    wire [N-1:0] out;
    
    // Instancja testowanego modułu
    incrementor #(N) uut (
        .in(in),
        .out(out)
    );
    
    initial begin
        $dumpfile("incrementor.vcd");
        $dumpvars(0, incrementor_tb);
        
        // Test cases
        in = 4'b0000; #10; // 0 -> 1
        if (out !== 4'b0001) $display("Error: 0->1 failed");
        
        in = 4'b0001; #10; // 1 -> 2
        if (out !== 4'b0010) $display("Error: 1->2 failed");
        
        in = 4'b1111; #10; // 15 -> 0
        if (out !== 4'b0000) $display("Error: 15->0 failed");
        
        $display("Test completed");
        $finish;
    end
endmodule 