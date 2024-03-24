`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 07:59:48
// Design Name: 
// Module Name: delay_line
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


module register#(
parameter N = 1)
(
    input clk,
    input ce,
    input [N-1:0]idata,
    output [N-1:0]odata
    );
    
    reg [N-1:0]val=1'b0;
    
    always @(posedge clk)
    begin
        if(ce) val <= idata;
        else val <= val;
    end
    
    assign odata=val;
    
endmodule



module delay_line#(
    parameter N=3,
    parameter DELAY=5
)
(
    input clk,
    input ce,
    input [N-1:0] idata,
    output [N-1:0] odata
);

wire [N-1:0] tdata [DELAY:0];
genvar i;

generate
    if(DELAY==0)
    begin
        assign odata=idata;
    end
    
    else
    begin
    assign tdata[0] = idata; 
    for(i=0;i<DELAY;i=i+1) begin 
        register
        #(
            .N(N)
         )
         delay(
            .clk(clk),
            .ce(ce),
            .idata(tdata[i]),
            .odata(tdata[i+1])
        ); end 
        assign odata = tdata[DELAY]; end
endgenerate
endmodule