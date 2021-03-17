`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2021 15:14:47
// Design Name: 
// Module Name: single_pulse
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


module single_pulse(
    input btn,
    input sp_clk,
    output pulse_out
    );
    
    wire Q1; wire Q2;
    DFlipFlop dff1(sp_clk,btn,Q1);
    DFlipFlop dff2(sp_clk,Q1,Q2);
    assign pulse_out = Q1 & (~Q2);
    
endmodule
