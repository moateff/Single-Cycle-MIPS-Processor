#include <ap_int.h>

void INST_MEM(ap_uint<32> PC, ap_uint<32> *Instruction_Code, ap_uint<1> reset);

void IFU(ap_uint<32> *Instruction_Code, ap_uint<1> reset)
{
	static ap_uint<32> PC;
	if (reset)
		PC = 36;  //If reset is one, clear the program counter
	else
		PC = PC + 4;  // Increment program counter on positive clock edge

	INST_MEM (PC, Instruction_Code, reset);
}
