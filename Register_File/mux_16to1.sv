module mux_16to1 (out, din, sel);
    input logic [15:0] din;
    input logic [3:0] sel;
    output logic out;

    logic [1:0] tmp;

    mux_8to1 m0 (.out(tmp[0]), .din(din[7:0]),  .sel(sel[2:0]));
    mux_8to1 m1 (.out(tmp[1]), .din(din[15:8]), .sel(sel[2:0]));

    mux_2to1 mf (.out, .din(tmp), .sel(sel[3]));
endmodule

module mux_16to1_testbench;
    logic [15:0] din;
    logic [3:0] sel;
    logic out;

    parameter delay = 10;

    integer i;
    initial begin
        for (i = 0; i < 16; i++) begin
            din = 16'hac81 * i;
            sel = i;
            #delay;
        end
    end

    mux_16to1 dut (.out, .din, .sel);
endmodule
