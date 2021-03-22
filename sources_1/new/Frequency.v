`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2021 22:55:57
// Design Name: 
// Module Name: Frequency
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


module Frequency(input clk_20kHz, input [11:0] mic_in, output [3:0] freq_level, output reg [11:0] freq = 0);

    reg [31:0] count = 0;
    reg end_period = 0;
    reg [11:0] SOUNDCOUNTER = 0;
    reg reset = 0;
    
    assign freq_level = (freq < 100) ? 0 : 
                        (freq < 200) ? 1 :
                        (freq < 300) ? 2 :
                        (freq < 400) ? 3 :
                        (freq < 500) ? 4 :
                        (freq < 600) ? 5 :
                        (freq < 700) ? 6 :
                        (freq < 800) ? 7 :
                        (freq < 900) ? 8 :
                        (freq < 1000) ? 9 :
                        (freq < 1100) ? 10 :
                        (freq < 1200) ? 11 :
                        (freq < 1300) ? 12 :
                        (freq < 1400) ? 13 :
                        (freq < 1500) ? 14 : 15;
                        
    always @ (posedge clk_20kHz) 
    begin
        count <= count +1;
        
        reset = 0;
        
        if(mic_in > 2100)
            end_period <= 1;
        else
            end_period <= 0;
       
        if(count == 3999)
        begin
            count <= 0;
            freq = 5 * SOUNDCOUNTER;
            reset = 1;
        end
    end
    
    always @ (posedge end_period, posedge reset)
    begin
        if (reset == 1)
            SOUNDCOUNTER <= 0;
        else 
            SOUNDCOUNTER <= SOUNDCOUNTER + 1;
    end

endmodule