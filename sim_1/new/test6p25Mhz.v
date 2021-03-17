`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2021 15:02:01
// Design Name: 
// Module Name: test6p25Mhz
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


module test6p25Mhz(

    );
    reg sim_clk;
    wire wire_out;
    
    clk6p25Mhz testClk(sim_clk,wire_out);
    
    initial begin
        sim_clk = 0;
    
    end
    
    always begin
        #5 sim_clk = ~sim_clk;
    
    end
endmodule
