`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/01 20:56:29
// Design Name: 
// Module Name: project2
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

module johnson2(CLR, CLK, Q);
input CLR, CLK;
output reg [3:0] Q;
always @ (posedge CLK or posedge CLR)
if(CLR)
Q=4'b0000;
else
Q<={~Q[0],Q[3:1]};
endmodule

