`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2021 17:01:37
// Design Name: 
// Module Name: pixel_index_axis
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


module pixel_index_axis(input [12:0]my_pixel_index, output reg [7:0] x = 7'd0, output reg [6:0] y = 6'd0);

    always @ (my_pixel_index)
    begin
        x <= (my_pixel_index % 96);
        y <= (my_pixel_index / 96);
    end
            
        

endmodule
