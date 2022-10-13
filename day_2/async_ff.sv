module async_ff (
  input   wire clk,
  input   wire reset,
  input   wire [7:0] in_data,

  output  reg [7:0] sync_out_data,
  output  reg [7:0] async_out_data
);

always_ff @(posedge clk) begin : sync_reset
    if (reset) begin
        sync_out_data <= 'b0;
    end else begin
        sync_out_data <= in_data;
    end
end

always_ff @(posedge clk or posedge reset) begin : async_reset
    if (reset) begin
        async_out_data <= 'b0;
    end else begin
        async_out_data <= in_data;
    end
end

endmodule