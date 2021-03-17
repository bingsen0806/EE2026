`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2021 21:02:52
// Design Name: 
// Module Name: RawAudio
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

// This module takes in mic_in data from Audio_Capture module, and updates the changes at a lower frequency
// So that it is visible to human eye.
module RawAudio(
    input ra_clk,
    input [11:0] mic_in,
    output reg [11:0] new_mic_in = 12'b00000_00000_00
    );
    
    always @ (posedge ra_clk) begin
        new_mic_in <= mic_in;
    end
endmodule
