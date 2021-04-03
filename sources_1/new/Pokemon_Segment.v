`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2021 18:16:43
// Design Name: 
// Module Name: Pokemon_Segment
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
   
module Pokemon_Segment(
    input display_clk, //400Hz
    input update_clk,  //Try 50Hz
    input [31:0] Health_Charmander,
    input [31:0] Health_Squirtle,
    output reg [3:0] an = 4'b1111,
    output reg [7:0] seg = 8'b11111_111
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

    always @(posedge update_clk) begin
        if(Health_Charmander > 99) begin
            segment[0] <= segment_const[9];
            segment[1] <= segment_const[9];
        end else begin
            segment[0] <= segment_const[Health_Charmander/10];
            segment[1] <= segment_const[Health_Charmander%10];
        end
        if(Health_Squirtle > 99) begin
            segment[2] <= segment_const[9];
            segment[3] <= segment_const[9];
        end else begin
            segment[2] <= segment_const[Health_Squirtle/10];
            segment[3] <= segment_const[Health_Squirtle%10];
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
