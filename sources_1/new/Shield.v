`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2021 20:45:34
// Design Name: 
// Module Name: Shield
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


module Shield(
    input[6:0] X, 
    input [5:0] Y, 
    input [6:0] leftX,  
    input [5:0] topY, 
    input [15:0] BACKGROUND,
    output reg [15:0] oled_data = 16'b0
    );
    
    parameter [15:0] LIGHTBLUE2 = 16'b00000_010111_11111; //LIGHTBLUE is darker than LIGHTBLUE2 is darker than LIGHTBLUE3
    parameter [15:0] LIGHTBLUE3 = 16'b10100_011101_11111;
    always @ (X or Y) begin
        if (Y == topY || Y == topY + 17 || (Y >= topY + 4 && Y <= topY + 6) || (Y >= topY + 11 && Y <= topY + 13)) oled_data = LIGHTBLUE3;
        else oled_data = LIGHTBLUE2;
    end
endmodule
