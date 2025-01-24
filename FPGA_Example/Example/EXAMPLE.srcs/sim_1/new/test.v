`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/09 10:33:59
// Design Name: 
// Module Name: test
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

module Tester();//testbench to test the non-blocking SR4
reg din, clk;
wire [3:0] dout, dout2;
SR4_NB UUT (.din(din), .clk(clk), .dout(dout));
SR4_B UUT2 (.din(din), .clk(clk), .dout(dout2));
initial
begin
    clk=1'b0;
    din=1'b1;
end
always//run continuously to generate clokck signal
begin
      #5;
      clk=~clk;  
end
endmodule


//module Tester();//testbench to test the 8-bit full adder
//reg [7:0] a,b;
//reg cin;
//wire [7:0] sum;
//wire cout;
//FullAdder8 UUT (.A(a), .B(b), .Cin(cin), .S(sum), .Cout(cout));
//initial
//begin
//    a=8'b10101010;
//    b=8'b10101010;
//    cin=1'b0;
//    #10;
//    a=8'b11110000;
//    b=8'b00001111;
//    cin=1'b0;
//    #10;
//    a=8'b11001100;
//    b=8'b10101010;
//    cin=1'b0;
//    #10;
//    a=8'b10110110;
//    b=8'b00110010;
//    cin=1'b0;
//    #10;
//end
//endmodule


//module Tester();//testbench to test the EvenParity module
//wire [8:0] d_out;
//reg [7:0] d_in;
//EvenParity UUT(.data_in(d_in),.data_out(d_out));
//initial 
//begin
//    d_in=8'b10101010;
//    #10;
//    d_in=8'b10101000;
//    #10;
//end
//endmodule


//module Tester(   );//testbench to test Majority3 module
//wire X;
//reg A,B,C;
//Majority3 UUT (A,B,C,X); //create instance of Majority3 module for testing
//initial
//begin
//    A=0;
//    B=0;
//    C=0;
//    #10 //simulate 10 units of delay
//    A=0;
//    B=0;
//    C=1;
//    #10 //simulate 10 units of delay
//    A=0;
//    B=1;
//    C=0;
//    #10 //simulate 10 units of delay
//    A=0;
//    B=1;
//    C=1;
//    #10 //simulate 10 units of delay
//    A=1;
//    B=0;
//    C=0;
//    #10 //simulate 10 units of delay
//    A=1;
//    B=0;
//    C=1;
//    #10 //simulate 10 units of delay
//    A=1;
//    B=1;
//    C=0;
//    #10 //simulate 10 units of delay
//    A=1;
//    B=1;
//    C=1;
//end
//endmodule


//module Tester();  //create n 8-bit LFSR instance
//parameter N=3;
//reg CLK, EN, SEED;
//reg [N-1:0] SEED_DATA;
//wire [N-1:0] LFSR_DATA;
//wire REPEAT;
//LFSR #(.n(N)) UUT(.clk(CLK), .en(EN), .seed(SEED), .seed_data(SEED_DATA), .LFSR_data(LFSR_DATA), .Repeat(REPEAT));
//initial
//begin
//    CLK=0;
//    EN=0;
//    SEED=0;
//    SEED_DATA=3'b100;
//    #10;
//    EN=1;
//    SEED=1;
//    #20;
//    SEED=0;
//end
//always
//begin
//    #5;
//    CLK=~CLK;
//end
//endmodule

