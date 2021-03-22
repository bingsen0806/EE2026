`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2021 10:53:13
// Design Name: 
// Module Name: Pixel_Coordinate
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


module Pixel_Coordinate(
    input [12:0] pixel_index,
    output [6:0] X,
    output [5:0] Y
    );
    assign X = (pixel_index ) % 96;
    assign Y = (pixel_index ) / 96;
endmodule
