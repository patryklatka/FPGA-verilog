`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 18:18:10
// Design Name: 
// Module Name: Cascade_AND
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


module Cascade_AND
#
(
    parameter LENGTH=8 )
    (
    input [LENGTH-1:0]x,
    output y );
    
    wire [LENGTH:0]chain;
    assign chain[0]=1'b1;
    
    genvar i;
    generate
        for(i=0;i<LENGTH;i=i+1)
        begin
            assign chain[i+1] = chain[i] & x[i];     
        end
    endgenerate
    
    assign y=chain[LENGTH];
    
endmodule
