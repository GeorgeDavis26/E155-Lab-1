// lab1_gd_tb.sv
// testbench file for top level lab-1 module lab1_gd.sv
// george davis gdavis@hmc.edu
// 8/30/2025

//Referenced E85 Lab_2 testbench provided tutorial by david harris to make this file


module lab1_gd_tb;
	
	logic	clk;
	logic	reset;
	
	//input variables
	logic	[3:0] s;
	logic	[2:0] led;
	logic	[6:0] seg;
	
	//32 bit vectornum indicates the number of test vectors applied
	//32 bit errors indicates number of errros found
	logic [31:0] vectornum errors;
	
	//14 bit testvectors covering 4 input switches and 10 outputs between the LED's and the seven seg disp
	logic [13:0]	testvectors[10000:0];
	
	// instatiate device to be tested
	top dut(s, led, seg);
	
	initial
		begin
		  readmemb("lab1_gd_tb.tv", testvectors);
		  
		  //Initialize 0 vectors tested and errors
		  vectornum = 0;
		  errors = 0; 
		  
		  //Pulse reset to begin test
		  reset <= 1; # 22; reset <= 0;
		end

	  always
		begin
		  clk <= 1; # 5; clk <= 0; # 5;
		end

	  //Check test vectors at the falling edge of the clock 
	  always @(posedge clk)
		begin
			#1;
			
			{s,led,seg} = testvectors[vectornum];
		end
endmodule