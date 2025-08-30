// seven_seg_disp.sv
// encodes a 7 segment display to show the first 16 Hexidecimal Digits
// george davis gdavis@hmc.edu

module seven_seg_disp (
	input	logic s[3:0],
	output	logic seg[6:0]

);
    logic seg_state[6:0]

    case(s)
    4'b0000:    seg_state = 7'b0000001; //Display Hex 0    
    4'b0001:    seg_state = 7'b1001111; //Display Hex 1
    4'b0010:    seg_state = 7'b0011010; //Display Hex 2 
    4'b0011:    seg_state = 7'b0000110; //Display Hex 3 
    4'b0100:    seg_state = 7'b1001100; //Display Hex 4 
    4'b0101:    seg_state = 7'b0100100; //Display Hex 5 
    4'b0110:    seg_state = 7'b1100000; //Display Hex 6 
    4'b0111:    seg_state = 7'b0001111; //Display Hex 7 
    4'b1000:    seg_state = 7'b0000000; //Display Hex 8 
    4'b1001:    seg_state = 7'b0001100; //Display Hex 9 
    4'b1010:    seg_state = 7'b0001000; //Display Hex A 
    4'b1011:    seg_state = 7'b1100000; //Display Hex B 
    4'b1100:    seg_state = 7'b0110001; //Display Hex C 
    4'b1101:    seg_state = 7'b1000010; //Display Hex D 
    4'b1110:    seg_state = 7'b0110000; //Display Hex E
    4'b1111:    seg_state = 7'b0111000; //Display Hex F 
    default:    seg_state = 7'b1111111; //Default to all LEDs off
    endcase

    assign seg = seg_state
endmodule