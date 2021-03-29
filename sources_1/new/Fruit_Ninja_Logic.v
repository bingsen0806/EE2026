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
    output reg [5:0] fruit_EN = 6'b000000,
    input single_pulse_clk,
    input [11:0] frequency,         
    input [11:0] raw_mic_data
    );
    integer i;
    reg break = 0;
    parameter [11:0] FREQ_THRESHOLD = 12'd1500;
    reg already_have_random = 0;
    reg [2:0] random = 3'd0;
    reg [9:0] timer = 10'd0; //timer increases when fruit is not sliced
    always @(posedge single_pulse_clk) begin  
        //If the state is in the game state and not ended
        if (state == 4'b0100 && fruit_ended == 0) begin  
            //If not yet have random fruit generate one
            if (already_have_random == 0) begin
                random <= (raw_mic_data % 3) * 2; //0 is watermelon, 2 is banana, 4 is strawberry
            end

            // If frequency is high and something is displayed, display the sliced one and un-display the non-sliced on
            if (frequency > FREQ_THRESHOLD) begin
                for (i=0;(i<6&&break==0);i=i+2) begin
                    if(fruit_EN[i] == 1) begin
                        fruit_EN[i] <= 0;
                        fruit_EN[i+1] <= 1;
                        break = 1;
                        timer <= 0;
                    end
                end
                break = 0;  
            end

            // If not sliced after certain time display next fruit
            if (timer == 999) begin
                timer <=0;
                if (already_have_random) begin //If u have a random fruit, display the random fruit and disablle old fruit
                    fruit_EN <= 6'b000001 << random; //(bitshift)
                end else begin //if no random fruit yet (by right shldnt happen unless at first clk cycle) , then show nothing (e.g. oled fruit disappear)
                    fruit_EN <= 6'b000000;
                end
            end

            // If button is pressed, quit the game
            if (btnC == 1) begin
                fruit_ended <= 0;
            end

            end
        else if (state == 4'b0000) begin //back to menu alrdy, reinitialize everything
            already_have_random <= 0;
            random <= 3'd0;
            timer <= 10'd0;
        end
   
    end
endmodule
