
`timescale 1ns/10ps
module Single_Cycle_CPU(reset,clk);

	input logic  reset;
	input logic    clk;
	
	
	output logic  zero,negative,overflow,carry_out;
	
	
	logic [63:0]dataA,dataB,WriteData,ALUOut,PC,PCnew;
	logic [31:0] instr;    //instruction code used for the CPU
	logic [4:0] OPID;			//instruction ID decoded from control signal 
	logic WrEn,ALUOp,MemWrite,read_enable;
	logic [18:0] CondAddr19,Imm19;
	logic [25:0] BrAddr26,Imm26;
	logic [8:0] DAddr9;
	logic [11:0] Imm12;
	
	instructmem i1(address,instruction,clk);
	
	Consig control1(instr, OPID);
	
	REG PCreg(PCnew, PC , clk, '1);
	
	PCpath (OPID, instr,PCnew);
	
	datapath (clk,Reg2Loc,ALUsrc,MemToReg, RegWrite,MemWrite, ConstSel,Reg3Loc,ALUOP,Imm9,Imm12,Imm19,Imm26,Rn,Rd,Rm,flags);

	REG (4) (flg,Flags,clk,FlagEn);
	
	
	/*regfile regA(dataA, dataB,WriteData,AddrA,AddrB, 
	AddrW,WrEn,clk);
	
	alu AluA(dataA, dataB, ALUOp, ALUOut, negative, zero, overflow, carry_out); 
	alu AluB(dataA, dataB, ALUOp, ALUOut, negative, zero, overflow, carry_out); 
	alu AluC(dataA, dataB, ALUOp, ALUOut, negative, zero, overflow, carry_out); 
	
	
	datamem MEM(ALUOut,MemWrite,read_enable,write_data,clk,xfer_size,read_data	);*/

