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
    
    wire [15:0] WIN;
    parameter [15:0] BACKGROUND = 16'h2144;
    parameter [15:0] WHITE = 16'b11111_111111_11111;
    parameter [15:0] RED = 16'b11111_000000_11111;
    parameter [15:0] BLUE = 16'b00000_000000_11111;
    
    assign WIN = ShowCharmander ? RED:BLUE;
    reg [15:0] oled_game_over = 16'd0; wire [15:0] oled_char; wire [15:0] oled_squir;
    
    always @(X or Y) begin
        if (X >= 32) begin
            if (Y>=19&&Y<= 34&& (X>=43&&X<=45||X>=51&&X<=52||X>=57&&X<=59||X>=66&&X<=67||X>=74&&X<=76||X>=84&&X<=86)) oled_game_over = WIN;
            else if(Y>=35&&Y<=37 && (X>=45&&X<=50||X>=53&&X<=57||X>=63&&X<=70||X>=74&&X<=76||X>=84&&X<=86)) oled_game_over = WIN;
            else if ((X>=63&&X<=70&&Y>=19&&Y<=21) || (X>=77&&X<=78&&Y>=19&&Y<=22) || (X>=79&&X<=80&&Y>=23&&Y<=29) || (X>=81&&X<=82&&Y>=30&&Y<=34)) oled_game_over = WIN;
            else oled_game_over = WHITE;
        end
    end
    //GameOverPokemon gameover(.X(X),.Y(Y),.leftX(7'd32),.topY(6'd0),.oled_data(oled_game_over));
    Charmander char(.X(X),.Y(Y),.leftX(7'd8),.topY(6'd23),.oled_data(oled_char),.BACKGROUND(BACKGROUND));
    Squirtle squir(.X(X),.Y(Y),.leftX(7'd8),.topY(6'd23),.oled_data(oled_squir),.BACKGROUND(BACKGROUND));
    
    assign oled_data = (X >= 32 && X <= 95) ? oled_game_over:
                       (X >= 8 && X <= 28 && Y >= 23 && Y <= 40) ? (ShowCharmander ? oled_char : oled_squir):
                       BACKGROUND;
                       
endmodule
