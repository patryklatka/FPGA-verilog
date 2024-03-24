`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 19:36:36
// Design Name: 
// Module Name: tb_Cascade_AND
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


module tb_Cascade_AND
    (
    );
     wire output_cascade;
     wire [7:0] input_cascade;
     
stimulate st_i(
    .output_stimulate(input_cascade)
);

Kaskada_AND kaskada
    (
        .x(input_cascade),
        .y(output_cascade)
    );
endmodule



module stimulate(
    output [7:0]output_stimulate
);

reg clk=1'b0;
reg [7:0]cnt=8'b0;

initial
begin
    while(1)
    begin
        #1; clk=1'b0;
        #1; clk=1'b1;
    end
end 

always @(posedge clk)
begin
    cnt<=cnt+1;
end

assign output_stimulate = cnt;
endmodule