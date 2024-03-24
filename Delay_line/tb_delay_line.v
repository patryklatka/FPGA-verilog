`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 10:55:23
// Design Name: 
// Module Name: tb_delay_line
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


module tb_delay_line(
    );

localparam N=10;
localparam DELAY=5;

wire [N-1:0]in;
wire [N-1:0] out;
wire clk;
wire ce;

stimulate
    #(
    .N(N)
    )
    st_i    
    (
        .clk_stimulate(clk),
        .ce_stimulate(ce),
        .output_stimulate(in)
    );
delay_line
    #(
    .DELAY(DELAY),
    .N(N)
    )
    dut
    (
        .clk(clk),
        .idata(in),
        .ce(ce),
        .odata(out)
    );  
endmodule




module stimulate #(
    parameter N=1
)

(
    output clk_stimulate,
    output [N-1:0]output_stimulate,
    output ce_stimulate
);

//wire [N-1:0] chain;
reg [N-1:0] in = 0;

reg clk = 1'b0;
reg ce = 1'b1;


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
    in<=in+1;
end

assign output_stimulate = in;
assign ce_stimulate = ce;
assign clk_stimulate = clk;
endmodule