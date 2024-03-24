`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2024 19:56:49
// Design Name: 
// Module Name: tb_State_machine
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


module tb_State_machine(

    );
    
wire clk_tb;
wire [7:0]data_tb;
wire send_tb;
wire txd_tb;
wire rst_tb = 1'b0;
wire [1:0]state_tb;
wire [4:0]cnt_tb;

stimulate st_i(
    .stimulate_clk(clk_tb)
);

load_file lf(
    .data(data_tb),
    .send(send_tb)
);

save_file sf(
    .final_data(txd_tb)
);


Maszyna_stanow ms(
    .send(send_tb),
    .data(data_tb),
    .clk(clk_tb),
    .txd(txd_tb),
    .rst(rst_tb),
    .state_test(state_tb),
    .cnt_test(cnt_tb)
);
    
endmodule




module load_file(
    output [7:0]data,
    output send
);

integer file;
reg [7:0]data_reg;
reg [9:0]i;
reg send_reg;

initial
begin
    file=$fopen("ifile_path.txt","rb");
    for(i=0;i<16;i=i+1)
    begin
    
        data_reg=$fgetc(file);
        send_reg<=1;
        #2;
        send_reg<=0;
        #22;

    end
    $fclose(file);
end

assign data=data_reg;
assign send=send_reg;
endmodule



module save_file(
    input final_data
);

integer file;
reg [9:0]i;
wire data;

initial
begin
    file=$fopen("ofile_path.txt","wb");
    for(i=0;i<12*16+1;i=i+1)
    begin
        #2;
        $fwrite(file,"%d",data);
        
    end
    $fclose(file);
end
assign data = final_data;
endmodule


module stimulate(
    output stimulate_clk
);

reg clk=1'b0;

initial
begin
    while(1)
    begin
        #1; clk=1'b0;
        #1; clk=1'b1;
    end
end 


assign stimulate_clk = clk;
endmodule