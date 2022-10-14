module siso_shift_register (
  input   wire clk,
  input   wire reset,

  input   wire si_i,

  output  reg [7:0] so_o
);

    always_ff @(posedge clk or posedge reset) begin : counter
        if (reset) begin
            so_o <= 8'b0;
        end else begin
            so_o <= {so_o, si_i};
        end
    end

endmodule