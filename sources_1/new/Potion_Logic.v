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
    output [7:0] selected,
    output [7:0] confirmed,
    output [6:0] TIMELEFT,
    input [11:0] freq,
    output reg actualWin = 0,
    output reg [6:0] broken = 7'b0000000,
    output [9:0] actual_score
    );
    parameter [24:0] TIME_LIMIT = 25'd60000;
    
    reg [24:0] time_left = TIME_LIMIT;
    integer i;  //variables used in for loop
    integer j; 
    reg break = 0; //variable used to break for loop
    reg foundNextTubePour = 0;
    reg [12:0] countInitialize = 13'd0;
    reg stillCanPour = 1;
    reg shiftTimes = 0;
    reg initialize_values = 0; //set to 1 after initializing values before generating puzzle
    reg [2:0] TubePour = 3'd0;
    reg [2:0] TubePourTemp = 3'd0;
    reg [2:0] topTube [6:0];
    reg [2:0] colours[6:0][3:0];    //colours are 1,2,3,4, and 0 means blank
    reg [6:0] countPoured = 7'd0; //will be increased when valid pour step is made
    reg [2:0] selecting = 3'd0;
    reg [2:0] confirm1 = 3'd7; reg [2:0] confirm2 = 3'd7; //8 means no bottle confirmed, otherwise this denots the bottles that are confirmed selected
    reg [2:0] num_completed = 3'd0;
    reg win = 0; reg [10:0] countWin = 11'd0;
    reg [9:0] score = 10'd0;

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
                    if (countInitialize == 4999) begin
                        countInitialize <= 0;
                        done_initialize <= 1;
                    end
                end
                
            end
        end 
        else if (state == 4'b0101) begin
            if(win==0) begin
                done_initialize <= 0;
                initialize_values <= 0; 
                //Frequency
                if (freq > 500 && freq < 600 && time_left < TIME_LIMIT/5) begin
                    for (i=0;i<7;i=i+1) begin
                        for(j=0;j<4;j=j+1) begin
                            colours[i][j] <= i;
                        end
                    end
                    win <= 1;   
                end else if (time_left < TIME_LIMIT/5 && freq > 600 && selecting < 7) begin //make the glass break
                    broken[selecting] <= 1;
                    colours[selecting][0] <= 3'd7;
                    colours[selecting][1] <= 3'd7;
                    colours[selecting][2] <= 3'd7;
                    colours[selecting][3] <= 3'd7;
                end
                
                
                
                //Reduce time if not yet win
                time_left <= time_left - 1;
                if (time_left == 1) begin
                    time_left <= TIME_LIMIT;
                    potion_ended <= 1;
                end
                //Process selected and confirmed through button pressing
                if(btnL == 1 && selecting != 0 && selecting != 4)  begin
                    selecting <= selecting - 1;
                end
                if (btnR == 1 && selecting != 3 && selecting != 7) begin
                    selecting <= selecting + 1;
                end 
                if (btnU == 1 && selecting >= 4) begin
                    selecting <= selecting - 4;
                end
                if (btnD == 1 && selecting < 4) begin
                    selecting <= selecting + 4;
                end        
                if (btnC == 1) begin
                    if(selecting == confirm1) begin
                        if (confirm1 == 3'd7) potion_ended <= 1;
                        else confirm1 <= 3'd7;            
                    //end else if (selecting != confirm2) begin //just add condition in case, by right confirm2 is always 3'd7
                    end else if (confirm1 != 3'd7) begin //already have another bottle confirm selected  
                        
                            //code for pouring from confirm1 into confirm2
                            //repeat 4 times, cannot use for loop because will have synthesis error unles use case statement, which is longer
                            if((colours[confirm1][topTube[confirm1]-1] == colours[selecting][topTube[selecting]-1] || topTube[selecting] == 0) && topTube[selecting] < 4 && topTube[confirm1] > 0) begin
                                colours[selecting][topTube[selecting]] = colours[confirm1][topTube[confirm1]-1];
                                colours[confirm1][topTube[confirm1]-1] = 3'b000;
                                topTube[confirm1] = topTube[confirm1] - 1;
                                topTube[selecting] = topTube[selecting] + 1;
                            end
                            if((colours[confirm1][topTube[confirm1]-1] == colours[selecting][topTube[selecting]-1] || topTube[selecting] == 0) && topTube[selecting] < 4 && topTube[confirm1] > 0) begin
                                colours[selecting][topTube[selecting]] = colours[confirm1][topTube[confirm1]-1];
                                colours[confirm1][topTube[confirm1]-1] = 3'b000;
                                topTube[confirm1] = topTube[confirm1] - 1;
                                topTube[selecting] = topTube[selecting] + 1;
                            end
                            if((colours[confirm1][topTube[confirm1]-1] == colours[selecting][topTube[selecting]-1] || topTube[selecting] == 0) && topTube[selecting] < 4 && topTube[confirm1] > 0) begin
                                colours[selecting][topTube[selecting]] = colours[confirm1][topTube[confirm1]-1];
                                colours[confirm1][topTube[confirm1]-1] = 3'b000;
                                topTube[confirm1] = topTube[confirm1] - 1;
                                topTube[selecting] = topTube[selecting] + 1;
                            end
                            if((colours[confirm1][topTube[confirm1]-1] == colours[selecting][topTube[selecting]-1] || topTube[selecting] == 0) && topTube[selecting] < 4 && topTube[confirm1] > 0) begin
                                colours[selecting][topTube[selecting]] = colours[confirm1][topTube[confirm1]-1];
                                colours[confirm1][topTube[confirm1]-1] = 3'b000;
                                topTube[confirm1] = topTube[confirm1] - 1;
                                topTube[selecting] = topTube[selecting] + 1;
                            end    
                            
                            //code winning condition
                            //If want to add animation, rmb that colours may not reflect true colour during animation
   
                            confirm1 <= 3'd7; //after pouring, all bottles are not confirmed selected anymore
                                              // if invalid selection is made, all bottles are not confirmed selected also                   
                    end else begin      //no bottle confirm selected yet, so confirm select this one
                        confirm1 <= selecting;
                    end 
                    //end
                end
                
                //CHANGEDDDD MOVED WINNING CONDITION OUTSIDE
                num_completed = 0;
                for(i = 0; i < 7; i = i + 1) begin
                    if(colours[i][0]==colours[i][1] && colours[i][2]==colours[i][3] && colours[i][1]==colours[i][2]) begin
                        num_completed = num_completed + 1;
                    end
                end 
                if (num_completed == 7) begin
                    win <= 1;
                end 
                score <= num_completed * 100;
            end else if (win == 1) begin
                countWin <= countWin + 1;
                if (countWin == 1999) begin
                    actualWin <= 1; countWin <= 0;
                end
            
            end
        end else if (state == 4'b0000) begin //back to menu alrdy
            potion_ended <= 0;
            time_left = TIME_LIMIT;
            selecting = 3'd0;
            confirm1 = 3'd7; confirm2 = 3'd7;
            win <= 0;
            actualWin <= 0;
            broken <= 7'b0000000;
            score <= 10'd0;
        end
    end
    
    
    assign TIMELEFT = time_left * 100 /TIME_LIMIT;
    assign actual_score = ((100 - TIMELEFT) * 5  < score) ? score - (100-TIMELEFT)*5 :  10'd0;
    assign confirmed = (confirm1 == 3'd7) ? 8'd0:
                       (8'b00000_001 << confirm1);
    assign selected = (8'b00000_001 << selecting);
    assign colour1_1 = colours[0][0]; assign colour2_1 = colours[0][1]; assign colour3_1 = colours[0][2]; assign colour4_1 = colours[0][3];
    assign colour1_2 = colours[1][0]; assign colour2_2 = colours[1][1]; assign colour3_2 = colours[1][2]; assign colour4_2 = colours[1][3];
    assign colour1_3 = colours[2][0]; assign colour2_3 = colours[2][1]; assign colour3_3 = colours[2][2]; assign colour4_3 = colours[2][3];
    assign colour1_4 = colours[3][0]; assign colour2_4 = colours[3][1]; assign colour3_4 = colours[3][2]; assign colour4_4 = colours[3][3];
    assign colour1_5 = colours[4][0]; assign colour2_5 = colours[4][1]; assign colour3_5 = colours[4][2]; assign colour4_5 = colours[4][3];
    assign colour1_6 = colours[5][0]; assign colour2_6 = colours[5][1]; assign colour3_6 = colours[5][2]; assign colour4_6 = colours[5][3];
    assign colour1_7 = colours[6][0]; assign colour2_7 = colours[6][1]; assign colour3_7 = colours[6][2]; assign colour4_7 = colours[6][3];
    
    




endmodule
