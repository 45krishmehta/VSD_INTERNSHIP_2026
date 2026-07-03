module gpio_ip(

    input wire clk,
    input wire reset,

    input wire write_en,
    input wire read_en,

    input wire [1:0] reg_sel,

    input wire [31:0] write_data,

    output reg [31:0] read_data,
    output wire [31:0] gpio_out

);


reg [31:0] gpio_data;
reg [31:0] gpio_dir;


// Write Logic

always @(posedge clk) begin

    if(reset) begin
        gpio_data <= 32'b0;
        gpio_dir <= 32'b0;
    end

    else if(write_en) begin

        case(reg_sel)

        2'b00:
            gpio_data <= write_data;

        2'b01:
            gpio_dir <= write_data;

        endcase

    end

end



// GPIO Output

assign gpio_out = gpio_data & gpio_dir;



// Read Logic

always @(*) begin

    case(reg_sel)

    2'b00:
        read_data = gpio_data;


    2'b01:
        read_data = gpio_dir;


    2'b10:
        read_data = gpio_out;


    default:
        read_data = 32'b0;


    endcase


end


endmodule
