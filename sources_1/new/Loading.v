`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2021 21:55:32
// Design Name: 
// Module Name: Loading
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


module Loading(
    input [6:0] X,
    input [5:0] Y,
    input clk,  // try 10Hz
    output reg [15:0] oled_data = 16'd0,
    input [3:0] state
    );
    parameter [15:0] GREEN = 16'b00000_111111_00000;
    parameter [15:0] BLACK = 16'b0;
    parameter [15:0] WHITE = 16'b11111_111111_11111;
    
    reg [3:0] load_EN = 4'd0;
    reg [5:0] length = 6'd0; //legnth of the green loading
    
    always @(posedge clk) begin
        load_EN <= load_EN + 1;
        if (load_EN == 9) begin
            load_EN <= 0;   
        end
        if (length < 60 && load_EN % 5 == 4) length <= length + 12;
        if(state == 4'b0101) begin
            load_EN <= 0;
            length <= 6'd0;
        end
    end
    
    always @ (X or Y) begin
        if (((Y==28||Y==39)&&(X>=14&&X<=75)) || ((X==13 || X==76) &&(Y>=29 && Y<=38))) oled_data = BLACK; //the black bars
        else if(Y >= 30 && Y <= 37 && X >=15 && X <= 15 + length) oled_data = GREEN; //the green bar
        else if(load_EN>=0 && ((X>=13&&X<=14&&Y>=15&&Y<=23) || (X>=15&&X<=18&&Y>=22&&Y<=23))) oled_data = BLACK; //L
        else if (load_EN >=1 && ((X==21||X==22|X==25|X==26)&&Y>=15&&Y<=23) || ((Y==15||Y==23)&&X>=23&&X<=24)) oled_data = BLACK; //O
        else if (load_EN >=2 && (((X==29||X==30||X==33||X==34)&&Y>=15&&Y<=23) || ((Y==15||Y==16||Y==19)&&(X==31||X==32)))) oled_data = BLACK;//A
        else if (load_EN >=3 && ((X>=37&&X<=38&&Y>=15&&Y<=23)||(X>=41&&X<=42&&Y>=16&&Y<=22)||(X>=39&&X<=41&&(Y==15||Y==16||Y==22||Y==23)))) oled_data = BLACK; //D
        else if (load_EN >=4 && (X>=45&&X<=46&&Y>=15&&Y<=23)) oled_data = BLACK; //I
        else if (load_EN>=5 && (((X==49||X==50||X==55||X==56)&&(Y>=15&&Y<=23)) || (X==51&&Y>15&&Y<=17) || (X==52&&Y>=18&&Y<=19) || (X==53&&Y>=20&&Y<=21)||(X==54&&Y>=22&&Y<=23) )) oled_data = BLACK;
        else if (load_EN>=6 && ( ((Y==15||Y==16||Y==22||Y==23)&&X>=59&&X<=64) || (X>=59&&X<=60&&Y>=17&&Y<=21) || (X>=63&&X<=64&&Y>=21&&Y<=22) )) oled_data = BLACK; //G
        else if(load_EN >=7 && (X>=67&&X<=68&&Y>=22&&Y<=23)) oled_data = BLACK;//first dot
        else if(load_EN >=8 && (X>=71&&X<=72&&Y>=22&&Y<=23)) oled_data = BLACK;
        else if(load_EN >=9 && (X>=75&&X<=76&&Y>=22&&Y<=23)) oled_data = BLACK;
        else oled_data = WHITE;
        
    end
endmodule
