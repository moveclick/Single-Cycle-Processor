`timescale 1ns / 1ps

module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);
    output [63:0] BusA;
    output [63:0] BusB;
    input [63:0] BusW;
    input [4:0] RW;
    input [4:0] RA;
    input [4:0] RB;
    input RegWr;
    input Clk;
    reg [63:0] registers [31:0];
    
    //Continously assignment of BusA and BusB on the contents of the registers defined by RA and RB
    assign #2 BusA = registers[RA];
    assign #2 BusB = registers[RB];
    
    //Initialize register 31 to 0
    initial begin
		registers[31] = 0;
	end
		
    //At negative Clk edge, and if RegWr is 1 and the register being written to isnt 31, write to the specified register
    always @ (negedge Clk) begin
        if(RegWr && (RW != 31))
            registers[RW] <= #3 BusW;
    end

endmodule
