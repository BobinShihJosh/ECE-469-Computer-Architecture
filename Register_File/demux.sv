module demux (out, in, enable);
    input logic [4:0] in;
    input logic enable;
    output logic [31:0] out;

    logic [31:0] temp;

    genvar i;
    generate
        for (i = 0; i < 32; i++) begin : eachEq
            equals e (temp[i], i, in);
            and a (out[i], temp[i], enable);
        end
    endgenerate
endmodule

module demux_testbench;
    logic [4:0] in;
    logic enable;
    logic [31:0] out;

    parameter delay = 10;

    integer i;

    initial begin
        $display("Test cases when enabled");
        enable = 1;
        for (i=0; i<32; i++) begin
            in = i; #delay;
        end

        $display("Test cases when not enabled");
        enable = 0;
        for (i=0; i<32; i++) begin
            in = i; #delay;
        end
    end

    demux dut (.out, .enable, .in);
endmodule