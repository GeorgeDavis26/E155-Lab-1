// gd top SV file
// parent file for led_control.sv and seven_seg_disp.sv
// george davis gdavis@hmc.edu


module top(
	input	logic s[3:0],
	output	logic led[2:0],
	output	logic seg[6:0]
	);
	
	logic int_osc;
	logic [15:0] counter = 0;
	
	//Internal high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	//Simple clock divider
	always_ff @(posedge int_osc)
		begin
			counter <= counter + 1;
		end
	
	led_controller	led_controller(s, counter, led);
	seven_seg_disp	seven_seg_disp(s, counter, seg);

	assign 
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