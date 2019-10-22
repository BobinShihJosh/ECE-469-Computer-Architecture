module fullAdder(A, B, cin, sum, cout, sub);
	input logic A, B, cin, sub;
	output logic sum, cout;
	
	// use a mux to determine if we should subtract by using cin as a subtract signal
	logic [1:0] fB;
	logic tmpB;
	assign fB[0] = B;
	//assign fB[1] = ~B;
	nand n2 (fB[1], fB[0], fB[0]);
	
	// sub signal is 1, return ~b
	mux_2to1 suboradd(.out(tmpB), .din(fB), .sel(sub));
	
	assign sum = A ^ tmpB ^ cin;
	assign cout = (A & tmpB) | (cin & (A ^ tmpB));
	
endmodule 

module fullAdder_testbench();
	logic A, B, cin, sum, cout, sub;
	
	fullAdder dut (A, B, cin, sum, cout, sub);
	
	initial begin
	
	sub=0;	A = 0; B = 0; cin =0; #10;
								  cin =1; #10;
						 B = 1; cin =0; #10;
								  cin =1; #10;
		      A = 1; B = 0; cin =0; #10;
								  cin =1; #10;
				       B = 1; cin =0; #10;
								  cin =1; #10;
	sub=1;	A = 0; B = 0; cin =0; #10;
								  cin =1; #10;
						 B = 1; cin =0; #10;
								  cin =1; #10;
		      A = 1; B = 0; cin =0; #10;
								  cin =1; #10;
				       B = 1; cin =0; #10;
								  cin =1; #10;
	   $stop;
	end
endmodule 
			