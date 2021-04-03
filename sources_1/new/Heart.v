`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2021 19:12:22
// Design Name: 
// Module Name: Heart
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


module Heart(
    input[6:0] X, 
    input [5:0] Y, 
    input [6:0] leftX,  
    input [5:0] topY, 
    input [15:0] BACKGROUND,
    output reg [15:0] oled_data = 16'b0
    );

    parameter[15:0] RED = 16'b11111_000000_00000;

    always @ (X or Y) begin
        if (Y == topY) begin
            if ((X >= leftX && X <= leftX + 1) || (X >= leftX + 3 && X <= leftX + 4)) oled_data = RED;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 1) begin
            oled_data = RED;
        end else if (Y == topY + 2) begin
            if ((X >= leftX + 1 && X <= leftX + 3)) oled_data = RED;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 3) begin
            if (X == leftX + 2) oled_data = RED;
            else oled_data = BACKGROUND;
        end
    end
endmodule
