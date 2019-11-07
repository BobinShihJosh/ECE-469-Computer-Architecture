module mux (out, in, select);
    input logic [31:0][63:0] in; // there are 32 64 bit busses
    input logic [4:0] select;    // select 1 of the 32 busses
    output logic [63:0] out; 

    assign out = in[select];
endmodule

module mux_testbench;
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

    mux dut (.out, .in, .select);
endmodule
