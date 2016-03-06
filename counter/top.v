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
module top(input clk_200mhz, input button, output led_0);
wire clk_200mhz;
wire button;
reg led_0;

reg [4:0] count_reg = 0;

always @(posedge clk_10mhz_out) begin
   if (button) begin
	   if (count_reg != 5'b11111) begin
		    count_reg <= count_reg + 1;
		end else begin
	       count_reg <= 0;
		end
	end
end

freq d(clk_200mhz, clk_10mhz_out);

endmodule