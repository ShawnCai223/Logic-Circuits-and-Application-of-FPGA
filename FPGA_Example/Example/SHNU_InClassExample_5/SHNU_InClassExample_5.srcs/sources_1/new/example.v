`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/08 23:10:21
// Design Name: 
// Module Name: example
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


module MooreEdgeDetect(clk, in, reset, f_e, r_e);
localparam RESET=0, LOW=1, HIGH=2, RISING=3, FALLING=4; //or change it to parameter and upon the module
input clk, in, reset;
output reg f_e, r_e;

reg [2:0] state, nextstate;
always @ (posedge clk)
begin
    if(reset==1'b1)
    begin
        state<=RESET;
    end
    else
    begin
        state<=nextstate;
    end
end

always @ (*)//next state and output functions
begin
    nextstate=state;//default set next state to current state
    r_e=1'b0;
    f_e=1'b0;
    
    case(state)
        RESET:begin
                if (in==1'b0)
                begin
                    nextstate<=LOW;
                end
                else
                begin
                    nextstate<=HIGH;
                end
              end
        LOW:begin
                if (in==1'b1)
                begin
                    nextstate<=RISING;
                end
             end
        HIGH:begin
                if (in==1'b0)
                begin
                    nextstate<=FALLING;
                end
             end
        RISING:begin
                r_e=1'b1; //set the rising edge flag to 1
                if (in==1'b0)
                begin
                    nextstate<=FALLING;
                end
                else
                begin
                    nextstate<=HIGH;
                end
             end
        FALLING:begin
                f_e=1'b1; //set the falling edge flag to 1
                if (in==1'b0)
                begin
                    nextstate<=LOW;
                end
                else
                begin
                    nextstate<=RISING;
                end
             end
        default:begin
                nextstate=RESET;
                end
    endcase
end
endmodule

module MealyEdgeDetect(clk, in, reset, f_e, r_e);
localparam RESET=0, LOW=1, HIGH=2; //or change it to parameter and upon the module
input clk, in, reset;
output reg f_e, r_e;

reg [1:0] state, nextstate;
always @ (posedge clk)
begin
    if(reset==1'b1)
    begin
        state<=RESET;
    end
    else
    begin
        state<=nextstate;
    end
end

always @ (*)//next state and output functions
begin
    nextstate=state;//default set next state to current state
    r_e=1'b0;
    f_e=1'b0;
    
    case(state)
        RESET:begin
                if (in==1'b0)
                begin
                    nextstate<=LOW;
                end
                else
                begin
                    nextstate<=HIGH;
                end
              end
        LOW:begin
                if (in==1'b1)
                begin
                    nextstate<=HIGH;
                    r_e=1'b1; //set rising edge flag
                end
             end
        HIGH:begin
                if (in==1'b0)
                begin
                    nextstate<=LOW;
                    f_e=1'b1;
                end
             end
       
        default:begin
                nextstate=RESET;
                end
    endcase
end
endmodule
