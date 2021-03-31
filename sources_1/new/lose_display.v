`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2021 14:57:12
// Design Name: 
// Module Name: lose_display
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


module lose_display(
	input [6:0]X,
	input [5:0]Y,
	output reg [15:0]oled_lose = 16'd0
);

	parameter [15:0]BLACK = 16'b00000_000000_00000;
	parameter [15:0]BLUE = 16'b00000_000000_11111;
	parameter [15:0]RED = 16'b11111_000000_00000;
	parameter [15:0]GREY = 16'b10101_101010_10100;
	parameter [15:0]BACKGROUND = 16'b11111_000000_11111; //purple

	always @ (X or Y) begin
	//LOSE
	//vertical lines
	if (((Y >= 2 && Y <= 16) && ((X >= 5 && X <= 8) || (X >= 28 && X <= 30) || (X >= 38 && X <= 40) || (X >= 81 && X <= 83))) || ((Y >= 2 && Y <= 9) && (X >= 56 && X <= 58)) ||  ((Y >= 8 && Y <= 16) && (X >= 63 && X <= 65))) oled_lose = BLACK;
	//horizontal lines
	else if (((Y == 2 || Y == 3) && ((X >= 28 && X <= 40) || (X >= 56 && X <= 65) || (X >= 81 && X <= 91))) || ((Y == 15 || Y == 16) && ((X >= 5 && X <= 15) || (X >= 28 && X <= 40) || (X >= 56 && X <= 65) || (X >= 81 && X <= 91))) || ((Y == 8 || Y == 9) && ((X >= 56 && X <= 65) || (X >= 81 && X <= 91)))) oled_lose = BLACK;

	//WHY & SO
	//vertical lines
	else if (((Y >= 20 && Y <= 32) && ((X >= 13 && X <= 15) || (X >= 24 && X <= 26) || (X >= 32 && X <= 34) || (X >= 40 && X <= 42) || (X >= 55 && X <= 57))) || ((Y >= 20 && Y <= 27) && (X >= 48 && X <= 49)) || ((Y >= 35 && Y <= 44) && (X == 74 || X == 75 || X == 80 || X == 81)) || ((Y >= 35 && Y <= 39) && (X == 60 || X == 61)) || ((Y >= 39 && Y <= 44) && (X == 67 || X == 68))) oled_lose = BLUE;
	//horizontal lines
	else if (((Y == 26 || Y == 27) && ((X >= 32 && X <= 42) || (X >= 48 && X <= 56))) || ((X >= 60 && X <= 68) && (Y == 35 || Y == 39 || Y == 44)) || ((X >= 74 && X <= 81) && (Y == 35 || Y == 44))) oled_lose = BLUE;
	//block in W
	else if (((X == 16 || X == 23) && (Y >= 29 && Y <= 31)) || ((X == 17 || X == 22) && (Y >= 28 && Y <= 30)) || ((X == 18 || X == 21) && (Y >= 27 && Y <= 29)) || ((X == 19 || X == 20 || X == 21) && (Y >= 25 && Y <= 28))) oled_lose = BLUE;

	//TRASH
	//vertical lines
	else if (((Y >= 49 && Y <= 62) && (X == 29 || X == 30 || X == 40 || X == 41 || X == 42 || X == 55 || X == 56 || X == 62 || X == 63 || X == 84 || X == 85 || X == 91 || X == 92)) || ((Y >= 49 && Y <= 56) && (X == 48 || X == 49 || X == 70 || X == 71)) || ((Y >= 56 && Y <= 62) && (X == 77 || X == 78))) oled_lose = RED;
	//horizontal lines
	else if (((Y == 49 || Y == 50) && ((X >= 25 && X <= 34) || (X >= 40 && X <= 49) || (X >= 55 && X <= 63))) || ((Y == 56 || Y == 57) && ((X >= 40 && X <= 49) || (X >= 55 && X <= 63) || (X >= 84 && X <= 92))) || ((Y == 49 || Y == 56 || Y == 62) && (X >= 70 && X <= 78))) oled_lose = RED;
	//block in R
	else if (((X == 43 || X == 44) && (Y == 58 || Y == 59)) || ((X == 45 || X == 46) && (Y == 59 || Y == 60)) || ((X == 47 || X == 48) && (Y == 60 || Y == 61)) || (X == 49 && Y == 62)) oled_lose = RED;

	//TRASH CAN
	//vertical lines
	else if (((Y == 41 || Y == 42) && (X == 9 || X == 14)) || ((Y == 44 || Y == 45 || Y == 46) && (X == 3 || X == 20)) || ((Y >= 47 && Y <= 62) && (X == 4 || X == 19)) || ((Y >= 52 && Y <= 60) && (X == 6 || X == 7 || X == 11 || X == 12 || X == 16 || X == 17))) oled_lose = BLACK;
	//horizontal lines
	else if (((X >= 10 && X <= 13) && Y == 40) || ((X >= 4 && X <= 19) && (Y == 43 || Y == 47 || Y == 62))) oled_lose = BLACK;
	//grey fill
	else if (((X >= 10 && X <= 13) && (Y == 41 || Y == 42)) || ((X >= 4 && X <= 19) && (Y >= 44 && Y <= 61))) oled_lose = GREY;

	else oled_lose = BACKGROUND;

	end

endmodule
