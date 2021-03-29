`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2021 15:43:40
// Design Name: 
// Module Name: banana_display
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


module banana_display(
    input [6:0]X,
    input [5:0]Y,
    input leftX_banana,
    input topY_banana,
    input [15:0]BACKGROUND,
    output reg [15:0]banana = 16'd0
    );
    
    parameter [15:0]BLACK = 16'b00000_000000_00000;
    parameter [15:0]YELLOW = 16'b11111_111111_00000;
    parameter [15:0]DARK_YELLOW = 16'b11011_101100_00010;

    always @ (X or Y)
    begin
        if ((X == leftX_banana) || (X == (leftX_banana + 1)))
            begin
            if ((Y >= (topY_banana + 12)) && (Y <= (topY_banana + 23)))
                banana <= BLACK;
            else
                banana <= BACKGROUND;
            end
        
        else if ((X == (leftX_banana + 2)) || (X == (leftX_banana + 3)))
            begin
            if ((Y >= (topY_banana + 12)) && (Y <= (topY_banana + 23)))
                banana <= DARK_YELLOW;
            else if ((Y >= (topY_banana + 7)) && (Y <= (topY_banana +28)))
                banana <= BLACK;
            else
                banana <= BACKGROUND;
            end
       
       else if ((X == (leftX_banana + 4)) || (X == (leftX_banana + 5)))
            begin
            if ((Y >= (topY_banana + 7)) && (Y <= (topY_banana +28)))
                banana <= DARK_YELLOW;
            else if (Y <= (topY_banana + 33))
                banana <= BLACK;
            else
                banana <= BACKGROUND;
            end
            
       else if ((X == (leftX_banana + 6)) || (X == (leftX_banana + 7)))
            begin
            if ((Y >= (topY_banana + 7)) && (Y <= (topY_banana + 24)))
                banana <= YELLOW;
            else if ((Y >= (topY_banana + 25)) && (Y <= (topY_banana + 33)))
                banana <= DARK_YELLOW;
            else if (Y <= (topY_banana + 39))
                banana <= BLACK;
            else
                banana <= BACKGROUND;
            end
                
       else if ((X == (leftX_banana + 8)) || (X == (leftX_banana + 9)))
            begin
            if ((Y >= (topY_banana + 7)) && (Y <= (topY_banana + 32)))
                banana <= YELLOW;
            else if ((Y >= (topY_banana + 33)) && (Y <= (topY_banana + 39)))
                banana <= DARK_YELLOW;
            else if (Y <= (topY_banana + 43))
                banana <= BLACK;
            else
                banana <= BACKGROUND;
            end
       
       else if ((X == (leftX_banana + 10)) || (X == (leftX_banana + 11)))
            begin
            if ((Y >= (topY_banana + 12)) && (Y <= (topY_banana + 37)))
                banana <= YELLOW;
            else if ((Y >= (topY_banana + 38)) && (Y <= (topY_banana + 43)))
                banana <= DARK_YELLOW;
            else if ((Y >= (topY_banana + 7)) && (Y <= (topY_banana + 47)))
                banana <= BLACK;
            else
                banana <= BACKGROUND;
            end
            
       else if ((X == (leftX_banana + 12)) || (X == (leftX_banana + 13)))
                 begin
                 if ((Y >= (topY_banana + 24)) && (Y <= (topY_banana + 42)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 43)) && (Y <= (topY_banana + 47)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 12)) && (Y <= (topY_banana + 49)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 14)) || (X == (leftX_banana + 15)))
                 begin
                 if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 46)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 47)) && (Y <= (topY_banana + 49)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 24)) && (Y <= (topY_banana + 51)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 16)) || (X == (leftX_banana + 17)))
                 begin
                 if ((Y >= (topY_banana + 28)) && (Y <= (topY_banana + 49)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 50)) && (Y <= (topY_banana + 51)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 53)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 18)) || (X == (leftX_banana + 19)))
                 begin
                 if ((Y >= (topY_banana + 30)) && (Y <= (topY_banana + 49)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 50)) && (Y <= (topY_banana + 51)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 28)) && (Y <= (topY_banana + 53)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 20)) || (X == (leftX_banana + 21)))
                 begin
                 if ((Y >= (topY_banana + 32)) && (Y <= (topY_banana + 49)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 50)) && (Y <= (topY_banana + 53)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 30)) && (Y <= (topY_banana + 55)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 22)) || (X == (leftX_banana + 23)))
                 begin
                 if ((Y >= (topY_banana + 34)) && (Y <= (topY_banana + 48)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 49)) && (Y <= (topY_banana + 53)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 32)) && (Y <= (topY_banana + 55)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 24)) || (X == (leftX_banana + 25)))
                 begin
                 if ((Y >= (topY_banana + 34)) && (Y <= (topY_banana + 48)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 49)) && (Y <= (topY_banana + 55)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 32)) && (Y <= (topY_banana + 57)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 26)) || (X == (leftX_banana + 27)) || (X == (leftX_banana + 28)) || (X == (leftX_banana + 29)) || (X == (leftX_banana + 30)) || (X == (leftX_banana + 31)))
                 begin
                 if ((Y >= (topY_banana + 36)) && (Y <= (topY_banana + 52)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 53)) && (Y <= (topY_banana + 57)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 34)) && (Y <= (topY_banana + 59)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 32)) || (X == (leftX_banana + 33)) || (X == (leftX_banana + 34)) || (X == (leftX_banana + 35)))
                 begin
                 if ((Y >= (topY_banana + 34)) && (Y <= (topY_banana + 50)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 51)) && (Y <= (topY_banana + 53)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 32)) && (Y <= (topY_banana + 55)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 36)) || (X == (leftX_banana + 37)))
                 begin
                 if ((Y >= (topY_banana + 32)) && (Y <= (topY_banana + 49)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 50)) && (Y <= (topY_banana + 51)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 30)) && (Y <= (topY_banana + 53)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 38)) || (X == (leftX_banana + 39)))
                 begin
                 if ((Y >= (topY_banana + 30)) && (Y <= (topY_banana + 48)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 49)) && (Y <= (topY_banana + 51)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 28)) && (Y <= (topY_banana + 53)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 40)) || (X == (leftX_banana + 41)))
                 begin
                 if ((Y >= (topY_banana + 28)) && (Y <= (topY_banana + 47)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 48)) && (Y <= (topY_banana + 49)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 51)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 42)) || (X == (leftX_banana + 43)))
                 begin
                 if ((Y >= (topY_banana + 28)) && (Y <= (topY_banana + 44)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 45)) && (Y <= (topY_banana + 47)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 49)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 44)) || (X == (leftX_banana + 45)))
                 begin
                 if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 40)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 41)) && (Y <= (topY_banana + 44)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 24)) && (Y <= (topY_banana + 47)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 46)) || (X == (leftX_banana + 47)))
                 begin
                 if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 34)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 35)) && (Y <= (topY_banana + 41)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 24)) && (Y <= (topY_banana + 44)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 48)) || (X == (leftX_banana + 49)))
                 begin
                 if ((Y >= (topY_banana + 30)) && (Y <= (topY_banana + 32)))
                     banana <= YELLOW;
                 else if ((Y >= (topY_banana + 33)) && (Y <= (topY_banana + 35)))
                     banana <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 41)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 50)) || (X == (leftX_banana + 51)))
                 begin
                 if ((Y >= (topY_banana + 30)) && (Y <= (topY_banana + 35)))
                     banana <= BLACK;
                 else
                     banana <= BACKGROUND;
                 end
        
        else
            banana <= BACKGROUND;
    
    end
    
endmodule
