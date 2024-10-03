#include <ap_int.h>

void CONTROL(ap_uint<7> funct7, ap_uint<3> funct3, ap_uint<7> opcode,
		ap_uint<4> *alu_control, ap_uint<1> *regwrite_control)
{
	if (opcode == 0b0110011){  // R-type instructions
		(*regwrite_control) = 1;

		switch(funct3){
			case 0:
				if(funct7 == 0)
					(*alu_control) = 0b0010; // ADD
                else if(funct7 == 32)
                	(*alu_control) = 0b0100; // SUB
				break;
			case 6: (*alu_control) = 0b0001; // OR
					break;
			case 7: (*alu_control) = 0b0000; // AND
					break;
			case 1: (*alu_control) = 0b0011; // SLL
					break;
			case 5: (*alu_control) = 0b0101; // SRL
					break;
			case 2: (*alu_control) = 0b0110; // MUL
					break;
			case 4: (*alu_control) = 0b0111; // XOR
					break;
			default:(*alu_control) = 0b1111; // NO OPERATION
					break;
		}
	}
}
