#include <iostream>
#include <ap_int.h>
#include "ALU.h"

int main(){
	ap_int<32> a_in, b_in;
	ap_uint<4> alu_control;
	ap_int<32> alu_result;
	ap_uint<1> zero_flag;
	ap_uint<1> reset;

    // Initialize inputs
    a_in = 10;
    b_in = 3;
	std::cout << "INPUTS: in1 = " << a_in << ", in2 = " << b_in << std::endl;

	reset = 1;
	// Test reset
	alu_control = 3;
	ALU(reset, a_in, b_in, alu_control, &alu_result, &zero_flag);
	std::cout << "MUL result: " << alu_result << ", Zero Flag: " << zero_flag << std::endl;

	reset = 0;

    // Test MUL operation
    alu_control = 6;
    ALU(reset, a_in, b_in, alu_control, &alu_result, &zero_flag);
	std::cout << "ALU result: " << alu_result << ", Zero Flag: " << zero_flag << std::endl;

	// Test ADD operation
    alu_control = 2;
    ALU(reset, a_in, b_in, alu_control, &alu_result, &zero_flag);
	std::cout << "ADD result: " << alu_result << ", Zero Flag: " << zero_flag << std::endl;

	// Test AND operation
    alu_control = 0;
    ALU(reset, a_in, b_in, alu_control, &alu_result, &zero_flag);
	std::cout << "AND result: " << alu_result << ", Zero Flag: " << zero_flag << std::endl;

	// Test LESS operation
    alu_control = 8;
    ALU(reset, a_in, b_in, alu_control, &alu_result, &zero_flag);
	std::cout << "LESS result: " << alu_result << ", Zero Flag: " << zero_flag << std::endl;
    return 0;
}
