`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2021 15:17:49
// Design Name: 
// Module Name: watermelon_display
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


module watermelon_display(
    input [6:0]X,
    input [5:0]Y,
    input leftX_watermelon,
    input topY_watermelon,
    input [15:0]BACKGROUND,
    output reg [15:0]watermelon = 16'd0
    );
    
    parameter [15:0]AVG_GREEN = 16'b00000_101011_00011;
    parameter [15:0]DARK_GREEN = 16'b01110_101011_00011;
    parameter [15:0]LIGHT_GREEN = 16'b00000_111111_00000; 
    
    always @ (X or Y)
    begin
        if (((X >= leftX_watermelon) && (X <= (leftX_watermelon + 3))) || ((X >= (leftX_watermelon + 52)) && (X <= (leftX_watermelon + 55))))
            begin
            if ((Y >= (topY_watermelon + 16)) && (Y <= (topY_watermelon + 41)))
                watermelon = AVG_GREEN;
            else
                watermelon = BACKGROUND;
            end
            
        else if (((X >= (leftX_watermelon + 4)) && (X <= (leftX_watermelon + 7))) || ((X >= (leftX_watermelon + 48)) && (X <= (leftX_watermelon + 51))))
            begin
            if ((Y >= (topY_watermelon + 12)) && (Y <= (topY_watermelon + 45)))
                watermelon = DARK_GREEN;
            else
                watermelon = BACKGROUND;
            end
            
        else if (((X >= (leftX_watermelon + 8)) && (X <= (leftX_watermelon + 11))) || ((X >= (leftX_watermelon + 44)) && (X <= (leftX_watermelon + 47))))
                begin
                if ((Y >= (topY_watermelon + 8)) && (Y <= (topY_watermelon + 49)))
                    watermelon = LIGHT_GREEN;
                else
                    watermelon = BACKGROUND;
                end

        else if (((X >= (leftX_watermelon + 12)) && (X <= (leftX_watermelon + 15))) || ((X >= (leftX_watermelon + 40)) && (X <= (leftX_watermelon + 43))))
                begin
                if ((Y >= (topY_watermelon + 6)) && (Y <= (topY_watermelon + 51)))
                    watermelon = DARK_GREEN;
                else
                    watermelon = BACKGROUND;
                end

        else if (((X >= (leftX_watermelon + 16)) && (X <= (leftX_watermelon + 19))) || ((X >= (leftX_watermelon + 36)) && (X <= (leftX_watermelon + 39))))
                begin
                if ((Y >= (topY_watermelon + 2)) && (Y <= (topY_watermelon + 55)))
                    watermelon = AVG_GREEN;
                else
                    watermelon = BACKGROUND;
                end

        else if (((X >= (leftX_watermelon + 20)) && (X <= (leftX_watermelon + 23))) || ((X >= (leftX_watermelon + 32)) && (X <= (leftX_watermelon + 35))))
                begin
                if ((Y >= (topY_watermelon)) && (Y <= (topY_watermelon + 57)))
                    watermelon = DARK_GREEN;
                else
                    watermelon = BACKGROUND;
                end

        else if ((X >= (leftX_watermelon + 24)) && (X <= (leftX_watermelon + 31)))
                begin
                if ((Y >= (topY_watermelon)) && (Y <= (topY_watermelon + 57)))
                    watermelon = LIGHT_GREEN;
                else
                    watermelon = BACKGROUND;
                end
        
        else 
            watermelon = BACKGROUND;
    end
    
endmodule
