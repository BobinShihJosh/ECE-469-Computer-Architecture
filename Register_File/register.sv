module register (out, in, enable, clk);
    input logic [63:0] in;
    input logic enable, clk;
    output logic [63:0] out;

    // if enabled then out == in else out == out
    logic [63:0] temp;

    genvar i;

    generate
        for(i=0; i<64; i++) begin : each
            mux_2to1 m (
                .out(temp[i]), 
                .din({in[i], out[i]}),
                .sel(enable)
            );
            D_FF dff (
                .q(out[i]),
                .d(temp[i]),
                .reset(1'b0),
                .clk
            );
        end
    endgenerate
endmodule

module register_testbench;
    logic [63:0] in;
    logic enable;
    logic [63:0] out;

    logic clk;
    parameter PERIOD = 100;
    
    initial begin
        clk <= 1;
        forever #(PERIOD/2) clk = ~clk;
    end

    initial begin
        $display("When enabled");
        enable <= 1; @(posedge clk);
        in <= 2; @(posedge clk); 
        in <= 4; @(posedge clk);
        in <= 16; @(posedge clk);
        in <= 64; @(posedge clk);
        in <= 256; @(posedge clk);
        in <= 1024; @(posedge clk);
        in <= -1; @(posedge clk); @(posedge clk); // all ones

        $display("When not enabled");
        enable <= 0; @(posedge clk);
        in <= 2; @(posedge clk);
        in <= -1; @(posedge clk);
        in <= 1024; @(posedge clk); 

        $stop();
    end

    register dut (.out, .in, .enable, .clk);
endmodule

