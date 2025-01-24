`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/01 21:10:55
// Design Name: 
// Module Name: testyi4
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


module testyi4();

reg clr, clk, dsl, dsr;
reg [3:0] d;
reg [1:0] s;
wire [3:0] q;
yi4 uu1 (.CLR(clr), .CLK(clk), .DSL(dsl), .DSR(dsr), .D(d), .S(s), .Q(q));
initial
begin
    clr=0; clk=0; d=4'b1011; s=2'b00; dsl=1; dsr=0;
    #10 clk=~clk; s=2'b11;
    #10 clk=~clk;
    #10 clk=~clk; s=2'b10;
    #10 clk=~clk;
    #10 clk=~clk; s=2'b01;
    #10 clk=~clk;
    #10 clk=~clk; s=2'b00;
    #10 clk=~clk;
    #10 clr=1;
    #10 $finish;
    end

endmodule

