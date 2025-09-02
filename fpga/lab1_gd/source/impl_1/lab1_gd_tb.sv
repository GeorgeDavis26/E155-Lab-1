// lab1_gd_tb.sv
// testbench file for top level lab-1 module lab1_gd.sv
// george davis gdavis@hmc.edu
// 8/30/2025

//Referenced E85 Lab_2 testbench provided tutorial by david harris to make this file

`timescale 1ps/1ps //timescale <time_unit>/<time_precision>

module lab1_gd_tb;
	
	
	
	logic	clk;
	logic	reset;
	
	//input variables
	logic	[3:0] s;
	logic	[2:0] led, led_expected;
	logic	[6:0] seg, seg_expected;
	
	//32 bit vectornum indicates the number of test vectors applied
	//32 bit errors indicates number of errros found
	logic [31:0] vectornum, errors;
	
	//14 bit testvectors covering 4 input switches and 10 outputs between the LED's and the seven seg disp
	logic [13:0]	testvectors[10000:0];
	
	// instatiate device to be tested
	top dut(s, led, seg);

	always
		begin
			clk <= 1; # 5; clk <= 0; # 5;
		end

	
	initial
		begin
			$readmemb("lab1_gd_tb.tv", testvectors);
			
			//Initialize 0 vectors tested and errors
			vectornum = 0;
			errors = 0; 
			
			//Pulse reset to begin test
			reset <= 1; # 22; reset <= 0;
		end

	  	//Check test vectors at the falling edge of the clock 
		always @(posedge clk)
			begin
				#1;
				//loads test vectors into inputs and expected outputs
				{s,led_expected,seg_expected} = testvectors[vectornum];
			end
	
    
		always @(negedge clk)
			if(~reset) begin
				//detect error by comparing actual output expected output from testvectors
				if (led != led_expected || seg != seg_expected) begin
					//display input/outputs that generated the error
					$display("Error: inputs = %b", {s});
					$display(" outputs = %b", {led, seg});
					errors = errors + 1;
				end

				vectornum = vectornum + 1;
				
				if (testvectors[vectornum] == 14'bX) begin
					$display("%d tests completed with %d errors", vectornum, errors);
					$stop;
				end
			end

endmodule