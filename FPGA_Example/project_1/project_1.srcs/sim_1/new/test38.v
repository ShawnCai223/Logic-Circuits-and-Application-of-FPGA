`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/17 12:57:23
// Design Name: 
// Module Name: test38
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


module test38();
reg [2:0] a;
wire [7:0] y;

decoder_38 uu1 (a,y);
initial 
begin
a=3'b000;
#10 a=3'b001;
#10 a=3'b010;
#10 a=3'b011;
#10 a=3'b100;
#10 a=3'b101;
#10 a=3'b110;
#10 a=3'b111;
#10 $finish;
end

endmodule
