`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2021 15:00:05
// Design Name: 
// Module Name: volume_bar
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


module volume_bar(input [3:0]sw, input [3:0] mic_data, input [6:0] X, input [5:0] Y, output reg [15:0]colour = 16'd0);
    
    parameter[15:0] BLACK  = 16'b0;
    parameter[15:0] WHITE = 16'b11111_111111_11111;
    parameter[15:0] MAGENTA = 16'b11111_000000_11111;
    parameter[15:0] CYAN = 16'b00000_111111_11111;
    parameter[15:0] YELLOW = 16'b11111_111111_00000;
    parameter[15:0] GREEN = 16'b00000_111111_00000;
    parameter[15:0] RED = 16'b11111_000000_00000;
    parameter[15:0] BLUE = 16'b00000_000000_11111;
    parameter[15:0] ORANGE = 16'b11111_100110_00000;
    parameter[15:0] GREY = 16'b01100_011000_01100;
    
    //white border
    always @ (X or Y) begin
        //PIXEL BORDER
        if (sw[1] == 1) begin //sw[1] is to turn on or off the border
            //sw[0] controls 1 pixel or 3 pixel border
            if (sw[0] == 0) begin //1 pixel border
                if (Y == 0 || Y == 63 || X == 0 || X == 95)
                    colour = WHITE;
                else 
                    colour = BLACK;
            end else begin //3 pixel border
                if (Y == 0 || Y == 1 || Y == 2 || Y == 61 || Y == 62 || Y == 63 || X == 0 || X == 1 || X == 2 || X == 93 || X == 94 || X == 95)
                    colour = WHITE;
                else 
                    colour = BLACK;
            end
         end

         //VOLUME BAR
         case (mic_data)
         4'd1:
            begin
            if (X >= 43 && X <= 53)
                begin
                if (Y >= 58 && Y <= 60)
                    colour <= GREEN;
                end
            end
        
          4'd2:
            begin
            if (X >= 43 && X <= 53)
                begin
                if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56))
                    colour <= GREEN;
                end
            end
        
          4'd3:
            begin
            if (X >= 43 && X <= 53)
                begin
                if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52))
                    colour <= GREEN;
                end
            end
            
          4'd4:
            begin
            if (X >= 43 && X <= 53)
                begin
                if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52) || (Y >= 46 && Y <= 48))
                    colour <= GREEN;
                end
           end
           
          4'd5:
               begin
               if (X >= 43 && X <= 53)
                   begin
                   if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52) || (Y >= 46 && Y <= 48) || (Y >= 42 && Y <= 44))
                       colour <= GREEN;
                   end
               end

          4'd6:
               begin
               if (X >= 43 && X <= 53)
                   begin
                   if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52) || (Y >= 46 && Y <= 48) || (Y >= 42 && Y <= 44))
                       colour <= GREEN;
                   else if (Y >= 38 && Y <= 40)
                       colour <= YELLOW;
                   end
              end
              
          4'd7:
              begin
              if (X >= 43 && X <= 53)
                   begin
                   if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52) || (Y >= 46 && Y <= 48) || (Y >= 42 && Y <= 44))
                       colour <= GREEN;
                   else if ((Y >= 38 && Y <= 40) || (Y >= 34 && Y <= 36))
                       colour <= YELLOW;
                   end
              end

          4'd8:
              begin
              if (X >= 43 && X <= 53)
                   begin
                   if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52) || (Y >= 46 && Y <= 48) || (Y >= 42 && Y <= 44))
                       colour <= GREEN;
                   else if ((Y >= 38 && Y <= 40) || (Y >= 34 && Y <= 36) || (Y >= 30 && Y <= 32))
                       colour <= YELLOW;
                   end
              end

          4'd9:
              begin
              if (X >= 43 && X <= 53)
                   begin
                   if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52) || (Y >= 46 && Y <= 48) || (Y >= 42 && Y <= 44))
                       colour <= GREEN;
                   else if ((Y >= 38 && Y <= 40) || (Y >= 34 && Y <= 36) || (Y >= 30 && Y <= 32) || (Y >= 26 && Y <= 28))
                       colour <= YELLOW;
                   end
              end

          4'd10:
              begin
              if (X >= 43 && X <= 53)
                   begin
                   if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52) || (Y >= 46 && Y <= 48) || (Y >= 42 && Y <= 44))
                       colour <= GREEN;
                   else if ((Y >= 38 && Y <= 40) || (Y >= 34 && Y <= 36) || (Y >= 30 && Y <= 32) || (Y >= 26 && Y <= 28) || (Y >= 22 && Y <= 24))
                       colour <= YELLOW;
                   end
              end

          4'd11:
              begin
              if (X >= 43 && X <= 53)
                   begin
                   if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52) || (Y >= 46 && Y <= 48) || (Y >= 42 && Y <= 44))
                       colour <= GREEN;
                   else if ((Y >= 38 && Y <= 40) || (Y >= 34 && Y <= 36) || (Y >= 30 && Y <= 32) || (Y >= 26 && Y <= 28) || (Y >= 22 && Y <= 24))
                       colour <= YELLOW;
                   else if (Y >= 18 && Y <= 20)
                       colour <= RED;
                   end
              end

          4'd12:
              begin
              if (X >= 43 && X <= 53)
                   begin
                   if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52) || (Y >= 46 && Y <= 48) || (Y >= 42 && Y <= 44))
                       colour <= GREEN;
                   else if ((Y >= 38 && Y <= 40) || (Y >= 34 && Y <= 36) || (Y >= 30 && Y <= 32) || (Y >= 26 && Y <= 28) || (Y >= 22 && Y <= 24))
                       colour <= YELLOW;
                   else if ((Y >= 18 && Y <= 20) || (Y >= 14 && Y <= 16))
                       colour <= RED;
                   end
              end

          4'd13:
              begin
              if (X >= 43 && X <= 53)
                   begin
                   if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52) || (Y >= 46 && Y <= 48) || (Y >= 42 && Y <= 44))
                       colour <= GREEN;
                   else if ((Y >= 38 && Y <= 40) || (Y >= 34 && Y <= 36) || (Y >= 30 && Y <= 32) || (Y >= 26 && Y <= 28) || (Y >= 22 && Y <= 24))
                       colour <= YELLOW;
                   else if ((Y >= 18 && Y <= 20) || (Y >= 14 && Y <= 16) || (Y >= 10 && Y <= 12))
                       colour <= RED;
                   end
              end

          4'd14:
              begin
              if (X >= 43 && X <= 53)
                   begin
                   if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52) || (Y >= 46 && Y <= 48) || (Y >= 42 && Y <= 44))
                       colour <= GREEN;
                   else if ((Y >= 38 && Y <= 40) || (Y >= 34 && Y <= 36) || (Y >= 30 && Y <= 32) || (Y >= 26 && Y <= 28) || (Y >= 22 && Y <= 24))
                       colour <= YELLOW;
                   else if ((Y >= 18 && Y <= 20) || (Y >= 14 && Y <= 16) || (Y >= 10 && Y <= 12) || (Y >= 6 && Y <= 8))
                       colour <= RED;
                   end
              end

          4'd15:
              begin
              if (X >= 43 && X <= 53)
                   begin
                   if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52) || (Y >= 46 && Y <= 48) || (Y >= 42 && Y <= 44))
                       colour <= GREEN;
                   else if ((Y >= 38 && Y <= 40) || (Y >= 34 && Y <= 36) || (Y >= 30 && Y <= 32) || (Y >= 26 && Y <= 28) || (Y >= 22 && Y <= 24))
                       colour <= YELLOW;
                   else if ((Y >= 18 && Y <= 20) || (Y >= 14 && Y <= 16) || (Y >= 10 && Y <= 12) || (Y >= 6 && Y <= 8) || (Y >= 2 && Y <= 4))
                       colour <= RED;
                   end
              end
              
        endcase
         
         
         /*
         if (X >= 43 && X <= 53)
            begin
            if ((Y >= 58 && Y <= 60) || (Y >=54 && Y <= 56) || (Y >= 50 && Y <= 52) || (Y >= 46 && Y <= 48) || (Y >= 42 && Y <= 44))
                colour <= GREEN;
                
            else if ((Y >= 38 && Y <= 40) || (Y >= 34 && Y <= 36) || (Y >= 30 && Y <= 32) || (Y >= 26 && Y <= 28) || (Y >= 22 && Y <= 24))
                colour <= YELLOW;
                
            else if ((Y >= 18 && Y <= 20) || (Y >= 14 && Y <= 16) || (Y >= 10 && Y <= 12) || (Y >= 6 && Y <= 8) || (Y >= 2 && Y <= 4))
                colour <= RED;
            end  
            */  
    end
endmodule

