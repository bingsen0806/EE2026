`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY  WEDNESDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: LIM BING SEN
//  STUDENT B MATRICULATION NUMBER: A0192330N
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    input basys_clk,
    input btnC,
    output [7:0] JC,
    input sw,
    output [15:0] led, //remember change constraint
    output [3:0] an,
    output [7:0] seg
    );
    
    wire frame_begin; wire sending_pixels; wire sample_pixel;
    wire [12:0] pixel_index; wire teststate;
    reg [15:0] oled_data = 16'h07E0;
    wire clk_6p25M; wire clk_1k; wire clk_20k; wire clk_20; wire clk_400; wire clk_5; wire reset_pulse;
    wire [11:0] mic_in;
    clk1k clk1kHz(basys_clk,clk_1k);
    clk5Hz clk_5Hz(basys_clk,clk_5);
    clk20kHz clk_20kHz(basys_clk,clk_20k);
    clk20Hz clk_20Hz(basys_clk,clk_20);
    clk400Hz clk_400Hz(basys_clk,clk_400);
    clk6p25Mhz clk6p25Mhz(basys_clk,clk_6p25M);
    single_pulse reset(btnC, clk_1k, reset_pulse);
    Oled_Display oled(
        .clk(clk_6p25M), 
        .reset(reset_pulse),
        .frame_begin(frame_begin),  
        .sending_pixels(sending_pixels) ,  
        .sample_pixel(sample_pixel) ,  
        .pixel_index(pixel_index) ,
        .pixel_data(oled_data),
        .cs(JC[0]), 
        .sdin(JC[1]), 
        .sclk(JC[3]), 
        .d_cn(JC[4]), 
        .resn(JC[5]), 
        .vccen(JC[6]),
        .pmoden(JC[7]),
        .teststate(teststate)
    );
    
    Audio_Capture audio(
        .CLK(basys_clk),
        .cs(clk_20k),
        .MISO(J_MIC3_Pin3),
        .clk_samp(J_MIC3_Pin1),
        .sclk(J_MIC3_Pin4),
        .sample(mic_in)
    );
    
    wire [11:0] peak_mic_in; wire[11:0] raw_mic_in; wire [3:0] volume_level_raw; wire [3:0] volume_level_peak; 

    RawAudio raw_audio(.ra_clk(clk_20),.mic_in(mic_in),.new_mic_in(raw_mic_in));
    PeakVolume peakDetector(.clk(clk_20k),.mic_in(mic_in),.peak_volume(peak_mic_in));
    VolumeLevel volumeLevelRaw(.mic_in(raw_mic_in),.volume_level(volume_level_raw)); 
    VolumeLevel volumeLevelPeak(.mic_in(peak_mic_in),.volume_level(volume_level_peak));
    LED_Display_Mic led_display(.led_clk(clk_6p25M),.sw(sw),.raw_volume(volume_level_raw),.peak_volume(volume_level_peak),.led(led));
    Seven_Segment_Sound soundDisplay(.display_clk(clk_400), .update_volume_clk(clk_5),.an(an),.seg(seg),.volume_raw(volume_level_raw),.volume_peak(volume_level_peak),.sw(sw));
    always @(posedge clk_20k) begin
        oled_data <= {mic_in[11:7],6'b000000,5'b00000};
//        led <= sw ? mic_in : 12'b0;
    end
    
endmodule