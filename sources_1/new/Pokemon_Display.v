`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2021 14:22:37
// Design Name: 
// Module Name: Pokemon_Display
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


module Pokemon_Display(
    input[6:0] X, leftXCharmander, leftXSquirtle, //Can remove both leftX later and set to fixed constant
    input [5:0] Y, topYCharmander, topYSquirtle,
    input [6:0] leftX_fb1, leftX_fb2, leftX_fb3, leftX_fb4, leftX_fb5, leftX_fb6, leftX_fb7, leftX_fb8, leftX_fb9,
    input [8:0] fireball_EN,
    input [6:0] leftX_wb1, leftX_wb2, leftX_wb3, leftX_wb4, leftX_wb5, leftX_wb6, leftX_wb7, leftX_wb8, leftX_wb9,
    input [8:0] waterball_EN,
    output [15:0] oled_data,
    input [31:0] Health_Charmander,
    input [31:0] Health_Squirtle,
    input Charmander_Alive,
    input Squirtle_Alive,
    input [5:0] shield_EN
    );
    parameter [15:0] BACKGROUND = 16'b11111_111111_11111;
    wire [15:0] oled_charmander, oled_squirtle;
    wire [15:0] oled_fb_lane1_1, oled_fb_lane1_2, oled_fb_lane1_3, oled_fb_lane2_1, oled_fb_lane2_2;
    wire [15:0] oled_fb_lane2_3, oled_fb_lane3_1, oled_fb_lane3_2, oled_fb_lane3_3;
    wire [15:0] oled_wb_lane1_1, oled_wb_lane1_2, oled_wb_lane1_3, oled_wb_lane2_1, oled_wb_lane2_2;
    wire [15:0] oled_wb_lane2_3, oled_wb_lane3_1, oled_wb_lane3_2, oled_wb_lane3_3;
    wire [15:0] oled_heart1, oled_heart2, oled_health_bar_1, oled_health_bar_2;
    wire [15:0] oled_shield1, oled_shield2, oled_shield3, oled_shield4, oled_shield5, oled_shield6;
    //Can set leftX to fixed constant later
    Charmander charmander(.X(X),.Y(Y),.leftX(leftXCharmander),.topY(topYCharmander),.BACKGROUND(BACKGROUND),.oled_data(oled_charmander));
    Squirtle squirtle(.X(X),.Y(Y),.leftX(leftXSquirtle),.topY(topYSquirtle),.BACKGROUND(BACKGROUND),.oled_data(oled_squirtle));
    
    FireBall lane1_1 (.X(X),.Y(Y),.leftX(leftX_fb1),.topY(6'd6),.BACKGROUND(BACKGROUND),.oled_data(oled_fb_lane1_1));
    FireBall lane1_2 (.X(X),.Y(Y),.leftX(leftX_fb2),.topY(6'd6),.BACKGROUND(BACKGROUND),.oled_data(oled_fb_lane1_2));
    FireBall lane1_3 (.X(X),.Y(Y),.leftX(leftX_fb3),.topY(6'd6),.BACKGROUND(BACKGROUND),.oled_data(oled_fb_lane1_3));
    FireBall lane2_1 (.X(X),.Y(Y),.leftX(leftX_fb4),.topY(6'd24),.BACKGROUND(BACKGROUND),.oled_data(oled_fb_lane2_1));
    FireBall lane2_2 (.X(X),.Y(Y),.leftX(leftX_fb5),.topY(6'd24),.BACKGROUND(BACKGROUND),.oled_data(oled_fb_lane2_2));
    FireBall lane2_3 (.X(X),.Y(Y),.leftX(leftX_fb6),.topY(6'd24),.BACKGROUND(BACKGROUND),.oled_data(oled_fb_lane2_3));
    FireBall lane3_1 (.X(X),.Y(Y),.leftX(leftX_fb7),.topY(6'd42),.BACKGROUND(BACKGROUND),.oled_data(oled_fb_lane3_1));
    FireBall lane3_2 (.X(X),.Y(Y),.leftX(leftX_fb8),.topY(6'd42),.BACKGROUND(BACKGROUND),.oled_data(oled_fb_lane3_2));
    FireBall lane3_3 (.X(X),.Y(Y),.leftX(leftX_fb9),.topY(6'd42),.BACKGROUND(BACKGROUND),.oled_data(oled_fb_lane3_3));
    
    WaterBall lane1_1_wb (.X(X),.Y(Y),.leftX(leftX_wb1),.topY(6'd6),.BACKGROUND(BACKGROUND),.oled_data(oled_wb_lane1_1));
    WaterBall lane1_2_wb (.X(X),.Y(Y),.leftX(leftX_wb2),.topY(6'd6),.BACKGROUND(BACKGROUND),.oled_data(oled_wb_lane1_2));
    WaterBall lane1_3_wb (.X(X),.Y(Y),.leftX(leftX_wb3),.topY(6'd6),.BACKGROUND(BACKGROUND),.oled_data(oled_wb_lane1_3));
    WaterBall lane2_1_wb (.X(X),.Y(Y),.leftX(leftX_wb4),.topY(6'd24),.BACKGROUND(BACKGROUND),.oled_data(oled_wb_lane2_1));
    WaterBall lane2_2_wb (.X(X),.Y(Y),.leftX(leftX_wb5),.topY(6'd24),.BACKGROUND(BACKGROUND),.oled_data(oled_wb_lane2_2));
    WaterBall lane2_3_wb (.X(X),.Y(Y),.leftX(leftX_wb6),.topY(6'd24),.BACKGROUND(BACKGROUND),.oled_data(oled_wb_lane2_3));
    WaterBall lane3_1_wb (.X(X),.Y(Y),.leftX(leftX_wb7),.topY(6'd42),.BACKGROUND(BACKGROUND),.oled_data(oled_wb_lane3_1));
    WaterBall lane3_2_wb (.X(X),.Y(Y),.leftX(leftX_wb8),.topY(6'd42),.BACKGROUND(BACKGROUND),.oled_data(oled_wb_lane3_2));
    WaterBall lane3_3_wb (.X(X),.Y(Y),.leftX(leftX_wb9),.topY(6'd42),.BACKGROUND(BACKGROUND),.oled_data(oled_wb_lane3_3));
    
    Heart heart1 (.X(X),.Y(Y),.leftX(7'd1),.topY(6'd59),.BACKGROUND(BACKGROUND),.oled_data(oled_heart1));
    Heart heart2 (.X(X),.Y(Y),.leftX(7'd72),.topY(6'd59),.BACKGROUND(BACKGROUND),.oled_data(oled_heart2));
    
    Health_Bar healthBar1(.X(X),.Y(Y),.leftX(7'd7),.topY(6'd59),.BACKGROUND(BACKGROUND),.oled_data(oled_health_bar_1),.health_level(Health_Charmander));
    Health_Bar healthBar2(.X(X),.Y(Y),.leftX(7'd78),.topY(6'd59),.BACKGROUND(BACKGROUND),.oled_data(oled_health_bar_2),.health_level(Health_Squirtle));
    
    Shield shield1(.X(X),.Y(Y),.leftX(7'd23),.topY(6'd1),.BACKGROUND(BACKGROUND),.oled_data(oled_shield1));
    Shield shield2(.X(X),.Y(Y),.leftX(7'd23),.topY(6'd19),.BACKGROUND(BACKGROUND),.oled_data(oled_shield2));
    Shield shield3(.X(X),.Y(Y),.leftX(7'd23),.topY(6'd37),.BACKGROUND(BACKGROUND),.oled_data(oled_shield3));
    Shield shield4(.X(X),.Y(Y),.leftX(7'd72),.topY(6'd1),.BACKGROUND(BACKGROUND),.oled_data(oled_shield4));
    Shield shield5(.X(X),.Y(Y),.leftX(7'd72),.topY(6'd19),.BACKGROUND(BACKGROUND),.oled_data(oled_shield5));
    Shield shield6(.X(X),.Y(Y),.leftX(7'd72),.topY(6'd37),.BACKGROUND(BACKGROUND),.oled_data(oled_shield6));
    
    assign oled_data = (Charmander_Alive && X >= leftXCharmander && X <= leftXCharmander + 20 && Y >= topYCharmander && Y <= topYCharmander + 17) ? oled_charmander:
                       (Squirtle_Alive && X >= leftXSquirtle && X <= leftXSquirtle + 20 && Y >= topYSquirtle && Y <= topYSquirtle + 17) ? oled_squirtle:
                       (shield_EN[0] && X == 7'd23 && Y >= 6'd1 && Y <= 6'd18) ? oled_shield1:
                       (shield_EN[1] && X == 7'd23 && Y >= 6'd19 && Y <= 6'd36) ? oled_shield2:
                       (shield_EN[2] && X == 7'd23 && Y >= 6'd37 && Y <= 6'd54) ? oled_shield3:
                       (shield_EN[3] && X == 7'd72 && Y >= 6'd1 && Y <= 6'd18) ? oled_shield4:
                       (shield_EN[4] && X == 7'd72 && Y >= 6'd19 && Y <= 6'd36) ? oled_shield5:
                       (shield_EN[5] && X == 7'd72 && Y >= 6'd37 && Y <= 6'd54) ? oled_shield6:
                       (fireball_EN[0] == 1 && X >= leftX_fb1 && X <= leftX_fb1 + 7 && Y >= 6'd6 && Y <= 6'd13) ? oled_fb_lane1_1:
                       (fireball_EN[1] == 1 && X >= leftX_fb2 && X <= leftX_fb2 + 7 && Y >= 6'd6 && Y <= 6'd13) ? oled_fb_lane1_2:
                       (fireball_EN[2] == 1 && X >= leftX_fb3 && X <= leftX_fb3 + 7 && Y >= 6'd6 && Y <= 6'd13) ? oled_fb_lane1_3:
                       (fireball_EN[3] == 1 && X >= leftX_fb4 && X <= leftX_fb4 + 7 && Y >= 6'd24 && Y <= 6'd31) ? oled_fb_lane2_1:
                       (fireball_EN[4] == 1 && X >= leftX_fb5 && X <= leftX_fb5 + 7 && Y >= 6'd24 && Y <= 6'd31) ? oled_fb_lane2_2:
                       (fireball_EN[5] == 1 && X >= leftX_fb6 && X <= leftX_fb6 + 7 && Y >= 6'd24 && Y <= 6'd31) ? oled_fb_lane2_3:
                       (fireball_EN[6] == 1 && X >= leftX_fb7 && X <= leftX_fb7 + 7 && Y >= 6'd42 && Y <= 6'd49) ? oled_fb_lane3_1:
                       (fireball_EN[7] == 1 && X >= leftX_fb8 && X <= leftX_fb8 + 7 && Y >= 6'd42 && Y <= 6'd49) ? oled_fb_lane3_2:
                       (fireball_EN[8] == 1 && X >= leftX_fb9 && X <= leftX_fb9 + 7 && Y >= 6'd42 && Y <= 6'd49) ? oled_fb_lane3_3:
                       (waterball_EN[0] == 1 && X >= leftX_wb1 && X <= leftX_wb1 + 7 && Y >= 6'd6 && Y <= 6'd13) ? oled_wb_lane1_1:
                       (waterball_EN[1] == 1 && X >= leftX_wb2 && X <= leftX_wb2 + 7 && Y >= 6'd6 && Y <= 6'd13) ? oled_wb_lane1_2:
                       (waterball_EN[2] == 1 && X >= leftX_wb3 && X <= leftX_wb3 + 7 && Y >= 6'd6 && Y <= 6'd13) ? oled_wb_lane1_3:
                       (waterball_EN[3] == 1 && X >= leftX_wb4 && X <= leftX_wb4 + 7 && Y >= 6'd24 && Y <= 6'd31) ? oled_wb_lane2_1:
                       (waterball_EN[4] == 1 && X >= leftX_wb5 && X <= leftX_wb5 + 7 && Y >= 6'd24 && Y <= 6'd31) ? oled_wb_lane2_2:
                       (waterball_EN[5] == 1 && X >= leftX_wb6 && X <= leftX_wb6 + 7 && Y >= 6'd24 && Y <= 6'd31) ? oled_wb_lane2_3:
                       (waterball_EN[6] == 1 && X >= leftX_wb7 && X <= leftX_wb7 + 7 && Y >= 6'd42 && Y <= 6'd49) ? oled_wb_lane3_1:
                       (waterball_EN[7] == 1 && X >= leftX_wb8 && X <= leftX_wb8 + 7 && Y >= 6'd42 && Y <= 6'd49) ? oled_wb_lane3_2:
                       (waterball_EN[8] == 1 && X >= leftX_wb9 && X <= leftX_wb9 + 7 && Y >= 6'd42 && Y <= 6'd49) ? oled_wb_lane3_3:
                       (X >= 7'd1 && X <= 7'd5 && Y >= 6'd59 && Y <= 6'd62) ? oled_heart1:
                       (X >= 7'd72 && X <= 7'd76 && Y >= 6'd59 && Y <= 6'd62) ? oled_heart2:
                       (X >= 7'd7 && X <= 7'd23 && Y >= 6'd59 && Y <= 6'd62) ? oled_health_bar_1:
                       (X >= 7'd78 && X <= 7'd94 && Y >= 6'd59 && Y <= 6'd62) ? oled_health_bar_2:
                        BACKGROUND;
                       
endmodule
