#include <iostream>
#include <ap_int.h>

void IFU(ap_uint<32> *Instruction_Code, ap_uint<1> reset);

int main(){
	ap_uint<32> Instruction_Code = 0;
	ap_uint<1> reset = 1;

	IFU(&Instruction_Code, reset);
	std::cout <<"Instruction Code: "<< std::hex << Instruction_Code << std::endl;

	reset = 0;
	IFU(&Instruction_Code, reset);
	std::cout <<"Instruction Code: "<< std::hex << Instruction_Code << std::endl;

	IFU(&Instruction_Code, reset);
	std::cout <<"Instruction Code: "<< std::hex << Instruction_Code << std::endl;

	return 0;
}
