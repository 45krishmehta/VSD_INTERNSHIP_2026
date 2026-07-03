// PWM IP Integration inside RISC-V SoC

wire pwm_write;
wire pwm_read;

wire [31:0] pwm_rdata;
wire pwm_signal;


// Address Decode
assign pwm_write = mem_valid &&
                   (mem_addr[31:12] == 20'h40000) &&
                   |mem_wstrb;


assign pwm_read = mem_valid &&
                  (mem_addr[31:12] == 20'h40000);


// PWM Instance

pwm_ip pwm_unit (

    .clk(clk),
    .reset(reset),

    .write_en(pwm_write),
    .read_en(pwm_read),

    .addr(mem_addr[3:2]),

    .write_data(mem_wdata),
    .read_data(pwm_rdata),

    .pwm_out(pwm_signal)

);
