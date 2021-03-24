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
    input player2_shoot,
    input [7:0] random_number,
    input [3:0] volume_level,
    input clk_50Hz
    );
    
    wire [5:0] topYCharmander; wire [5:0] topYSquirtle;
    wire [11:0] FireBall_EN; //changed size
    wire [11:0] WaterBall_EN; //changed size
    wire [6:0] leftX_fb1, leftX_fb2, leftX_fb3, leftX_fb4, leftX_fb5, leftX_fb6, leftX_fb7, leftX_fb8, leftX_fb9;
    wire [6:0] leftX_fb10, leftX_fb11, leftX_fb12; //added
    wire [6:0] leftX_wb1, leftX_wb2, leftX_wb3, leftX_wb4, leftX_wb5, leftX_wb6, leftX_wb7, leftX_wb8, leftX_wb9;
    wire [6:0] leftX_wb10, leftX_wb11, leftX_wb12; //added
    wire Charmander_Alive, Squirtle_Alive;
    wire [31:0] Health_Charmander, Health_Squirtle;
    wire [5:0] Shield_EN;
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
        .leftX_fb9(leftX_fb9),
        .leftX_fb10(leftX_fb10), //added 3 lines
        .leftX_fb11(leftX_fb11),
        .leftX_fb12(leftX_fb12),
        .waterball_EN(WaterBall_EN),
        .leftX_wb1(leftX_wb1),
        .leftX_wb2(leftX_wb2),
        .leftX_wb3(leftX_wb3),
        .leftX_wb4(leftX_wb4),
        .leftX_wb5(leftX_wb5),
        .leftX_wb6(leftX_wb6),
        .leftX_wb7(leftX_wb7),
        .leftX_wb8(leftX_wb8),
        .leftX_wb9(leftX_wb9),
        .leftX_wb10(leftX_wb10), //added 3 lines
        .leftX_wb11(leftX_wb11),
        .leftX_wb12(leftX_wb12),
        .Charmander_Alive(Charmander_Alive),
        .Squirtle_Alive(Squirtle_Alive),
        .Health_Charmander(Health_Charmander),
        .Health_Squirtle(Health_Squirtle),
        .shield_EN(Shield_EN)
        );
    
    Pokemon_Logic logic(    
        .single_pulse_clk (single_pulse_clk),
        .player1_up (player1_up),
        .player1_down (player1_down),
        .player2_up (player2_up),
        .player2_down (player2_down),
        .topYCharmander(topYCharmander),
        .topYSquirtle(topYSquirtle),
        .clk_move_speed(clk_50Hz),
        .clk_shield(clk_20Hz),
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
        .leftX_fb10(leftX_fb10), //added 3 lines
        .leftX_fb11(leftX_fb11),
        .leftX_fb12(leftX_fb12),
        .WaterBall_EN(WaterBall_EN),
        .leftX_wb1(leftX_wb1),
        .leftX_wb2(leftX_wb2),
        .leftX_wb3(leftX_wb3),
        .leftX_wb4(leftX_wb4),
        .leftX_wb5(leftX_wb5),
        .leftX_wb6(leftX_wb6),
        .leftX_wb7(leftX_wb7),
        .leftX_wb8(leftX_wb8),
        .leftX_wb9(leftX_wb9),
        .leftX_wb10(leftX_wb10), //added 3 lines
        .leftX_wb11(leftX_wb11),
        .leftX_wb12(leftX_wb12),
        .Charmander_Alive(Charmander_Alive),
        .Squirtle_Alive(Squirtle_Alive),
        .Health_Charmander(Health_Charmander),
        .Health_Squirtle(Health_Squirtle),
        .Shield_EN(Shield_EN),
        .random_number(random_number),
        .volume_level(volume_level)
    );
endmodule
