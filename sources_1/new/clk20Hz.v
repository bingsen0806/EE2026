`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2021 22:05:16
// Design Name: 
// Module Name: clk20Hz
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

module clk20Hz(
    input basys_clk,
    output reg clk_signal = 0
    );
    
    reg [31:0] count = 32'd0;
    always @(posedge basys_clk) begin
        count <= (count == 2499999) ? 0 : count + 1;
        clk_signal <= (count == 0) ? ~clk_signal : clk_signal;
   
    end 
endmodule