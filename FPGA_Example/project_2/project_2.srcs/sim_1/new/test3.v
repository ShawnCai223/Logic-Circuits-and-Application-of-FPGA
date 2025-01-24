`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/01 20:58:39
// Design Name: 
// Module Name: test3
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

module testjohnson2();
wire [3:0] q;
reg clk, clr;
johnson2 u2 (clr, clk, q);
initial 
begin
clk=0; clr=0;
#10 clr=1;
#10 clr=0;clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10 clk=~clk;
#10;
end
endmodule

