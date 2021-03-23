`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2021 14:47:01
// Design Name: 
// Module Name: Pokemon_Logic
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


module Pokemon_Logic(
    input single_pulse_clk,
    input clk_20Hz,
    input player1_up,
    input player1_down,
    input player2_up,
    input player2_down,
    input player1Shoot,
    input player2Shoot,
    output reg [5:0] topYCharmander = 6'd18,
    output reg [5:0] topYSquirtle = 6'd18,
    output [8:0] FireBall_EN,
    output [8:0] WaterBall_EN,
    output [6:0] leftX_fb1, leftX_fb2, leftX_fb3, leftX_fb4, leftX_fb5, leftX_fb6, leftX_fb7, leftX_fb8, leftX_fb9,
    output [6:0] leftX_wb1, leftX_wb2, leftX_wb3, leftX_wb4, leftX_wb5, leftX_wb6, leftX_wb7, leftX_wb8, leftX_wb9
    );
    
    parameter [6:0] INITIAL_LEFT_FB = 7'd17;
    parameter [6:0] INITIAL_LEFT_WB = 7'd74;
    parameter [5:0] SLOW_SHOOT_RATE = 6'd20;
    parameter [5:0] MEDIUM_SHOOT_RATE = 6'd15;
    parameter [5:0] FAST_SHOOT_RATE = 6'd10;
    
    integer i; 
    integer j;
    integer k;
//    reg [5:0] topYCharmander = 6'd18;
//    reg [5:0] topYSquirtle = 6'd18;
    reg [8:0] FireBall_EN = 9'b00000_0000;
    reg [8:0] WaterBall_EN = 9'b00000_0000;
    reg [6:0] leftX_Fireball [8:0];
    reg [6:0] leftX_Waterball [8:0];
    reg [5:0] topY_Fireball [8:0];
    reg [5:0] topY_Waterball [8:0];
    reg [5:0] botY_Fireball [8:0];
    reg [5:0] botY_Waterball [8:0];
    reg can_shoot_1 = 1; reg can_shoot_2 = 1; reg [5:0] coolDown_1 = 6'd0; reg[5:0] coolDown_2 = 6'd0;
    initial begin
        for (i = 0; i <= 8; i = i + 1) begin
            leftX_Waterball[i] = INITIAL_LEFT_WB;
            leftX_Fireball[i] = INITIAL_LEFT_FB;     
            if (i >= 0 && i <= 2 ) begin
                topY_Fireball[i] = 6'd6;
                botY_Fireball[i] = 6'd13;
                topY_Waterball[i] = 6'd6;
                botY_Waterball[i] = 6'd13;
            end else if (i >= 3 && i <= 5 ) begin
                topY_Fireball[i] = 6'd24;
                botY_Fireball[i] = 6'd31;
                topY_Waterball[i] = 6'd24;
                botY_Waterball[i] = 6'd31;
            end else begin
                topY_Fireball[i] = 6'd42;
                botY_Fireball[i] = 6'd49;
                topY_Waterball[i] = 6'd42;
                botY_Waterball[i] = 6'd49;
            end
        end
    end

    
    always @(posedge single_pulse_clk) begin
        if (player2_up == 1 && topYSquirtle >=18) begin
            topYSquirtle <= topYSquirtle - 18;
        end else if (player2_down == 1 && topYSquirtle < 36) begin
            topYSquirtle <= topYSquirtle + 18; 
        end
        if (player1_up == 1 && topYCharmander >=18) begin
            topYCharmander <= topYCharmander - 18;
        end else if (player1_down == 1 && topYCharmander < 36) begin
            topYCharmander <= topYCharmander + 18;
        end
    end
    
    always @(posedge clk_20Hz) begin
        
        //Move the FireBalls if they are enabled
        for (i = 0; i <= 8 ; i = i + 1) begin
            //FireBall
            if (FireBall_EN[i] == 1) begin
                if(leftX_Fireball[i] + 7 >= 94) begin //The right end has reached the right side of screen
                    leftX_Fireball[i] <= INITIAL_LEFT_FB;
                    FireBall_EN[i] <= 0;
                end else begin
                    leftX_Fireball[i] <= leftX_Fireball[i] + 1;
                end
            end
            //WaterBall
            if (WaterBall_EN[i] == 1) begin
                if(leftX_Waterball[i] <= 1) begin   //The left end has reached the left side of screen
                    leftX_Waterball[i] <= INITIAL_LEFT_WB;
                    WaterBall_EN[i] <= 0;
                end else begin
                    leftX_Waterball[i] <= leftX_Waterball[i] - 1;
                end
            end
        end
        
        //Remove the balls if any two FireBall and WaterBall clashes
        for (i = 0; i <= 8 ; i = i + 1) begin
            for (j = 0; j <= 8; j = j + 1) begin
                if ((FireBall_EN[i] == 1 && WaterBall_EN[j] == 1) &&
                    (leftX_Fireball[i] + 8 >= leftX_Waterball[j] - 1) && 
                    ((botY_Fireball[i] >= topY_Waterball[j] && botY_Fireball[i] <= botY_Waterball[j]) ||
                    (botY_Waterball[j] >= topY_Fireball[i] && botY_Waterball[j] <= botY_Fireball[i]))
                   ) begin
                   leftX_Fireball[i] <= INITIAL_LEFT_FB;
                   FireBall_EN[i] <= 0;
                   leftX_Waterball[j] <= INITIAL_LEFT_WB;
                   WaterBall_EN[j] <= 0;
                end
            end
        end
        
        
        //Player 1 Shoots if can_shoot_1 and the switch is on
        if (can_shoot_1 == 1) begin
            if (player1Shoot == 1) begin
                if (topYCharmander < 18) begin
                    for (i = 0; (i <= 2 && k == 1); i = i + 1) begin
                        if (FireBall_EN[i] == 0) begin
                            FireBall_EN[i] <= 1;
                            k = 0;
                        end
                    end
                    k = 1;
                end else if (topYCharmander < 36) begin
                    for (i = 3; (i <= 5 && k == 1); i = i + 1) begin
                        if (FireBall_EN[i] == 0) begin
                            FireBall_EN[i] <= 1;
                            k = 0;
                        end
                    end
                    k = 1;                
                end else begin
                    for (i = 6; (i <= 8 && k == 1); i = i + 1) begin
                        if (FireBall_EN[i] == 0) begin
                            FireBall_EN[i] <= 1;
                            k = 0;
                        end
                    end
                    k = 1;                
                end
                can_shoot_1 <= 0;
            end
        end else begin      //Still in cooldown stage
            coolDown_1 <= coolDown_1 + 1;
            if (coolDown_1 == SLOW_SHOOT_RATE - 1) begin
                can_shoot_1 <= 1;
                coolDown_1 <= 0;
            end
        end
                
        //Player 2 shoots if can_shoot_2 and switch is on
        if (can_shoot_2 == 1) begin
            if (player2Shoot == 1) begin
                if (topYSquirtle < 18) begin
                    for (i = 0; (i <= 2 && k == 1); i = i + 1) begin
                        if (WaterBall_EN[i] == 0) begin
                            WaterBall_EN[i] <= 1;
                            k = 0;
                        end
                    end
                    k = 1;
                end else if (topYSquirtle < 36) begin
                    for (i = 3; (i <= 5 && k == 1); i = i + 1) begin
                        if (WaterBall_EN[i] == 0) begin
                            WaterBall_EN[i] <= 1;
                            k = 0;
                        end
                    end
                    k = 1;                
                end else if (topYSquirtle < 54) begin
                    for (i = 6; (i <= 8 && k == 1); i = i + 1) begin
                        if (WaterBall_EN[i] == 0) begin
                            WaterBall_EN[i] <= 1;
                            k = 0;
                        end
                    end
                    k = 1;                
                end
                can_shoot_2 <= 0;
            end
        end else begin      //Still in cooldown stage
            coolDown_2 <= coolDown_2 + 1;
            if (coolDown_2 == SLOW_SHOOT_RATE - 1) begin
                can_shoot_2 <= 1;
                coolDown_2 <= 0;
            end
        end                
        
    end
    
    assign leftX_fb1 = leftX_Fireball[0];
    assign leftX_fb2 = leftX_Fireball[1];
    assign leftX_fb3 = leftX_Fireball[2];
    assign leftX_fb4 = leftX_Fireball[3];
    assign leftX_fb5 = leftX_Fireball[4];
    assign leftX_fb6 = leftX_Fireball[5];
    assign leftX_fb7 = leftX_Fireball[6];
    assign leftX_fb8 = leftX_Fireball[7];
    assign leftX_fb9 = leftX_Fireball[8];

    assign leftX_wb1 = leftX_Waterball[0];
    assign leftX_wb2 = leftX_Waterball[1];
    assign leftX_wb3 = leftX_Waterball[2];
    assign leftX_wb4 = leftX_Waterball[3];
    assign leftX_wb5 = leftX_Waterball[4];
    assign leftX_wb6 = leftX_Waterball[5];
    assign leftX_wb7 = leftX_Waterball[6];
    assign leftX_wb8 = leftX_Waterball[7];
    assign leftX_wb9 = leftX_Waterball[8];
endmodule
