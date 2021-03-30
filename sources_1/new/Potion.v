`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2021 23:14:50
// Design Name: 
// Module Name: Potion
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


module Potion(
    input [6:0] X,
    input [5:0] Y,
    input single_pulse_clk,
    input btnL, btnR, btnU, btnD, btnC,
    input [3:0] state,
    output [15:0] oled_data,
    output done_initialize,
    output potion_ended,
    input [11:0] raw_mic_data, //for randomness
    input loading_clk,
    output [15:0] oled_loading,
    output actualWin,
    input [11:0] freq
    );
    
    wire [7:0] selected; wire[7:0] confirmed; wire[6:0] TIMELEFT;
    wire [2:0] colour1_1,colour2_1,colour3_1,colour4_1;
    wire [2:0] colour1_2,colour2_2,colour3_2,colour4_2;
    wire [2:0] colour1_3,colour2_3,colour3_3,colour4_3;
    wire [2:0] colour1_4,colour2_4,colour3_4,colour4_4; 
    wire [2:0] colour1_5,colour2_5,colour3_5,colour4_5;
    wire [2:0] colour1_6,colour2_6,colour3_6,colour4_6;
    wire [2:0] colour1_7,colour2_7,colour3_7,colour4_7;
    wire [6:0] broken;
    Potion_Display potion_display(
        .X(X),
        .Y(Y),
        .selected(selected), //8bits, each for one boiler
        .colour1_1(colour1_1), .colour2_1(colour2_1), .colour3_1(colour3_1), .colour4_1(colour4_1), //4 colours for first boiler
        .colour1_2(colour1_2), .colour2_2(colour2_2), .colour3_2(colour3_2), .colour4_2(colour4_2),
        .colour1_3(colour1_3), .colour2_3(colour2_3), .colour3_3(colour3_3), .colour4_3(colour4_3),
        .colour1_4(colour1_4), .colour2_4(colour2_4), .colour3_4(colour3_4), .colour4_4(colour4_4),
        .colour1_5(colour1_5), .colour2_5(colour2_5), .colour3_5(colour3_5), .colour4_5(colour4_5),
        .colour1_6(colour1_6), .colour2_6(colour2_6), .colour3_6(colour3_6), .colour4_6(colour4_6),
        .colour1_7(colour1_7), .colour2_7(colour2_7), .colour3_7(colour3_7), .colour4_7(colour4_7),
        .oled_data(oled_data),
        .confirmed(confirmed),
        .TIMELEFT(TIMELEFT),
        .broken(broken)
    );
    
    Potion_Logic potion_logic(
        .single_pulse_clk(single_pulse_clk),
        .btnL(btnL),.btnR(btnR),.btnU(btnU),.btnD(btnD),.btnC(btnC),
        .state(state),.raw_mic_data(raw_mic_data),
        .colour1_1(colour1_1), .colour2_1(colour2_1), .colour3_1(colour3_1), .colour4_1(colour4_1), //4 colours for first boiler
        .colour1_2(colour1_2), .colour2_2(colour2_2), .colour3_2(colour3_2), .colour4_2(colour4_2),
        .colour1_3(colour1_3), .colour2_3(colour2_3), .colour3_3(colour3_3), .colour4_3(colour4_3),
        .colour1_4(colour1_4), .colour2_4(colour2_4), .colour3_4(colour3_4), .colour4_4(colour4_4),
        .colour1_5(colour1_5), .colour2_5(colour2_5), .colour3_5(colour3_5), .colour4_5(colour4_5),
        .colour1_6(colour1_6), .colour2_6(colour2_6), .colour3_6(colour3_6), .colour4_6(colour4_6),
        .colour1_7(colour1_7), .colour2_7(colour2_7), .colour3_7(colour3_7), .colour4_7(colour4_7), 
        .selected(selected),
        .done_initialize(done_initialize),
        .potion_ended(potion_ended),
        .confirmed(confirmed),
        .TIMELEFT(TIMELEFT),
        .freq(freq),
        .actualWin(actualWin),
        .broken(broken)
    );
    
    Loading loading(
        .X(X),
        .Y(Y),
        .clk(loading_clk),
        .oled_data(oled_loading),
        .state(state)
    );
endmodule
