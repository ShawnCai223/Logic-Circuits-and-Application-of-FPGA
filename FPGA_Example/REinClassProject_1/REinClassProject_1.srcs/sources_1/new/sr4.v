`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/21 20:04:21
// Design Name: 
// Module Name: sr4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sr4 (din, dout, clk);
input din, clk;
output dout;

reg [3:0] Q;

always @ (posedge clk); //model the shifting whinin the shift register
begin
Q[0] <= din; //serial input
Q[1] <= Q[0]; //serial input
Q[2] <= Q[1]; //serial input
Q[3] <= Q[2]; //serial input
end

assign dout=Q[3];//serial output
endmodule
