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
    input [11:0] freq,
    output reg [3:0] an,
    output reg [7:0] seg,
    input seg_clk //400Hz
    );
    reg [1:0] count = 2'b00;
    reg [7:0] segment [3:0]; //this variable array will be changed according to volume level
    reg [7:0] segment_const [9:0]; //this is a constant array (e.g. segment_const[4] is the 8-bit value that shows "4" on the display)
    initial begin //just to initialize segment_const
        segment_const[0] = 8'b11000000; // Number 0
        segment_const[1] = 8'b11111001;
        segment_const[2] = 8'b10100100;
        segment_const[3] = 8'b10110000;
        segment_const[4] = 8'b10011001;
        segment_const[5] = 8'b10010010;
        segment_const[6] = 8'b10000010;
        segment_const[7] = 8'b11111000;
        segment_const[8] = 8'b10000000;
        segment_const[9] = 8'b10010000;
    end
    wire [7:0] selected; wire[7:0] confirmed; wire[6:0] TIMELEFT;
    wire [2:0] colour1_1,colour2_1,colour3_1,colour4_1;
    wire [2:0] colour1_2,colour2_2,colour3_2,colour4_2;
    wire [2:0] colour1_3,colour2_3,colour3_3,colour4_3;
    wire [2:0] colour1_4,colour2_4,colour3_4,colour4_4; 
    wire [2:0] colour1_5,colour2_5,colour3_5,colour4_5;
    wire [2:0] colour1_6,colour2_6,colour3_6,colour4_6;
    wire [2:0] colour1_7,colour2_7,colour3_7,colour4_7;
    wire [6:0] broken;
    wire [9:0] actual_score;
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
        .broken(broken),
        .actual_score(actual_score)
    );
    
    Loading loading(
        .X(X),
        .Y(Y),
        .clk(loading_clk),
        .oled_data(oled_loading),
        .state(state)
    );



    always @(posedge loading_clk) begin
        segment[0] <= segment_const[actual_score/1000];
        segment[1] <= segment_const[(actual_score%1000)/100];
        segment[2] <= segment_const[(actual_score%100)/10];
        segment[3] <= segment_const[actual_score%10]; 
    end

    always @(posedge seg_clk) begin
        count <= count + 1;
        case (count)
        2'b00: begin
            an <= 4'b0111; 
            seg <= segment[0];
            end
        2'b01: begin
            an <= 4'b1011; 
            seg <= segment[1];
            end
        2'b10: begin
            an <= 4'b1101;
            seg <= segment[2];
            end
        2'b11: begin
            an <= 4'b1110;
            seg <= segment[3];
            end
        endcase
    end
endmodule
