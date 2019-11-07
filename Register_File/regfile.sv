module regfile (
    ReadData1,
    ReadData2,
    WriteData,
    ReadRegister1,
    ReadRegister2,
    WriteRegister,
    RegWrite,
    clk
);
    input logic [4:0] ReadRegister1, ReadRegister2, WriteRegister;
    input logic [63:0] WriteData;
    input logic RegWrite, clk;
    output logic [63:0] ReadData1, ReadData2;

    // output of decoder
    logic [31:0] sel;

    // output of registers, input to multiplexors
    logic [31:0][63:0] temp;

    demux d (
        .out(sel),
        .in(WriteRegister), 
        .enable(RegWrite)
    );

    genvar i;

    generate
        for(i=0; i<31; i++) begin : eachReg
            register r (
                .out(temp[i]),
                .in(WriteData),
                .enable(sel[i]),
                .clk
            );
        end
    endgenerate

    // register 31 always 0
    assign temp[31] = 64'd0;

    mux_64x32to1 m1 (
        .out(ReadData1),
        .in(temp),
        .sel(ReadRegister1)
    );

    mux_64x32to1 m2 (
        .out(ReadData2),
        .in(temp),
        .sel(ReadRegister2)
    );
endmodule


