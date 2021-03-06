`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2021 19:11:17
// Design Name: 
// Module Name: clk10Hz
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


module clk10Hz(
    input basys_clk,
    output clk_signal
    );
    
    reg [31:0] count = 32'd0;
    reg clk_signal = 0;
    always @(posedge basys_clk) begin
        count <= (count == 4999999) ? 0 : count + 1;
        clk_signal <= (count == 0) ? ~clk_signal : clk_signal;
   
    end 
endmodule
