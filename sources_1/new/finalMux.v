`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2021 18:43:28
// Design Name: 
// Module Name: finalMux
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


module finalMux(
    input clk,
    input [3:0] state,
    input [15:0] oled_menu, oled_basic, oled_pokemon, oled_pokemon_over, oled_potion_mixing,
    input [3:0] an_basic, an_pokemon,
    input [7:0] seg_basic, seg_pokemon,
    output reg [15:0] oled_data,
    output reg [3:0] an,
    output reg [7:0] seg,
    input [15:0] oled_loading
    );
    
    always @ (posedge clk) begin
        case(state)
        4'b0000: begin //menu
            oled_data <= oled_menu;
            an <= an_basic;
            seg <= seg_basic;   
        end
        4'b0001: begin //volume bar
            oled_data <= oled_basic;
            an <= an_basic;
            seg <= seg_basic; 
        end
        4'b0010: begin //pokemon game
            oled_data <= oled_pokemon;
            an <= an_pokemon;
            seg <= seg_pokemon;
        end
        4'b0011: begin //pokemon game over
            oled_data <= oled_pokemon_over;
            an <= 4'b1111;
            seg <= 8'b11111_111;
        end
        4'b0100: begin
            oled_data <= 16'b00000_000000_11111;
            an <= 4'b1111;
            seg <= 8'b11111_111;
        end
        4'b0101: begin
            oled_data <= oled_potion_mixing;
            an <= 4'b1111;
            seg <= 8'b11111_111;
        end
        4'b0110: begin
            oled_data <= oled_loading;
            an <= 4'b1111;
            seg <= 8'b11111_111;        
        end
        endcase
    
    
    end
endmodule
