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


module volume_bar(input SW, clk12p5Mhz, [6:0] x, [5:0] y, output reg [15:0]colour = 16'd0);

    //white border
    always @ (posedge clk12p5Mhz)
    begin
        //PIXEL BORDER
        if (SW == 0) //1 pixel border
            begin 
                if (y == 0 | y == 63 | x == 0 | x == 95)
                    colour <= 16'b11111_111111_11111;
                else 
                    colour <= 16'b00000_000000_00000;
            end
        else 
            begin //3 pixel border
            if (y == 0 | y == 1 | y == 2 | y == 61 | y == 62 | y == 63 | x == 0 | x == 1 | x == 2 | x == 93 | x == 94 | x == 95)
                colour <= 16'b11111_111111_11111;
            else 
                colour <= 16'b00000_000000_00000;
            end
         
         
         //VOLUME BAR
         if (x >= 43 & x <= 53)
            begin
            if (y >= 42 & y <= 60)
                begin
                colour <= 16'b00000_111111_00000;
                end
            else if (y >= 23 & y <= 41)
                begin
                colour <= 16'b11111_111111_00000;
                end
            else if (y >= 3 & y <= 22)
                begin
                colour <= 16'b11111_000000_00000;
                end
            end
         
         
    end
endmodule
