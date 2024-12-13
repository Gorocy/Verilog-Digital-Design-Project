module mux_n_to_1_tb;
    parameter N = 8;
    reg [N-1:0] data_in;
    reg [$clog2(N)-1:0] sel;
    wire out;
    
    mux_n_to_1 #(N) uut (
        .data_in(data_in),
        .sel(sel),
        .out(out)
    );
    
    initial begin
        $dumpfile("mux_n_to_1.vcd");
        $dumpvars(0, mux_n_to_1_tb);
        
        // Test wszystkich możliwych selekcji
        data_in = 8'b10101010;
        
        sel = 3'b000; #10; // Wybór bitu 0
        if (out !== 1'b0) $display("Error: sel=000 failed");
        
        sel = 3'b001; #10; // Wybór bitu 1
        if (out !== 1'b1) $display("Error: sel=001 failed");
        
        sel = 3'b010; #10; // Wybór bitu 2
        if (out !== 1'b0) $display("Error: sel=010 failed");
        
        sel = 3'b111; #10; // Wybór bitu 7
        if (out !== 1'b1) $display("Error: sel=111 failed");
        
        // Test z wszystkimi bitami = 0
        data_in = 8'b00000000;
        sel = 3'b000; #10;
        if (out !== 1'b0) $display("Error: all_zeros failed");
        
        // Test z wszystkimi bitami = 1
        data_in = 8'b11111111;
        sel = 3'b111; #10;
        if (out !== 1'b1) $display("Error: all_ones failed");
        
        $display("Test completed");
        $finish;
    end
endmodule 