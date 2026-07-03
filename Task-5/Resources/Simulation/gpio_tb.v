`timescale 1ns/1ps


module gpio_tb;


reg clk;
reg reset;

reg write_en;
reg read_en;

reg [1:0] reg_sel;

reg [31:0] write_data;


wire [31:0] read_data;
wire [31:0] gpio_out;



gpio_ip DUT(

.clk(clk),
.reset(reset),

.write_en(write_en),
.read_en(read_en),

.reg_sel(reg_sel),

.write_data(write_data),

.read_data(read_data),
.gpio_out(gpio_out)

);


// Clock

always #5 clk = ~clk;



initial begin


$dumpfile("gpio_wave.vcd");
$dumpvars(0,gpio_tb);



clk = 0;

reset = 1;

write_en = 0;


#20;

reset = 0;



// Set GPIO Direction

reg_sel = 2'b01;

write_data = 32'hFFFFFFFF;

write_en = 1;

#10;

write_en = 0;



// Write GPIO Data

reg_sel = 2'b00;

write_data = 32'h000000AA;

write_en = 1;

#10;

write_en = 0;



#100;


$finish;


end


endmodule
