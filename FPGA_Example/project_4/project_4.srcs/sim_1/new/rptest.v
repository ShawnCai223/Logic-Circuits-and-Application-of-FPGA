`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/07 13:04:50
// Design Name: 
// Module Name: rptest
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


module rptest();
reg clk, st; 
wire [3:0] q; 
rpcounter rp (clk, st, q);
initial
begin
    clk=0; st=0;
    #10 clk=~clk; st=1;
    #10 clk=~clk; st=0;
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
    #10 clk=~clk;
    #10 clk=~clk;
    #10 clk=~clk;
    #10 clk=~clk;
    #10 clk=~clk;
    #10 clk=~clk;
    #10 $finish;
end
endmodule
