`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/17 12:39:41
// Design Name: 
// Module Name: project_1
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

module decoder_38(A,Y);
input [2:0] A;
output [7:0] Y;

////use assign
//assign Y[0]=~A[2]&~A[1]&~A[0];
//assign Y[1]=~A[2]&~A[1]&A[0];
//assign Y[2]=~A[2]&A[1]&~A[0];
//assign Y[3]=~A[2]&A[1]&A[0];

//assign Y[4]=A[2]&~A[1]&~A[0];
//assign Y[5]=A[2]&~A[1]&A[0];
//assign Y[6]=A[2]&A[1]&~A[0];
//assign Y[7]=A[2]&A[1]&A[0];

////use for loop
//reg [7:0] Y;
//integer cnt;
//always @ (A)
//begin
//    for(cnt=0; cnt<8; cnt=cnt+1) //set the value for each bit of the output
//        begin
//            if(cnt==A) //check if current bit location equals to the input value
//            begin
//                Y[cnt]=1'b1;
//            end
//            else
//            begin
//                Y[cnt]=1'b0;       
//            end
//        end
//    end

////use continuous assignment
//assign Y=8'b0000_0001<<A;

//use case statement with procedural block
reg [7:0] Y;
always @(A)
    begin
        case(A)
            3'b000: Y=8'b0000_0001;
            3'b001: Y=8'b0000_0010;
            3'b010: Y=8'b0000_0100;
            3'b011: Y=8'b0000_1000;
            3'b100: Y=8'b0001_0000;
            3'b101: Y=8'b0010_0000;
            3'b110: Y=8'b0100_0000;
            3'b111: Y=8'b1000_0000;
            default:Y=8'b0000_0000;
        endcase
    end
    
endmodule