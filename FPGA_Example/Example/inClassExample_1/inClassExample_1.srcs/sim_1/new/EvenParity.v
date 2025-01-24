`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/21 12:33:45
// Design Name: 
// Module Name: EvenParity
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


module EvenParity(data_in, data_out);

input [7:0] data_in;
output [8:0] data_out;
    assign data_out [8:1] = data_in;
    assign data_out [0] =^data_in; //even parity bit

endmodule
