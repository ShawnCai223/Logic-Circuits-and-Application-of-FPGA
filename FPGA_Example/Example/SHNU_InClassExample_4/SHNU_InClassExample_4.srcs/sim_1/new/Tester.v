`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/07 18:18:39
// Design Name: 
// Module Name: Tester
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


module Tester();
parameter N=3;
reg CLK, EN, SEED;
reg [N-1:0] SEED_DATA;
wire [N-1:0] LFSR_DATA;
wire REPEAT;

//create n 8-bit LFSR instance
LFSR #(.n(N)) UUT(.clk(CLK), .en(EN), .seed(SEED), .seed_data(SEED_DATA), .LFSR_data(LFSR_DATA), .Repeat(REPEAT));
initial
begin
    CLK=0;
    EN=0;
    SEED=0;
    SEED_DATA=3'b100;
    #10;
    EN=1;
    SEED=1;
    #20;
    SEED=0;
end

always
begin
    #5;
    CLK=~CLK;
end
endmodule
