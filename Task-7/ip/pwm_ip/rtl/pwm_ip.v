module pwm_ip (

    input clk,
    input reset,

    input write_en,
    input [3:0] addr,
    input [31:0] write_data,

    output reg [31:0] read_data,
    output pwm_out

);


reg [31:0] ctrl;
reg [31:0] period;
reg [31:0] duty;
reg [31:0] counter;


// Register Write Logic

always @(posedge clk) begin

    if(reset) begin

        ctrl <= 32'd0;

        period <= 32'd10;

        duty <= 32'd5;

        counter <= 32'd0;

    end


    else begin


        if(write_en) begin

            case(addr)

                4'h0:
                    ctrl <= write_data;


                4'h4:
                    period <= write_data;


                4'h8:
                    duty <= write_data;


                default:
                    ;

            endcase

        end



        if(counter >= period)

            counter <= 0;

        else

            counter <= counter + 1;


    end

end



// Register Read Logic

always @(*) begin

    case(addr)


        4'h0:
            read_data = ctrl;


        4'h4:
            read_data = period;


        4'h8:
            read_data = duty;


        4'hC:
            read_data = counter;


        default:
            read_data = 32'd0;


    endcase

end



// PWM Output Generation

assign pwm_out = ctrl[0] ? (counter < duty) : 1'b0;



endmodule
