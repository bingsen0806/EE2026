`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2021 20:17:21
// Design Name: 
// Module Name: Stadium
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


module Stadium(
    input[6:0] X, 
    input [5:0] Y, 
    output reg [15:0] oled_data = 16'b0
    );
    //GREEN1 is darkest. GREEN4 is lightest
    parameter [15:0] GREEN1 = 16'b00111_011111_00100;
    parameter [15:0] GREEN2 = 16'b00101_101010_00101;
    parameter [15:0] GREEN3 = 16'b10001_110000_00100;
    parameter [15:0] GREEN4 = 16'b10110_111010_10100;
    parameter [15:0] BROWN = 16'b01111_001111_00000;
    parameter [15:0] DARKGREY = 16'b01010_010101_01011;
    parameter [15:0] LIGHTGREY = 16'b10111_110000_11000;
    parameter [15:0] DARKBLUE = 16'b00000_000000_10000;
    parameter [15:0] PEACH = 16'b11110_111010_11000;
    
    always @ (X or Y) begin
        if (X == 0 || X == 95) oled_data = GREEN4;
        else if ((X == 17 || X == 78) && (Y >= 11 && Y <= 52 )) oled_data = DARKBLUE;
        else if ((X == 47 || X == 48) && ((Y >= 11 && Y <=26) || (Y >= 37 && Y <= 52))) oled_data = DARKBLUE;
        else if ((Y==11 || Y==52) && (X>= 17 && X <=78)) oled_data = DARKBLUE;
        
        else if ((Y==2 || Y==4 || Y==61 || Y==59) && ((X >= 60 && X <= 79) || (X >= 16 && X <= 35))) oled_data = DARKGREY; //changed
        
        else if (((X >= 60 && X <= 79) || (X >= 16 && X <= 35)) && (Y <= 5 || Y >=58)) oled_data = LIGHTGREY;
        
        else if ((Y == 6 || Y == 57) && ((X >= 59 && X <= 80) || (X >= 15 && X <= 36))) oled_data = BROWN; //changed
        else if ((X==80 || X==59 || X==15||X==36) && (Y<=5 || Y>=58)) oled_data = BROWN;
        else if ((Y==18 ||Y==45) && ((X>=49 && X<=52) || (X>=43 && X<=46))) oled_data = DARKBLUE;
        
        
        else if ((Y==19 ||Y==44) && ((X>=52 && X<=54) || (X>=41 && X<=43))) oled_data = DARKBLUE;
        else if ((Y==20 ||Y==43) && ((X>=54 && X<=55) || (X>=40 && X<=41))) oled_data = DARKBLUE;
        else if ((Y==21 ||Y==42) && ((X>=55 && X<=57) || (X>=38 && X<=40)|| (X>=79 && X<=80) || (X>=15 && X<=16))) oled_data = DARKBLUE;
        else if ((Y==22 ||Y==41) && ((X>=57 && X<=58) || (X>=37 && X<=38)|| (X>=80 && X<=81) || (X>=14 && X<=15))) oled_data = DARKBLUE;
        else if ((Y==23 ||Y==40) && ((X>=58 && X<=59) || (X>=36 && X<=37)|| (X>=81 && X<=82) || (X>=13 && X<=14))) oled_data = DARKBLUE;
        else if ((Y==24 ||Y==39) && ((X>=59 && X<=60) || (X>=35 && X<=36)|| (X>=82 && X<=83) || (X>=12 && X<=13))) oled_data = DARKBLUE;
        else if ((Y==25 || Y==38) && (X==12 || X ==83 || X==35 || X==60 )) oled_data = DARKBLUE;
        //else if ((Y==26 ||Y==37) && (X==60 || X==35 || X==83 || X==12)) oled_data = DARKBLUE;
        //changed the whole chunk above this
        
        
        else if ((Y==26 ||Y==37) && ((X>=60 && X<=61) || (X>=34 && X<=35)|| (X>=83 && X<=84) || (X>=11 && X<=12)|| (X>=49 && X<=51) || (X>=44 && X<=46))) oled_data = DARKBLUE;
        else if ((Y==27 ||Y==36) && ((X==61) || (X==34)|| (X==84) || (X==11)|| (X>=51 && X<=52) || (X>=43 && X<=44))) oled_data = DARKBLUE;
        else if ((Y==28 ||Y==35) && ((X==61) || (X==34) || (X>=84 && X<=85)|| (X>=10 && X<=11) || (X>=52 && X<=53) || (X>=42 && X<=43))) oled_data = DARKBLUE;
        else if ((Y>=29 && Y<=34) && ((X==61) || (X==34)|| (X==85) || (X==10)|| (X==53) || (X==42))) oled_data = DARKBLUE;
        
        else if ( (Y>=2&&Y<=5) || (Y>=13&&Y<=17) || (Y>=58&&Y<=61) || (Y>=46&&Y<=50) || Y==29||Y==34) begin //GREEN
            if(X==91||X==90||X==4||X==5) oled_data = GREEN1;
            else if(X==92||X==3) oled_data = GREEN2;
            else if(X==93||X==94||X==1||X==2) oled_data = GREEN3;
            else oled_data = PEACH;
        end
        else if (Y >=30 && Y<= 33) begin
            if(X==89 || X==6) oled_data = GREEN1;
            else if (X==91||X==90||X==4||X==5) oled_data = GREEN2;
            else if ((X>=92 && X <=94) || (X>=1 && X<=3)) oled_data = GREEN3;
            else oled_data = PEACH;
        
        end else if (Y==51||Y==62||Y==12||Y==1||Y==18||Y==19||Y==44||Y==45||Y==28||Y==35||(Y>=55&&Y<=57)||(Y>=6&&Y<=8)) begin
        
            if(X==91||X==4) oled_data = GREEN1;
            else if(X==92||X==3) oled_data = GREEN2;
            else if(X==93||X==94||X==2||X==1) oled_data = GREEN3;
            else oled_data = PEACH;
        end else if(Y==0||Y==63||Y==36||Y==27||(Y>=52&&Y<=54)||(Y>=9&&Y<=11)||(Y>=41&&Y<=43)||(Y>20&&Y<=22)) begin
           if(X==92||X==3) oled_data = GREEN1;
           else if (X==93||X==2) oled_data = GREEN2;
           else if (X==94||X==1) oled_data = GREEN3;
           else oled_data = PEACH;
        end else if ((Y>=23&&Y<=26)||(Y>=37&&Y<=40)) begin
            if(X==93||X==2) oled_data = GREEN1;
            else if(X==94||X==1) oled_data = GREEN2;
            else oled_data = PEACH;
        end else oled_data = PEACH;
    end
endmodule
