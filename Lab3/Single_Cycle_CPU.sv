module Single_Cycle_CPU(instr,clk,   );

	input logic  [31:0]instr;
	input logic    clk;
	
	
	output logic  zero,negative,overflow,carry_out;
	
	
	logic [63:0]dataA,dataB,WriteData,ALUOut,PC;
	logic [4:0]AddrA,AddrB,AddrW;
	logic WrEn,ALUOp,MemWrite,read_enable;
	logic [18:0] CondAddr19,Imm19;
	logic [25:0] BrAddr26,Imm26;
	logic [8:0] DAddr9;
	logic [11:0] Imm12;
	
	
	
	
	regfile regA(dataA, dataB,WriteData,AddrA,AddrB, 
	AddrW,WrEn,clk);
	
	alu AluA(dataA, dataB, ALUOp, ALUOut, negative, zero, overflow, carry_out); 
	alu AluB(dataA, dataB, ALUOp, ALUOut, negative, zero, overflow, carry_out); 
	alu AluC(dataA, dataB, ALUOp, ALUOut, negative, zero, overflow, carry_out); 
	
	
	datamem MEM(ALUOut,MemWrite,read_enable,write_data,clk,xfer_size,read_data	);

	instructmem (address,instruction,clk);