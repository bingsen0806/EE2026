`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2021 14:47:01
// Design Name: 
// Module Name: Pokemon_Logic
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


module Pokemon_Logic(
    input single_pulse_clk,
    input player1_up,
    input player1_down,
    input player2_up,
    input player2_down,
    output [5:0] topYCharmander ,
    output [5:0] topYSquirtle
    );
    
    reg [5:0] topYCharmander = 6'd18;
    reg [5:0] topYSquirtle = 6'd18;
    always @(posedge single_pulse_clk) begin
        if (player2_up == 1 && topYSquirtle >=18) begin
            topYSquirtle <= topYSquirtle - 18;
        end else if (player2_down == 1 && topYSquirtle < 36) begin
            topYSquirtle <= topYSquirtle + 18; 
        end
        if (player1_up == 1 && topYCharmander >=18) begin
            topYCharmander <= topYCharmander - 18;
        end else if (player1_down == 1 && topYCharmander < 36) begin
            topYCharmander <= topYCharmander + 18;
        end
    end
endmodule
