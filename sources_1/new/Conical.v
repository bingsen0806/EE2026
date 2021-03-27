`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2021 00:02:18
// Design Name: 
// Module Name: Conical
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


module Conical(
    input[6:0] X, 
    input [5:0] Y, 
    input [6:0] leftX,  
    input [5:0] topY, 
    input [15:0] BACKGROUND,
    output reg [15:0] oled_data = 16'b0,
    input selected
    );
    parameter [15:0] WHITE = 16'b11111_111111_11111;
    parameter [15:0] LIGHTGREY = 16'b10100_101001_10100;
    parameter [15:0] DARKGREY = 16'b01010_010101_01011;
    parameter [15:0] RED = 16'b11111_000000_00000;
    parameter [15:0] BLACK = 16'd0;
    
    reg [15:0] TOP_COLOUR = WHITE;
    
    always @(selected) begin
        TOP_COLOUR = selected ? RED : WHITE;
    end
    
    always @(X or Y) begin
        if ((X ==leftX+7 ||X==leftX+10) && (Y >= topY + 3 && Y <= topY+18)) oled_data = BLACK;
        else if((X ==leftX+8 ||X==leftX+9) && (Y>=topY + 3 && Y <= topY + 7))oled_data = TOP_COLOUR;
        else if((X ==leftX+8 ||X==leftX+9) && (Y>=topY + 6 && Y <= topY + 18)) oled_data = DARKGREY;
        else if (X== leftX + 11 && (Y == topY + 24 || Y == topY + 27)) oled_data = LIGHTGREY; 
        else if(Y == topY) begin
            if (X >= leftX + 5 && X <= leftX + 12) oled_data = BLACK;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 1) begin
            if (X == leftX + 4 || X == leftX + 13) oled_data = BLACK;
            else if (X >= leftX + 5 && X <= leftX + 12) oled_data = TOP_COLOUR;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 2) begin
            if (X == leftX + 5 || X == leftX + 12) oled_data = BLACK;
            else if (X >= leftX + 6 && X <= leftX + 11) oled_data = TOP_COLOUR;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 3) begin
            if (X==leftX + 6||X == leftX + 11) oled_data = BLACK;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 19) begin
            if (X == leftX + 6 || X == leftX + 11) oled_data = BLACK;
            else if (X >= leftX + 7 && X <= leftX + 10) oled_data = DARKGREY;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 20) begin
            if (X == leftX + 5 || X == leftX + 12) oled_data = BLACK;
            else if (X >= leftX + 6 && X <= leftX + 11) oled_data = DARKGREY;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 21) begin
            if (X == leftX + 4 || X == leftX + 13) oled_data = BLACK;
            else if (X >= leftX + 5 && X <= leftX + 12) oled_data = DARKGREY;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 22) begin
            if (X == leftX + 3 || X == leftX + 14) oled_data = BLACK;
            else if (X >= leftX + 4 && X <= leftX + 13) oled_data = DARKGREY;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 23) begin
            if (X == leftX + 2 || X == leftX + 15) oled_data = BLACK;
            else if (X >= leftX + 3 && X <= leftX + 14) oled_data = DARKGREY;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 24 || Y == topY + 28) begin
            if(X==leftX + 1 || X == leftX + 16) oled_data = BLACK;
            else if (X >= leftX + 2 && X <= leftX + 15) oled_data = DARKGREY;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 25 || Y == topY + 26) begin
            if (X==leftX + 4 || X == leftX + 5 ||(X >= leftX + 10&& X <= leftX + 12)) oled_data = LIGHTGREY;
            else if(X==leftX || X == leftX + 17) oled_data = BLACK;
            else oled_data = DARKGREY;
        end else if (Y == topY + 27) begin
            if(X==leftX || X == leftX + 17) oled_data = BLACK;
            else oled_data = DARKGREY;
        end else if (Y == topY + 29) begin
            if(X >= leftX + 2 && X <= leftX + 15) oled_data = BLACK;
            else oled_data = BACKGROUND;
        end else oled_data = BACKGROUND;
    end
endmodule
