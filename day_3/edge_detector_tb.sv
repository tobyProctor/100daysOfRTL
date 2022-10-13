module edge_detector_tb ();

    logic clk;
    logic reset;
    logic data_i;

    logic rising_edge_o;

    // Generate clk
    always begin
        clk = 1'b1;
        #1;
        clk = 1'b0;
        #1;
    end

    edge_detector edge_detector1 (.*);
    
    initial begin
        #3;
        reset = 1'b0;
        data_i = 1'b0;
        #1;
        reset = 1'b1;
        #1;
        reset = 1'b0;
        #1;

        #3;
        data_i = 1'b1;
        #6;

        $finish;
    end

    
    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0,edge_detector_tb);
    end

endmodule