module odd_counter (
  input   wire clk,
  input   wire reset,

  output  reg [7:0] counter_o
);

    always_ff @(posedge clk or posedge reset) begin : counter
        if (reset) begin
            counter_o <= 8'b1;
        end else begin
            counter_o <= counter_o + 8'h2;
        end
    end

endmodule