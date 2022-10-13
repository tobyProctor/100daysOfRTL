module edge_detector (
  input   wire clk,
  input   wire reset,

  input   wire [7:0] data_a_i,
  input   wire [7:0] data_b_i,

  input   wire [3:0] op_i,

  output  reg  [7:0] alu_o
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