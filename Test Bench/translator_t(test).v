//testbench for braille translator

`timescale 10ns/1ns
module t_braille_translator;
	parameter n=50;
	reg[n*8:0] sen;	//given sentence to be converted to braille(in lowercase, no special characters)
	reg [n*6:0] br;	//given braille to be converted to text
	wire[n*6:0] out1;	//braille output
	wire[n*8:0] out2;	//sentence output
	wire[n*7:0] out3;	//7 segment display
	integer i;
	
	braille_translator b1(sen, out1, br, out2,out3);
	
	initial
		begin
			
			sen=0;
			br=0;
			
			#5 	sen="pauls laptop is silver in colour but small in size"; 	
				$display("%s",sen);

			#5 	$display(" Braille translation(in binary form) : ");
				for(i=n-1;i>=0;i=i-1)
					$display(" %b ",out1[i*6+:6]);
					
			#5  $display("\n");
				sen="he sells sea shells on the sea shore to earn money"; 	
				$display("%s",sen);

			#5 	$display(" Braille translation(in binary form) : ");
				for(i=n-1;i>=0;i=i-1)
					$display(" %b ",out1[i*6+:6]);
					
			#5  $display("\n");
				sen=0;
				br=301'b110010100010000000011001100010101000101000011001000000011001100010100000000000011001110010100010101000101000011001000000101010101001000000011011110010100010000000011001100010100000000000011001110010101010111010100010000000011011101010000000100010100000111010101001000000111000101010101001100010101111;	
				
					
			#5	$display("\n");
				$finish;
						
		end
endmodule
			