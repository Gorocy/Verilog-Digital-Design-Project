module two_complement_tb;
    parameter N = 4;
    reg [N-1:0] in;
    wire [N-1:0] out;
    
    // Instancja testowanego modułu
    two_complement #(N) uut (
        .in(in),
        .out(out)
    );
    
    initial begin
        $dumpfile("two_complement.vcd");
        $dumpvars(0, two_complement_tb);
        
        // Test cases
        in = 4'b0001; #10; // 1 -> -1
        if (out !== 4'b1111) $display("Error: 1->-1 failed");
        
        in = 4'b0010; #10; // 2 -> -2
        if (out !== 4'b1110) $display("Error: 2->-2 failed");
        
        $display("Test completed");
        $finish;
    end
endmodule 