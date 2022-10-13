module async_ff_tb ();
    // in
    logic clk;
    logic reset;
    logic [7:0] in_data;
    // out
    logic [7:0] sync_out_data;
    logic [7:0] async_out_data;


    // Generate clk
    always begin
        clk = 1'b1;
        #5;
        clk = 1'b0;
        #5;
    end

    always begin
        in_data = in_data + 1'b1;
        #10;
    end

    async_ff async_ff1 (.*);

    initial begin
        in_data = 'b0;
        $display("sync_out_data=%b async_out_data=%b in_data=%b", sync_out_data, async_out_data, in_data);
        #20;

        $display("sync_out_data=%b async_out_data=%b in_data=%b", sync_out_data, async_out_data, in_data);
        #1;
        reset = 'b0;
        #1;
        reset = 'b1;
        #1;
        reset = 'b0;
        #1;
        $display("sync_out_data=%b async_out_data=%b in_data=%b", sync_out_data, async_out_data, in_data);

        #20;
        $display("sync_out_data=%b async_out_data=%b in_data=%b", sync_out_data, async_out_data, in_data);
        #20;

        $display("sync_out_data=%b async_out_data=%b in_data=%b", sync_out_data, async_out_data, in_data);
        #1;
        reset = 'b0;
        #1;
        reset = 'b1;
        #5;
        reset = 'b0;
        #1;
        $display("sync_out_data=%b async_out_data=%b in_data=%b", sync_out_data, async_out_data, in_data);

        $finish;
    end

endmodule