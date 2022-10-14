module siso_shift_register_tb ();

    logic clk;
    logic reset;
    logic si_i;

    logic [7:0] so_o;

    siso_shift_register siso_shift_register1 (.*);
    
    always begin
        clk = 1'b1;
        #1;
        clk = 1'b0;
        #1;
    end

    initial begin
        si_i = 1'b0;
        reset = 1'b0;
        #1;
        reset = 1'b1;
        #1;
        reset = 1'b0;
        #1;

        si_i = 1'b1;
        #2;
        si_i = 1'b0;
        #1;

        for (int i = 0; i < 16; i++) begin
            $display("so_o=%b", so_o);
            #1;
        end
        $finish;
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0,siso_shift_register_tb);
    end

endmodule