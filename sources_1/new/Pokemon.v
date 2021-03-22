`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2021 16:44:55
// Design Name: 
// Module Name: Pokemon
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


module Pokemon(
    input [6:0] X,
    input [5:0] Y,
    input single_pulse_clk,
    input player1_up,
    input player1_down,
    input player2_up,
    input player2_down,
    output [15:0] oled_data
    );
    
    wire [5:0] topYCharmander; wire [5:0] topYSquirtle;
    Pokemon_Display pokemon_display( //Can remove leftX later
        .X(X), .leftXCharmander(7'd0), .leftXSquirtle(7'd74),
        .Y(Y), .topYCharmander(topYCharmander), .topYSquirtle(topYSquirtle),
        .oled_data(oled_data)
        );
    
    Pokemon_Logic logic(    
        .single_pulse_clk (single_pulse_clk),
        .player1_up (player1_up),
        .player1_down (player1_down),
        .player2_up (player2_up),
        .player2_down (player2_down),
        .topYCharmander(topYCharmander),
        .topYSquirtle(topYSquirtle)
    );
endmodule
