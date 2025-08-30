// gd top SV file
// encodes a 7 segment display to show the first 16 Hexidecimal Digits
// george davis gavis@hmc.edu


module top(
	input	logic s[3:0],
	output	logic led[2:0],
	output	logic seg[6:0]
	);
	
	logic int_osc;
	logic led_state[2:0];
	logic [13:0] counter = 0;
	
	//Internal high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	//Simple clock divider
	always_ff @(posedge int_osc)
		begin
			counter <= counter + 1;
		end
	
	// logic to control led[0]
	always_comb begin
		case(s)
			4'b0001:		led_state[0] = 3'b001;	//turn led[0] on 
			4'b0010:		led_state[0] = 3'b001;	//turn led[0] on 
			default:		led_state[0] = 3'b001;	//default led[0] off
		endcase
	end
	
	// logic to control led[1]
	always_comb begin
		case(s)
			4'b1100: 		led_state[1] = 0;	//turn led[1] on 
			default:		led_state[1] = 1;	//default led[1] off
		endcase
	end
	
	assign led[2] = counter[13];
	assign led[1] = led_state[1];
	assign led[0] = led_state[0];		

endmodule
	

// Provided code for reference
//module top(
	//input 	logic	mcu_blink_in,
	//output 	logic fpga_blink_out, mcu_echo_led
//);

	//logic int_osc;
	//logic pulse;
	//logic led_state = 0;
	//logic [24:0] counter = 0;
	
	//Internal high-speed oscillator
	//HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	//Simple clock divider
	//always_ff @(posedge int_osc)
		//begin
			//counter <= counter + 1;
		//end
		
  //assign fpga_blink_out = counter[24];
	//assign mcu_echo_led = mcu_blink_in;

//endmodule