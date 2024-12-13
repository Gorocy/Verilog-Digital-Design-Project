module parity_generator_tb;
    parameter N = 4;
    reg [N-1:0] data;
    wire parity, odd;
    
    parity_generator #(N) uut (
        .data(data),
        .parity(parity),
        .odd(odd)
    );
    
    initial begin
        $dumpfile("parity_generator.vcd");
        $dumpvars(0, parity_generator_tb);
        
        // Test różnych kombinacji
        data = 4'b0000; #10; // parzysta liczba 1 (0)
        if (parity !== 1'b0 || odd !== 1'b1) $display("Error: 0000 failed");
        
        data = 4'b0001; #10; // nieparzysta liczba 1 (1)
        if (parity !== 1'b1 || odd !== 1'b0) $display("Error: 0001 failed");
        
        data = 4'b0011; #10; // parzysta liczba 1 (2)
        if (parity !== 1'b0 || odd !== 1'b1) $display("Error: 0011 failed");
        
        data = 4'b0111; #10; // nieparzysta liczba 1 (3)
        if (parity !== 1'b1 || odd !== 1'b0) $display("Error: 0111 failed");
        
        data = 4'b1111; #10; // parzysta liczba 1 (4)
        if (parity !== 1'b0 || odd !== 1'b1) $display("Error: 1111 failed");
        
        $display("Test completed");
        $finish;
    end
endmodule 