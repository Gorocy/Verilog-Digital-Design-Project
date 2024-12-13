module adder_tb;
    parameter N = 4;
    reg [N-1:0] a, b;
    wire [N-1:0] sum;
    wire cout;
    
    // Instancja testowanego modułu
    adder #(N) uut (
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );
    
    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, adder_tb);
        
        // Test cases
        a = 4'b0001; b = 4'b0001; #10; // 1 + 1 = 2
        if ({cout, sum} !== 5'b00010) $display("Error: 1+1 failed");
        
        a = 4'b1111; b = 4'b0001; #10; // 15 + 1 = 16
        if ({cout, sum} !== 5'b10000) $display("Error: 15+1 failed");
        
        $display("Test completed");
        $finish;
    end
endmodule 