#include <iostream>
#include <ap_int.h>
void INST_MEM(ap_uint<32> PC, ap_uint<32> *Instruction_Code, ap_uint<1> reset);

int main()
{
	ap_uint<32> PC = 4;
	ap_uint<32> Instruction_Code = 0;
	ap_uint<1> reset;

	reset = 1;
	INST_MEM(PC, &Instruction_Code, reset);
	std::cout <<"Instruction Code: "<< std::hex << Instruction_Code << std::endl;

	reset = 0;
	INST_MEM(PC, &Instruction_Code, reset);
	std::cout <<"Instruction Code: "<< std::hex << Instruction_Code << std::endl;

	return 0;
}
