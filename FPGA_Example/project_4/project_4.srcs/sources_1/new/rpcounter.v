`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/07 12:36:20
// Design Name: 
// Module Name: rpcounter
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


module rpcounter(CLK, ST, Q);
input CLK, ST;
output [3:0] Q;
Tff tff0(CLK, ST,Q[0]);
Tff tff1(Q[0], ST, Q[1]);
Tff tff2(Q[1], ST, Q[2]);
Tff tff3(Q[2], ST, Q[3]);
endmodule


module Tff (clk, st, qq);
input clk,st;
output qq;
Dff df (clk, st, ~qq, qq);
endmodule


module Dff(clock, reset, d, q);
input clock, reset, d;
output reg q;
always @ (negedge clock or posedge reset)
    if (reset)
        q=1'b0;
    else
        q<=d;
endmodule