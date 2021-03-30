`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2021 17:41:38
// Design Name: 
// Module Name: Fruit_Ninja_Logic
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


module Fruit_Ninja_Logic(
    input btnC,
    input [3:0] state,
    output reg fruit_ended = 0,
    input single_pulse_clk,
    input [11:0] frequency,         
    input [11:0] raw_mic_data,
    input [6:0] X,
    input [5:0] Y,
    output [15:0] oled_fruit
    );
    parameter [15:0]BACKGROUND = 16'b11111_111111_00000; //white
    parameter [11:0] FREQ_THRESHOLD = 12'd1500;
    
    wire [15:0] oled_watermelon, oled_watermelonS, oled_banana, oled_bananaS, oled_strawberry, oled_strawberryS;
    
    integer i;
    reg [5:0] fruit_EN = 6'b000000;
    reg break = 0;
    reg can_slice = 0;
    reg [8:0] countCanSlice = 9'd0;
    reg already_have_random = 0;
    reg [2:0] random = 3'd0;
    reg [10:0] timer = 11'd0; //timer increases when fruit is not sliced
    always @(posedge single_pulse_clk) begin  
        //If the state is in the game state and not ended
        if (state == 4'b0100 && fruit_ended == 0) begin  
            //If not yet have random fruit generate one
            if (already_have_random == 0) begin
                random <= (raw_mic_data % 3) * 2; //0 is watermelon, 2 is banana, 4 is strawberry
                already_have_random <= 1;
            end

            // If frequency is high and something is displayed, display the sliced one and un-display the non-sliced on
            if (frequency > FREQ_THRESHOLD && can_slice == 1) begin
                for (i=0;(i<6&&break==0);i=i+2) begin
                    if(fruit_EN[i] == 1) begin
                        fruit_EN[i] <= 0;
                        fruit_EN[i+1] <= 1;
                        can_slice <= 0;
                        break = 1;
                        timer <= 0;
                    end
                end
                break = 0;  
            end

            // If not sliced after certain time display next fruit
            timer <= timer + 1;
            if (timer == 1999) begin
                timer <=0;
                if (already_have_random == 1) begin //If u have a random fruit, display the random fruit and disablle old fruit
                    fruit_EN <= (6'b000001 << random); //(bitshift)
                    already_have_random <= 0;
                    can_slice <= 1;
                end else begin //if no random fruit yet (by right shldnt happen unless at first clk cycle) , then show nothing (e.g. oled fruit disappear)
                    fruit_EN <= 6'b000000;
                end
            end

            // If button is pressed, quit the game
            if (btnC == 1) begin
                fruit_ended <= 1;
            end
            
            if(can_slice == 0) begin
                countCanSlice <= countCanSlice + 1;
                if(countCanSlice == 249) begin
                    countCanSlice <= 0;
                    can_slice <= 1;
                end
            end
        end
        else if (state == 4'b0000) begin //back to menu alrdy, reinitialize everything
            already_have_random <= 0;
            random <= 3'd0;
            timer <= 11'd0;
            fruit_ended <= 0;
            fruit_EN <= 6'b000000;
            can_slice <= 0;
            countCanSlice <= 9'd0;
        end
   
    end
    
    watermelon_display watermelon_un (.X(X), .Y(Y), .leftX_watermelon(15), .topY_watermelon(2), .BACKGROUND(BACKGROUND), .watermelon(oled_watermelon));
    watermelon_sliced watermelon_sliced (.X(X), .Y(Y), .leftX_watermelon(15), .topY_watermelon(2), .BACKGROUND(BACKGROUND), .watermelonS(oled_watermelonS));
    banana_display banana_un (.X(X), .Y(Y), .leftX_banana(15), .topY_banana(2), .BACKGROUND(BACKGROUND), .banana(oled_banana));
    banana_sliced banana_sliced (.X(X), .Y(Y), .leftX_banana(15), .topY_banana(2), .BACKGROUND(BACKGROUND), .bananaS(oled_bananaS));
    strawberry_display strawberry_un (.X(X), .Y(Y), .leftX_strawberry(15), .topY_strawberry(2), .BACKGROUND(BACKGROUND), .strawberry(oled_strawberry));
    strawberry_sliced strawberry_sliced (.X(X), .Y(Y), .leftX_strawberry(15), .topY_strawberry(2), .BACKGROUND (BACKGROUND), .strawberryS(oled_strawberryS));
    
    assign oled_fruit = (fruit_EN[0] == 1 && X >= 15 && X <= 70 && Y >= 2 && Y <= 61) ? oled_watermelon:
                        (fruit_EN[1] == 1 && X >= 15 && X <= 70 && Y>=2 && Y <= 61) ? oled_watermelonS:
                        (fruit_EN[2] == 1 && X >= 15 && X <= 70 && Y>=2 && Y <= 61) ? oled_banana:
                        (fruit_EN[3] == 1 && X>= 15 && X <= 70 && Y>=2 && Y <= 61) ? oled_bananaS:
                        (fruit_EN[4] == 1 && X>= 15 && X <= 70 && Y>=2 && Y <= 61) ? oled_strawberry:
                        (fruit_EN[5] == 1 && X>= 15 && X <= 70 && Y>=2 && Y <= 61) ? oled_strawberryS:
                        BACKGROUND;
endmodule
