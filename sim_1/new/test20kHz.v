`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2021 14:52:16
// Design Name: 
// Module Name: test20kHz
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


module test20kHz(

    );
    reg sim_clk;
    wire wire_out;
    
    clk20kHz testClk(sim_clk,wire_out);
    
    initial begin
        sim_clk = 0;
    
    end
    
    always begin
        #5 sim_clk = ~sim_clk;
    
    end
endmodule
