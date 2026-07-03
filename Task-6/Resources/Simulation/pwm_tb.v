`timescale 1ns/1ps


module pwm_tb;


reg clk;
reg reset;

reg write_en;
reg read_en;

reg [1:0] addr;
reg [31:0] write_data;

wire [31:0] read_data;
wire pwm_out;



pwm_ip DUT(

.clk(clk),
.reset(reset),

.write_en(write_en),
.read_en(read_en),

.addr(addr),

.write_data(write_data),
.read_data(read_data),

.pwm_out(pwm_out)

);


// Clock generation

always #5 clk = ~clk;



initial begin


$dumpfile("pwm_wave.vcd");
$dumpvars(0,pwm_tb);


clk = 0;
reset = 1;

write_en = 0;
read_en = 0;

#20;

reset = 0;


// Set period = 20

addr = 2'b01;
write_data = 20;

write_en = 1;

#10;

write_en = 0;


// Set duty = 10

addr = 2'b10;
write_data = 10;

write_en = 1;

#10;

write_en = 0;


// Enable PWM

addr = 2'b00;
write_data = 1;

write_en = 1;

#10;

write_en = 0;


#300;


$finish;


end


endmodule
