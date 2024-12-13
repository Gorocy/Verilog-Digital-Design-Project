module demux_1_to_n_tb;
    parameter N = 8;
    reg data_in;
    reg [$clog2(N)-1:0] sel;
    wire [N-1:0] out;
    
    demux_1_to_n #(N) uut (
        .data_in(data_in),
        .sel(sel),
        .out(out)
    );
    
    initial begin
        $dumpfile("demux_1_to_n.vcd");
        $dumpvars(0, demux_1_to_n_tb);
        
        // Test wszystkich możliwych selekcji
        data_in = 1'b1;
        
        sel = 3'b000; #10; // Wyjście 0
        if (out !== 8'b00000001) $display("Error: sel=000 failed");
        
        sel = 3'b001; #10; // Wyjście 1
        if (out !== 8'b00000010) $display("Error: sel=001 failed");
        
        sel = 3'b010; #10; // Wyjście 2
        if (out !== 8'b00000100) $display("Error: sel=010 failed");
        
        sel = 3'b111; #10; // Wyjście 7
        if (out !== 8'b10000000) $display("Error: sel=111 failed");
        
        // Test z data_in = 0
        data_in = 1'b0;
        sel = 3'b000; #10;
        if (out !== 8'b00000000) $display("Error: data_in=0 failed");
        
        $display("Test completed");
        $finish;
    end
endmodule 