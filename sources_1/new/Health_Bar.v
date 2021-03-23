`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2021 19:12:43
// Design Name: 
// Module Name: Health_Bar
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


module Health_Bar(
    input[6:0] X, 
    input [5:0] Y, 
    input [6:0] leftX,  
    input [5:0] topY, 
    input [15:0] BACKGROUND,
    input [31:0] health_level,
    output reg [15:0] oled_data = 16'b0
    );

    parameter[15:0] YELLOW = 16'b11111_111111_00000;
    parameter[15:0] GREEN = 16'b00000_111111_00000;
    parameter[15:0] RED = 16'b11111_000000_00000;
    parameter[15:0] BLACK  = 16'b0;
    parameter[15:0] WHITE = 16'b11111_111111_11111;
    
    reg [15:0] health_colour = GREEN;
    reg [3:0] health_width = 4'b0;
    always @ (health_level) begin
        health_colour = health_level <= 7'd20 ? RED : 
                        health_level <= 7'd50 ? YELLOW:
                        GREEN;
        health_width = health_level < 7 ? 4'd0:
                       health_level < 14 ? 4'd1:
                       health_level < 20 ? 4'd2:
                       health_level < 27 ? 4'd3:
                       health_level < 34 ? 4'd4:
                       health_level < 40 ? 4'd5:
                       health_level < 47 ? 4'd6:
                       health_level < 54 ? 4'd7:
                       health_level < 60 ? 4'd8:
                       health_level < 67 ? 4'd9:
                       health_level < 74 ? 4'd10:
                       health_level < 80 ? 4'd11:
                       health_level < 87 ? 4'd12:
                       health_level < 94 ? 4'd13:
                       health_level < 100 ? 4'd14: 4'd15;                    
    end

    always @ (X or Y) begin
        if (Y == topY || Y == topY + 3) begin
            if (X >= leftX + 1 && X <= leftX + 15) oled_data = BLACK;
            else oled_data = BACKGROUND;
        end else if (Y == topY + 1 || Y == topY + 2) begin
            if (X == leftX || X == leftX + 16) oled_data = BLACK;
            else if (X >= leftX + 1 && X <= leftX + health_width)oled_data = health_colour;
            else oled_data = WHITE;
        end
    end


endmodule
