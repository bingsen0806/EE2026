`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2021 00:14:29
// Design Name: 
// Module Name: clk400Hz
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


module clk400Hz(
    input basys_clk,
    output clk_signal
    );
    reg [31:0] count = 32'd0;
    reg clk_signal = 0;
    always @(posedge basys_clk) begin
        count <= (count == 124999) ? 0 : count + 1;
        clk_signal <= (count == 0) ? ~clk_signal : clk_signal;
   
    end 
endmodule
