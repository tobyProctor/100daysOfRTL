module alu (
  input   wire [7:0] data_a_i,
  input   wire [7:0] data_b_i,

  input   wire [2:0] op_i,

  output  reg  [7:0] alu_o
);

    /*
    ALU Operations:
    3'b000	ADD	-
    3'b001	SUB	-
    3'b010	SLL	- Vector a should left shift using bits 2:0 of vector b
    3'b011	LSR - Vector a should right shift using bits 2:0 of vector b
    3'b100	AND	-
    3'b101	OR	-
    3'b110	XOR	-
    3'b111	EQL	- Output should be 1 when equal otherwise 0
    */
    localparam  ADD = 3'b000;
    localparam  SUB = 3'b001;
    localparam  SLL = 3'b010;
    localparam  LSR = 3'b011;
    localparam  AND = 3'b100;
    localparam  OR  = 3'b101;
    localparam  XOR = 3'b110;
    localparam  EQL = 3'b111;

    // always_comb and case statements not supported in iverilog
    always @(op_i or data_a_i or data_b_i) begin : ALU_logic
      case (op_i)
         ADD : alu_o = data_a_i + data_b_i;
         SUB : alu_o = data_a_i - data_b_i;
         SLL : alu_o = data_a_i << data_b_i[2:0];
         LSR : alu_o = data_a_i >> data_b_i[2:0];
         AND : alu_o = data_a_i & data_b_i;
         OR  : alu_o = data_a_i | data_b_i;
         XOR : alu_o = data_a_i ^ data_b_i;
         EQL : alu_o = {7'h0, data_a_i == data_b_i};
         default : begin
          alu_o = 8'b0;
         end
      endcase
    end

endmodule