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
    input [15:0] oled_menu, oled_basic, oled_pokemon, oled_pokemon_over, oled_potion_mixing, oled_fruit,
    input [3:0] an_basic, an_pokemon, an_potion,
    input [7:0] seg_basic, seg_pokemon, seg_potion,
    output reg [15:0] oled_data,
    output reg [3:0] an,
    output reg [7:0] seg,
    input [15:0] oled_loading,
    input [6:0] X,
    input [5:0] Y,
    input sw_potion
    );
    parameter [15:0]LIGHT_BLUE = 16'b00000_101100_11101;
    parameter [15:0]BROWN = 16'b11101_011111_00110;
    parameter [6:0] leftX_1 = 7'd6;
    parameter [6:0] leftX_2 = 7'd80;
    parameter [15:0] WHITE = 16'b11111_111111_11111;
    parameter [15:0] GREEN = 16'b00000_111111_00000;
	parameter [15:0] BLACK = 16'b00000_000000_00000;
    parameter [15:0] RED = 16'b11111_000000_00000;
    parameter [15:0] BLUE = 16'b00000_000000_11111;
    parameter [15:0] BACKGROUND = 16'b11101_111000_01011; //yellow
    parameter [15:0]BACKGROUND2 = 16'b11111_000000_11111; //purple
    reg [15:0] oled_over;
    reg [15:0] oled_win;
    always @ (X or Y) begin
        //OVER & LIAO
        //horizontal lines
        if ((((X >= 5 && X <= 13) || (X >= 42 && X <= 50)) && (Y == 4 || Y == 5 || Y == 6 | Y == 17 || Y == 18)) || ((X >= 58 && X <= 66) && (Y == 4 || Y == 5)) || ((Y == 11) && ((X >= 44 && X <= 50) || (X >= 60 && X <= 66))) || ((Y == 21 || Y == 22) && ((X >= 48 && X <= 57) || (X>= 65 && X <= 74) || (X >= 82 && X <= 91))) || ((Y == 34 || Y == 35) && ((X >= 31 && X <= 40) || (X >= 48 && X <= 57) || (X >= 82 && X <= 91))) || ((Y == 28 || Y == 29) && (X >= 65 && X <= 74))) oled_over = BLACK;
        //vertical lines
        else if (((Y >= 4 && Y <= 18) && (X == 5 || X == 6 || X == 12 || X == 13 || X == 42 || X == 43 || X == 58 || X == 59)) || (Y >= 4 && Y <= 11) && (X == 21 || X == 22 || X == 33 | X == 34 | X == 65 | X == 66) || (Y >= 21 && Y <= 35) && (X == 31 || X == 32 || X == 52 || X == 53 || X == 65 || X == 66 || X == 73 || X == 74 || X == 82 || X == 83 || X == 90 || X == 91)) oled_over = BLACK;
        //blocks in V
        else if (((Y >= 11 && Y <= 14) && (X == 23 || X == 24 || X == 31 || X == 32 || X == 60)) || ((Y >= 13 && Y <= 16) && (X == 25 || X == 26 || X == 29 || X == 30)) || ((Y >= 15 && Y <= 18) && (X == 27 || X == 28))) oled_over = BLACK;
        //blocks in R
        else if (((Y >= 13 && Y <= 15) && X == 61) || ((Y >= 14 && Y <= 16) && X == 62) || ((Y >= 15 && Y <= 17) && X == 63) || ((Y >= 16 && Y <= 18) && (X == 64 || X == 65))) oled_over = BLACK;


        //SHIOK & HOR
        //vertical lines
        else if ((Y >= 40 && Y <= 49) && (X == 17 || X == 18 || X == 25 || X == 26 || X == 36 || X == 37 || X == 47|| X == 48 || X == 56 || X == 57 || X == 62 || X == 63) || (Y >= 53 && Y <= 62) && (X == 53 || X == 54 || X == 61 || X == 62 || X == 68 || X == 69 || X == 76|| X == 77 || X == 83 || X == 84) || ((X == 3 || X == 4) && (Y >= 40 && Y <= 44)) || ((X == 11 | X == 12) && (Y >= 44 && Y <= 49)) || ((X == 89 || X == 90) && (Y >= 53 && Y <= 57))) oled_over = BLUE;
        //horizontal lines
        else if (((Y == 40 || Y == 41 || Y == 48 || Y == 49) && ((X >= 33 && X <= 42) || (X >= 48 && X <= 57))) || ((X >= 3 && X <= 12) && (Y == 40 || Y == 44|| Y == 49)) || ((X >= 18 && X <= 27) && Y == 44) || ((Y == 53 || Y == 54) && ((X >= 68 && X <= 77) || (X >= 83 && X <= 89))) || ((Y == 61 || Y == 62) && (X >= 68 && X <= 77)) || (Y == 57 && ((X >= 53 && X <= 62) || (X >= 83 && X <= 89)))) oled_over = BLUE;
        //blocks in K
        else if (((X == 65 || X == 66) && (Y  >= 43 && Y <= 45)) || ((X == 67 || X == 68) && (Y == 42 || Y == 43 || (Y >= 45 && Y <= 47))) || ((X == 69 || X == 70) && (Y == 41 || Y == 42 || (Y >= 47 && Y <= 49)))) oled_over = BLUE;
        //blocks in R
        else if (((Y == 58 || Y == 59) && X == 85) || ((Y == 59 || Y == 60) && X == 86) || ((Y == 60 || Y == 61) && X == 87) || ((Y == 61 || Y == 62) && X == 88)) oled_over = BLUE;


        //HEART
        else if (((Y>= 40 && Y <= 42) && (X >= 78 && X <= 86)) || ((Y>= 38 && Y <= 43) && (X == 79 || X == 80 || X == 84 || X == 85)) || ((Y>= 43 && Y <= 45) && (X >= 81 && X <= 83)) || (Y == 39 && (X == 78 || X == 81 || X == 83 || X == 86)) || (Y == 44 && (X == 80 || X == 84)) || (Y == 46 && X == 82)) oled_over = RED;

        else oled_over = BACKGROUND;

    end
    
	always @ (X or Y) begin
    //colourful block left
    //green confetti
    if ((X == leftX_1 && (Y >= 40 && Y <= 42)) || (X == leftX_1 + 4  && (Y >= 35 && Y <= 37)) || (X == leftX_1 + 8  && (Y >= 47 && Y <= 49)) || ((X == leftX_1 + 3 || X == leftX_1 + 4)  && (Y == 42 || Y == 43))) oled_win = GREEN;
    //pink confetti
    else if ((X == leftX_1 + 6 && (Y >= 42 && Y <= 44)) || (X == leftX_1 + 9  && (Y >= 39 && Y <= 41)) || ((X == leftX_1 || X == leftX_1 + 1)  && (Y == 45 || Y == 46)) || ((X == leftX_1 + 8 || X == leftX_1 + 9)  && (Y == 36 || Y == 37))) oled_win = WHITE;
    //blue confetti
    else if ((X == leftX_1 + 3 && (Y >= 46 && Y <= 48)) || (X == leftX_1 + 6  && (Y >= 38 && Y <= 40)) || ((X == leftX_1 + 1 || X == leftX_1 + 2)  && (Y == 37 || Y == 38)) || ((X == leftX_1 + 9 || X == leftX_1 + 10)  && (Y == 43 || Y == 44))) oled_win = LIGHT_BLUE;
    //brown block
    else if ((X >= leftX_1 + 3 && X <= leftX_1 + 5) && (Y >= 50 && Y <= 63)) oled_win = BROWN;

    //colourful block right
    //green confetti
    else if ((X == leftX_2 && (Y >= 40 && Y <= 42)) || (X == leftX_2 + 4  && (Y >= 35 && Y <= 37)) || (X == leftX_2 + 8  && (Y >= 47 && Y <= 49)) || ((X == leftX_2 + 3 || X == leftX_2 + 4)  && (Y == 42 || Y == 43))) oled_win = GREEN;
    //pink confetti
    else if ((X == leftX_2 + 6 && (Y >= 42 && Y <= 44)) || (X == leftX_2 + 9  && (Y >= 39 && Y <= 41)) || ((X == leftX_2 || X == leftX_2 + 1)  && (Y == 45 || Y == 46)) || ((X == leftX_2 + 8 || X == leftX_2 + 9)  && (Y == 36 || Y == 37))) oled_win = WHITE;
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
    
    always @ (posedge clk) begin
        case(state)
        4'b1111: begin //locked state
            oled_data <= 16'd0;
            an <= 4'b1111; 
            seg <= 8'b11111_111;
        end
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
            oled_data <= oled_fruit;
            an <= an_basic;
            seg <= seg_basic;
        end
        4'b0101: begin
            oled_data <= oled_potion_mixing;
            if (sw_potion == 0) begin
                an <= an_potion;
                seg <= seg_potion;
            end else begin
                an <= an_basic;
                seg <= seg_basic;
            end
        end
        4'b0110: begin
            oled_data <= oled_loading;
            an <= 4'b1111;
            seg <= 8'b11111_111;        
        end
        4'b0111: begin //potion win
            oled_data <= oled_over; // potion game over
            an <= an_potion;
            seg <= seg_potion;
        end
        4'b1000: begin
            oled_data <= oled_win;
            an <= an_potion;
            seg <= seg_potion;
        end
        endcase
    end
endmodule
