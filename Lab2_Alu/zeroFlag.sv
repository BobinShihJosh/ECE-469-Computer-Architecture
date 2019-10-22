module zeroFlag (out, alu);
	input logic [63:0] alu;
	output logic out;
	
	logic [62:0] tmp;
	
	or (tmp[0], alu[0], alu[1]);
	
	genvar i;
	generate 
		for (i = 0; i < 62; i++) begin : eachor
			or (tmp[i+1],tmp[i], alu[i+2]);
		end
	endgenerate
	
	not n1(out, tmp[62]);
	
endmodule
