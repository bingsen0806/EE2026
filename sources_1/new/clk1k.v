`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2021 15:21:34
// Design Name: 
// Module Name: clk1k
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


module clk1k(
    input basys_clk,
    output clk_signal
    );
    
    reg [31:0] count = 32'd0;
    reg clk_signal = 0;
    always @(posedge basys_clk) begin
        count <= (count == 49999) ? 0 : count + 1;
        clk_signal <= (count == 0) ? ~clk_signal : clk_signal;
   
    end 
endmodule
