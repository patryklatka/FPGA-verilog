`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 14:40:09
// Design Name: 
// Module Name: State_machine
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


module State_machine(
    input clk,
    input rst,
    input send, 
    input [7:0]data,
    output txd,
    output [1:0]state_test,
    output [4:0]cnt_test
    );
    
    localparam STATE0 = 2'd0;
    localparam STATE1 = 2'd1;
    localparam STATE2 = 2'd2;
    localparam STATE3 = 2'd3;
    
    reg [7:0]rememb_data = 8'b0;
    reg rememb_send = 1'd0;
    reg [4:0]cnt = 5'd0;
    reg [1:0]state = STATE0;
    reg r_y = 1'b0;

    
    always @(posedge clk)
    begin
        if(rst) state <= STATE0;
        else
        begin   
            case(state)
            STATE0:
            begin
                if(send==1'b1 & rememb_send==1'b0)
                state <= STATE1;
                rememb_data <= data;
                rememb_send <= send;
            end
            
            STATE1:
            begin
                r_y <= 1'b1;
                state <= STATE2;
            end
            
            STATE2:
            begin
                if(cnt < 5'd8)
                begin
                    r_y <= data[cnt];
                    cnt <= cnt + 1;
                end
                else
                begin
                    cnt <= 5'd0;
                    state <= STATE3;
                end
            end
            
            STATE3:
            begin
                r_y = 1'b0;
                rememb_send <= send;
                state <= STATE0;
            end
            endcase
        end
     end
     
     assign cnt_test = cnt;
     assign txd = r_y;
     assign state_test = state;
endmodule









