`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2021 23:59:48
// Design Name: 
// Module Name: test
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


module test(
    input basys_clk,
    input btnC,
    output reg [15:0] led = 16'b0
    );
    wire clk_16p67M; wire centreButton; wire clk_1k; wire clk_20;
    
    clk16p67MHz clk_16p67Mhz(basys_clk,clk_16p67M);
    clk1k clk1kHz(basys_clk,clk_1k);
    clk20Hz clk_20Hz(basys_clk,clk_20);
    
    wire [7:0] random_number;
    single_pulse btn_C(btnC, clk_1k, centreButton);
    Rng_8Bit rng1(.rng_clk(clk_16p67M),.rst(1'b0),.random_number(random_number));
    
    always @(posedge clk_20) begin
        led <= random_number;
    end
endmodule
