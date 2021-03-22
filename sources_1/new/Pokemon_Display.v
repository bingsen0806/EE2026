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
    output [15:0] oled_data
    );
    parameter [15:0] BACKGROUND = 16'b11111_111111_11111;
    wire [15:0] oled_charmander, oled_squirtle;
    
    //Can set leftX to fixed constant later
    Charmander charmander(.X(X),.Y(Y),.leftX(leftXCharmander),.topY(topYCharmander),.BACKGROUND(BACKGROUND),.oled_data(oled_charmander));
    Squirtle squirtle(.X(X),.Y(Y),.leftX(leftXSquirtle),.topY(topYSquirtle),.BACKGROUND(BACKGROUND),.oled_data(oled_squirtle));
    assign oled_data = (X >= leftXCharmander && X <= leftXCharmander + 20 && Y >= topYCharmander && Y <= topYCharmander + 17) ? oled_charmander:
                       (X >= leftXSquirtle && X <= leftXSquirtle + 20 && Y >= topYSquirtle && Y <= topYSquirtle + 17) ? oled_squirtle:
                        BACKGROUND;
                       
endmodule
