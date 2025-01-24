`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/14 18:02:48
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
//module Tester();
//wire [7:0] sum;
//wire cout;
//reg [7:0] a, b;
//reg cin;
//FullAdder8 UUT (.A(A), .B(b), .Cin(cin), .S(sum), .Cout(cout));
//initial
//begin
//    a=8'b10101010;
//    b=8'b10101010;
//    cin=1'b0;
//    #10;
//    a=8'b10101010;
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
    

//module Tester();//testbench to test the Majority3 module

//wire X; 
//reg A, B, C;

//Majority3 UUT (A, B, C, X); //UUT: unit under test; create instance of Majority3 module for testing

//initial
//begin
//    A=0;
//    B=0;
//    C=0;
//    #10 //simulate 10 units of delay
//    A=1;
//    B=0;
//    C=0;
//    #10 //simulate 10 units of delay
//    A=0;
//    B=1;
//    C=0;
//    #10 //simulate 10 units of delay
//    A=1;
//    B=1;
//    C=0;
//    #10 //simulate 10 units of delay
//    A=0;
//    B=0;
//    C=1;
//    #10 //simulate 10 units of delay
//    A=1;
//    B=0;
//    C=1;
//    #10 //simulate 10 units of delay
//    A=0;
//    B=1;
//    C=1;
//    #10 //simulate 10 units of delay
//    A=1;
//    B=1;
//    C=1;

//end


//endmodule


module Tester ();

wire [8:0] data_out;
reg [7:0] data_in;
EvenParity UUT(.data_in(data_in), .data_out(data_out));

initial;
begin
    data_in = 8'b10101010;
    #10
    data_in = 8'b10101000;
    #10
end

endmodule
