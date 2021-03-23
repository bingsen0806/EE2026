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
    output [15:0] oled_data,
    input clk_20Hz,
    input player1_shoot,
    input player2_shoot
    );
    
    wire [5:0] topYCharmander; wire [5:0] topYSquirtle;
    wire [8:0] FireBall_EN; 
    wire [8:0] WaterBall_EN;
    wire [6:0] leftX_fb1, leftX_fb2, leftX_fb3, leftX_fb4, leftX_fb5, leftX_fb6, leftX_fb7, leftX_fb8, leftX_fb9;
    wire [6:0] leftX_wb1, leftX_wb2, leftX_wb3, leftX_wb4, leftX_wb5, leftX_wb6, leftX_wb7, leftX_wb8, leftX_wb9;
    
    Pokemon_Display pokemon_display(
        .X(X), .leftXCharmander(7'd0), .leftXSquirtle(7'd74),
        .Y(Y), .topYCharmander(topYCharmander), .topYSquirtle(topYSquirtle),
        .oled_data(oled_data),.fireball_EN(FireBall_EN),
        .leftX_fb1(leftX_fb1),
        .leftX_fb2(leftX_fb2),
        .leftX_fb3(leftX_fb3),
        .leftX_fb4(leftX_fb4),
        .leftX_fb5(leftX_fb5),
        .leftX_fb6(leftX_fb6),
        .leftX_fb7(leftX_fb7),
        .leftX_fb8(leftX_fb8),
        .leftX_fb9(leftX_fb9),.waterball_EN(WaterBall_EN),
        .leftX_wb1(leftX_wb1),
        .leftX_wb2(leftX_wb2),
        .leftX_wb3(leftX_wb3),
        .leftX_wb4(leftX_wb4),
        .leftX_wb5(leftX_wb5),
        .leftX_wb6(leftX_wb6),
        .leftX_wb7(leftX_wb7),
        .leftX_wb8(leftX_wb8)
        );
    
    Pokemon_Logic logic(    
        .single_pulse_clk (single_pulse_clk),
        .player1_up (player1_up),
        .player1_down (player1_down),
        .player2_up (player2_up),
        .player2_down (player2_down),
        .topYCharmander(topYCharmander),
        .topYSquirtle(topYSquirtle),
        .clk_20Hz(clk_20Hz),
        .player1Shoot(player1_shoot),
        .player2Shoot(player2_shoot),
        .FireBall_EN(FireBall_EN),
        .leftX_fb1(leftX_fb1),
        .leftX_fb2(leftX_fb2),
        .leftX_fb3(leftX_fb3),
        .leftX_fb4(leftX_fb4),
        .leftX_fb5(leftX_fb5),
        .leftX_fb6(leftX_fb6),
        .leftX_fb7(leftX_fb7),
        .leftX_fb8(leftX_fb8),
        .leftX_fb9(leftX_fb9),
        .WaterBall_EN(WaterBall_EN),
        .leftX_wb1(leftX_wb1),
        .leftX_wb2(leftX_wb2),
        .leftX_wb3(leftX_wb3),
        .leftX_wb4(leftX_wb4),
        .leftX_wb5(leftX_wb5),
        .leftX_wb6(leftX_wb6),
        .leftX_wb7(leftX_wb7),
        .leftX_wb8(leftX_wb8),
        .leftX_wb9(leftX_wb9)
    );
endmodule
