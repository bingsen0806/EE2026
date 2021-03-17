`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2021 15:31:51
// Design Name: 
// Module Name: AudioVolume
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


module PeakVolume(
    input clk,
    input [11:0] mic_in,
    output reg [11:0] peak_volume = 12'b00000_00000_00
    );
    reg [11:0] max_Volume = 12'b00000_00000_00;
    reg [8:0] count = 9'b00000_0000;
    always @(posedge clk) begin
        count <= count + 1;
        if (mic_in > max_Volume) begin
            max_Volume <= mic_in;
        end
        if (count == 9'b00000_0000) begin
            peak_volume <= max_Volume;
            max_Volume <= 12'b00000_00000_00;
        end
    end
endmodule
