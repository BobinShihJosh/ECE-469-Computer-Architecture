module datapath (clk,Reg2Loc,ALUsrc,MemToReg, RegWrite,MemWrite, ConstSel,Reg3Loc,ALUOP,Imm9,Imm12,Imm19,Imm26,Rn,Rd,Rm,flags);
	input logic clk;
	input logic Reg2Loc,ALUsrc,MemToReg, RegWrite,MemWrite, ConstSel,Reg3Loc;
	
	input logic [2:0] ALUOP;
	input logic [11:0]Imm12;
	input logic [25:0]Imm26;
	input logic [18:0]Imm19;
	input logic [8:0] Imm9;
	input logic [4:0] Rn, Rd,Rm;
	
	output logic [3:0] flags;//negative,zero,overflow,carry_out
	
	logic [64:0]  dataA, dataB,WriteData,dataB1,ALUOut, read_data,constant;
	logic [4:0] tempR;
	
	signextend ();
	
	
	regfile regA(dataA, dataB,WriteData,tempR,Rn, Rd,WrEn,clk);
	
	alu AluA(dataA, dataB1, ALUOp, ALUOut, flags[3], flags[2], flags[1], flags[0]); 
	
	datamem MEM(ALUOut,MemWrite,1'b1,dataB,clk,xfer_size,read_data);
	
	mux2_1_x #(5) regtoloc(Rd, Rm,out, sel);
	mux2_1_x alusource (dataB,constant,dataB1,ALUSrc);
	mux3_1_x memorytoreg (ALUOut,read_data,PCvalue,WriteData,MemToReg);
	
endmodule 
