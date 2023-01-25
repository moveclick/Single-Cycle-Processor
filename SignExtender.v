module SignExtender(BusImm, Imm, Ctrl); 
   output [63:0] BusImm; 
   input [25:0]  Imm; 
   input [2:0]	 Ctrl; 

   reg 	 [63:0]	 res;
   assign BusImm[63:0] = res[63:0];

   always@(*)
     case(Ctrl)
       3'b000:
	 //I Format
	 res = {{52{1'b0}}, Imm[21:10]};
        
       3'b001:
	 //D format
	 res = {{55{Imm[20]}}, Imm[20:12]};
         
       3'b010:
	 //B format
	 res = {{36{Imm[25]}}, Imm[25:0], 2'b0};
         
       3'b011:
	 //CB format
	 res = {{43{Imm[23]}}, Imm[23:5], 2'b0};
	 
       3'b100:
	 //Shift 0
	 res = {48'b0, Imm[20:5]};
	 
       3'b101:
	 //Shift 16
	 res = {32'b0, Imm[20:5], 16'b0};
	 
       3'b110:
	 //Shift 32
	 res = {16'b0, Imm[20:5], 32'b0};
	 
       3'b111:
	 //Shift 48
	 res = {Imm[20:5], 48'b0};
	 
      
     endcase // case (Ctrl)
     
endmodule
