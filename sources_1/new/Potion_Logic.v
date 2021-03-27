`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2021 23:14:09
// Design Name: 
// Module Name: Potion_Logic
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


module Potion_Logic(
    input single_pulse_clk,
    input btnL, btnR, btnU, btnD, btnC,
    input [3:0] state,
    input [11:0] raw_mic_data,
    output reg done_initialize = 0,
    output reg potion_ended = 0,
    output [2:0] colour1_1, colour2_1, colour3_1, colour4_1,
    output [2:0] colour1_2, colour2_2, colour3_2, colour4_2,
    output [2:0] colour1_3, colour2_3, colour3_3, colour4_3,
    output [2:0] colour1_4, colour2_4, colour3_4, colour4_4,
    output [2:0] colour1_5, colour2_5, colour3_5, colour4_5,
    output [2:0] colour1_6, colour2_6, colour3_6, colour4_6,
    output [2:0] colour1_7, colour2_7, colour3_7, colour4_7,
    output reg [7:0] selected = 8'b00000001
    );
endmodule
