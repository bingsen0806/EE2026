`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2021 21:38:17
// Design Name: 
// Module Name: Rng_8Bit
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


module Rng_8Bit(
    input rng_clk,
    input rst,
    output reg [7:0] random_number = 8'b00000001
    );
    
    always @(posedge rng_clk, posedge rst) begin
        if (rst == 1) begin
            random_number <= 8'b00000001;
        end else begin
            random_number[0] <= random_number[1];
            random_number[1] <= random_number[2];
            random_number[3] <= random_number[4];
            random_number[4] <= random_number[5];
            random_number[5] <= random_number[6];
            random_number[6] <= random_number[7];
            random_number[7] <= random_number[6] ^ random_number[5] ^ random_number[4] ^ random_number[0];
        end
    end
endmodule
