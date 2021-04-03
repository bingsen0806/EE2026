`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2021 20:03:27
// Design Name: 
// Module Name: Menu_Display
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


module Menu_Display(
    input [3:0] state,
    input single_pulse_clk,
    input btnU,
    input btnD,
    input [6:0] X,
    input [5:0] Y,
    output reg [15:0] oled_data = 16'b11111_000000_00000,
    output reg [1:0] nextStateMenu = 2'b00
    );
    
    parameter [15:0] RED = 16'b11111_000000_00000;
    parameter [15:0] GREEN = 16'b00000_111111_00000;
    parameter [15:0] BLUE = 16'b00000_000000_11111;
    parameter [15:0] YELLOW = 16'b11111_111111_00000;
    parameter [15:0] BLACK = 16'd0;
    parameter [15:0] WHITE = 16'b11111_111111_11111;
    
    reg [15:0] word1 = BLACK; reg [15:0] word2 = WHITE; reg [15:0] word3 = WHITE; reg [15:0] word4 = WHITE;
    reg [15:0] back1 = WHITE; reg [15:0] back2 = BLACK; reg [15:0] back3 = BLACK; reg [15:0] back4 = BLACK;
    
    always @(nextStateMenu) begin
        word1 = (nextStateMenu == 2'b00) ? BLACK : WHITE;
        word2 = (nextStateMenu == 2'b01) ? BLACK : WHITE;
        word3 = (nextStateMenu == 2'b10) ? BLACK : WHITE;
        word4 = (nextStateMenu == 2'b11) ? BLACK : WHITE;
        back1 = (nextStateMenu == 2'b00) ? WHITE : BLACK;
        back2 = (nextStateMenu == 2'b01) ? WHITE : BLACK;
        back3 = (nextStateMenu == 2'b10) ? WHITE : BLACK;
        back4 = (nextStateMenu == 2'b11) ? WHITE : BLACK;
    end
    
    always @(posedge single_pulse_clk) begin
        if (state == 4'b0000) begin
            if (btnU == 1 && nextStateMenu > 0) begin
                nextStateMenu <= nextStateMenu - 1;
            end else if (btnD == 1 && nextStateMenu < 2'b11) begin
                nextStateMenu <= nextStateMenu + 1;
            end
        end else begin
            nextStateMenu <= 2'b00;
        end
    end
    
    always @ (X or Y) begin
        if (X <= 4 && Y >=16 && Y<=27 && nextStateMenu == 2'b00) oled_data = RED;
        else if (X <= 4 && Y >=28 && Y<=39 && nextStateMenu == 2'b01) oled_data = GREEN;
        else if (X <= 4 && Y >=40 && Y<=51 && nextStateMenu == 2'b10) oled_data = BLUE;
        else if (X <= 4 && Y >=52 && nextStateMenu == 2'b11) oled_data = YELLOW; //completed the 4 boxes
        else if ((X==27||X==28||X==34||X==35||X==39||X==40||X==48||X==49||X==55||X==56||X==60||X==61||X==66||X==67) && Y>=5&&Y<=13) oled_data = WHITE;
        else if (X>=41&&X<=44&&(Y==5||Y==9||Y==13)) oled_data = WHITE;
        else if ((X>=30&&X<=32&&Y==9) || (X>=29&&X<=33&&Y==8) || (X==29&&Y==7) || (X==33&&Y==7)) oled_data = WHITE;
        else if(X>=62&&X<=65&&Y==13) oled_data = WHITE;
        else if((X==50&&Y>=6&&Y<=8)||(X==51&&Y>=8&&Y<=9)||(X==52&&Y>=9&&Y<=10) || (X==53&&Y>=10&&Y<=11) || (X==54&&Y>=11&&Y<=12))oled_data = WHITE;
        else if (Y<=15) oled_data = BLACK;//completed "MENU"
        else if (Y>=17&&Y<=25&& (X==18||X==19||X==22||X==23||X==27||X==28||X==34||X==35||X==39||X==40||X==43||X==44||X==50||X==51||X==54||X==55||X==67||X==68||X==75||X==76||X==80||X==81||X==84||X==85))oled_data = word1;//CHANGED
        else if (Y>=17&&Y<=21 && (X==8||X==9||X==14||X==15||X==70||X==71||X==88)) oled_data = word1; //Straight lines
        else if ((Y==22&&((X>=8&&X<=10)||X>=13&&X<=15)) || ((X==10||X==13)&&(Y==23||Y==24)) || (X>=11&&X<=12&&Y>=24&&Y<=25)) oled_data = word1; //CHANGED
        else if ((X==20||X==21)&&(Y==17||Y==25)) oled_data = word1;
        else if ((X>=29&&X<=31&&Y>=24&&Y<=25) || (X>=36&&X<=38&&Y==25)) oled_data = word1;
        else if (X>=56&&X<=59&&(Y==17||Y==20||Y==21||Y==25)) oled_data = word1; //E
        else if (((Y==19||Y==20)&&(X==45||X==49)) || (X>=46&&X<=48&&(Y==20||Y==21))) oled_data = word1;
        else if ((X==69&&Y==17) || (X>=69&&X<=72&&(Y==21||Y==25)) || (X>=71&&X<=72&&Y>=22&&Y<=24)) oled_data = word1; //B
        else if (X>=77&&X<=79&&(Y==17||Y==21||Y==22)) oled_data = word1;
        else if (((X==86||X==87)&&(Y==17||Y==21||Y==23)) || (Y==24&&(X==87||X==88)) || (X==88&&Y==25)) oled_data = word1;
        else if (Y>=16&&Y<=27) oled_data = back1; //completed volume bar
        
        else if (Y>=29&&Y<=37&&(X==8||X==9||X==16||X==17||X==20||X==21||X==24||X==25||X==31||X==32||X==39||X==40||X==46||X==47||X==50||X==51||X==54||X==55||X==58||X==59||X==65||X==66)) oled_data = word2; //CHANGED
        else if ((X>=10&&X<=13&&(Y==29||Y==33)) ||(X==13&&Y>=30&&Y<=32)) oled_data = word2; //P
        else if ((X==18||X==19||X==52||X==53)&&(Y==29||Y==37)) oled_data = word2; //two O //CHANGED
        else if ((X==26&&Y>=32&&Y<=35)||(X==27&&(Y==31||Y==32||Y==35||Y==36)) ||(X==28&&(Y==30||Y==31||Y==36||Y==37))) oled_data = word2; //k
        else if (X>=33&&X<=36&&(Y==29||Y==32||Y==33||Y==37)) oled_data = word2; //E
        else if (((Y==31||Y==32)&&(X==41||X==45)) ||((Y==32||Y==33)&&X>=42&&X<=44)) oled_data = word2; //M
        else if ((X==60&&Y>=30&&Y<=32)||(X==61&&(Y==32||Y==33)) ||(X==62&&(Y==33||Y==34))||(X==63&&(Y==34||Y==35)) ||(X==64&&(Y==35||Y==36))) oled_data = word2;//N
        else if (Y>=28&&Y<=39) oled_data = back2; //completed pokemon
        
        else if (Y>=41&&Y<=49&&(X==17||X==18||X==24||X==25||X==28||X==29||X==35||X==36||X==43||X==44)) oled_data = word3;
        else if ((X>=8&&X<=13&&(Y==41||Y==45||Y==49)) ||(Y>=42&&Y<=44&&(X==8||X==9)) ||(Y>=46&&Y<=48&&(X==12||X==13))) oled_data = word3; //S
        else if (X>=19&&X<=21&&(Y==49||Y==49)) oled_data = word3; //L
        else if (X>=30&&X<=32&&(Y==41||Y==49)) oled_data = word3; //C
        else if (X>=37&&X<=40&&(Y==44||Y==45||Y==41||Y==49)) oled_data = word3; //E
        else if ((X>=45&&X<=48&&(Y==41||Y==49))||(Y>=42&&Y<=48&&(X==48||X==49))) oled_data = word3; //D
        else if (Y>=40&&Y<=51) oled_data = back3; //end of sliced
        
        else if (Y>=53&&Y<=61&&(X==8||X==9||X==16||X==17||X==20||X==21||X==26||X==27||X==32||X==33||X==36||X==37||X==41||X==40||X==44||X==45||X==51||X==52)) oled_data = word4;
        else if ((X>=10&&X<=13&&(Y==53||Y==57)) ||(X==13&&Y>=54&&Y<=56)) oled_data = word4; // P
        else if ((X==18 ||X==19||X==38||X==39)&&(Y==53||Y==61)) oled_data = word4; //two O
        else if (X>=24&&X<=29&&Y==53) oled_data = word4; //T
        else if ((X==46&&Y>=54&&Y<=56)||(X==47&&(Y==56||Y==57)) ||(X==48&&(Y==57||Y==58))||(X==49&&(Y==58||Y==59)) ||(X==50&&(Y==59||Y==60))) oled_data = word4;//N
        else oled_data = back4;

    end
endmodule
