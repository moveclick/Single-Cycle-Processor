module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 
   input [63:0] CurrentPC, SignExtImm64; 
   input 	Branch, ALUZero, Uncondbranch; 
   output reg [63:0] NextPC; 

   //If any of the variables change
   always @(*)
     begin
      //Check if there is a branch and add the address accordingly
	if ((ALUZero & Branch) | Uncondbranch) NextPC = CurrentPC + SignExtImm64;
	//Otherwise, increment the PC by 4
	else NextPC = CurrentPC + 3'b100;
     end

endmodule
