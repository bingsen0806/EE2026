`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2021 23:08:36
// Design Name: 
// Module Name: Seven_Segment_Sound
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


module Seven_Segment_Sound(
    input display_clk, //refresh rate of 380Hz
    input update_volume_clk,
    output reg [3:0] an = 4'b0000,
    output reg [7:0] seg = 8'b00000_000,
    input [11:0] volume_raw,
    input [3:0] volume_level_peak,
    input [3:0] volume_level_raw,
    input sw00, sw11,
    input [11:0] freq
    );
    reg [1:0] count = 2'b00;
    reg [7:0] segment [3:0]; //this variable array will be changed according to volume level
    reg [7:0] segment_const [13:0]; //this is a constant array (e.g. segment_const[4] is the 8-bit value that shows "4" on the display)
    initial begin //just to initialize segment_const
        segment_const[0] = 8'b11000000; // Number 0
        segment_const[1] = 8'b11111001;
        segment_const[2] = 8'b10100100;
        segment_const[3] = 8'b10110000;
        segment_const[4] = 8'b10011001;
        segment_const[5] = 8'b10010010;
        segment_const[6] = 8'b10000010;
        segment_const[7] = 8'b11111000;
        segment_const[8] = 8'b10000000;
        segment_const[9] = 8'b10010000;
        segment_const[10] = 8'b11000111; //Letter L
        segment_const[11] = 8'b11101010; //Letter M
        segment_const[12] = 8'b10001001; //Letter H
        segment_const[13] = 8'b10110110; //Just 3 horizontal lines
    end

    always @(posedge update_volume_clk) begin
        if (sw11 == 1) begin
            segment[0] <= segment_const[freq/1000];
            segment[1] <= segment_const[(freq%1000)/100];
            segment[2] <= segment_const[(freq%100)/10];
            segment[3] <= segment_const[freq%10];           
        end else if (sw00 == 0) begin
            segment[0] <= segment_const[13];
            //Below sets the letter L, M or H
            if(volume_level_peak > 10) begin
                segment[1] <= segment_const[12]; //set to H
            end else if (volume_level_peak > 5) begin
                segment[1] <= segment_const[11]; //set to M
            end else begin
                segment[1] <= segment_const[10]; //set to L
            end
            //Below sets the 2-digit volume level display
            segment[2] <= segment_const[volume_level_peak/10];
            segment[3] <= segment_const[volume_level_peak%10];
        end else begin 
            segment[0] <= segment_const[volume_raw/1000];
            segment[1] <= segment_const[(volume_raw%1000)/100];
            segment[2] <= segment_const[(volume_raw%100)/10];
            segment[3] <= segment_const[volume_raw%10];
        end 

    end
    
    always @(posedge display_clk) begin
        count <= count + 1;
        case (count)
        2'b00: begin
            an <= 4'b0111; 
            seg <= segment[0];
            end
        2'b01: begin
            an <= 4'b1011; 
            seg <= segment[1];
            end
        2'b10: begin
            an <= 4'b1101;
            seg <= segment[2];
            end
        2'b11: begin
            an <= 4'b1110;
            seg <= segment[3];
            end
        endcase
    end
endmodule
