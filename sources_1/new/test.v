`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2021 23:59:48
// Design Name: 
// Module Name: test
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


module test(
    input basys_clk,
    output reg [15:0] led = 16'b0
    );
    
    reg t = 0;
    reg w = 1;
    always @(posedge basys_clk) begin
        if (t==0) begin
            led <= 16'b00000_11111_00000_0;
        end
        if (w == 1) begin
            led <= 16'b11111_00000_00000_0;
        end
    end
endmodule
