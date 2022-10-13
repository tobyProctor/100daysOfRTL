module alu_tb ();

    logic clk;
    logic reset;

    logic [7:0] data_a_i,
    logic [7:0] data_b_i,

    logic [3:0] op_i,

    logic [7:0] alu_o

    // Generate clk
    always begin
        clk = 1'b1;
        #1;
        clk = 1'b0;
        #1;
    end

    alu alu1 (.*);
    
    initial begin

        $finish;
    end

    
    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0,alu_tb);
    end

endmodule