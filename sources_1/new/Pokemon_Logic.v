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
    input clk_move_speed, //changed
    input player1_up,
    input player1_down,
    input player2_up,
    input player2_down,
    input player1Shoot,
    input player2Shoot,
    output reg [5:0] topYCharmander = 6'd19, //changed from 18
    output reg [5:0] topYSquirtle = 6'd19, //changed from 18
    output [11:0] FireBall_EN, //changed size
    output [11:0] WaterBall_EN, //changed size
    output [6:0] leftX_fb1, leftX_fb2, leftX_fb3, leftX_fb4, leftX_fb5, leftX_fb6, leftX_fb7, leftX_fb8, leftX_fb9,leftX_fb10, leftX_fb11, leftX_fb12, //added
    output [6:0] leftX_wb1, leftX_wb2, leftX_wb3, leftX_wb4, leftX_wb5, leftX_wb6, leftX_wb7, leftX_wb8, leftX_wb9,leftX_wb10, leftX_wb11, leftX_wb12, //added
    output reg Charmander_Alive = 1,
    output reg Squirtle_Alive = 1,
    output [31:0] Health_Charmander,
    output [31:0] Health_Squirtle,
    output reg [5:0] Shield_EN = 6'b000000,
    input [7:0] random_number,
    input [3:0] volume_level,
    input clk_shield //added
    );
    
    parameter [6:0] INITIAL_LEFT_FB = 7'd17;
    parameter [6:0] INITIAL_LEFT_WB = 7'd74;
    parameter [5:0] SLOW_SHOOT_RATE = 6'd27;
    parameter [5:0] MEDIUM_SHOOT_RATE = 6'd20;
    parameter [5:0] FAST_SHOOT_RATE = 6'd13;
    parameter [31:0] MAX_HP = 32'd5;
    parameter [7:0] SHIELD_CHANCE_CHAR_LOW = 8'd3; //modulus 17
    parameter [7:0] SHIELD_CHANCE_CHAR_MID = 8'd6;
    parameter [7:0] SHIELD_CHANCE_CHAR_HIGH = 8'd9;
    parameter [7:0] SHIELD_CHANCE_SQUIR_LOW = 8'd3; //modulus 17
    parameter [7:0] SHIELD_CHANCE_SQUIR_MID = 8'd6;
    parameter [7:0] SHIELD_CHANCE_SQUIR_HIGH = 8'd9;
    parameter [7:0] BALL_MOVE_CHANCE_1 = 8'd3; //modulus 13
    parameter [7:0] BALL_MOVE_CHANCE_2 = 8'd4; //modulus 23
    parameter [7:0] BALL_MOVE_CHANCE_3 = 8'd6; //modulus 29
    
    integer i; 
    integer j;
    integer k;
