// led_control.sv
// encodes 3 LEDs to display board functionality
// george davis gdavis@hmc.edu

module led_control(
input	logic [3:0] s,
input	logic [13:0] counter,
output	logic [2:0] led
);
	logic [2:0] led_state;
	always_comb begin
		// logic to control led[0]
		case(s)
			4'b0001:		led_state = 3'bXX0;	//turn led[0] on 
			4'b0010:		led_state = 3'bXX0;	//turn led[0] on 
			default:		led_state = 3'bXX1;	//default led[0] off
		endcase	
		
		// logic to control led[1]
		case(s)
			4'b1100: 		led_state = 3'bX0X;	//turn led[1] on 
			default:		led_state = 3'bX1X;	//default led[1] off
		endcase

		//logic to control led[2]
		case(counter)
			'd20000:		led_state = 3'b0XX; //turn led[2] on
			default:		led_state = 3'b1XX; //default led[2] off 
		endcase
	end
    
    assign led = led_state;
endmodule