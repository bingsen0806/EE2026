`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2021 15:00:05
// Design Name: 
// Module Name: volume_bar
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


module volume_bar(
    input sw0, sw1, sw2, sw4,//changed to 3 bit from 4 bit 
    input [3:0] mic_data, 
    input [6:0] X, 
    input [5:0] Y, 
    output reg [15:0] colour = 16'd0,
    input btnL,
    input btnR,
    input single_pulse_clk,
    input [3:0] state
);
    
    parameter[15:0] BLACK  = 16'b0;
    parameter[15:0] WHITE = 16'b11111_111111_11111;
    parameter[15:0] YELLOW = 16'b11111_111111_00000;
    parameter[15:0] GREEN = 16'b00000_111111_00000;
    parameter[15:0] RED = 16'b11111_000000_00000;
    parameter[15:0] COLOUR3 = 16'b11111_011111_11010;
    parameter[15:0] COLOUR2 = 16'b11000_011111_11111;
    parameter[15:0] COLOUR1 = 16'b01111_100110_11111;
    
    parameter [6:0] LENGTH = 7'd10;
    reg [6:0] leftX = 7'd43;
    reg [15:0] LOW_COLOUR = GREEN;
    reg [15:0] MID_COLOUR = YELLOW;
    reg [15:0] HIGH_COLOUR = RED;
    reg [1:0] border_width = 2'd1;
    reg border_on = 1;
    wire [15:0] BACKGROUND; wire [15:0] BORDER_COLOUR;
    
    assign BACKGROUND = sw2 ? WHITE : BLACK;
    assign BORDER_COLOUR = sw2 ? BLACK : WHITE;
    always @(sw0 or sw1 or sw2) begin
        if(sw1 == 1) begin
            if(sw0 == 1) begin
                border_width = 2'd3;
            end else begin
                border_width = 2'd1;
            end
        end else begin
            border_width = 2'd0;
        end

        if (sw2 == 1) begin
            HIGH_COLOUR = COLOUR3; MID_COLOUR = COLOUR2; LOW_COLOUR = COLOUR1;
        end else begin
            HIGH_COLOUR = RED; MID_COLOUR = YELLOW; LOW_COLOUR = GREEN;
        end
    end
    
    always @ (posedge single_pulse_clk) begin
        if (state == 4'b0000) leftX <= 7'd43;
        if (btnL == 1 && leftX > border_width + 5 && state == 4'b0001) leftX <= leftX - 5;
        if (btnR == 1 && (leftX <= (7'd95 - border_width -LENGTH - 7'd5)) && state == 4'b0001) leftX <= leftX + 5;
    end  
    
    //white border
    always @ (X or Y) begin

        if (X < border_width || X > 95 - border_width || Y < border_width || Y > 63-border_width) colour = BORDER_COLOUR;
        else if (sw4 == 1) colour = BACKGROUND;
        else begin
            if (X >= leftX && X < leftX + LENGTH) begin                  
                if (mic_data >= 15 && Y >= 2 && Y <= 4) colour = HIGH_COLOUR;
                else if (mic_data >= 14 && Y >= 6 && Y <= 8) colour = HIGH_COLOUR;
                else if (mic_data >= 13 && Y >= 10 && Y <= 12) colour = HIGH_COLOUR;
                else if (mic_data >= 12 && Y >= 14 && Y <= 16) colour = HIGH_COLOUR;
                else if (mic_data >= 11 && Y >= 18 && Y <= 20) colour = HIGH_COLOUR;
                else if (mic_data >= 10 && Y >= 22 && Y <= 24) colour = MID_COLOUR;
                else if (mic_data >= 9 && Y >= 26 && Y <= 28) colour = MID_COLOUR;
                else if (mic_data >= 8 && Y >= 30 && Y <= 32) colour = MID_COLOUR;
                else if (mic_data >= 7 && Y >= 34 && Y <= 36) colour = MID_COLOUR;
                else if (mic_data >= 6 && Y >= 38 && Y <= 40) colour = MID_COLOUR;
                else if (mic_data >= 5 && Y >= 42 && Y <= 44) colour = MID_COLOUR;
                else if (mic_data >= 4 && Y >= 46 && Y <= 48) colour = LOW_COLOUR;
                else if (mic_data >= 3 && Y >= 50 && Y <= 52) colour = LOW_COLOUR;
                else if (mic_data >= 2 && Y >= 54 && Y <= 56) colour = LOW_COLOUR;
                else if (mic_data >= 1 && Y >= 58 && Y <= 60) colour = LOW_COLOUR;
                else colour = BACKGROUND;
                
            end
            else colour = BACKGROUND;
        end      
    end

endmodule
