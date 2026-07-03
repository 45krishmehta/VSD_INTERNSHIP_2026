// GPIO IP Integration with RISC-V Processor


wire gpio_write;
wire gpio_read;

wire [31:0] gpio_read_data;
wire [31:0] gpio_output;


// GPIO Address Mapping

assign gpio_write = mem_valid &&
                    (mem_addr[31:12] == 20'h30000)
                    && |mem_wstrb;


assign gpio_read = mem_valid &&
                   (mem_addr[31:12] == 20'h30000);



// GPIO Instance

gpio_ip gpio (

    .clk(clk),

    .reset(reset),

    .write_en(gpio_write),

    .read_en(gpio_read),

    .addr(mem_addr[3:2]),

    .write_data(mem_wdata),

    .read_data(gpio_read_data),

    .gpio_reg(gpio_output)

);
