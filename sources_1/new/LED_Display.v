`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2021 21:12:53
// Design Name: 
// Module Name: LED_Display_Mic
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


module LED_Display_Mic(
    input led_clk,
    input [1:0] sw,
    input [3:0] raw_volume,
    input [3:0] peak_volume,
    input [3:0] freq_level,
    output reg [15:0] led = 16'b00000_00000_00000_0
    );
    
    reg [3:0] volume_used; 
    always @(posedge led_clk) begin
        volume_used <= sw[1] ? freq_level : sw[0] ? raw_volume : peak_volume;
        case (volume_used)
        4'b0000:
            led <= {{15{1'b0}},1'b1};
        4'b0001:
            led <= {{14{1'b0}},{2{1'b1}}};
        4'b0010:
                led <= {{13{1'b0}},{3{1'b1}}};
        4'b0011:
                led <= {{12{1'b0}},{4{1'b1}}};
        4'b0100:
                led <= {{11{1'b0}},{5{1'b1}}};
        4'b0101:
                led <= {{10{1'b0}},{6{1'b1}}}; 
        4'b0110:
                led <= {{9{1'b0}},{7{1'b1}}};
        4'b0111:
                led <= {{8{1'b0}},{8{1'b1}}};
        4'b1000:
                led <= {{7{1'b0}},{9{1'b1}}}; 
        4'b1001:
                led <= {{6{1'b0}},{10{1'b1}}};   
        4'b1010:
                led <= {{5{1'b0}},{11{1'b1}}};  
        4'b1011:
                led <= {{4{1'b0}},{12{1'b1}}};
        4'b1100:
                led <= {{3{1'b0}},{13{1'b1}}};  
        4'b1101:
                led <= {{2{1'b0}},{14{1'b1}}};         
        4'b1110:
                led <= {{1{1'b0}},{15{1'b1}}};     
        4'b1111:
                led <= {16{1'b1}};
        default:
                led <= {16{1'b0}};
        endcase          
    end
endmodule
