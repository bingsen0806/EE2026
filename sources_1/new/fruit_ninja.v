`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2021 15:38:46
// Design Name: 
// Module Name: fruit_ninja
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


module fruit_ninja(
    input [6:0]X,
    input [5:0]Y,
    output [15:0]oled_fruit
    );
    
    reg [1:0]fruitID = 2'b0;
    
    parameter [15:0]BACKGROUND = 16'b11111_111111_11111; //white
    
    wire [15:0] oled_watermelon;
    wire [15:0] oled_watermelonS;
    wire [15:0] oled_banana;
    wire [15:0] oled_bananaS;
    wire [15:0] oled_strawberry;
    wire [15:0] oled_strawberryS;
    
    watermelon_display watermelon_un (.X(X), .Y(Y), .leftX_watermelon(30), .topY_watermelon(20), .BACKGROUND(BACKGROUND), .watermelon(oled_watermelon));
    watermelon_sliced watermelon_sliced (.X(X), .Y(Y), .leftX_watermelon(30), .topY_watermelon(20), .BACKGROUND(BACKGROUND), .watermelonS(oled_watermelonS));
    banana_display banana_un (.X(X), .Y(Y), .leftX_banana(30), .topY_banana(20), .BACKGROUND(BACKGROUND), .banana(oled_banana));
    banana_sliced banana_sliced (.X(X), .Y(Y), .leftX_banana(30), .topY_banana(20), .BACKGROUND(BACKGROUND), .bananaS(oled_bananaS));
    strawberry_display strawberry_un (.X(X), .Y(Y), .leftX_strawberry(30), .topY_strawberry(20), .BACKGROUND(BACKGROUND), .strawberry(oled_strawberry));
    strawberry_sliced strawberry_sliced (.X(X), .Y(Y), .leftX_strawberry(30), .topY_strawberry(20), .BACKGROUND (BACKGROUND), .strawberryS(oled_strawberryS));
    
    
    /*assign oled_fruit = (fruit_EN[0] == 1 && X>= && X <= && Y>= Y <= ) ? oled_watermelon:
                        (fruit_EN[1] == 1 && X>= && X <= && Y>= Y <= ) ? oled_watermelonS:
                        (fruit_EN[2] == 1 && X>= && X <= && Y>= Y <= ) ? oled_watermelom:
                        (fruit_EN[3] == 1 && X>= && X <= && Y>= Y <= ) ? oled_watermelom:
                        (fruit_EN[4] == 1 && X>= && X <= && Y>= Y <= ) ? oled_watermelom:
                        (fruit_EN[5] == 1 && X>= && X <= && Y>= Y <= ) ? oled_watermelom:
    
                         :
                        BACKGROUND
    //logic alwyas reset register variables at state menu
    //game ended = 1 remember to change to 0!!!
    
    
    //for logic module:
        //use for loop to slice
    for (i = 0; i < 6, i = i+2) begin
    */
endmodule
