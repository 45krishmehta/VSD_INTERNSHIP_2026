module pwm_ip (
    input wire clk,
    input wire reset,

    input wire write_en,
    input wire read_en,
    input wire [1:0] addr,

    input wire [31:0] write_data,
    output reg [31:0] read_data,

    output reg pwm_out
);

reg [31:0] ctrl;
reg [31:0] period;
reg [31:0] duty;
reg [31:0] counter;


// Write registers
always @(posedge clk) begin

    if(reset) begin
        ctrl <= 0;
        period <= 32'd10;
        duty <= 32'd5;
    end

    else if(write_en) begin
        case(addr)

        2'b00:
            ctrl <= write_data;

        2'b01:
            period <= write_data;

        2'b10:
            duty <= write_data;

        endcase
    end
end


// PWM Counter
always @(posedge clk) begin

    if(reset)
        counter <= 0;

    else if(ctrl[0]) begin

        if(counter >= period)
            counter <= 0;

        else
            counter <= counter + 1;

    end
end


// PWM Output Generation
always @(*) begin

    if(counter < duty)
        pwm_out = 1'b1;

    else
        pwm_out = 1'b0;

end


// Read Registers
always @(*) begin

    case(addr)

    2'b00:
        read_data = ctrl;

    2'b01:
        read_data = period;

    2'b10:
        read_data = duty;

    2'b11:
        read_data = counter;

    default:
        read_data = 0;

    endcase

end


endmodule
