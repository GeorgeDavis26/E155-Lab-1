// led_control SV file
// encodes a 7 segment display to show the first 16 Hexidecimal Digits
// george davis gavis@hmc.edu

module led_control 

    
	always_comb 
	begin
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


endmodule