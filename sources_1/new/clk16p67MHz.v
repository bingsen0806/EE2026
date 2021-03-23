`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2021 21:55:47
// Design Name: 
// Module Name: clk16p67MHz
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


module clk16p67MHz(
    input basys_clk,
    output clk_signal
    );
    reg [31:0] count = 32'd0;
    reg clk_signal = 0;
    always @(posedge basys_clk) begin
        count <= (count == 2) ? 0 : count + 1;
        clk_signal <= (count == 0) ? ~clk_signal : clk_signal;
   
    end  
endmodule
