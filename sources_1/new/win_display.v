`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2021 13:33:49
// Design Name: 
// Module Name: win_display
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


module win_display(
	input [6:0]X,
	input [5:0]Y,
	output reg [15:0]oled_win = 16'd0
);

	parameter [6:0] leftX_1 = 7'd6;
	parameter [6:0] leftX_2 = 7'd80;

	parameter [15:0]BLACK = 16'b00000_000000_00000;
	parameter [15:0]BLUE = 16'b00000_000000_11111;
	parameter [15:0]RED = 16'b11111_000000_00000;
	parameter [15:0]GREEN = 16'b00000_111111_00000;
	parameter [15:0]WHITE = 16'b11111_111111_11111;
	parameter [15:0]LIGHT_BLUE = 16'b00000_101100_11101;
	parameter [15:0]BROWN = 16'b11101_011111_00110;
	parameter [15:0]BACKGROUND = 16'b11111_000000_11111; //purple

	always @ (X or Y) begin
	//colourful block left
	//green confetti
	if ((X == leftX_1 && (Y >= 40 && Y <= 42)) || (X == leftX_1 + 4  && (Y >= 35 && Y <= 37)) || (X == leftX_1 + 8  && (Y >= 47 && Y <= 49)) || ((X == leftX_1 + 3 || X == leftX_1 + 4)  && (Y == 42 || Y == 43))) oled_win = GREEN;
	//pink confetti
	else if ((X == leftX_1 + 6 && (Y >= 42 && Y <= 44)) || (X == leftX_1 + 9  && (Y >= 39 && Y <= 41)) || ((X == leftX_1 || X == leftX_1 + 1)  && (Y == 45 || Y == 46)) || ((X == leftX_1 + 8 || X == leftX_1 + 9)  && (Y == 36 || Y == 37))) oled_win = PINK;
	//blue confetti
	else if ((X == leftX_1 + 3 && (Y >= 46 && Y <= 48)) || (X == leftX_1 + 6  && (Y >= 38 && Y <= 40)) || ((X == leftX_1 + 1 || X == leftX_1 + 2)  && (Y == 37 || Y == 38)) || ((X == leftX_1 + 9 || X == leftX_1 + 10)  && (Y == 43 || Y == 44))) oled_win = LIGHT_BLUE;
	//brown block
	else if ((X >= leftX_1 + 3 && X <= leftX_1 + 5) && (Y >= 50 && Y <= 63)) oled_win = BROWN;

	//colourful block right
	//green confetti
	else if ((X == leftX_2 && (Y >= 40 && Y <= 42)) || (X == leftX_2 + 4  && (Y >= 35 && Y <= 37)) || (X == leftX_2 + 8  && (Y >= 47 && Y <= 49)) || ((X == leftX_2 + 3 || X == leftX_2 + 4)  && (Y == 42 || Y == 43))) oled_win = GREEN;
	//pink confetti
	else if ((X == leftX_2 + 6 && (Y >= 42 && Y <= 44)) || (X == leftX_2 + 9  && (Y >= 39 && Y <= 41)) || ((X == leftX_2 || X == leftX_2 + 1)  && (Y == 45 || Y == 46)) || ((X == leftX_2 + 8 || X == leftX_2 + 9)  && (Y == 36 || Y == 37))) oled_win = PINK;
	//blue confetti
	else if ((X == leftX_2 + 3 && (Y >= 46 && Y <= 48)) || (X == leftX_2 + 6  && (Y >= 38 && Y <= 40)) || ((X == leftX_2 + 1 || X == leftX_2 + 2)  && (Y == 37 || Y == 38)) || ((X == leftX_2 + 9 || X == leftX_2 + 10)  && (Y == 43 || Y == 44))) oled_win = LIGHT_BLUE;
	//brown block
	else if ((X >= leftX_2 + 3 && X <= leftX_2 + 5) && (Y >= 50 && Y <= 63)) oled_win = BROWN;



	//WORDS!!!
	//WIN
	//vertical lines
	else if ((Y >= 3 && Y <= 17) && ((X >= 10 && X <= 12) || (X >= 28 && X <= 30) || (X >= 50 && X <= 52) || (X >= 72 && X <= 74) || (X >= 83 && X <= 85))) oled_win = BLACK;
	//horizontal lines
	else if ((X >= 46 && X <= 56) && (Y == 3 || Y == 4 || Y == 16 || Y == 17)) oled_win = BLACK;
	//blocks in W
	else if (((X == 13 || X == 14 || X == 26 || X == 27) && (Y >= 13&& Y <= 17)) || ((X == 15 || X == 16 || X == 24 || X == 25) && (Y >= 12 && Y <= 16)) || ((X == 17 || X == 18 || X == 22 || X == 23) && (Y >= 11 && Y <= 15)) || ((X == 19 || X == 20 || X == 21) && (Y >= 8 && Y <= 14))) oled_win = BLACK;
	//blocks in N
	else if (((X == 75 || X == 76) && (Y >= 5 && Y <= 9)) || ((X == 77 || X == 78 ) && (Y >= 7 && Y <= 11)) || ((X == 79 || X == 80) && (Y >= 9 && Y <= 13)) || ((X == 81 || X == 82) && (Y >= 11 && Y <= 15))) oled_win = BLACK;

	//ZAI
	//horizontal lines
	else if (((X >= 33 && X <= 40) && (Y == 36 || Y == 37 || Y == 46 || Y == 47)) || ((X >= 46 && X <= 54) && (Y == 36 || Y == 37 || Y == 41 || Y == 42)) || ((X >= 60 && X <= 67) && (Y == 36 || Y == 47))) oled_win = RED;
	//vertical lines
	else if ((Y >= 36 && Y <= 47) && (X == 46 || X == 47 || X == 53 || X == 54 || X == 63 || X == 64)) oled_win = RED;
	//blocks in Z
	else if ((X == 33 && Y == 45) || (X == 34 && (Y == 44 || Y == 45)) || (X == 35 && (Y == 43 || Y == 44 || Y == 47)) || (X == 36 && (Y == 42 || Y == 43 || Y == 44)) || (X == 37 && (Y == 41 || Y == 42 || Y == 43)) || (X == 38 && (Y == 40 || Y == 41 || Y == 42)) || (X == 39 && (Y == 39 || Y == 40 || Y == 41)) || (X == 40 && (Y == 38 || Y == 39 || Y == 40))) oled_win = RED;

	//DAMN & SIOL
	//vertical lines
	else if (((Y >= 21 && Y <= 31) && (X == 22 || X == 23 || X == 37 || X == 38 || X == 44 || X == 45 || X == 51 || X == 52 || X == 58 || X == 59 || X == 65 || X == 66 || X == 72 || X == 73)) || ((Y >= 22 && Y <= 30) && (X == 29 || X == 30)) || ((Y >= 53 && Y <= 62) && (X == 42 || X == 43 || X == 52 || X == 53 || X == 59 || X == 60 || X == 66 || X == 67)) || ((Y >= 53 && Y <= 57) && (X == 25 || X == 26)) || ((Y >= 57 && Y <= 62) && (X == 32 || X == 33))) oled_win = BLUE;
	//horizontal lines
	else if (((X >= 22 && X <= 29) && (Y == 21 || Y == 31)) || ((X >= 37 && X <= 45) && (Y == 21 || Y == 22 || Y == 26 || Y == 27)) || (Y == 53 && ((X >= 25 && X <= 33) || (X >= 39 && X <= 46) || (X >= 52 && X <= 60))) || (Y == 62 && ((X >= 25 && X <= 33) || (X >= 39 && X <= 46) || (X >= 52 && X <= 60) || (X >= 66 && X <= 72))) || (Y == 57 && (X >= 25 && X <= 33))) oled_win = BLUE;
	//blocks in M
	else if (((X == 53 || X == 57) && (Y >= 22 && Y <= 24)) || ((X == 54 || X == 56) && (Y >= 23 && Y <= 25)) || (X == 55 && (Y >= 24 && Y <= 26))) oled_win = BLUE; 
	//blocks in N
	else if ((X == 67 && (Y >= 22 && Y <= 24)) || (X == 68 && (Y >= 23 && Y <= 25)) || (X == 69 && (Y >= 24 && Y <= 26)) || (X == 70 && (Y >= 25 && Y <= 27)) || (X == 71 && (Y >= 26 && Y <= 28))) oled_win = BLUE;

	else oled_win = BACKGROUND;

	end

endmodule

