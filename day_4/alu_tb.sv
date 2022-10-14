module alu_tb ();

    logic [7:0] data_a_i;
    logic [7:0] data_b_i;

    logic [2:0] op_i;

    logic [7:0] alu_o;

    alu alu1 (.*);
    
    initial begin
        for (int i = 0; i < 10; i++) begin
            data_a_i = $urandom_range (0, 8'hFF);
            data_b_i = $urandom_range (0, 8'hFF);
            op_i = $urandom_range (0, 3'b111);
            #1;
            $display("data_a_i=%d data_b_i=%d op_i=%d, alu_o=%d", data_a_i, data_b_i, op_i, alu_o);
        end
        $finish;
    end

    
    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0,alu_tb);
    end

endmodule