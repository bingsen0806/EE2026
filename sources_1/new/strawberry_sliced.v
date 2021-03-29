`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2021 14:55:09
// Design Name: 
// Module Name: strawberry_sliced
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


module strawberry_sliced(
    input [6:0] Y,
    input [5:0] X,
    input [6:0] leftX_strawberry,
    input [5:0] topY_strawberry,
    input [15:0] BACKGROUND,
    output reg [15:0] strawberryS = 16'd0
    );
    
    parameter [15:0]BLACK = 16'b00000_000000_00000;
    parameter [15:0]PINK = 16'b11011_011001_01100;
    parameter [15:0]YELLOW = 16'b11111_111111_00000;
    parameter [15:0]GREEN = 16'b00000_111111_00000;
    
    always @ (X or Y)
    begin
    
        if ((X == leftX_strawberry) || (X == (leftX_strawberry + 1)))
            begin
            if ((Y >= (topY_strawberry + 26)) && (Y <= (topY_strawberry + 34)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 2)) || (X == (leftX_strawberry + 3)))
            begin
            if ((Y >= (topY_strawberry + 30)) && (Y <= (topY_strawberry + 31)))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 26)) && (Y <= (topY_strawberry + 34)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 21)) && (Y <= (topY_strawberry + 39)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 4)) || (X == (leftX_strawberry + 5)))
            begin
            if (((Y >= (topY_strawberry + 23)) && (Y <= (topY_strawberry + 24))) || ((Y >= (topY_strawberry + 35)) && (Y <= (topY_strawberry + 36))))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 21)) && (Y <= (topY_strawberry + 39)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 17)) && (Y <= (topY_strawberry + 41)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 6)) || (X == (leftX_strawberry + 7)))
            begin
            if ((Y >= (topY_strawberry + 17)) && (Y <= (topY_strawberry + 41)))
                strawberryS <= PINK;
            else if (((Y >= (topY_strawberry + 15)) && (Y <= (topY_strawberry + 43))) || (Y == (topY_strawberry + 9)) || (Y == (topY_strawberry + 10)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 8)) || (X == (leftX_strawberry + 9)))
            begin
            if ((Y >= (topY_strawberry + 41)) && (Y <= (topY_strawberry + 44)))
                strawberryS <= BACKGROUND;
            else if (((Y >= (topY_strawberry + 17)) && (Y <= (topY_strawberry + 18))) || ((Y >= (topY_strawberry + 32)) && (Y <= (topY_strawberry + 33))) || ((Y >= (topY_strawberry + 41)) && (Y <= (topY_strawberry + 42))))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 15)) && (Y <= (topY_strawberry + 43)))
                strawberryS <= PINK;
            else if (((Y >= (topY_strawberry + 13)) && (Y <= (topY_strawberry + 46))) || (Y == (topY_strawberry + 9)) || (Y == (topY_strawberry + 10)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 10)) || (X == (leftX_strawberry + 11)))
            begin
            if ((Y >= (topY_strawberry + 38)) && (Y <= (topY_strawberry + 41)))
                strawberryS <= BACKGROUND;
            else if ((Y >= (topY_strawberry + 26)) && (Y <= (topY_strawberry + 27)))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 10)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 15)) && (Y <= (topY_strawberry + 46)))
                strawberryS <= PINK;
            else if (Y == (topY_strawberry + 12))
                strawberryS <= BACKGROUND;
            else if ((Y >= (topY_strawberry + 7)) && (Y <= (topY_strawberry + 48)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 12)) || (X == (leftX_strawberry + 13)))
            begin
            if ((Y >= (topY_strawberry + 36)) && (Y <= (topY_strawberry + 38)))
                strawberryS <= BACKGROUND;
            else if (((Y >= (topY_strawberry + 14)) && (Y <= (topY_strawberry + 15))) || ((Y >= (topY_strawberry + 43)) && (Y <= (topY_strawberry + 44))))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 10)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 13)) && (Y <= (topY_strawberry + 48)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 7)) && (Y <= (topY_strawberry + 50)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 14)) || (X == (leftX_strawberry + 15)))
            begin
            if ((Y >= (topY_strawberry + 34)) && (Y <= (topY_strawberry + 36)))
                strawberryS <= BACKGROUND;
            else if (((Y >= (topY_strawberry + 20)) && (Y <= (topY_strawberry + 21))) || ((Y >= (topY_strawberry + 32)) && (Y <= (topY_strawberry + 33))) || ((Y >= (topY_strawberry + 38)) && (Y <= (topY_strawberry + 39))) || ((Y >= (topY_strawberry + 49)) && (Y <= (topY_strawberry + 50))))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 10)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 13)) && (Y <= (topY_strawberry + 48)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 7)) && (Y <= (topY_strawberry + 52)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 16)) || (X == (leftX_strawberry + 17)))
            begin
            if ((Y >= (topY_strawberry + 31)) && (Y <= (topY_strawberry + 34)))
                strawberryS <= BACKGROUND;
            else if ((Y >= (topY_strawberry + 10)) && (Y <= (topY_strawberry + 11)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 13)) && (Y <= (topY_strawberry + 52)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 54)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 18)) || (X == (leftX_strawberry + 19)))
            begin
            if ((Y >= (topY_strawberry + 29)) && (Y <= (topY_strawberry + 31)))
                strawberryS <= BACKGROUND;
            else if (((Y >= (topY_strawberry + 25)) && (Y <= (topY_strawberry + 26))) || ((Y >= (topY_strawberry + 44)) && (Y <= (topY_strawberry + 45))))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 12)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 18)) && (Y <= (topY_strawberry + 53)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 55)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 20)) || (X == (leftX_strawberry + 21)))
            begin
            if ((Y >= (topY_strawberry + 26)) && (Y <= (topY_strawberry + 29)))
                strawberryS <= BACKGROUND;
            else if ((Y >= (topY_strawberry + 13)) && (Y <= (topY_strawberry + 17)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 21)) && (Y <= (topY_strawberry + 53)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 55)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 22)) || (X == (leftX_strawberry + 23)))
            begin
            if ((Y >= (topY_strawberry + 24)) && (Y <= (topY_strawberry + 27)))
                strawberryS <= BACKGROUND;
            else if (((Y >= (topY_strawberry + 29)) && (Y <= (topY_strawberry + 30))) || ((Y >= (topY_strawberry + 35)) && (Y <= (topY_strawberry + 36))) || ((Y >= (topY_strawberry + 51)) && (Y <= (topY_strawberry + 52))))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 20)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 23)) && (Y <= (topY_strawberry + 54)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 57)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 24)) || (X == (leftX_strawberry + 25)))
            begin
            if ((Y >= (topY_strawberry + 21)) && (Y <= (topY_strawberry + 24)))
                strawberryS <= BACKGROUND;
            else if ((Y >= (topY_strawberry + 41)) && (Y <= (topY_strawberry + 42)))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 22)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 25)) && (Y <= (topY_strawberry + 53)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 5)) && (Y <= (topY_strawberry + 55)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 26)) || (X == (leftX_strawberry + 27)))
            begin
            if ((Y >= (topY_strawberry + 19)) && (Y <= (topY_strawberry + 21)))
                strawberryS <= BACKGROUND;
            else if (((Y >= (topY_strawberry + 25)) && (Y <= (topY_strawberry + 26))) || ((Y >= (topY_strawberry + 46)) && (Y <= (topY_strawberry + 47))))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 20)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 23)) && (Y <= (topY_strawberry + 53)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 5)) && (Y <= (topY_strawberry + 8)))
                strawberryS <= BACKGROUND;
            else if ((Y >= (topY_strawberry + 2)) && (Y <= (topY_strawberry + 55)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 28)) || (X == (leftX_strawberry + 29)))
            begin
            if ((Y >= (topY_strawberry + 17)) && (Y <= (topY_strawberry + 19)))
                strawberryS <= BACKGROUND;
            else if ((Y >= (topY_strawberry + 31)) && (Y <= (topY_strawberry + 32)))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 13)) && (Y <= (topY_strawberry + 17)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 21)) && (Y <= (topY_strawberry + 52)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 2)) && (Y <= (topY_strawberry + 8)))
                strawberryS <= BACKGROUND;
            else if ((Y >= topY_strawberry) && (Y <= (topY_strawberry + 54)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end
            
        else if ((X == (leftX_strawberry + 30)) || (X == (leftX_strawberry + 31)))
            begin
            if ((Y >= (topY_strawberry + 15)) && (Y <= (topY_strawberry + 17)))
                strawberryS <= BACKGROUND;
            else if (((Y >= (topY_strawberry + 20)) && (Y <= (topY_strawberry + 21))) || ((Y >= (topY_strawberry + 38)) && (Y <= (topY_strawberry + 39))) || ((Y >= (topY_strawberry + 48)) && (Y <= (topY_strawberry + 49))))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 12)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 18)) && (Y <= (topY_strawberry + 50)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 52)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 32)) || (X == (leftX_strawberry + 33)))
            begin
            if ((Y >= (topY_strawberry + 13)) && (Y <= (topY_strawberry + 16)))
                strawberryS <= BACKGROUND;
            else if (((Y >= (topY_strawberry + 15)) && (Y <= (topY_strawberry + 16))) || ((Y >= (topY_strawberry + 23)) && (Y <= (topY_strawberry + 24))))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 12)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 14)) && (Y <= (topY_strawberry + 48)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 50)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 34)) || (X == (leftX_strawberry + 35)))
            begin
            if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 13)))
                strawberryS <= BACKGROUND;
            else if ((Y >= (topY_strawberry + 33)) && (Y <= (topY_strawberry + 34)))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 12)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 14)) && (Y <= (topY_strawberry + 46)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 7)) && (Y <= (topY_strawberry + 48)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 36)) || (X == (leftX_strawberry + 37)))
            begin
            if (Y <= (topY_strawberry + 11))
                strawberryS <= BACKGROUND;
            if (((Y >= (topY_strawberry + 18)) && (Y <= (topY_strawberry + 19))) || ((Y >= (topY_strawberry + 43)) && (Y <= (topY_strawberry + 44))))
                strawberryS <= YELLOW;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 12)))
                strawberryS <= GREEN;
            else if ((Y >= (topY_strawberry + 14)) && (Y <= (topY_strawberry + 46)))
                strawberryS <= PINK;
            else if ((Y >= (topY_strawberry + 7)) && (Y <= (topY_strawberry + 48)))
                strawberryS <= BLACK;
            else 
                strawberryS <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 38)) || (X == (leftX_strawberry + 39)))
                begin
                if (((Y >= (topY_strawberry + 27)) && (Y <= (topY_strawberry + 28))) || ((Y >= (topY_strawberry + 36)) && (Y <= (topY_strawberry + 37))))
                    strawberryS <= YELLOW;
                else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 10)))
                    strawberryS <= GREEN;
                else if ((Y >= (topY_strawberry + 15)) && (Y <= (topY_strawberry + 44)))
                    strawberryS <= PINK;
                else if ((Y >= (topY_strawberry + 7)) && (Y <= (topY_strawberry + 46)))
                    strawberryS <= BLACK;
                else 
                    strawberryS <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 40)) || (X == (leftX_strawberry + 41)))
                begin
                if ((Y >= (topY_strawberry + 20)) && (Y <= (topY_strawberry + 21)))
                    strawberryS <= YELLOW;
                else if ((Y >= (topY_strawberry + 15)) && (Y <= (topY_strawberry + 41)))
                    strawberryS <= PINK;
                else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 12)))
                    strawberryS <= BACKGROUND;
                else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 44)))
                    strawberryS <= BLACK;
                else 
                    strawberryS <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 42)) || (X == (leftX_strawberry + 43)))
                begin
                if ((Y >= (topY_strawberry + 29)) && (Y <= (topY_strawberry + 30)))
                    strawberryS <= YELLOW;
                else if ((Y >= (topY_strawberry + 17)) && (Y <= (topY_strawberry + 39)))
                    strawberryS <= PINK;
                else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 14)))
                    strawberryS <= BACKGROUND;
                else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 41)))
                    strawberryS <= BLACK;
                else 
                    strawberryS <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 44)) || (X == (leftX_strawberry + 45)))
                begin
                if ((Y >= (topY_strawberry + 34)) && (Y <= (topY_strawberry + 35)))
                    strawberryS <= YELLOW;
                else if ((Y >= (topY_strawberry + 21)) && (Y <= (topY_strawberry + 37)))
                    strawberryS <= PINK;
                else if ((Y >= (topY_strawberry + 17)) && (Y <= (topY_strawberry + 39)))
                    strawberryS <= BLACK;
                else 
                    strawberryS <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 46)) || (X == (leftX_strawberry + 47)))
                begin
                if ((Y >= (topY_strawberry + 25)) && (Y <= (topY_strawberry + 26)))
                    strawberryS <= YELLOW;
                else if ((Y >= (topY_strawberry + 27)) && (Y <= (topY_strawberry + 33)))
                    strawberryS <= PINK;
                else if ((Y >= (topY_strawberry + 21)) && (Y <= (topY_strawberry + 37)))
                    strawberryS <= BLACK;
                else 
                    strawberryS <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 48)) || (X == (leftX_strawberry + 49)))
                begin
                if ((Y >= (topY_strawberry + 25)) && (Y <= (topY_strawberry + 33)))
                    strawberryS <= BLACK;
                else 
                    strawberryS <= BACKGROUND;
                end
        else
            strawberryS <= BACKGROUND;
    
    end
endmodule
