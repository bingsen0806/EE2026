`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2021 21:15:31
// Design Name: 
// Module Name: Boiler
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


module Boiler(
    input[6:0] X, 
    input [5:0] Y, 
    input [6:0] leftX,  
    input [5:0] topY, 
    input [15:0] BACKGROUND,
    output reg [15:0] oled_data = 16'b0,
    input selected,
    input confirmed,
    input [2:0] colour1,
    input [2:0] colour2,
    input [2:0] colour3,
    input [2:0] colour4
    );
    
    parameter [15:0] WHITE = 16'b11111_111111_11111; //000
    parameter [15:0] PINK = 16'b11001_011100_10010;  //001
    parameter [15:0] LIGHTGREEN = 16'b10100_111011_10111; //010
    parameter [15:0] ORANGE = 16'b11101_101011_01100; //011
    parameter [15:0] BLUE = 16'b00000_000000_10110;   //100
    parameter [15:0] LIGHTBLUE = 16'b00000_110100_111000;//101
    parameter [15:0] LIGHTGREY = 16'b10100_101001_10100; //110
    parameter [15:0] DARKGREY = 16'b01010_010101_01011; 
    parameter [15:0] RED = 16'b11111_000000_00000;
    parameter [15:0] BROWN = 16'b01100_000111_00000;
    parameter [15:0] BLACK = 16'd0;
    parameter [15:0] GREEN = 16'b00000_011110_00000;
    
    reg [15:0] FIRST_COLOUR = WHITE;
    reg [15:0] SECOND_COLOUR = WHITE;
    reg [15:0] THIRD_COLOUR = WHITE;
    reg [15:0] FOURTH_COLOUR = WHITE;
    reg [15:0] CAP_COLOUR = WHITE;
    
    always @(selected or confirmed) begin
        CAP_COLOUR = confirmed ? GREEN:
                     selected ? RED : BROWN;
    end
    
    always @(colour1) begin
        FIRST_COLOUR = (colour1 == 3'b000)? WHITE:
                       (colour1 == 3'b001) ? PINK:
                       (colour1 == 3'b010) ? LIGHTGREEN:
                       (colour1 == 3'b011) ? ORANGE:
                       (colour1 == 3'b100) ? BLUE:
                       (colour1 == 3'b101) ? LIGHTBLUE:
                       (colour1 == 3'b110) ? LIGHTGREY: RED; //By right should not see red, unless got unexpected noise   
    end
    
    always @(colour2) begin
        SECOND_COLOUR = (colour2 == 3'b000)? WHITE:
                   (colour2 == 3'b001) ? PINK:
                   (colour2 == 3'b010) ? LIGHTGREEN:
                   (colour2 == 3'b011) ? ORANGE:
                   (colour2 == 3'b100) ? BLUE:
                   (colour2 == 3'b101) ? LIGHTBLUE:
                   (colour2 == 3'b110) ? LIGHTGREY: RED;    
    end
    
    always @(colour3) begin
        THIRD_COLOUR = (colour3 == 3'b000)? WHITE:
                   (colour3 == 3'b001) ? PINK:
                   (colour3 == 3'b010) ? LIGHTGREEN:
                   (colour3 == 3'b011) ? ORANGE:
                   (colour3 == 3'b100) ? BLUE:
                   (colour3 == 3'b101) ? LIGHTBLUE:
                   (colour3 == 3'b110) ? LIGHTGREY: RED;       
    end
    
    always @(colour4) begin
        FOURTH_COLOUR = (colour4 == 3'b000)? WHITE:
                   (colour4 == 3'b001) ? PINK:
                   (colour4 == 3'b010) ? LIGHTGREEN:
                   (colour4 == 3'b011) ? ORANGE:
                   (colour4 == 3'b100) ? BLUE:
                   (colour4 == 3'b101) ? LIGHTBLUE:
                   (colour4 == 3'b110) ? LIGHTGREY: RED;      
    end
    
    always @(X or Y) begin
        if (Y == topY) begin
            if (X >= leftX +6 && X <= leftX + 11) oled_data = CAP_COLOUR;
            else oled_data = BACKGROUND;
        end else if (Y >= topY + 1 && Y <= topY + 3) begin
            if (X >= leftX + 5 && X <= leftX + 12) oled_data = CAP_COLOUR;
            else oled_data = BACKGROUND;
        end else if (Y >= topY + 4 && Y <= topY + 9) begin
            if (X == leftX + 6 || X == leftX + 11) oled_data = BLACK;
            else if (X >= leftX + 7 && X <= leftX + 10) oled_data = WHITE;
            else oled_data = BACKGROUND;
        end else if (Y >= topY + 10 && Y <= topY + 14) begin
            if (X == leftX + 6 || X == leftX + 11) oled_data = BLACK;
            else if (X >= leftX + 7 && X <= leftX + 10) oled_data = FOURTH_COLOUR;
            else oled_data =BACKGROUND;
        end else if (Y == topY + 15) begin
            if (X == leftX + 5 || X == leftX + 12) oled_data = BLACK;
            else if (X >= leftX + 6 && X <= leftX + 11)oled_data = FOURTH_COLOUR;        
            else oled_data = BACKGROUND;
        end else if (Y == topY + 16) begin
            if (X == leftX + 4 || X == leftX + 13) oled_data = BLACK;
            else if (X >= leftX + 5 && X <= leftX + 12)oled_data = FOURTH_COLOUR;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 17) begin
            if (X == leftX + 3 || X == leftX + 14) oled_data = BLACK;
            else if (X >= leftX + 4 && X <= leftX + 13)oled_data = THIRD_COLOUR;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 18) begin
            if (X == leftX + 2 || X == leftX + 15) oled_data = BLACK;
            else if (X >= leftX + 3 && X <= leftX + 14)oled_data = THIRD_COLOUR; 
            else oled_data = BACKGROUND;
        end else if (Y == topY + 19 || Y == topY + 20) begin
            if (X == leftX + 1 || X == leftX + 16) oled_data = BLACK;
            else if (X >= leftX + 2 && X <= leftX + 15)oled_data = THIRD_COLOUR;      
            else oled_data = BACKGROUND;
        end else if (Y >= topY + 21 && Y <= topY + 24) begin
            if (X == leftX || X == leftX +17) oled_data = BLACK;
            else oled_data = SECOND_COLOUR; 
        end else if (Y ==topY + 25 || Y == topY + 26) begin
            if (X == leftX + 1 || X == leftX + 16) oled_data = BLACK;
            else if (X >= leftX + 2 && X <= leftX + 15)oled_data = FIRST_COLOUR;  
            else oled_data = BACKGROUND;
        end else if (Y == topY + 27) begin
            if (X == leftX + 2 || X == leftX + 15) oled_data = BLACK;
            else if (X >= leftX + 3 && X <= leftX + 14)oled_data = FIRST_COLOUR;  
            else oled_data = BACKGROUND;
        end else if (Y == topY + 28) begin
            if (X == leftX + 3 || X == leftX + 4 || X == leftX + 14 || X == leftX + 13) oled_data = BLACK;
            else if (X >= leftX + 5 && X <= leftX + 12)oled_data = FIRST_COLOUR;  
            else oled_data = BACKGROUND;
        end else if (Y == topY + 29) begin
            if (X >= leftX + 5 && X <= leftX + 12) oled_data = BLACK;
            else oled_data = BACKGROUND;
        end
    end
    
endmodule
