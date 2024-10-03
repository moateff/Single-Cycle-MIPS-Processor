#include <iostream>
#include <bitset>
#include <ap_int.h>

void CONTROL(ap_uint<7> funct7, ap_uint<3> funct3, ap_uint<7> opcode,
		ap_uint<4> *alu_control, ap_uint<1> *regwrite_control);

int main(){
	ap_uint<7> funct7 = 0, opcode = 0b0110011;
	ap_uint<3> funct3 = 0;
	ap_uint<4> alu_control;
	ap_uint<1> regwrite_control;

	CONTROL(funct7, funct3, opcode, &alu_control, &regwrite_control);

	std::cout <<"ALU Control: "<< std::bitset<4>(alu_control) <<" Write Control: "<< regwrite_control<< std::endl;

	return 0;
}
