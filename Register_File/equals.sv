module equals (out, a, b);
    input logic [4:0] a, b;
    output logic out;

    logic temp[4:0];

    genvar i;

    generate 
        for (i=0; i<5; i++) begin : eachXnor
            xnor xnorGate (temp[i], a[i], b[i]);
        end
    endgenerate

    and andGate (
        out,
        temp[0],
        temp[1],
        temp[2],
        temp[3],
        temp[4]
    );
endmodule

module equals_testbench;
    logic [4:0] a, b;
    logic out;

    parameter delay = 10;

    initial begin
        $display("Try cases where inputs are equal");
        a = 12; b = 12; #delay; // arbitrary value
        a = 0; b = 0; #delay;   // min binary value
        a = 31; b = 31; #delay; // 0b11111 (max binary value for width=5)

        $display("Try cases where inputs are not equal");
        a = 0; b = 31; #delay;
        a = 0; b = 1; #delay;
        a = 10; b = 11; #delay;

        $stop;
    end

    equals dut (.out, .a, .b);
endmodule