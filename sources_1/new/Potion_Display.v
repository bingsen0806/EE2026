`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2021 23:14:30
// Design Name: 
// Module Name: Potion_Display
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


module Potion_Display(
    input [6:0] X,
    input [5:0] Y,
    input [7:0] confirmed,
    input [7:0] selected, //8bits, each for one boiler
    input [2:0] colour1_1, colour2_1, colour3_1, colour4_1, //4 colours for first boiler
    input [2:0] colour1_2, colour2_2, colour3_2, colour4_2,
    input [2:0] colour1_3, colour2_3, colour3_3, colour4_3,
    input [2:0] colour1_4, colour2_4, colour3_4, colour4_4,
    input [2:0] colour1_5, colour2_5, colour3_5, colour4_5,
    input [2:0] colour1_6, colour2_6, colour3_6, colour4_6,
    input [2:0] colour1_7, colour2_7, colour3_7, colour4_7, //7th boiler
    output [15:0] oled_data,
    input [6:0] TIMELEFT,
    input [6:0] broken
    );
    //parameter [15:0] GREEN4 = 16'b10110_111010_10100;
    
    parameter [15:0] TIME100 = 16'b10110_111010_10100;
    parameter [15:0] TIME85 = 16'b10011_110111_10001;
    parameter [15:0] TIME70 = 16'b10000_110100_01110;
    parameter [15:0] TIME55 = 16'b01100_110000_01010;
    parameter [15:0] TIME40 = 16'b11101_111000_01101; //below here is orange
    parameter [15:0] TIME30 = 16'b11011_101111_01001;
    parameter [15:0] TIME20 = 16'b11011_100110_01001; 
    parameter [15:0] TIME15 = 16'b11110_011101_01001;  //below here is red
    parameter [15:0] TIME10 = 16'b11100_011000_00111;
    parameter [15:0] TIME5 = 16'b11000_010000_00100;
    reg [15:0] BACKGROUND = TIME100;
    always @(TIMELEFT) begin
        BACKGROUND = (TIMELEFT >= 85) ? TIME100:
                     (TIMELEFT >= 70) ? TIME85:
                     (TIMELEFT >= 55) ? TIME70:
                     (TIMELEFT >= 40) ? TIME55:
                     (TIMELEFT >= 30) ? TIME40:
                     (TIMELEFT >= 20) ? TIME30:
                     (TIMELEFT >= 15) ? TIME20:
                     (TIMELEFT >= 10) ? TIME15:
                     (TIMELEFT >= 5) ? TIME10: TIME5;
    end
    wire [15:0] oled_b1, oled_b2, oled_b3, oled_b4, oled_b5, oled_b6, oled_b7, oled_conical;
    
    Boiler boiler1(.X(X),.Y(Y),.leftX(7'd4),.topY(6'd1),.BACKGROUND(BACKGROUND),.selected(selected[0]),.confirmed(confirmed[0]),.colour1(colour1_1),.colour2(colour2_1),.colour3(colour3_1),.colour4(colour4_1),.oled_data(oled_b1),.broken(broken[0]));
    Boiler boiler2(.X(X),.Y(Y),.leftX(7'd26),.topY(6'd1),.BACKGROUND(BACKGROUND),.selected(selected[1]),.confirmed(confirmed[1]),.colour1(colour1_2),.colour2(colour2_2),.colour3(colour3_2),.colour4(colour4_2),.oled_data(oled_b2),.broken(broken[1]));
    Boiler boiler3(.X(X),.Y(Y),.leftX(7'd48),.topY(6'd1),.BACKGROUND(BACKGROUND),.selected(selected[2]),.confirmed(confirmed[2]),.colour1(colour1_3),.colour2(colour2_3),.colour3(colour3_3),.colour4(colour4_3),.oled_data(oled_b3),.broken(broken[2]));
    Boiler boiler4(.X(X),.Y(Y),.leftX(7'd70),.topY(6'd1),.BACKGROUND(BACKGROUND),.selected(selected[3]),.confirmed(confirmed[3]),.colour1(colour1_4),.colour2(colour2_4),.colour3(colour3_4),.colour4(colour4_4),.oled_data(oled_b4),.broken(broken[3]));
    Boiler boiler5(.X(X),.Y(Y),.leftX(7'd4),.topY(6'd33),.BACKGROUND(BACKGROUND),.selected(selected[4]),.confirmed(confirmed[4]),.colour1(colour1_5),.colour2(colour2_5),.colour3(colour3_5),.colour4(colour4_5),.oled_data(oled_b5),.broken(broken[4]));
    Boiler boiler6(.X(X),.Y(Y),.leftX(7'd26),.topY(6'd33),.BACKGROUND(BACKGROUND),.selected(selected[5]),.confirmed(confirmed[5]),.colour1(colour1_6),.colour2(colour2_6),.colour3(colour3_6),.colour4(colour4_6),.oled_data(oled_b6),.broken(broken[5]));
    Boiler boiler7(.X(X),.Y(Y),.leftX(7'd48),.topY(6'd33),.BACKGROUND(BACKGROUND),.selected(selected[6]),.confirmed(confirmed[6]),.colour1(colour1_7),.colour2(colour2_7),.colour3(colour3_7),.colour4(colour4_7),.oled_data(oled_b7),.broken(broken[6]));
    Conical conical(.X(X),.Y(Y),.leftX(7'd70),.topY(6'd33),.BACKGROUND(BACKGROUND),.selected(selected[7]),.oled_data(oled_conical));
    
    assign oled_data = (X >= 7'd4 && X <= 7'd21 && Y >= 6'd1 && Y <= 6'd30) ? oled_b1:
                       (X >= 7'd26 && X <= 7'd43 && Y >= 6'd1 && Y <= 6'd30) ? oled_b2:
                       (X >= 7'd48 && X <= 7'd65 && Y >= 6'd1 && Y <= 6'd30) ? oled_b3:
                       (X >= 7'd70 && X <= 7'd87 && Y >= 6'd1 && Y <= 6'd30) ? oled_b4:
                       (X >= 7'd4 && X <= 7'd21 && Y >= 6'd33 && Y <= 6'd62) ? oled_b5:
                       (X >= 7'd26 && X <= 7'd43 && Y >= 6'd33 && Y <= 6'd62) ? oled_b6:
                       (X >= 7'd48 && X <= 7'd65 && Y >= 6'd33 && Y <= 6'd62) ? oled_b7:
                       (X >= 7'd70 && X <= 7'd87 && Y >= 6'd33 && Y <= 6'd62) ? oled_conical:
                       BACKGROUND;
                       
endmodule
