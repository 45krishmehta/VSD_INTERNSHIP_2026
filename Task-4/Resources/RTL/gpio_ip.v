module gpio_ip (

    input wire clk,
    input wire reset,

    input wire write_en,
    input wire read_en,

    input wire [1:0] addr,

    input wire [31:0] write_data,
    output reg [31:0] read_data,

    output reg [31:0] gpio_reg

);


always @(posedge clk) begin

    if(reset) begin

        gpio_reg <= 32'b0;

    end


    else if(write_en) begin

        gpio_reg <= write_data;

    end


end



always @(*) begin

    if(read_en)

        read_data = gpio_reg;

    else

        read_data = 32'b0;


end



endmodule
