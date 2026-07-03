`timescale 1ns/1ps


module gpio_testbench;


reg clk;
reg reset;

reg write_en;
reg read_en;

reg [1:0] addr;

reg [31:0] write_data;

wire [31:0] read_data;

wire [31:0] gpio_reg;



gpio_ip DUT(

.clk(clk),

.reset(reset),

.write_en(write_en),

.read_en(read_en),

.addr(addr),

.write_data(write_data),

.read_data(read_data),

.gpio_reg(gpio_reg)

);



// clock

always #5 clk = ~clk;



initial begin


$dumpfile("gpio.vcd");

$dumpvars(0,gpio_testbench);



clk = 0;

reset = 1;

write_en = 0;

read_en = 0;


#20;


reset = 0;


// write test


write_data = 32'h55AA55AA;

write_en = 1;


#10;


write_en = 0;



// read test

read_en = 1;


#20;



$finish;



end


endmodule
