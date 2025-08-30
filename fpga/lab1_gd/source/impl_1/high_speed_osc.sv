// high_speed_osc.sv
// uses internal 48 MHz to count through a 16 bit counter
// george davis gdavis@hmc.edu

module high_speed_osc (
    output  logic   counter
);
    logic int_osc;
	logic [15:0] counter = 0;
	
	//Internal 48 MHz high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	//Simple clock divider
	always_ff @(posedge int_osc)
		begin
			counter <= counter + 1;
		end
    
endmodule
