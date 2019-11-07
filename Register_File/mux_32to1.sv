module mux_32to1(out, din, sel);
    input logic [31:0] din;
    input logic [4:0] sel;
    output logic out;
     
    logic [1:0] tmp;

    mux_16to1 m0 (.out(tmp[0]), .din(din[15:0]),  .sel(sel[3:0]));
    mux_16to1 m1 (.out(tmp[1]), .din(din[31:16]), .sel(sel[3:0]));
     
    mux_2to1 mf (.out, .din(tmp), .sel(sel[4]));
endmodule

module mux_32to1_testbench;
    logic [31:0] din;
    logic [4:0] sel;
    logic out;

    parameter delay = 10;

    integer i;
    initial begin
    din = 32'd1;
        for (i = 0; i < 32; i++) begin
            sel = i;
            din = 32'h12345678 * i;
            #delay;
        end
    end

    mux_32to1 dut (.out, .din, .sel);
endmodule
