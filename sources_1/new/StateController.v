`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2021 19:00:56
// Design Name: 
// Module Name: StateController
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


module StateController(
    input btnC, btnL, btnR, btnU, btnD, //single pulse inputs
    input clk, //1kHz, same as single pulse one
    input [1:0] nextStateMenu, //00 goes to volume bar, 01 goes to pokemon, 10 goes to fruit ninja, 11 goes to potion mixing
    input pokemon_ended, fruit_ninja_ended, potion_mixing_ended,
    output reg [3:0] state = 4'b0000
    );
    
    always @(posedge clk) begin
        case(state)
        4'b0000: begin//menu
            if(btnC == 1) begin
                if(nextStateMenu == 2'b00) state <= 4'b0001;
                else if (nextStateMenu == 2'b01) state <= 4'b0010;
                else if (nextStateMenu == 2'b10) state <= 4'b0010; //temporary only, remember change back to 0011
                else if (nextStateMenu == 2'b11) state <= 4'b0010; //remember to change back to 0100
            end
        end
        4'b0001: begin //volume bar 
            if (btnC == 1) begin
                state <= 4'b0000; //go back to menu
            end
        end
        4'b0010: begin //pokemon game
            if (pokemon_ended == 1) begin
                state <= 4'b0011; //go to pokemon game over page
            end
        end
        4'b0011: begin // pokemon game over
            if (btnC == 1) begin
                state <= 4'b0000; //go back to menu
            end
        end
        4'b0100: begin //fruit ninja
            if (fruit_ninja_ended == 1) begin
                state <= 4'b0000; //go back to menu
            end
        end
        4'b0101: begin //potion mixing
            if (potion_mixing_ended == 1) begin
                state <= 4'b0000; //go back to menu
            end
        end
        endcase
    
    end
endmodule
