module mux_8to1(out, din, sel);
    input logic [2:0] sel;
    input logic [7:0] din;
    output logic out;

    logic [1:0] tmp;

    mux_4to1 m0 (.out(tmp[0]), .din(din[3:0]), .sel(sel[1:0]));
    mux_4to1 m1 (.out(tmp[1]), .din(din[7:4]), .sel(sel[1:0]));

    mux_2to1 mf (.out, .din(tmp), .sel(sel[2]));
endmodule

module mux_8to1_testbench;
    logic [2:0] sel; 
    logic [7:0] din;
    logic out;

    parameter delay = 10;

    integer i;

    initial begin
        for (i = 0; i < 2048; i++) begin
            {sel, din} = i;
            #delay;
        end
    end

    mux_8to1 dut (.out, .din, .sel);
endmodule
