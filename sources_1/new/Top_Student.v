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
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    output [7:0] JC,
    input [15:0] sw,
    output [15:0] led, //remember change constraint
    output [3:0] an,
    output [7:0] seg
    );
    
    //Wires for Oled_Display and Audio_Capture
    wire frame_begin; wire sending_pixels; wire sample_pixel;
    wire [12:0] pixel_index; wire teststate;
    wire [15:0] oled_data;

    wire [11:0] mic_in;
    
    //Clocks
    wire clk_6p25M; wire clk_1k; wire clk_20k; wire clk_20; wire clk_400; wire clk_5;
    wire clk_10; wire clk_16p67M;
    clk1k clk1kHz(basys_clk,clk_1k);
    clk5Hz clk_5Hz(basys_clk,clk_5);
    clk10Hz clk_10Hz(basys_clk,clk_10);
    clk20kHz clk_20kHz(basys_clk,clk_20k);
    clk20Hz clk_20Hz(basys_clk,clk_20);
    clk400Hz clk_400Hz(basys_clk,clk_400);
    clk6p25Mhz clk6p25Mhz(basys_clk,clk_6p25M);
    clk16p67MHz clk_16p67Mhz(basys_clk,clk_16p67M);
    //Buttons
    wire centreButton; wire upButton; wire downButton; wire leftButton; wire rightButton;
    single_pulse btn_C(btnC, clk_1k, centreButton);
    single_pulse btn_U(btnU, clk_1k, upButton);
    single_pulse btn_D(btnD, clk_1k, downButton);
    single_pulse btn_L(btnL, clk_1k, leftButton);
    single_pulse btn_R(btnR, clk_1k, rightButton);
    
    //Initialize Oled
    Oled_Display oled(
        .clk(clk_6p25M), 
        .reset(centreButton),
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
    
    //Initialize Audio Capture
    Audio_Capture audio(
        .CLK(basys_clk),
        .cs(clk_20k),
        .MISO(J_MIC3_Pin3),
        .clk_samp(J_MIC3_Pin1),
        .sclk(J_MIC3_Pin4),
        .sample(mic_in)
    );
    
    wire[11:0] raw_mic_in; wire [3:0] volume_level_raw; wire [3:0] volume_level_peak; 
    wire [3:0] freq_level; wire [11:0] freq;
    
    Sound micData(.clk_20(clk_20),.clk_20k(clk_20k),.mic_in(mic_in),.volume_level_raw(volume_level_raw),.raw_mic_in(raw_mic_in),.volume_level_peak(volume_level_peak));
    LED_Display_Mic led_display(.led_clk(clk_6p25M),.sw(sw),.raw_volume(volume_level_raw),.peak_volume(volume_level_peak),.led(led),.freq_level(freq_level));
    Seven_Segment_Sound soundDisplay(.display_clk(clk_400), .update_volume_clk(clk_10),.an(an),.seg(seg),.volume_raw(raw_mic_in),.volume_level_peak(volume_level_peak),.sw(sw),.volume_level_raw(volume_level_raw),.freq(freq));
    Frequency frequency(.clk_20kHz(clk_20k), .mic_in(mic_in), .freq_level(freq_level), .freq(freq));
    
    //Random Number Generator
    wire [7:0] random_number;
    Rng_8Bit rng1(.rng_clk(clk_16p67M),.rst(1'b0),.random_number(random_number));
    //Pixel
    wire [6:0] X; wire [5:0] Y;
    Pixel_Coordinate pixel(.pixel_index(pixel_index),.X(X),.Y(Y));
    Pokemon pokemon(
        .X (X),
        .Y (Y),
        .single_pulse_clk (clk_1k),
        .player1_up (upButton),
        .player1_down (leftButton),
        .player2_up (rightButton),
        .player2_down (downButton),
        .oled_data (oled_data),
        .clk_20Hz(clk_20),
        .player1_shoot(sw[15]),
        .player2_shoot(sw[14]),
        .random_number(random_number)
        );   
endmodule