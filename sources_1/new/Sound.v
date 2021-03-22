`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2021 21:43:11
// Design Name: 
// Module Name: Sound
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


module Sound(
    input clk_20,
    input clk_20k,
    input [11:0] mic_in,
    output [3:0] volume_level_raw,
    output [3:0] volume_level_peak,
    output [11:0] raw_mic_in
    );
    
    wire [11:0] peak_mic_in;
    RawAudio raw_audio(.ra_clk(clk_20),.mic_in(mic_in),.new_mic_in(raw_mic_in));
    PeakVolume peakDetector(.clk(clk_20k),.mic_in(mic_in),.peak_volume(peak_mic_in));
    VolumeLevel volumeLevelRaw(.mic_in(raw_mic_in),.volume_level(volume_level_raw));
    VolumeLevel volumeLevelPeak(.mic_in(peak_mic_in),.volume_level(volume_level_peak));
endmodule
