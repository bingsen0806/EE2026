`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2021 13:42:27
// Design Name: 
// Module Name: strawberry_display
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


module strawberry_display(
    input [6:0] X,
    input [5:0] Y,
    input [6:0] leftX_strawberry,
    input [5:0] topY_strawberry,
    input [15:0] BACKGROUND,
    output reg [15:0]strawberry = 16'd0
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
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 2)) || (X == (leftX_strawberry + 3)))
            begin
            if ((Y >= (topY_strawberry + 30)) && (Y <= (topY_strawberry + 31)))
                strawberry <= YELLOW;
            else if ((Y >= (topY_strawberry + 26)) && (Y <= (topY_strawberry + 34)))
                strawberry <= PINK;
            else if ((Y >= (topY_strawberry + 21)) && (Y <= (topY_strawberry + 39)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 4)) || (X == (leftX_strawberry + 5)))
            begin
            if (((Y >= (topY_strawberry + 23)) && (Y <= (topY_strawberry + 24))) || ((Y >= (topY_strawberry + 35)) && (Y <= (topY_strawberry + 36))))
                strawberry <= YELLOW;
            else if ((Y >= (topY_strawberry + 21)) && (Y <= (topY_strawberry + 39)))
                strawberry <= PINK;
            else if ((Y >= (topY_strawberry + 17)) && (Y <= (topY_strawberry + 41)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 6)) || (X == (leftX_strawberry + 7)))
            begin
            if ((Y >= (topY_strawberry + 17)) && (Y <= (topY_strawberry + 41)))
                strawberry <= PINK;
            else if (((Y >= (topY_strawberry + 15)) && (Y <= (topY_strawberry + 43))) || (Y == (topY_strawberry + 9)) || (Y == (topY_strawberry + 10)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 8)) || (X == (leftX_strawberry + 9)))
            begin
            if (((Y >= (topY_strawberry + 17)) && (Y <= (topY_strawberry + 18))) || ((Y >= (topY_strawberry + 32)) && (Y <= (topY_strawberry + 33))) || ((Y >= (topY_strawberry + 41)) && (Y <= (topY_strawberry + 42))))
                strawberry <= YELLOW;
            else if ((Y >= (topY_strawberry + 15)) && (Y <= (topY_strawberry + 43)))
                strawberry <= PINK;
            else if (((Y >= (topY_strawberry + 13)) && (Y <= (topY_strawberry + 46))) || (Y == (topY_strawberry + 9)) || (Y == (topY_strawberry + 10)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 10)) || (X == (leftX_strawberry + 11)))
            begin
            if ((Y >= (topY_strawberry + 26)) && (Y <= (topY_strawberry + 27)))
                strawberry <= YELLOW;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 10)))
                strawberry <= GREEN;
            else if ((Y >= (topY_strawberry + 15)) && (Y <= (topY_strawberry + 46)))
                strawberry <= PINK;
            else if (Y == (topY_strawberry + 12))
                strawberry <= BACKGROUND;
            else if ((Y >= (topY_strawberry + 7)) && (Y <= (topY_strawberry + 48)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 12)) || (X == (leftX_strawberry + 13)))
            begin
            if (((Y >= (topY_strawberry + 14)) && (Y <= (topY_strawberry + 15))) || ((Y >= (topY_strawberry + 43)) && (Y <= (topY_strawberry + 44))))
                strawberry <= YELLOW;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 10)))
                strawberry <= GREEN;
            else if ((Y >= (topY_strawberry + 13)) && (Y <= (topY_strawberry + 48)))
                strawberry <= PINK;
            else if ((Y >= (topY_strawberry + 7)) && (Y <= (topY_strawberry + 50)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 14)) || (X == (leftX_strawberry + 15)))
            begin
            if (((Y >= (topY_strawberry + 20)) && (Y <= (topY_strawberry + 21))) || ((Y >= (topY_strawberry + 32)) && (Y <= (topY_strawberry + 33))) || ((Y >= (topY_strawberry + 38)) && (Y <= (topY_strawberry + 39))) || ((Y >= (topY_strawberry + 49)) && (Y <= (topY_strawberry + 50))))
                strawberry <= YELLOW;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 10)))
                strawberry <= GREEN;
            else if ((Y >= (topY_strawberry + 13)) && (Y <= (topY_strawberry + 48)))
                strawberry <= PINK;
            else if ((Y >= (topY_strawberry + 7)) && (Y <= (topY_strawberry + 52)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 16)) || (X == (leftX_strawberry + 17)))
            begin
            if ((Y >= (topY_strawberry + 10)) && (Y <= (topY_strawberry + 11)))
                strawberry <= GREEN;
            else if ((Y >= (topY_strawberry + 13)) && (Y <= (topY_strawberry + 52)))
                strawberry <= PINK;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 54)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 18)) || (X == (leftX_strawberry + 19)))
            begin
            if (((Y >= (topY_strawberry + 25)) && (Y <= (topY_strawberry + 26))) || ((Y >= (topY_strawberry + 44)) && (Y <= (topY_strawberry + 45))))
                strawberry <= YELLOW;
            else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 12)))
                strawberry <= GREEN;
            else if ((Y >= (topY_strawberry + 18)) && (Y <= (topY_strawberry + 53)))
                strawberry <= PINK;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 55)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 20)) || (X == (leftX_strawberry + 21)))
            begin
            if ((Y >= (topY_strawberry + 13)) && (Y <= (topY_strawberry + 17)))
                strawberry <= GREEN;
            else if ((Y >= (topY_strawberry + 21)) && (Y <= (topY_strawberry + 53)))
                strawberry <= PINK;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 55)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 22)) || (X == (leftX_strawberry + 23)))
            begin
            if (((Y >= (topY_strawberry + 29)) && (Y <= (topY_strawberry + 30))) || ((Y >= (topY_strawberry + 35)) && (Y <= (topY_strawberry + 36))) || ((Y >= (topY_strawberry + 51)) && (Y <= (topY_strawberry + 52))))
                strawberry <= YELLOW;
            else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 20)))
                strawberry <= GREEN;
            else if ((Y >= (topY_strawberry + 23)) && (Y <= (topY_strawberry + 54)))
                strawberry <= PINK;
            else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 57)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 24)) || (X == (leftX_strawberry + 25)))
            begin
            if ((Y >= (topY_strawberry + 41)) && (Y <= (topY_strawberry + 42)))
                strawberry <= YELLOW;
            else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 22)))
                strawberry <= GREEN;
            else if ((Y >= (topY_strawberry + 25)) && (Y <= (topY_strawberry + 53)))
                strawberry <= PINK;
            else if ((Y >= (topY_strawberry + 5)) && (Y <= (topY_strawberry + 55)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 26)) || (X == (leftX_strawberry + 27)))
            begin
            if (((Y >= (topY_strawberry + 25)) && (Y <= (topY_strawberry + 26))) || ((Y >= (topY_strawberry + 46)) && (Y <= (topY_strawberry + 47))))
                strawberry <= YELLOW;
            else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 20)))
                strawberry <= GREEN;
            else if ((Y >= (topY_strawberry + 23)) && (Y <= (topY_strawberry + 53)))
                strawberry <= PINK;
            else if ((Y >= (topY_strawberry + 5)) && (Y <= (topY_strawberry + 8)))
                strawberry <= BACKGROUND;
            else if ((Y >= (topY_strawberry + 2)) && (Y <= (topY_strawberry + 55)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end

        else if ((X == (leftX_strawberry + 28)) || (X == (leftX_strawberry + 29)))
            begin
            if ((Y >= (topY_strawberry + 31)) && (Y <= (topY_strawberry + 32)))
                strawberry <= YELLOW;
            else if ((Y >= (topY_strawberry + 13)) && (Y <= (topY_strawberry + 17)))
                strawberry <= GREEN;
            else if ((Y >= (topY_strawberry + 21)) && (Y <= (topY_strawberry + 52)))
                strawberry <= PINK;
            else if ((Y >= (topY_strawberry + 2)) && (Y <= (topY_strawberry + 8)))
                strawberry <= BACKGROUND;
            else if ((Y >= topY_strawberry) && (Y <= (topY_strawberry + 54)))
                strawberry <= BLACK;
            else 
                strawberry <= BACKGROUND;
            end
            
        else if ((X == (leftX_strawberry + 30)) || (X == (leftX_strawberry + 31)))
                begin
                if (((Y >= (topY_strawberry + 20)) && (Y <= (topY_strawberry + 21))) || ((Y >= (topY_strawberry + 38)) && (Y <= (topY_strawberry + 39))) || ((Y >= (topY_strawberry + 48)) && (Y <= (topY_strawberry + 49))))
                    strawberry <= YELLOW;
                else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 12)))
                    strawberry <= GREEN;
                else if ((Y >= (topY_strawberry + 18)) && (Y <= (topY_strawberry + 50)))
                    strawberry <= PINK;
                else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 52)))
                    strawberry <= BLACK;
                else 
                    strawberry <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 32)) || (X == (leftX_strawberry + 33)))
                begin
                if (((Y >= (topY_strawberry + 15)) && (Y <= (topY_strawberry + 16))) || ((Y >= (topY_strawberry + 23)) && (Y <= (topY_strawberry + 24))))
                    strawberry <= YELLOW;
                else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 12)))
                    strawberry <= GREEN;
                else if ((Y >= (topY_strawberry + 14)) && (Y <= (topY_strawberry + 48)))
                    strawberry <= PINK;
                else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 50)))
                    strawberry <= BLACK;
                else 
                    strawberry <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 34)) || (X == (leftX_strawberry + 35)))
                begin
                if ((Y >= (topY_strawberry + 33)) && (Y <= (topY_strawberry + 34)))
                    strawberry <= YELLOW;
                else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 12)))
                    strawberry <= GREEN;
                else if ((Y >= (topY_strawberry + 14)) && (Y <= (topY_strawberry + 46)))
                    strawberry <= PINK;
                else if ((Y >= (topY_strawberry + 7)) && (Y <= (topY_strawberry + 48)))
                    strawberry <= BLACK;
                else 
                    strawberry <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 36)) || (X == (leftX_strawberry + 37)))
                begin
                if (((Y >= (topY_strawberry + 18)) && (Y <= (topY_strawberry + 19))) || ((Y >= (topY_strawberry + 43)) && (Y <= (topY_strawberry + 44))))
                    strawberry <= YELLOW;
                else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 12)))
                    strawberry <= GREEN;
                else if ((Y >= (topY_strawberry + 14)) && (Y <= (topY_strawberry + 46)))
                    strawberry <= PINK;
                else if ((Y >= (topY_strawberry + 7)) && (Y <= (topY_strawberry + 48)))
                    strawberry <= BLACK;
                else 
                    strawberry <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 38)) || (X == (leftX_strawberry + 39)))
                begin
                if (((Y >= (topY_strawberry + 27)) && (Y <= (topY_strawberry + 28))) || ((Y >= (topY_strawberry + 36)) && (Y <= (topY_strawberry + 37))))
                    strawberry <= YELLOW;
                else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 10)))
                    strawberry <= GREEN;
                else if ((Y >= (topY_strawberry + 15)) && (Y <= (topY_strawberry + 44)))
                    strawberry <= PINK;
                else if ((Y >= (topY_strawberry + 7)) && (Y <= (topY_strawberry + 46)))
                    strawberry <= BLACK;
                else 
                    strawberry <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 40)) || (X == (leftX_strawberry + 41)))
                begin
                if ((Y >= (topY_strawberry + 20)) && (Y <= (topY_strawberry + 21)))
                    strawberry <= YELLOW;
                else if ((Y >= (topY_strawberry + 15)) && (Y <= (topY_strawberry + 41)))
                    strawberry <= PINK;
                else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 12)))
                        strawberry <= BACKGROUND;
                else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 44)))
                    strawberry <= BLACK;
                else 
                    strawberry <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 42)) || (X == (leftX_strawberry + 43)))
                begin
                if ((Y >= (topY_strawberry + 29)) && (Y <= (topY_strawberry + 30)))
                    strawberry <= YELLOW;
                else if ((Y >= (topY_strawberry + 17)) && (Y <= (topY_strawberry + 39)))
                    strawberry <= PINK;
                else if ((Y >= (topY_strawberry + 11)) && (Y <= (topY_strawberry + 14)))
                        strawberry <= BACKGROUND;
                else if ((Y >= (topY_strawberry + 9)) && (Y <= (topY_strawberry + 41)))
                    strawberry <= BLACK;
                else 
                    strawberry <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 44)) || (X == (leftX_strawberry + 45)))
                begin
                if ((Y >= (topY_strawberry + 34)) && (Y <= (topY_strawberry + 35)))
                    strawberry <= YELLOW;
                else if ((Y >= (topY_strawberry + 21)) && (Y <= (topY_strawberry + 37)))
                    strawberry <= PINK;
                else if ((Y >= (topY_strawberry + 17)) && (Y <= (topY_strawberry + 39)))
                    strawberry <= BLACK;
                else 
                    strawberry <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 46)) || (X == (leftX_strawberry + 47)))
                begin
                if ((Y >= (topY_strawberry + 25)) && (Y <= (topY_strawberry + 26)))
                    strawberry <= YELLOW;
                else if ((Y >= (topY_strawberry + 27)) && (Y <= (topY_strawberry + 33)))
                    strawberry <= PINK;
                else if ((Y >= (topY_strawberry + 21)) && (Y <= (topY_strawberry + 37)))
                    strawberry <= BLACK;
                else 
                    strawberry <= BACKGROUND;
                end

        else if ((X == (leftX_strawberry + 48)) || (X == (leftX_strawberry + 49)))
                begin
                if ((Y >= (topY_strawberry + 25)) && (Y <= (topY_strawberry + 33)))
                    strawberry <= BLACK;
                else 
                    strawberry <= BACKGROUND;
                end
        else
            strawberry <= BACKGROUND;
    
    end
endmodule
