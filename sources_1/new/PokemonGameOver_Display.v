`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2021 17:48:48
// Design Name: 
// Module Name: PokemonGameOver_Display
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


module PokemonGameOver_Display(
    input [6:0] X,
    input [5:0] Y,
    input ShowCharmander,
    output [15:0] oled_data
    );
    
    parameter [15:0] BACKGROUND = 16'h2144;
    
    wire [15:0] oled_game_over; wire [15:0] oled_char; wire [15:0] oled_squir;
    GameOverPokemon gameover(.X(X),.Y(Y),.leftX(7'd32),.topY(6'd0),.oled_data(oled_game_over));
    Charmander char(.X(X),.Y(Y),.leftX(7'd8),.topY(6'd23),.oled_data(oled_char),.BACKGROUND(BACKGROUND));
    Squirtle squir(.X(X),.Y(Y),.leftX(7'd8),.topY(6'd23),.oled_data(oled_squir),.BACKGROUND(BACKGROUND));
    
    assign oled_data = (X >= 32 && X <= 95) ? oled_game_over:
                       (X >= 8 && X <= 28 && Y >= 23 && Y <= 40) ? (ShowCharmander ? oled_char : oled_squir):
                       BACKGROUND;
                       
endmodule
