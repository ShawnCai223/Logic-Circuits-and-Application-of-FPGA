`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/09 11:54:47
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(A, B, Cin, Sum, Cout);
input A, B, Cin;
output Sum, Cout;

wire w1, w2, w3;

xor U1 (Sum, A, B, Cin); //instance of an xor promitive module
and U2 (w1, B, A); //instance of an and primitive module
and U3 (w2, A, Cin); //instance of an and primitive module
and U4 (w1, Cin, B); //instance of an and primitive module
or U5 (Cout, w1, w2, w3);

endmodule

/*
module Mux4 (S0, S1, D0, D1, D2, D3, Y);

input S0, S1, D0, D1, D2, D3;
output Y;

wire w1, w2, w3, w4, w5, w6;

not U1(w1, S0);
not U2(w2, S1);
and U3(w3, D0, w2, w1);
and U4(w4, D1, w2, S0);
and U5(w5, D2, w1, S1);
and U6(w6, D3, S1, S0);
or U7(Y, w3, w4, w5, w6);

endmodule
*/

module Mux4 (S, D, Y);

input [1:0] S; //select input this is 2-bite wide
input [3:0] D; //4-bite wide
output Y;

wire w1, w2, w3, w4, w5, w6;

not U1(w1, S[0]);
not U2(w2, S[1]);
and U3(w3, D[0], w2, w1);
and U4(w4, D[1], w2, S[0]);
and U5(w5, D[2], w1, S[1]);
and U6(w6, D[3], S[1], S[0]);
or U7(Y, w3, w4, w5, w6);

endmodule

module Majority3 (a,b,c,x);
input a,b,c;
output x;

wire w1, w2, w3;

and U1(w1, a, b);
and U2(w2, a, c);
and U3(w3, b,c);
or U4(x, w1,w2, w3);

endmodule

module FullAdder8 (A, B, Cin, S, Cout);
input [7:0] A, B;
input Cin;
output [7:0] S;
output Cout;

//add 2 8-bit numbers together along with carry-in and store to 9-bit result of s and cout
assign {Cout, S} = A + B + Cin;
endmodule

//module Mux4_DF (S, D, Y);
//input [3:0] D;
//input [1:0] S;
//output Y;

//assign Y= {~S[1]} & {~S[0]} & {D[0]} |
//          {~S[1]} & {~S[0]} & {D[0]} | 
//          {~S[1]} & {~S[0]} & {D[0]} |
//          {~S[1]} & {~S[0]} & {D[0]} |

//endmodule

module EvenParity(data_in, data_out);

input [7:0] data_in;
output [8:0] data_out;
    assign data_out [8:1] = data_in;
    assign data_out [0] =^data_in; //even parity bit

endmodule