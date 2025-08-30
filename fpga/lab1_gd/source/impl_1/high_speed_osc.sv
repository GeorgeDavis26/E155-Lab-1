// led_control SV file
// encodes 3 LEDs to display board functionality
// george davis gdavis@hmc.edu

module high_speed_osc (
    output  logic   counter
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
    
endmodule