//    reg [5:0] topYCharmander = 6'd18;
//    reg [5:0] topYSquirtle = 6'd18;
    reg [11:0] FireBall_EN = 12'b00000_00000_00; //changed size
    reg [11:0] WaterBall_EN = 12'b00000_00000_00; //changed size
    reg [6:0] leftX_Fireball [11:0]; //changed size
    reg [6:0] leftX_Waterball [11:0]; //changed size
    reg [5:0] topY_Fireball [11:0]; //changed size
    reg [5:0] topY_Waterball [11:0];//changed size
    reg [5:0] botY_Fireball [11:0];//changed size
    reg [5:0] botY_Waterball [11:0];//changed size
    reg can_shoot_1 = 1; reg can_shoot_2 = 1; reg [5:0] coolDown_1 = 6'd0; reg[5:0] coolDown_2 = 6'd0;
    reg [31:0] HP_Squirtle = MAX_HP; reg [31:0] HP_Charmander = MAX_HP;
    reg [7:0] ShieldChance_Char = SHIELD_CHANCE_CHAR_LOW; reg [7:0] ShieldChance_Squir = SHIELD_CHANCE_SQUIR_LOW;
    reg [5:0] ShootRate = SLOW_SHOOT_RATE;
    reg [5:0] Shield_Count = 6'b000000;
    
    reg [3:0] rightMost_Fire = 4'b1111; // represents the rightmost fireball, 15 by default means no rightmost
    reg [6:0] rightmost = 7'b0000000; //temporary variable to store rightmost fire ball X value
    reg [1:0] movement = 2'd0; //0 is stay, 1 is move down, 2 is move up, 3 is split
    
    initial begin
        for (i = 0; i <= 11; i = i + 1) begin //changed condition
            leftX_Waterball[i] = INITIAL_LEFT_WB;
            leftX_Fireball[i] = INITIAL_LEFT_FB;     
            if ((i >= 0 && i <= 2) || i == 9) begin //changed condition
                topY_Fireball[i] = 6'd6;
                botY_Fireball[i] = 6'd13;
                topY_Waterball[i] = 6'd6;
                botY_Waterball[i] = 6'd13;
            end else if ((i >= 3 && i <= 5) || i == 10 ) begin //changed condition
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
    
    always @ (volume_level) begin
        ShieldChance_Char <= volume_level % 3 == 4'd0 ?  SHIELD_CHANCE_CHAR_LOW:
                             volume_level % 3 == 4'd1 ? SHIELD_CHANCE_CHAR_MID:
                             SHIELD_CHANCE_CHAR_HIGH;
        ShieldChance_Squir <= volume_level % 3 == 4'd0 ?  SHIELD_CHANCE_SQUIR_HIGH:
                             volume_level % 3 == 4'd1 ? SHIELD_CHANCE_SQUIR_MID:
                             SHIELD_CHANCE_SQUIR_LOW; 
        ShootRate <= (volume_level < 4'd6) ? SLOW_SHOOT_RATE :
                     (volume_level < 4'd11) ? MEDIUM_SHOOT_RATE :  
                     FAST_SHOOT_RATE; 
    end
    
//    always @(clk_shield) begin
//        for (i = 0; i <= 5; i = i + 1) begin
//            if(Shield_EN[i] == 1) begin
//                Shield_Count[i] <= Shield_Count[i] + 1;
//                if (Shield_Count[i] == 1'b1) begin
//                    Shield_Count[i] <= 0;
//                    Shield_EN[i] <= 0;
//                end
//            end 
//        end
//    end
    
    always @(posedge single_pulse_clk) begin
        if (HP_Charmander == 0) Charmander_Alive <= 0;
        if (HP_Squirtle == 0) Squirtle_Alive <= 0;
        if (player2_up == 1 && topYSquirtle >=19) begin //chaned 18 to 19 and 36 to 37 below
            topYSquirtle <= topYSquirtle - 18;
        end else if (player2_down == 1 && topYSquirtle < 37) begin
            topYSquirtle <= topYSquirtle + 18; 
        end
        if (player1_up == 1 && topYCharmander >=19) begin
            topYCharmander <= topYCharmander - 18;
        end else if (player1_down == 1 && topYCharmander < 37) begin
            topYCharmander <= topYCharmander + 18;
        end
    end
    
    always @(posedge clk_move_speed) begin
        
        //Disable shield animation after certain time
        for (i = 0; i <= 5; i = i + 1) begin
            if(Shield_EN[i] == 1) begin
                Shield_Count[i] <= Shield_Count[i] + 1;
                if (Shield_Count[i] == 1'b1) begin
                    Shield_Count[i] <= 0;
                    Shield_EN[i] <= 0;
                end
            end 
        end        
        
        rightMost_Fire = 4'b1111;
        rightmost = 7'b0000000;
        //Randomly Swap RightMost FireBall Position
        for (i = 0; i <= 11 ; i = i + 1) begin //find rightmost fireball
            if (FireBall_EN[i] == 1 && leftX_Fireball[i] > rightmost)begin
                rightmost = leftX_Fireball[i];
                rightMost_Fire = i;
            end     
        end
        
        //Move the FireBalls if they are enabled
        for (i = 0; i <= 11 ; i = i + 1) begin //changed condition
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
        for (i = 0; i <= 11 ; i = i + 1) begin //changed condition
            for (j = 0; j <= 11; j = j + 1) begin //changed condition
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
            if (player1Shoot == 1 && Charmander_Alive == 1) begin
                if (topYCharmander < 19) begin //changed
                    for (i = 0; (i <= 2 && k == 1); i = i + 1) begin
                        if (FireBall_EN[i] == 0) begin
                            FireBall_EN[i] <= 1;
                            k = 0;
                        end else if (FireBall_EN[9] == 0) begin //added whole else
                            FireBall_EN[9] <= 1;
                            k = 0;
                        end
                    end
                    k = 1;
                end else if (topYCharmander < 37) begin //changed
                    for (i = 3; (i <= 5 && k == 1); i = i + 1) begin
                        if (FireBall_EN[i] == 0) begin
                            FireBall_EN[i] <= 1;
                            k = 0;
                        end else if (FireBall_EN[10] == 0) begin //added whole else
                            FireBall_EN[10] <= 1;
                            k = 0;
                        end
                    end
                    k = 1;                
                end else begin
                    for (i = 6; (i <= 8 && k == 1); i = i + 1) begin
                        if (FireBall_EN[i] == 0) begin
                            FireBall_EN[i] <= 1;
                            k = 0;
                        end else if (FireBall_EN[11] == 0) begin //added whole else
                            FireBall_EN[11] <= 1;
                            k = 0;
                        end
                    end
                    k = 1;                
                end
                can_shoot_1 <= 0;
            end
        end else begin      //Still in cooldown stage
            coolDown_1 <= coolDown_1 + 1;
            if (coolDown_1 >= ShootRate - 1) begin
                can_shoot_1 <= 1;
                coolDown_1 <= 0;
            end
        end
                
        //Player 2 shoots if can_shoot_2 and switch is on
        if (can_shoot_2 == 1) begin
            if (player2Shoot == 1 && Squirtle_Alive == 1) begin
                if (topYSquirtle < 19) begin //changed
                    for (i = 0; (i <= 2 && k == 1); i = i + 1) begin
                        if (WaterBall_EN[i] == 0) begin
                            WaterBall_EN[i] <= 1;
                            k = 0;
                        end else if (WaterBall_EN[9] == 0) begin //added whole else
                            WaterBall_EN[9] <= 1;
                            k = 0;
                        end
                    end
                    k = 1;
                end else if (topYSquirtle < 37) begin //changed
                    for (i = 3; (i <= 5 && k == 1); i = i + 1) begin
                        if (WaterBall_EN[i] == 0) begin
                            WaterBall_EN[i] <= 1;
                            k = 0;
                        end else if (WaterBall_EN[10] == 0) begin //added whole else
                            WaterBall_EN[10] <= 1;
                            k = 0;
                        end
                    end
                    k = 1;                
                end else if (topYSquirtle < 55) begin //changed
                    for (i = 6; (i <= 8 && k == 1); i = i + 1) begin
                        if (WaterBall_EN[i] == 0) begin
                            WaterBall_EN[i] <= 1;
                            k = 0;
                        end else if (WaterBall_EN[11] == 0) begin //added whole else
                            WaterBall_EN[11] <= 1;
                            k = 0;
                        end
                    end
                    k = 1;                
                end
                can_shoot_2 <= 0;
            end
        end else begin      //Still in cooldown stage
            coolDown_2 <= coolDown_2 + 1;
            if (coolDown_2 >= ShootRate - 1) begin //changed to >=
                can_shoot_2 <= 1;
                coolDown_2 <= 0;
            end
        end                
        
        //Fire hits Squirtle or Water hits Charmander. Note that the logic only works for the 3 lanes
        for (i = 0; i <= 11; i = i + 1) begin //changed condition
            if (Squirtle_Alive == 1 && leftX_Fireball[i] + 7 >= 72 && topY_Fireball[i] >= topYSquirtle && topY_Fireball[i] <= topYSquirtle + 17) begin
                leftX_Fireball[i] <= INITIAL_LEFT_FB;
                FireBall_EN[i] <= 0;
                if (random_number % 17 > ShieldChance_Squir) begin
                    HP_Squirtle <= HP_Squirtle - 1;
                end else begin
                    if (topYSquirtle < 19) Shield_EN[3] <= 1; //changed to 19
                    else if (topYSquirtle < 37) Shield_EN[4] <= 1; //changed to 37
                    else Shield_EN[5] <= 1;
                end
            end
        end
        
        for (i = 0; i <= 11; i = i + 1) begin //changed condition
            if (Charmander_Alive == 1 && leftX_Waterball[i] <= 24 && topY_Waterball[i] >= topYCharmander && topY_Waterball[i] <= topYCharmander + 17) begin //changed to 24
                leftX_Waterball[i] <= INITIAL_LEFT_WB;
                WaterBall_EN[i] <= 0;
                if (random_number % 17 > ShieldChance_Char) begin
                    HP_Charmander <= HP_Charmander - 1;
                end else begin
                    if (topYCharmander < 19) Shield_EN[0] <= 1; //changed
                    else if (topYCharmander < 37) Shield_EN[1] <= 1;//changed
                    else Shield_EN[2] <= 1;                
                end
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
    assign leftX_fb10 = leftX_Fireball[9]; //added 3 lines
    assign leftX_fb11 = leftX_Fireball[10];
    assign leftX_fb12 = leftX_Fireball[11];
    
    assign leftX_wb1 = leftX_Waterball[0];
    assign leftX_wb2 = leftX_Waterball[1];
    assign leftX_wb3 = leftX_Waterball[2];
    assign leftX_wb4 = leftX_Waterball[3];
    assign leftX_wb5 = leftX_Waterball[4];
    assign leftX_wb6 = leftX_Waterball[5];
    assign leftX_wb7 = leftX_Waterball[6];
    assign leftX_wb8 = leftX_Waterball[7];
    assign leftX_wb9 = leftX_Waterball[8];
    assign leftX_wb10 = leftX_Waterball[9];
    assign leftX_wb11 = leftX_Waterball[10];
    assign leftX_wb12 = leftX_Waterball[11];
        
    assign Health_Charmander = HP_Charmander * 100 / MAX_HP;
    assign Health_Squirtle = HP_Squirtle * 100 / MAX_HP;
endmodule
