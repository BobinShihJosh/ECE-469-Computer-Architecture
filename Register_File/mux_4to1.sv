module mux_4to1(out, din, sel);
    input logic [1:0] sel;
    input logic [3:0] din;
    output logic out;

    logic [1:0] tmp;

    mux_2to1 m0 (.out(tmp[0]), .din(din[1:0]), .sel(sel[0]));
    mux_2to1 m1 (.out(tmp[1]), .din(din[3:2]), .sel(sel[0]));

    mux_2to1 mf (.out, .din(tmp), .sel(sel[1]));
endmodule

module mux_4to1_testbench;
    logic [1:0] sel; 
    logic [3:0] din;
    logic out;

    parameter delay = 10;

    integer i;
    initial begin
        for (i = 0; i < 64; i++) begin
            {sel, din} = i;
            #delay;
        end
    end

    mux_4to1 dut (.out, .din, .sel);
endmodule
