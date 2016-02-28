`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:58:15 02/28/2016 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(clk_200mhz, led_0);
input clk_200mhz;
output led_0;
wire clk_200mhz;
reg led_0;

reg [4:0] count_reg = 0;
reg q0 = 0;
reg q1 = 0;

always @(posedge clk_200mhz) begin
	  if (count_reg < 24) begin
			count_reg <= count_reg + 1;
	  end else begin
			count_reg <= 0;
	  end
	  q0 <= count_reg < 12;
	  q1 <= count_reg < 13;
end

always @(posedge clk_10mhz_out or negedge clk_10mhz_out) begin
if (clk_10mhz_out) begin
		led_0 = 1;
	end else begin
		led_0 = 0;
	end
end

devide d(clk_10mhz_out, clk_200mhz, q0, q1);

endmodule

module devide(clk_10mhz_out, clk_200mhz, q0, q1, );
output clk_10mhz_out;
input clk_200mhz, q0, q1;

   // Clock forwarding circuit using the double data-rate register
   //       Virtex-4/5/6
   // Xilinx HDL Language Template, version 14.7

   ODDR2 #(
      .DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1" 
      .INIT(1'b0),    // Sets initial state of the Q output to 1'b0 or 1'b1
      .SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
   ) clock_forward_inst (
      .Q(clk_10mhz_out),     // 1-bit DDR output data
      .C0(clk_200mhz),  // 1-bit clock input
      .C1(~clk_200mhz), // 1-bit clock input
      .CE(1),      // 1-bit clock enable input
      .D0(q0), // 1-bit data input (associated with C0)
      .D1(q1), // 1-bit data input (associated with C1)
      .R(0),   // 1-bit reset input
      .S(0)   // 1-bit set input
   );

   // End of clock_forward_inst instantiation

endmodule