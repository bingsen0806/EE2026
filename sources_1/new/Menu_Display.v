`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2021 20:03:27
// Design Name: 
// Module Name: Menu_Display
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


module Menu_Display(
    input [3:0] state,
    input single_pulse_clk,
    input btnU,
    input btnD,
    input [6:0] X,
    input [5:0] Y,
    output reg [15:0] oled_data = 16'b11111_000000_00000,
    output reg [1:0] nextStateMenu = 2'b00
    );
    
    always @(posedge single_pulse_clk) begin
        if (state == 4'b0000) begin
            if (btnU == 1 && nextStateMenu > 0) begin
                nextStateMenu <= nextStateMenu - 1;
            end else if (btnD == 1 && nextStateMenu < 2'b11) begin
                nextStateMenu <= nextStateMenu + 1;
            end
        end else begin
            nextStateMenu <= 2'b00;
        end
    end
    
    always @ (X or Y) begin
        oled_data = 16'b00000_111111_00000;
    end
endmodule
