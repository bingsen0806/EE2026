`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2021 01:47:59
// Design Name: 
// Module Name: watermelon_sliced
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


module watermelon_sliced(
    input [6:0] X,
    input [5:0] Y,
    input [6:0] leftX_watermelon,
    input [5:0] topY_watermelon,
    input [15:0] BACKGROUND,
    output reg [15:0]watermelonS = 16'd0
    );

    parameter [15:0]AVG_GREEN = 16'b00000_101011_00011;
    parameter [15:0]DARK_GREEN = 16'b01110_101011_00011;
    parameter [15:0]LIGHT_GREEN = 16'b00000_111111_00000; 
    parameter [15:0]BLACK = 16'b00000_000000_00000;
    parameter [15:0]RED = 16'b11111_000000_00000;
    
    always @ (X or Y)
    begin
        if ((Y == (topY_watermelon + 25)) || (Y == (topY_watermelon + 29)))
            begin
                if ((X == (leftX_watermelon + 4)) || (X == (leftX_watermelon + 5)) || (X == (leftX_watermelon + 12)) || (X == (leftX_watermelon + 13)) || (X == (leftX_watermelon + 20)) || (X == (leftX_watermelon + 21)) || (X == (leftX_watermelon + 28)) || (X == (leftX_watermelon + 29)) || (X == (leftX_watermelon + 36)) || (X == (leftX_watermelon + 37)) || (X == (leftX_watermelon + 44)) || (X == (leftX_watermelon + 45)))
                    watermelonS = BLACK;
                else if (((X >= leftX_watermelon) && (X <= (leftX_watermelon + 3))) || ((X >= (leftX_watermelon + 52)) && (X <= (leftX_watermelon + 55))))
                    watermelonS = AVG_GREEN;
                else if ((X >= (leftX_watermelon + 4)) && (X <= (leftX_watermelon + 51)))
                    watermelonS = RED;
                else
                    watermelonS = BACKGROUND;
            end
        else if ((Y == (topY_watermelon + 26)) || (Y == (topY_watermelon + 30)))
            begin
                if ((X == (leftX_watermelon + 8)) || (X == (leftX_watermelon + 9)) || (X == (leftX_watermelon + 16)) || (X == (leftX_watermelon + 17)) || (X == (leftX_watermelon + 24)) || (X == (leftX_watermelon + 25)) || (X == (leftX_watermelon + 32)) || (X == (leftX_watermelon + 33)) || (X == (leftX_watermelon + 41)) || (X == (leftX_watermelon + 42)) || (X == (leftX_watermelon + 49)) || (X == (leftX_watermelon + 50)))
                    watermelonS = BLACK;
                else if (((X >= leftX_watermelon) && (X <= (leftX_watermelon + 3))) || ((X >= (leftX_watermelon + 52)) && (X <= (leftX_watermelon + 55))))
                    watermelonS = AVG_GREEN;
                else if ((X >= (leftX_watermelon + 4)) && (X <= (leftX_watermelon + 51)))
                    watermelonS = RED;
                else
                    watermelonS = BACKGROUND;
            end
        else if ((Y == (topY_watermelon + 27)) || (Y == (topY_watermelon + 28)))
                watermelonS = BACKGROUND; 
        else if (((X >= leftX_watermelon) && (X <= (leftX_watermelon + 3))) || ((X >= (leftX_watermelon + 52)) && (X <= (leftX_watermelon + 55))))
            begin
            if ((Y >= (topY_watermelon + 16)) && (Y <= (topY_watermelon + 41)))
                watermelonS = AVG_GREEN;
            else
                watermelonS = BACKGROUND;
            end
            
        else if (((X >= (leftX_watermelon + 4)) && (X <= (leftX_watermelon + 7))) || ((X >= (leftX_watermelon + 48)) && (X <= (leftX_watermelon + 51))))
            begin
            if ((Y >= (topY_watermelon + 12)) && (Y <= (topY_watermelon + 45)))
                watermelonS = DARK_GREEN;
            else
                watermelonS = BACKGROUND;
            end
            
        else if (((X >= (leftX_watermelon + 8)) && (X <= (leftX_watermelon + 11))) || ((X >= (leftX_watermelon + 44)) && (X <= (leftX_watermelon + 47))))
                begin
                if ((Y >= (topY_watermelon + 8)) && (Y <= (topY_watermelon + 49)))
                    watermelonS = LIGHT_GREEN;
                else
                    watermelonS = BACKGROUND;
                end

        else if (((X >= (leftX_watermelon + 12)) && (X <= (leftX_watermelon + 15))) || ((X >= (leftX_watermelon + 40)) && (X <= (leftX_watermelon + 43))))
                begin
                if ((Y >= (topY_watermelon + 6)) && (Y <= (topY_watermelon + 51)))
                    watermelonS = DARK_GREEN;
                else
                    watermelonS = BACKGROUND;
                end

        else if (((X >= (leftX_watermelon + 16)) && (X <= (leftX_watermelon + 19))) || ((X >= (leftX_watermelon + 36)) && (X <= (leftX_watermelon + 39))))
                begin
                if ((Y >= (topY_watermelon + 2)) && (Y <= (topY_watermelon + 55)))
                    watermelonS = AVG_GREEN;
                else
                    watermelonS = BACKGROUND;
                end

        else if (((X >= (leftX_watermelon + 20)) && (X <= (leftX_watermelon + 23))) || ((X >= (leftX_watermelon + 32)) && (X <= (leftX_watermelon + 35))))
                begin
                if ((Y >= (topY_watermelon)) && (Y <= (topY_watermelon + 57)))
                    watermelonS = DARK_GREEN;
                else
                    watermelonS = BACKGROUND;
                end

        else if ((X >= (leftX_watermelon + 24)) && (X <= (leftX_watermelon + 31)))
                begin
                if ((Y >= (topY_watermelon)) && (Y <= (topY_watermelon + 57)))
                    watermelonS = LIGHT_GREEN;
                else
                    watermelonS = BACKGROUND;
                end
        
        else 
            watermelonS = BACKGROUND;
    end    
    
endmodule
