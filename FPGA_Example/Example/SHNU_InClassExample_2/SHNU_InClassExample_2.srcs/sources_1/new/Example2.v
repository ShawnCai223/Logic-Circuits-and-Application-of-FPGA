`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/09 08:58:16
// Design Name: 
// Module Name: Example2
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
module Bin8ToBCD(clk, bin, out, an);
input clk;
input [7:0] bin;
output reg [6:0] out;
output reg [3:0] an;

reg [19:0] count; //20-bit counter to divide 100 MHz clock frequency for selecting 7-segment display

wire [1:0] pos;
wire [3:0] ones, tens, hunds;
wire [6:0] seg7ones, seg7tens, seg7hunds;

bin2BCD U1 (.bin(bin), .ones(ones), .tens(tens), .hunds(hunds));
Seg7 U2 (.BCD(ones),.out(seg7ones));
Seg7 U3 (.BCD(tens),.out(seg7tens));
Seg7 U4 (.BCD(hunds),.out(seg7hunds));

always @(posedge clk) //create a 20-bit free running binary counter 
begin
    count<=count+1;
end

assign pos=count[19:18]; //use upper 2-bit of counter for mux select input, too fast would not show clear and too slow would blink

always @ (pos,seg7ones, seg7tens, seg7hunds)
begin
    //implement mux for 7 segment display
    case(pos)
        2'b00://ones
            begin
                out=seg7ones;
                an=4'b1110;
            end
        2'b01://tens
            begin
                out=seg7tens;
                an=4'b1101;
            end
        2'b10://hunds
            begin
                out=seg7hunds;
                an=4'b1011;
            end
        2'b11://thousands
            begin
                out=7'b1111111;
                an=4'b0111;
            end
       endcase
       
end

endmodule

module bin2BCD(bin, ones, tens, hunds);
input [7:0] bin;
output [3:0] ones, tens, hunds;

reg [19:0] temp; //temporary register to hold 8-bit binary input and BCD output during shifting and add 3 process

integer cnt; //control variable for the for loop

always @ (bin)
begin
    temp={12'b0, bin}; //concatinate 12 bits of 0 with binary input and store to temp register
    
    //perform the shift and add 3 algorithm 8 times
    for (cnt=0; cnt<8; cnt=cnt+1)
    begin
        temp = temp << 1;//shift temp register to left by 1
        if(cnt<7)//first shifts
        begin
            //test each BCD output >=5
            if(temp[11:8]>=5)//if ones digit >=5
            begin
                temp[11:8]=temp[11:8]+3;
            end
            if(temp[15:12]>=5)//if tens digit >=5
            begin
                temp[15:12]=temp[15:12]+3;
            end
            if(temp[19:16]>=5)//if hunds digit >=5
            begin
                temp[19:16]=temp[19:16]+3;
            end
        end
     end
end

assign ones=temp[11:8];
assign tens=temp[15:12];
assign hunds=temp[19:16];    

endmodule

module Seg7 (BCD, out);
input [3:0] BCD;
output reg [6:0] out;

always @ (BCD)
begin
    case(BCD) //care about the lsb and msb
        4'b0000:out=7'b1000000;
        4'b0001:out=7'b1111001;
        4'b0010:out=7'b0100100;
        4'b0011:out=7'b0110000;
        4'b0100:out=7'b0011001;
        4'b0101:out=7'b0010010;
        4'b0110:out=7'b0000010;
        4'b0111:out=7'b1111000;
        4'b1000:out=7'b0000000;
        4'b1001:out=7'b0010000;
        default: out=7'b1111111; //turn off display if invalid number
        endcase
end

endmodule



