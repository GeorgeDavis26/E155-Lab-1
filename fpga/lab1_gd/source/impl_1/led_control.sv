// led_control.sv
// encodes 3 LEDs to display board functionality
// george davis gdavis@hmc.edu
// 8/30/2025

module led_control(
	input	logic [3:0] s,
	output	logic [2:0] led
	);
	
	// logic to control led[0]
	assign led[0] = s[0] ^ s[1];

	// logic to control led[1]
	assign led[1] = s[2] & s[3];

	//logic to control led[2]	
	logic	clk;
	logic	[24:0]	counter = 0;
		 
	//Internal 48MHz high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));
	
	//Simple clock divider
	always_ff @(posedge clk)
		begin
			if(counter == 'd10000000) 
				begin
				led[2]  = ~led[2];	//flip LED 
				counter = 0;		//reset counter
				end
			else 
				begin
				counter = counter + 1;
				end
		end
endmodule