//braille translator using verilog 

module braille_translator(sen, out1, br, out2,out3);
	parameter n=50;		//no. of letters in in the sentence 
	input[n*8:0] sen;	//given sentence to be converted to braille(in lowercase, no special characters)
	input [n*6:0] br;	//given braille to be converted to text
	output reg[n*6:0] out1;	//braille output
	output reg[n*8:0] out2;	//sentence output
	output reg[n*7:0] out3;	//7 segment display
	reg [7:0] med[0:n];
		
	integer i,j;
	
	always@(*)	//text to braille
		begin
			if(sen!=0)
				begin
					for(i=0;i<n;i=i+1)
						med[i]=sen[i*8+:8];
						
					for(i=0;i<n;i=i+1)
						begin					
							case(med[i])
								97: out1[i*6+:6]=6'b100000; 	//a
								98: out1[i*6+:6]=6'b110000;		//b
								99:	out1[i*6+:6]=6'b100001;		//c
								100: out1[i*6+:6]=6'b100011;	//d
								101: out1[i*6+:6]=6'b100010;	//e
								102: out1[i*6+:6]=6'b110001;	//f
								103: out1[i*6+:6]=6'b110011;	//g
								104: out1[i*6+:6]=6'b110010;	//h 
								105: out1[i*6+:6]=6'b010100;	//i 
								106: out1[i*6+:6]=6'b010001;	//j
								107: out1[i*6+:6]=6'b010011;	//k						
								108: out1[i*6+:6]=6'b101000;	//l
								109: out1[i*6+:6]=6'b111000;	//m
								110: out1[i*6+:6]=6'b101001;	//n						
								111: out1[i*6+:6]=6'b101010;	//o	
								112: out1[i*6+:6]=6'b101011;	//p
								113: out1[i*6+:6]=6'b111011;	//q						
								114: out1[i*6+:6]=6'b111010;	//r
								115: out1[i*6+:6]=6'b011001;	//s
								116: out1[i*6+:6]=6'b011011;	//t
								117: out1[i*6+:6]=6'b101100;	//u
								118: out1[i*6+:6]=6'b111100;	//v
								119: out1[i*6+:6]=6'b010111;	//w
								120: out1[i*6+:6]=6'b101101;	//x
								121: out1[i*6+:6]=6'b101111;	//y
								122: out1[i*6+:6]=6'b101110;	//z
								default: out1[i*6+:6]=000000;
							endcase
						end
				end	//end of if statement
		end	//end of text to braille
		
	always@(*)	//braile to text
		begin
			if(br!=0)
				begin
					$display("Braille to text: ");
					for(i=n-1;i>=0;i=i-1)
						begin					
							case(br[i*6+:6])
								6'b100000: out2[i*8+:8]="a"; 	//a
								6'b110000: out2[i*8+:8]="b";	//b
								6'b100001: out2[i*8+:8]="c";	//c
								6'b100011: out2[i*8+:8]="d";	//d
								6'b100010: out2[i*8+:8]="e";	//e
								6'b110001: out2[i*8+:8]="f";	//f
								6'b110011: out2[i*8+:8]="g";	//g
								6'b110010: out2[i*8+:8]="h";	//h 
								6'b010100: out2[i*8+:8]="i";	//i 
								6'b010001: out2[i*8+:8]="j";	//j
								6'b010011: out2[i*8+:8]="k";	//k						
								6'b101000: out2[i*8+:8]="l";	//l
								6'b111000: out2[i*8+:8]="m";	//m
								6'b101001: out2[i*8+:8]="n";	//n						
								6'b101010: out2[i*8+:8]="o";	//o	
								6'b101011: out2[i*8+:8]="p";	//p
								6'b111011: out2[i*8+:8]="q";	//q						
								6'b111010: out2[i*8+:8]="r";	//r
								6'b011001: out2[i*8+:8]="s";	//s
								6'b011011: out2[i*8+:8]="t";	//t
								6'b101100: out2[i*8+:8]="u";	//u
								6'b111100: out2[i*8+:8]="v";	//v
								6'b010111: out2[i*8+:8]="w";	//w
								6'b101101: out2[i*8+:8]="x";	//x
								6'b101111: out2[i*8+:8]="y";	//y
								6'b101110: out2[i*8+:8]="z";	//z
								default: out2[i*8+:8]=" ";
							endcase
							$write("%s",out2[i*8+:8]);
							
							j=0;
							case(out2[i*8+:8])	//text to 7 segment display
								97: begin
									out3[j*7+:7]=7'b1111011; 	//9
									j=j+7;
									out3[j*7+:7]=7'b1110000;	//7
									j=j+7;
									end
								
								98: begin
									out3[j*7+:7]=7'b1111011; 	//9
									j=j+7;
									out3[j*7+:7]=7'b1111111;	//8
									j=j+7;
									end
								
								99:	begin
									out3[j*7+:7]=7'b1111011; 	//9
									j=j+7;
									out3[j*7+:7]=7'b1111011;	//9
									j=j+7;
									end
								
								100: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									end
								
								101: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									out3[j*7+:7]=7'b0110000;	//1
									j=j+7;
									end
									
								102: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									out3[j*7+:7]=7'b1101101;	//2
									j=j+7;
									end
									
								103: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									out3[j*7+:7]=7'b1111001;	//3 
									j=j+7;
									end
									
								104: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									out3[j*7+:7]=7'b0110011;	//4
									j=j+7;
									end
									
								105:begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									out3[j*7+:7]=7'b1011011;	//5
									j=j+7;
									end
									
								106: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									out3[j*7+:7]=7'b1011111;	//6
									j=j+7;
									end
									
								107: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									out3[j*7+:7]=7'b1110000;	//7
									j=j+7;
									end
									
								108:begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									out3[j*7+:7]=7'b1111111;	//8
									j=j+7;
									end
									
								109:begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									out3[j*7+:7]=7'b1111011;	//9
									j=j+7;
									end
									
								110:begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b0110000;	//1
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									end	
									
								111:begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b0110000;	//1
									j=j+7;
									out3[j*7+:7]=7'b0110000;	//0
									j=j+7;
									end	
										
								112:begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b0110000;	//1
									j=j+7;
									out3[j*7+:7]=7'b1101101;	//2
									j=j+7;
									end	
									
								113: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b0110000;	//1
									j=j+7;
									out3[j*7+:7]=7'b1111001;	//3
									j=j+7;
									end	
															
								114: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b0110000;	//1
									j=j+7;
									out3[j*7+:7]=7'b0110011;	//4
									j=j+7;
									end	
									
								115: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b0110000;	//1
									j=j+7;
									out3[j*7+:7]=7'b1011011;	//0
									j=j+7;
									end	
									
								116: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b0110000;	//1
									j=j+7;
									out3[j*7+:7]=7'b1011111;	//0
									j=j+7;
									end	
									
								117: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b0110000;	//1
									j=j+7;
									out3[j*7+:7]=7'b1110000;	//7
									j=j+7;
									end	
									
								118: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b0110000;	//1
									j=j+7;
									out3[j*7+:7]=7'b1111111;	//8
									j=j+7;
									end	
									
								119: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b0110000;	//1
									j=j+7;
									out3[j*7+:7]=7'b1111011;	//9
									j=j+7;
									end	
									
								120: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b1101101;	//2
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//1
									j=j+7;
									end	
									
								121: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b1101101;	//2
									j=j+7;
									out3[j*7+:7]=7'b0110000;	//0
									j=j+7;
									end	
									
								122: begin
									out3[j*7+:7]=7'b0110000; 	//1
									j=j+7;
									out3[j*7+:7]=7'b1101101;	//2
									j=j+7;
									out3[j*7+:7]=7'b1101101;	//2
									j=j+7;
									end	
									
								default: begin
									out3[j*7+:7]=7'b1111110; //0
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									out3[j*7+:7]=7'b1111110;	//0
									j=j+7;
									end	
								endcase
																
						end
						
						
				end	//end of if statement				
		end	//end of braille to text

		
endmodule