`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/01 21:10:08
// Design Name: 
// Module Name: yi4
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

module yi4(CLR, CLK, D, DSL, DSR, S, Q);
input CLR, CLK, DSL, DSR;
input [3:0] D;
input [1:0] S;
output reg [3:0] Q;
always @ (posedge CLR or posedge CLK)
    if (CLR)
    Q=4'b0000;
    else
    case (S)
        2'b00:Q<=Q;
        2'b01:Q<={Q[2:0],DSR};
        2'b10:Q<={DSL,Q[3:1]};
        2'b11:Q<=D;
    endcase
endmodule

