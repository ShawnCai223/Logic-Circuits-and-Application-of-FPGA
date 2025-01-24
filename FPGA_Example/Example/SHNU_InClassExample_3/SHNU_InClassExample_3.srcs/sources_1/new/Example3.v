`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/10 12:02:58
// Design Name: 
// Module Name: Example3
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

module DFF (clk, D, clr, pre, Q, Qnot);// clr, pre are active high

input clk, D, clr, pre;
output reg Q;
output Qnot;

always @ (posedge clk, posedge clr, posedge pre)
begin
	//first look at asyschronous inputs
	if(clr==1'b1)
	begin
	   Q<=1'b0;
	end
	else if (pre==1'b1)
	begin
	   Q<=1'b1;
	end
	else
	begin
	   Q<=D;
	end
end

assign Qnot=~Q;
endmodule


module shiftreg (data_in, clk, clr, load, sc, load_data, data_out);//clr and load are asynchronous inputs
input data_in, clk,clr, load, sc;
input [3:0] load_data;
output data_out;

reg [3:0] R;

always @ (posedge clk, posedge clr, posedge load)
begin
    if (clr==1'b1)
    begin
        R<=0;
    end
    else if(load==1'b1)
    begin
        R<=load_data;
    end
    else
    begin
        if(sc==1'b1)//shift right
        begin
            R<={data_in, R[3:1]};
        end
        else//shift left
        begin
            R<={R[2:0],data_in};
        end
    end
end

assign data_out=(sc==1'b1)?R[0]:R[3];
    
endmodule




