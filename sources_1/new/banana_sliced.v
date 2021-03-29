`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2021 10:55:06
// Design Name: 
// Module Name: banana_sliced
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


module banana_sliced(
    input [6:0]X,
    input [5:0]Y,
    input leftX_banana,
    input topY_banana,
    input [15:0]BACKGROUND,
    output reg [15:0]bananaS = 16'd0
    );
    
    parameter [15:0]BLACK = 16'b00000_000000_00000;
    parameter [15:0]YELLOW = 16'b11111_111111_00000;
    parameter [15:0]DARK_YELLOW = 16'b11011_101100_00010;
    parameter [15:0]PALE_YELLOW = 16'b11100_111000_10001;

    always @ (X or Y)
    begin
        if ((X == leftX_banana) || (X == (leftX_banana + 1)))
            begin
            if ((Y >= (topY_banana + 12)) && (Y <= (topY_banana + 23)))
                bananaS <= BLACK;
            else
                bananaS <= BACKGROUND;
            end
        
        else if ((X == (leftX_banana + 2)) || (X == (leftX_banana + 3)))
            begin
            if ((Y >= (topY_banana + 12)) && (Y <= (topY_banana + 23)))
                bananaS <= DARK_YELLOW;
            else if ((Y >= (topY_banana + 7)) && (Y <= (topY_banana +28)))
                bananaS <= BLACK;
            else
                bananaS <= BACKGROUND;
            end
       
       else if ((X == (leftX_banana + 4)) || (X == (leftX_banana + 5)))
            begin
            if ((Y >= (topY_banana + 7)) && (Y <= (topY_banana +28)))
                bananaS <= DARK_YELLOW;
            else if (Y <= (topY_banana + 33))
                bananaS <= BLACK;
            else
                bananaS <= BACKGROUND;
            end
            
       else if ((X == (leftX_banana + 6)) || (X == (leftX_banana + 7)))
            begin
            if ((Y >= (topY_banana + 7)) && (Y <= (topY_banana + 24)))
                bananaS <= YELLOW;
            else if ((Y >= (topY_banana + 25)) && (Y <= (topY_banana + 33)))
                bananaS <= DARK_YELLOW;
            else if (Y <= (topY_banana + 39))
                bananaS <= BLACK;
            else
                bananaS <= BACKGROUND;
            end
                
       else if ((X == (leftX_banana + 8)) || (X == (leftX_banana + 9)))
            begin
            if ((Y >= (topY_banana + 7)) && (Y <= (topY_banana + 32)))
                bananaS <= YELLOW;
            else if ((Y >= (topY_banana + 33)) && (Y <= (topY_banana + 39)))
                bananaS <= DARK_YELLOW;
            else if (Y <= (topY_banana + 43))
                bananaS <= BLACK;
            else
                bananaS <= BACKGROUND;
            end
       
       else if ((X == (leftX_banana + 10)) || (X == (leftX_banana + 11)))
            begin
            if ((Y >= (topY_banana + 12)) && (Y <= (topY_banana + 37)))
                bananaS <= YELLOW;
            else if ((Y >= (topY_banana + 38)) && (Y <= (topY_banana + 43)))
                bananaS <= DARK_YELLOW;
            else if ((Y >= (topY_banana + 7)) && (Y <= (topY_banana + 47)))
                bananaS <= BLACK;
            else
                bananaS <= BACKGROUND;
            end
            
       else if ((X == (leftX_banana + 12)) || (X == (leftX_banana + 13)))
                 begin
                 if ((Y >= (topY_banana + 24)) && (Y <= (topY_banana + 42)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 43)) && (Y <= (topY_banana + 47)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 12)) && (Y <= (topY_banana + 49)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 14)) || (X == (leftX_banana + 15)))
                 begin
                 if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 46)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 47)) && (Y <= (topY_banana + 49)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 24)) && (Y <= (topY_banana + 51)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 16)) || (X == (leftX_banana + 17)))
                 begin
                 if ((Y >= (topY_banana + 45)) && (Y <= (topY_banana + 48)))
                     bananaS <= PALE_YELLOW;
                 else if ((Y >= (topY_banana + 28)) && (Y <= (topY_banana + 48)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 27)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 18)) || (X == (leftX_banana + 19)))
                 begin
                 if ((Y >= (topY_banana + 43)) && (Y <= (topY_banana + 45)))
                     bananaS <= PALE_YELLOW;           
                 else if ((Y >= (topY_banana + 46)) && (Y <= (topY_banana + 51)))
                     bananaS <= BACKGROUND;
                 else if ((Y >= (topY_banana + 30)) && (Y <= (topY_banana + 45)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 50)) && (Y <= (topY_banana + 51)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 28)) && (Y <= (topY_banana + 53)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 20)) || (X == (leftX_banana + 21)))
                 begin
                 if ((Y >= (topY_banana + 45)) && (Y <= (topY_banana + 50)))
                     bananaS <= BACKGROUND;           
                 else if ((Y >= (topY_banana + 43)) && (Y <= (topY_banana + 51)))
                     bananaS <= PALE_YELLOW;
                 else if ((Y >= (topY_banana + 32)) && (Y <= (topY_banana + 49)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 50)) && (Y <= (topY_banana + 53)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 30)) && (Y <= (topY_banana + 55)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 22)) || (X == (leftX_banana + 23)))
                 begin
                 if ((Y >= (topY_banana + 44)) && (Y <= (topY_banana + 47)))
                     bananaS <= BACKGROUND;           
                 else if ((Y >= (topY_banana + 41)) && (Y <= (topY_banana + 51)))
                     bananaS <= PALE_YELLOW;
                 else if ((Y >= (topY_banana + 34)) && (Y <= (topY_banana + 48)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 49)) && (Y <= (topY_banana + 53)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 32)) && (Y <= (topY_banana + 55)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 24)) || (X == (leftX_banana + 25)))
                 begin
                 if ((Y >= (topY_banana + 43)) && (Y <= (topY_banana + 46)))
                     bananaS <= BACKGROUND;           
                 else if ((Y >= (topY_banana + 40)) && (Y <= (topY_banana + 49)))
                     bananaS <= PALE_YELLOW;
                 else if ((Y >= (topY_banana + 34)) && (Y <= (topY_banana + 48)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 49)) && (Y <= (topY_banana + 55)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 32)) && (Y <= (topY_banana + 57)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 26)) || (X == (leftX_banana + 27)))
                 begin
                  if ((Y >= (topY_banana + 41)) && (Y <= (topY_banana + 44)))
                     bananaS <= BACKGROUND;           
                 else if ((Y >= (topY_banana + 37)) && (Y <= (topY_banana + 47)))
                     bananaS <= PALE_YELLOW;
                 else if ((Y >= (topY_banana + 36)) && (Y <= (topY_banana + 52)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 53)) && (Y <= (topY_banana + 57)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 34)) && (Y <= (topY_banana + 59)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end
                 
       else if ((X == (leftX_banana + 28)) || (X == (leftX_banana + 29)))
                           begin
                            if ((Y >= (topY_banana + 38)) && (Y <= (topY_banana + 42)))
                               bananaS <= BACKGROUND;           
                           else if ((Y >= (topY_banana + 37)) && (Y <= (topY_banana + 45)))
                               bananaS <= PALE_YELLOW;
                           else if ((Y >= (topY_banana + 36)) && (Y <= (topY_banana + 52)))
                               bananaS <= YELLOW;
                           else if ((Y >= (topY_banana + 53)) && (Y <= (topY_banana + 57)))
                               bananaS <= DARK_YELLOW;
                           else if ((Y >= (topY_banana + 34)) && (Y <= (topY_banana + 59)))
                               bananaS <= BLACK;
                           else
                               bananaS <= BACKGROUND;
                           end

       else if ((X == (leftX_banana + 30)) || (X == (leftX_banana + 31)))
                 begin
                  if ((Y >= (topY_banana + 37)) && (Y <= (topY_banana + 40)))
                     bananaS <= BACKGROUND;           
                 else if ((Y >= (topY_banana + 41)) && (Y <= (topY_banana + 43)))
                     bananaS <= PALE_YELLOW;
                 else if ((Y >= (topY_banana + 36)) && (Y <= (topY_banana + 52)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 53)) && (Y <= (topY_banana + 57)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 34)) && (Y <= (topY_banana + 59)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 32)) || (X == (leftX_banana + 33)))
                 begin
                 if ((Y >= (topY_banana + 35)) && (Y <= (topY_banana + 38)))
                     bananaS <= BACKGROUND;           
                 else if ((Y >= (topY_banana + 39)) && (Y <= (topY_banana + 41)))
                     bananaS <= PALE_YELLOW;
                 else if ((Y >= (topY_banana + 34)) && (Y <= (topY_banana + 50)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 51)) && (Y <= (topY_banana + 53)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 32)) && (Y <= (topY_banana + 55)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 34)) || (X == (leftX_banana + 35)))
                 begin
                 if (Y <= (topY_banana + 35))
                     bananaS <= BACKGROUND;           
                 else if ((Y >= (topY_banana + 36)) && (Y <= (topY_banana + 39)))
                     bananaS <= PALE_YELLOW;
                 else if ((Y >= (topY_banana + 34)) && (Y <= (topY_banana + 50)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 51)) && (Y <= (topY_banana + 53)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 32)) && (Y <= (topY_banana + 55)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 36)) || (X == (leftX_banana + 37)))
                 begin
                 if (Y <= (topY_banana + 33))
                     bananaS <= BACKGROUND;           
                 else if ((Y >= (topY_banana + 34)) && (Y <= (topY_banana + 36)))
                     bananaS <= PALE_YELLOW;
                 else if ((Y >= (topY_banana + 32)) && (Y <= (topY_banana + 49)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 50)) && (Y <= (topY_banana + 51)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 30)) && (Y <= (topY_banana + 53)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 38)) || (X == (leftX_banana + 39)))
                 begin
                 if (Y <= (topY_banana + 30))
                     bananaS <= BACKGROUND;           
                 else if ((Y >= (topY_banana + 31)) && (Y <= (topY_banana + 34)))
                     bananaS <= PALE_YELLOW;
                 else if ((Y >= (topY_banana + 30)) && (Y <= (topY_banana + 48)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 49)) && (Y <= (topY_banana + 51)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 28)) && (Y <= (topY_banana + 53)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 40)) || (X == (leftX_banana + 41)))
                 begin
                 if ((Y >= (topY_banana + 30)) && (Y <= (topY_banana + 31)))
                     bananaS <= PALE_YELLOW;
                 else if ((Y >= (topY_banana + 28)) && (Y <= (topY_banana + 47)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 48)) && (Y <= (topY_banana + 49)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 51)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 42)) || (X == (leftX_banana + 43)))
                 begin
                 if ((Y >= (topY_banana + 28)) && (Y <= (topY_banana + 44)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 45)) && (Y <= (topY_banana + 47)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 49)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 44)) || (X == (leftX_banana + 45)))
                 begin
                 if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 40)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 41)) && (Y <= (topY_banana + 44)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 24)) && (Y <= (topY_banana + 47)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 46)) || (X == (leftX_banana + 47)))
                 begin
                 if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 34)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 35)) && (Y <= (topY_banana + 41)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 24)) && (Y <= (topY_banana + 44)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 48)) || (X == (leftX_banana + 49)))
                 begin
                 if ((Y >= (topY_banana + 30)) && (Y <= (topY_banana + 32)))
                     bananaS <= YELLOW;
                 else if ((Y >= (topY_banana + 33)) && (Y <= (topY_banana + 35)))
                     bananaS <= DARK_YELLOW;
                 else if ((Y >= (topY_banana + 26)) && (Y <= (topY_banana + 41)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end

       else if ((X == (leftX_banana + 50)) || (X == (leftX_banana + 51)))
                 begin
                 if ((Y >= (topY_banana + 30)) && (Y <= (topY_banana + 35)))
                     bananaS <= BLACK;
                 else
                     bananaS <= BACKGROUND;
                 end
        
        else
            bananaS <= BACKGROUND;
    
    end 
    
    
    
    
endmodule
