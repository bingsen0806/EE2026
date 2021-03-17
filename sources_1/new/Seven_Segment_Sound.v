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
    input [3:0] volume_raw,
    input [3:0] volume_peak,
    input sw
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
    
    reg [3:0] volume_used;

    always @(posedge update_volume_clk) begin
        volume_used <= sw ? volume_raw : volume_peak;
        //Below sets the letter L, M or H
        if(volume_used > 10) begin
            segment[1] <= segment_const[12]; //set to H
        end else if (volume_used > 5) begin
            segment[1] <= segment_const[11]; //set to M
        end else begin
           segment[1] <= segment_const[10]; //set to L
        end
        //Below sets the 2-digit volume level display
        if (volume_used < 4'b1001) begin //If it's less than 9
            segment[2] <= segment_const[0];
            segment[3] <= segment_const[volume_used];
        end else begin                  //If more than or equal to 10  
            case (volume_used)
            4'b1001: begin
                segment[2] <= segment_const[0];
                segment[3] <= segment_const[9];            
            end
            4'b1010: begin 
                segment[2] <= segment_const[1];
                segment[3] <= segment_const[0]; 
                end  
            4'b1011: begin 
                segment[2] <= segment_const[1];
                segment[3] <= segment_const[1]; 
                end
            4'b1100: begin
                segment[2] <= segment_const[1];
                segment[3] <= segment_const[2];
                end 
            4'b1101: begin
                segment[2] <= segment_const[1];
                segment[3] <= segment_const[3];
                end
            4'b1110: begin
                segment[2] <= segment_const[1];
                segment[3] <= segment_const[4];
                end
            4'b1111: begin
                segment[2] <= segment_const[1];
                segment[3] <= segment_const[5];
                end
            endcase   
        end                              
    end
    
    always @(posedge display_clk) begin
        count <= count + 1;
        case (count)
        2'b00: begin
            an <= 4'b0111; 
            seg <= segment_const[13];
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
