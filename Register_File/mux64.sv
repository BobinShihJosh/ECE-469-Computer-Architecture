module mux_64x32to1 (out, in, select);
    input logic [31:0][63:0] in; // there are 32 64 bit busses
    input logic [4:0] select;    // select 1 of the 32 busses
    output logic [63:0] out; 

	 logic [63:0][31:0] tmpin;
	
	// transposing the 2D array
	integer i, j;
	always_comb begin
		for (i=0; i<32; i++) 
			for (j=0; j<64; j++) 
				tmpin[j][i] = in[i][j];
	end
			
	
	// use 64 32:1 muxes 
	genvar k;
	generate 
		for (k=0; k<64; k++) begin : eachmux_32
			mux_32to1 mx32(.out(out[k]), .din(tmpin[k]), .select(select));
		end
	endgenerate
endmodule

module mux_64x32to1_testbench;
    logic [31:0][63:0] in;
    logic [4:0] select;
    logic [63:0] out;

    parameter delay = 10;

    integer i;
    initial begin
        // seed input
        for (i = 0; i < 32; i++) begin
            in[i] = i;
        end
        
        for (i = 0; i < 32; i++) begin
            select = i; #delay;
        end
    end

    mux_64x32to1 dut (.out, .in, .select);
endmodule
