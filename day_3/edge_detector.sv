module edge_detector (
  input   wire clk,
  input   wire data_i,
  input   wire reset,

  output  reg rising_edge_o
);

    logic data_delayed;

    always_ff @(posedge clk or posedge reset) begin : delay_one_cycle
        if (reset) begin
            data_delayed <= 'b0;
        end else begin
            data_delayed <= data_i;
        end
    end

    assign rising_edge_o = ~data_delayed & data_i;

endmodule