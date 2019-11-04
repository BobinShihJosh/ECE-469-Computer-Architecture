module OPdecode(OPID, instr);
	input logic [3:0] OPID;
	input logic [31:0] instr;
	
	logic [11:0]Imm12;
	logic [25:0]Imm26;
	logic [18:0]Imm19;
	logic [8:0] Imm9;
	logic [4:0] Rn, Rd.Rm;
	
	
	assign enable = 1'b1;
	
	
	always_comb begin 
		if(OPID == 4'b0001) begin //ADDI
			Imm12 = instr [21:10];
			Rn = instr [9:5];
			Rd = instr [4:0];
		end 
		else if (OPID == 4'b0010)begin //ADDS
			Rm = instr [20:16];
			Rn = instr [9:5];
			Rd = instr [4:0];
			setFlag = enable; 
		 
		end
		else if (OPID == 4'b0011) begin //B IMM26
			Imm26 = instr[25:0];
		end
		else if (OPID == 4'b0100) begin //B.LT Imm19
			Imm19 = instr[23:5];
		end 
		else if (OPID == 4'b0101) begin //BL Imm26
			Imm26 = instr[25:0];
		end 
		else if (OPID == 4'b0110) begin // BR Rd
			
		end 
		else if (OPID == 4'b0111) begin //CBZ Rd, Imm19
			Imm19 = instr[23:5];
		end 
		else if (OPID == 4'b1000) begin //LDUR Rd
			Imm9 = instr[20:12];
			Rn = instr[9:5];
			Rd = instr[5:0];
		end 
		else if (OPID == 4'b1001) begin //STUR Rd
			Imm9 = instr[20:12];
			Rn = instr[9:5];
			Rd = instr[5:0];
		end
		else if (OPID == 4'b1010) begin //SUBS Rd
			Rm = instr [20:16];
			Rn = instr [9:5];
			Rd = instr [4:0];
			setFlag = enable; 		
			end 
		else begin 
		end 
	end 