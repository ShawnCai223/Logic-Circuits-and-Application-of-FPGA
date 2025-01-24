`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/07 17:46:21
// Design Name: 
// Module Name: LFSR
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


module LFSR(clk, en, seed, seed_data, LFSR_data, Repeat);
parameter n=4; //default width of LFSR is 4-bit
input clk, en, seed;
input [n-1:0] seed_data;
output Repeat;
output [n-1:0] LFSR_data;

reg [n-1:0] LFSR;
reg XOR; //output from linear function

always @ (posedge clk, posedge en)
begin
    if(en==1'b1)//LFSR is enabled
    begin
        if(seed==1'b1)//seeding the LFSR
        begin
            LFSR<=seed_data;//parallel load the LFSR register
        end
        else//not sedding, just shifting
        begin
            LFSR<={LFSR[n-1:0],XOR};//shift LFSR with linear function (XOR) output
        end
    end
    else //LFSR is not enabled
    begin
        LFSR<=0;//clear LFSR when not enabled
    end
end

//create the linear function for feedback of XOR value
always @ *
begin
    case(n)
        3:XOR=LFSR[0]^LFSR[2];
        4:XOR=LFSR[0]^LFSR[3];
        5:XOR=LFSR[1]^LFSR[4];
        6:XOR=LFSR[0]^LFSR[5];
        7:XOR=LFSR[0]^LFSR[6];
        8:XOR=LFSR[1]^LFSR[2]^LFSR[3]^LFSR[7];
        9:XOR=LFSR[3]^LFSR[8];
        10:XOR=LFSR[2]^LFSR[9];
        11:XOR=LFSR[1]^LFSR[10];
        12:XOR=LFSR[0]^LFSR[3]^LFSR[5]^LFSR[11];
        13:XOR=LFSR[0]^LFSR[2]^LFSR[3]^LFSR[12];
        14:XOR=LFSR[0]^LFSR[2]^LFSR[4]^LFSR[13];
        15:XOR=LFSR[0]^LFSR[14];
        16:XOR=LFSR[1]^LFSR[2]^LFSR[4]^LFSR[15];
     endcase
end
assign LFSR_data=LFSR;
assign Repeat={LFSR==seed_data}?1'b1:1'b0;//set Repeat to 1 whenever LFSR register equals the initial seed data (repeats)
endmodule
