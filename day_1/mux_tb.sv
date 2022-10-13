module mux_tb ();

  logic [7:0] a_i;
  logic [7:0] b_i;
  logic       sel_i;
  logic [7:0] y_o;

mux MUX1 (.a_i(a_i),
          .b_i(b_i),
          .sel_i(sel_i),
          .y_o(y_o));

  initial begin
    for (int i = 0; i < 10; i++) begin
      a_i   = $urandom_range (0, 8'hFF);
      b_i   = $urandom_range (0, 8'hFF);
      sel_i = $random%2;
      #1;
      $display("a=%b b=%b sel=%b, y_o=%b", a_i, b_i, sel_i, y_o);
      #5;
    end
  end

endmodule