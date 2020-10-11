
module INSTR_DATA(
	input clk,
	input wire[31:0] instruction,
	output reg[2:0] instr_type,
	output reg[3:0] data_instr_type
    );


	always@(posedge clk) begin
		 instr_type = instruction[27] && !instruction[26] ? 2'b11 :
								  !instruction[27] && instruction[26] ? 2'b10 :
								  !instruction[27] && !instruction[26] ? 2'b01:
								  2'b00;
								  
		 data_instr_type = instruction[25] ? 3'b001 :
										  !instruction[25] && !instruction[4] ? 3'b010 : 
										  instruction[25] && !instruction[7] && instruction[4] ? 3'b011 : 
										  !instruction[25] && !instruction[24] && !instruction[7] && 
										  instruction[6] && instruction[5] && !instruction[4] ? 3'b100 : 
										  3'b000;
		 end

endmodule