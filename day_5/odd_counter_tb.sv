module odd_counter_tb ();

    logic clk;
    logic reset;

    logic [7:0] counter_o;

    odd_counter odd_counter1 (.*);
    
    initial begin
        reset = 1'b0;
        #1;
        reset = 1'b1;
        #1;
        reset = 1'b0;
        #1;

        for (int i = 0; i < 10; i++) begin
            $display("counter_o=%d", counter_o);
            clk = 1'b1;
            #1;
            clk = 1'b0;
            #1;
        end
        $finish;
    end

endmodule