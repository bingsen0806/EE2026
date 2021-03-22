`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2021 10:42:28
// Design Name: 
// Module Name: Charmander
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


module Charmander(
    input[6:0] X, 
    input [5:0] Y, 
    input [6:0] leftX,  
    input [5:0] topY, 
    input [15:0] BACKGROUND,
    output reg [15:0] oled_data = 16'b0
    );
    parameter[15:0] BLACK  = 16'b0;
    parameter[15:0] WHITE = 16'b11111_111111_11111;
    parameter[15:0] MAGENTA = 16'b11111_000000_11111;
    parameter[15:0] CYAN = 16'b00000_111111_11111;
    parameter[15:0] YELLOW = 16'b11111_111111_00000;
    parameter[15:0] GREEN = 16'b00000_111111_00000;
    parameter[15:0] RED = 16'b11111_000000_00000;
    parameter[15:0] BLUE = 16'b00000_000000_11111;
    parameter[15:0] ORANGE = 16'b11111_100110_00000;
    parameter[15:0] GREY = 16'b01100_011000_01100;
    
    always @(X or Y) begin
    
        if (Y == topY) begin
        
            if( (X == leftX + 3) || (X >= leftX + 13 && X <= leftX + 16)) oled_data = BLACK;
            else oled_data = BACKGROUND;
            
        end else if (Y == topY + 1) begin
        
            if (X == leftX + 2 || X == leftX + 4 || X == leftX + 12 || X == leftX + 17) oled_data = BLACK;
            else if (X == leftX + 3) oled_data = RED;
            else if ((X >= leftX + 13) && (X <= leftX + 16)) oled_data = ORANGE;
            else oled_data = BACKGROUND;
        
        end else if (Y == topY + 2 || Y == topY + 3) begin
            
            if (X == leftX + 1 || X == leftX + 4 || X == leftX + 11 || X == leftX + 18) oled_data = BLACK;
            else if ((X >= leftX + 2) && (X <= leftX + 3)) oled_data = RED;
            else if ((X >= leftX + 12) && (X <= leftX + 17)) oled_data = ORANGE;
            else oled_data = BACKGROUND;
            
        end else if (Y == topY + 4) begin
        
            if (X == leftX || X == leftX + 5 || X == leftX + 10 || X == leftX + 19) oled_data = BLACK;
            else if ((X >= leftX + 1) && (X <= leftX + 4)) oled_data = RED;
            else if ((X >= leftX + 11) && (X <= leftX + 18)) oled_data = ORANGE;
            else oled_data = BACKGROUND;
            
        end else if (Y == topY + 5) begin
            
            if (X == leftX || X == leftX + 5 || X == leftX + 10 || X == leftX + 14 || X == leftX + 20) oled_data = BLACK;
            else if (X == leftX + 1 || X == leftX + 3 || X == leftX + 4) oled_data = RED;
            else if (X == leftX + 2) oled_data = YELLOW;
            else if (X == leftX + 15) oled_data = WHITE;
            else if ((X >= leftX + 11) && (X <= leftX + 19)) oled_data = ORANGE;
            else oled_data = BACKGROUND;
            
        end else if (Y == topY + 6) begin
        
            if (X == leftX || X == leftX + 5 || X == leftX + 9 || X == leftX + 14 || X == leftX + 15 || X == leftX + 20) oled_data = BLACK;
            else if (X == leftX + 1 || X == leftX + 4) oled_data = RED;
            else if (X == leftX + 2 || X == leftX + 3) oled_data = YELLOW;
            else if ((X >= leftX + 10) && (X <= leftX + 19)) oled_data = ORANGE;
            else oled_data = BACKGROUND;
            
        end else if (Y == topY + 7) begin
        
            if (X == leftX +1 || X == leftX + 2 || X == leftX + 4 || X == leftX + 9 || X == leftX + 14 || X == leftX + 15 || X == leftX + 20) oled_data = BLACK;
            else if (X == leftX + 3) oled_data = YELLOW;
            else if ((X >= leftX + 10) && (X <= leftX + 19)) oled_data = ORANGE;
            else oled_data = BACKGROUND;
            
        end else if (Y == topY + 8) begin
            
            if (X == leftX + 2 || X == leftX + 4 || X == leftX + 8 || X == leftX + 19) oled_data = BLACK;
            else if (X == leftX + 3) oled_data = RED;
            else if ((X >= leftX + 9) && (X <= leftX + 18)) oled_data = ORANGE;
            else oled_data = BACKGROUND;
            
        end else if (Y == topY + 9) begin
            
            if (X == leftX + 2 || X == leftX + 5 || X == leftX + 7 || X == leftX + 17 || X == leftX + 18) oled_data = BLACK;
            else if (X == leftX + 3 || X == leftX + 4) oled_data = RED;
            else if ((X >= leftX + 8) && (X <= leftX + 16)) oled_data = ORANGE;
            else oled_data = BACKGROUND;
            
        end else if (Y == topY + 10) begin
        
            if (X == leftX + 3 || X == leftX + 6 || X == leftX + 7 || X == leftX + 11 || (X >= leftX + 14 && X <= leftX + 16)) oled_data = BLACK;
            else if (X == leftX + 4 || X == leftX + 5) oled_data = RED;
            else if ((X >= leftX + 8) && (X <= leftX + 13)) oled_data = ORANGE;
            else oled_data = BACKGROUND;  
                  
        end else if (Y == topY + 11) begin
        
            if (X == leftX + 3 || X == leftX + 6 || X == leftX + 12 || X == leftX + 15) oled_data = BLACK;
            else if (X == leftX + 4 || X == leftX + 5) oled_data = RED;
            else if ((X >= leftX + 7) && (X <= leftX + 11)) oled_data = ORANGE;
            else if (X == leftX + 13 || X == leftX + 14) oled_data = YELLOW;
            else oled_data = BACKGROUND;       
              
        end else if (Y == topY + 12) begin
        
            if (X == leftX + 4 || X == leftX + 6 || X == leftX + 10 || X == leftX + 11 || X == leftX + 15) oled_data = BLACK;
            else if (X == leftX + 5) oled_data = RED;
            else if ((X >= leftX + 7) && (X <= leftX + 9)) oled_data = ORANGE;
            else if ((X >= leftX + 12) && (X <= leftX + 14)) oled_data = YELLOW;
            else oled_data = BACKGROUND;
                   
        end else if (Y == topY + 13) begin
        
            if (X == leftX + 5 || X == leftX + 6 || X == leftX + 14 || X == leftX + 16) oled_data = BLACK;
            else if ((X >= leftX + 7) && (X <= leftX + 10)) oled_data = ORANGE;
            else if ((X >= leftX + 11) && (X <= leftX + 13)) oled_data = YELLOW;
            else if (X == leftX + 15) oled_data = WHITE;
            else oled_data = BACKGROUND;     
              
        end else if (Y == topY + 14) begin
        
            if (X == leftX + 6 || X == leftX + 7 || (X >= leftX + 13 && X <= leftX + 15)) oled_data = BLACK;
            else if ((X >= leftX + 8) && (X <= leftX + 10)) oled_data = ORANGE;
            else if ((X >= leftX + 11) && (X <= leftX + 12)) oled_data = YELLOW;
            else oled_data = BACKGROUND;     
              
        end else if (Y == topY + 15) begin
        
            if (X == leftX + 7 || X == leftX + 8 || (X >= leftX + 10 && X <= leftX + 12)) oled_data = BLACK;
            else if (X == leftX + 9) oled_data = ORANGE;
            else if (X == leftX + 13) oled_data = WHITE;
            else oled_data = BACKGROUND;     
              
        end else if (Y == topY + 16) begin
        
            if (X == leftX + 7 || X == leftX + 11 || X == leftX + 13) oled_data = BLACK;
            else if (X == leftX + 9) oled_data = ORANGE;
            else if (X == leftX + 8 || X == leftX + 10) oled_data = WHITE;
            else oled_data = BACKGROUND; 
            
        end else if (Y == topY + 17) begin
            if (X >= leftX + 7 && X <= leftX + 9) oled_data = BLACK;
            else oled_data = BACKGROUND;
        end 
    end
endmodule
