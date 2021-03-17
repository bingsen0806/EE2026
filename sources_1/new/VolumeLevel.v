`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2021 22:00:51
// Design Name: 
// Module Name: VolumeLevel
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


module VolumeLevel(
    input [11:0] mic_in,
    output [3:0] volume_level
    );
    
    assign volume_level = (mic_in < 2176) ? 4'b0000 : (
                          (mic_in < 2304) ? 4'b0001 : (
                          (mic_in < 2432) ? 4'b0010 : (
                          (mic_in < 2560) ? 4'b0011 : (
                          (mic_in < 2688) ? 4'b0100 : (
                          (mic_in < 2816) ? 4'b0101 : (
                          (mic_in < 2944) ? 4'b0110 : (
                          (mic_in < 3072) ? 4'b0111 : (
                          (mic_in < 3200) ? 4'b1000 : (
                          (mic_in < 3328) ? 4'b1001 : (
                          (mic_in < 3456) ? 4'b1010 : (
                          (mic_in < 3584) ? 4'b1011 : (
                          (mic_in < 3712) ? 4'b1100 : (
                          (mic_in < 3840) ? 4'b1101 : (
                          (mic_in < 3968) ? 4'b1110 : 4'b1111 
                          ))))))))))))));
endmodule
