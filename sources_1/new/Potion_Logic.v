`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2021 23:14:09
// Design Name: 
// Module Name: Potion_Logic
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


module Potion_Logic(
    input single_pulse_clk,
    input btnL, btnR, btnU, btnD, btnC,
    input [3:0] state,
    input [11:0] raw_mic_data,
    output reg done_initialize = 0,
    output reg potion_ended = 0,
    output [2:0] colour1_1, colour2_1, colour3_1, colour4_1,
    output [2:0] colour1_2, colour2_2, colour3_2, colour4_2,
    output [2:0] colour1_3, colour2_3, colour3_3, colour4_3,
    output [2:0] colour1_4, colour2_4, colour3_4, colour4_4,
    output [2:0] colour1_5, colour2_5, colour3_5, colour4_5,
    output [2:0] colour1_6, colour2_6, colour3_6, colour4_6,
    output [2:0] colour1_7, colour2_7, colour3_7, colour4_7,
    output reg [7:0] selected = 8'b00000001
    );
    
    integer i;  //variables used in for loop
    integer j; 
    reg break = 0; //variable used to break for loop
    reg foundNextTubePour = 0;
    reg [9:0] countInitialize = 10'd0;
    reg stillCanPour = 1;
    reg shiftTimes = 0;
    reg initialize_values = 0; //set to 1 after initializing values before generating puzzle
    reg [2:0] TubePour = 3'd0;
    reg [2:0] TubePourTemp = 3'd0;
    reg [2:0] topTube [6:0];
    reg [2:0] colours[6:0][3:0];    //colours are 1,2,3,4, and 0 means blank
    reg [6:0] countPoured = 7'd0; //will be increased when valid pour step is made
    always @(posedge single_pulse_clk) begin
        if (state == 4'b0110 && done_initialize == 0) begin
            if (initialize_values == 0) begin
                TubePour <= 0;
                countPoured <= 0; 
                //Initialize topTube and colours
                for (i = 0; i < 7; i = i + 1)begin
                    if(i==0) begin
                        for (j = 0; j <4; j = j + 1)begin
                            colours[i][j] <= 3'd1;
                            topTube[i] <= 3'd4;
                        end
                    end
                    else if(i==1) begin
                        for (j = 0; j <4; j = j+1)begin
                            colours[i][j] <= 3'd2;
                            topTube[i] <= 3'd4;
                        end
                    end
                    else if(i==2) begin
                        for (j = 0; j <4; j = j + 1)begin
                            colours[i][j] <= 3'd3;
                            topTube[i] <= 3'd4;
                        end
                    end
                    else if(i==3) begin
                        for (j = 0; j <4; j = j + 1)begin
                            colours[i][j] <= 3'd4;
                            topTube[i] <= 3'd4;
                        end
                    end
                    else if (i==4)begin
                        for (j = 0; j <4; j = j + 1)begin
                            colours[i][j] <= 3'd5;
                            topTube[i] <= 3'd4;
                        end
                    end
                    else if (i==5)begin
                        for (j = 0; j <4; j = j + 1)begin
                            colours[i][j] <= 3'd6;
                            topTube[i] <= 3'd4;
                        end
                    end
                    else begin
                        for (j = 0; j <4; j = j + 1)begin
                            colours[i][j] <= 3'd0;
                            topTube[i] <= 3'd0;
                        end
                    end
                end
                stillCanPour <= 1;
                initialize_values <= 1;
            end
            else if (initialize_values == 1) begin //Process        
                if (countPoured < 7'd70 && stillCanPour==1) begin
                    //find first non-full tube that is not tubePour and pour into it
                    for (i = 0; (i < 3'd7 && break == 0); i = i + 1)begin
                        if(topTube[i] < 4 && i != TubePour) begin
                            colours[i][topTube[i]] = colours[TubePour][topTube[TubePour]-1];
                            colours[TubePour][topTube[TubePour]-1] = 0;
                            topTube[TubePour] = topTube[TubePour] - 1;
                            topTube[i] = topTube[i] + 1;
                            countPoured = countPoured + 1;
                            break = 1;
                        end
                    end
                    
                    break = 0;
    
                    //Change tubePour if the top and 2nd top are diff colours after pouring (cannot be used anyways)
                    //or if tubePour is now empty
    
                    if(topTube[TubePour] != 3'd1 && (topTube[TubePour]== 3'd0 || colours[TubePour][topTube[TubePour]-1] != colours[TubePour][topTube[TubePour]-2])) begin
                        foundNextTubePour = 0;
                        TubePourTemp = TubePour;
                        case(TubePour)
                        3'b000: begin
                        for (i = 1; (i < 7 && break == 0);i = i + 1)begin
                            if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                TubePourTemp = i; foundNextTubePour = 1; break = 1;
                            end
                        end
                        break = 0;                       
                        end
                        3'b001: begin
                        for (i = 2; (i < 7 && break == 0);i = i + 1)begin
                            if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                TubePourTemp = i; foundNextTubePour = 1; break = 1;
                            end
                        end
                        break = 0;
                        if(foundNextTubePour == 0 && TubePour > 0) begin // If TubePour is 0 the previous for loop shld have covered all possible tubes
                            for (i = 0; (i < 1 && break == 0);i=i+1)begin
                                if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                    TubePourTemp = i; foundNextTubePour = 1; break = 1;
                                end
                            end
                            break = 0;                       
                        end
                        end
                        3'b010: begin
                        for (i = 3; (i < 7 && break == 0);i = i + 1)begin
                            if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                TubePourTemp = i; foundNextTubePour = 1; break = 1;
                            end
                        end
                        break = 0;
                        if(foundNextTubePour == 0 && TubePour > 0) begin // If TubePour is 0 the previous for loop shld have covered all possible tubes
                            for (i = 0; (i < 2 && break == 0);i=i+1)begin
                                if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                    TubePourTemp = i; foundNextTubePour = 1; break = 1;
                                end
                            end
                            break = 0;                       
                        end                  
                        end
                        3'b011: begin
                        for (i = 4; (i < 7 && break == 0);i = i + 1)begin
                            if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                TubePourTemp = i; foundNextTubePour = 1; break = 1;
                            end
                        end
                        break = 0;
                        if(foundNextTubePour == 0 && TubePour > 0) begin // If TubePour is 0 the previous for loop shld have covered all possible tubes
                            for (i = 0; (i < 3 && break == 0);i=i+1)begin
                                if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                    TubePourTemp = i; foundNextTubePour = 1; break = 1;
                                end
                            end
                            break = 0;                       
                        end                      
                        end
                        3'b100: begin
                        for (i = 5; (i < 7 && break == 0);i = i + 1)begin
                            if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                TubePourTemp = i; foundNextTubePour = 1; break = 1;
                            end
                        end
                        break = 0;
                        if(foundNextTubePour == 0 && TubePour > 0) begin // If TubePour is 0 the previous for loop shld have covered all possible tubes
                            for (i = 0; (i < 4 && break == 0);i=i+1)begin
                                if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                    TubePourTemp = i; foundNextTubePour = 1; break = 1;
                                end
                            end
                            break = 0;                       
                        end                    
                        
                        end
                        3'b101: begin
                        for (i = 6; (i < 7 && break == 0);i = i + 1)begin
                            if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                TubePourTemp = i; foundNextTubePour = 1; break = 1;
                            end
                        end
                        break = 0;
                        if(foundNextTubePour == 0 && TubePour > 0) begin // If TubePour is 0 the previous for loop shld have covered all possible tubes
                            for (i = 0; (i < 5 && break == 0);i=i+1)begin
                                if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                    TubePourTemp = i; foundNextTubePour = 1; break = 1;
                                end
                            end
                            break = 0;                       
                        end                     
                        
                        end
                        3'b110: begin
                        if(foundNextTubePour == 0 && TubePour > 0) begin // If TubePour is 0 the previous for loop shld have covered all possible tubes
                            for (i = 0; (i < 1 && break == 0);i=i+1)begin
                                if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                    TubePourTemp = i; foundNextTubePour = 1; break = 1;
                                end
                            end
                            break = 0;                       
                        end                   
                        
                        end
                        endcase
                        TubePour = TubePourTemp;
                        if (foundNextTubePour == 0) stillCanPour = 0;
                    end
    
    
                    //find the next tubePour if stillCanPour, no point otherwise
                    if (stillCanPour == 1) begin
                        shiftTimes = (raw_mic_data % 2); //0 means dont shift
                        if (shiftTimes == 1)begin //One loop will find the nextTube Pour
                            foundNextTubePour = 0;
                            case(TubePour)
                            3'b000: begin
                            for (i = 1; (i < 7 && break == 0);i = i + 1)begin
                                if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                    TubePour = i; foundNextTubePour = 1; break = 1;
                                end
                            end
                            break = 0;                       
                            end
                            3'b001: begin
                            for (i = 2; (i < 7 && break == 0);i = i + 1)begin
                                if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                    TubePour = i; foundNextTubePour = 1; break = 1;
                                end
                            end
                            break = 0;
                            if(foundNextTubePour == 0 && TubePour > 0) begin // If TubePour is 0 the previous for loop shld have covered all possible tubes
                                for (i = 0; (i < 1 && break == 0);i=i+1)begin
                                    if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                        TubePour = i; foundNextTubePour = 1; break = 1;
                                    end
                                end
                                break = 0;                       
                            end
                            end
                            3'b010: begin
                            for (i = 3; (i < 7 && break == 0);i = i + 1)begin
                                if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                    TubePour = i; foundNextTubePour = 1; break = 1;
                                end
                            end
                            break = 0;
                            if(foundNextTubePour == 0 && TubePour > 0) begin // If TubePour is 0 the previous for loop shld have covered all possible tubes
                                for (i = 0; (i < 2 && break == 0);i=i+1)begin
                                    if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                        TubePour = i; foundNextTubePour = 1; break = 1;
                                    end
                                end
                                break = 0;                       
                            end                  
                            end
                            3'b011: begin
                            for (i = 4; (i < 7 && break == 0);i = i + 1)begin
                                if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                    TubePour = i; foundNextTubePour = 1; break = 1;
                                end
                            end
                            break = 0;
                            if(foundNextTubePour == 0 && TubePour > 0) begin // If TubePour is 0 the previous for loop shld have covered all possible tubes
                                for (i = 0; (i < 3 && break == 0);i=i+1)begin
                                    if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                        TubePour = i; foundNextTubePour = 1; break = 1;
                                    end
                                end
                                break = 0;                       
                            end                      
                            end
                            3'b100: begin
                            for (i = 5; (i < 7 && break == 0);i = i + 1)begin
                                if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                    TubePour = i; foundNextTubePour = 1; break = 1;
                                end
                            end
                            break = 0;
                            if(foundNextTubePour == 0 && TubePour > 0) begin // If TubePour is 0 the previous for loop shld have covered all possible tubes
                                for (i = 0; (i < 4 && break == 0);i=i+1)begin
                                    if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                        TubePour = i; foundNextTubePour = 1; break = 1;
                                    end
                                end
                                break = 0;                       
                            end                    
                            
                            end
                            3'b101: begin
                            for (i = 6; (i < 7 && break == 0);i = i + 1)begin
                                if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                    TubePour = i; foundNextTubePour = 1; break = 1;
                                end
                            end
                            break = 0;
                            if(foundNextTubePour == 0 && TubePour > 0) begin // If TubePour is 0 the previous for loop shld have covered all possible tubes
                                for (i = 0; (i < 5 && break == 0);i=i+1)begin
                                    if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                        TubePour = i; foundNextTubePour = 1; break = 1;
                                    end
                                end
                                break = 0;                       
                            end                     
                            
                            end
                            3'b110: begin
                            if(foundNextTubePour == 0 && TubePour > 0) begin // If TubePour is 0 the previous for loop shld have covered all possible tubes
                                for (i = 0; (i < 1 && break == 0);i=i+1)begin
                                    if(topTube[i] == 1 || (topTube[i]!=0 && colours[i][topTube[i]-1] == colours[i][topTube[i]-2]))begin
                                        TubePour = i; foundNextTubePour = 1; break = 1;
                                    end
                                end
                                break = 0;                       
                            end                   
                            
                            end
                            endcase
                            //OK to not set stillCanPour to 0. If foundNextTubePour is 0 TubePour will be the same TubePour
                            //Then when TubePour can no longer pour, the previous check will make stillCanPour 0.
                        end
                    end
//                    countInitialize <= countInitialize + 1;
//                    if (countInitialize == 999) begin
//                        countInitialize <= 0;
//                        done_initialize <= 1;
//                    end
    
                end else begin
                   // mix back everything into the first 4 tubes
                    countInitialize <= countInitialize + 1;
                    if (countInitialize == 999) begin
                        countInitialize <= 0;
                        done_initialize <= 1;
                    end
                end
                
            end
        end else if (state == 4'b0101) begin
                done_initialize <= 0;            
        end
    end
    
    assign colour1_1 = colours[0][0]; assign colour2_1 = colours[0][1]; assign colour3_1 = colours[0][2]; assign colour4_1 = colours[0][3];
    assign colour1_2 = colours[1][0]; assign colour2_2 = colours[1][1]; assign colour3_2 = colours[1][2]; assign colour4_2 = colours[1][3];
    assign colour1_3 = colours[2][0]; assign colour2_3 = colours[2][1]; assign colour3_3 = colours[2][2]; assign colour4_3 = colours[2][3];
    assign colour1_4 = colours[3][0]; assign colour2_4 = colours[3][1]; assign colour3_4 = colours[3][2]; assign colour4_4 = colours[3][3];
    assign colour1_5 = colours[4][0]; assign colour2_5 = colours[4][1]; assign colour3_5 = colours[4][2]; assign colour4_5 = colours[4][3];
    assign colour1_6 = colours[5][0]; assign colour2_6 = colours[5][1]; assign colour3_6 = colours[5][2]; assign colour4_6 = colours[5][3];
    assign colour1_7 = colours[6][0]; assign colour2_7 = colours[6][1]; assign colour3_7 = colours[6][2]; assign colour4_7 = colours[6][3];
endmodule
