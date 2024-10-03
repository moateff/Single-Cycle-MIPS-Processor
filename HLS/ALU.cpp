#include <ap_int.h>

void ALU (ap_uint<32> a_in, ap_uint<32> b_in, ap_uint<4> alu_control, ap_uint<32> *alu_result, ap_uint<1> *zero_flag, ap_uint<1> reset){
	#pragma HLS PIPELINE
	if(reset){
		(*alu_result) = 0;
		(*zero_flag) = 1;
	}
	else{
		switch(alu_control){
			case 0: (*alu_result) = a_in&b_in; break;
			case 1: (*alu_result) = a_in|b_in; break;
			case 2: (*alu_result) = a_in+b_in; break;
			case 4: (*alu_result) = a_in-b_in; break;
			case 8: (*alu_result) = (a_in<b_in)? 1 : 0; break;
			case 3: (*alu_result) = a_in<<b_in; break;
			case 5: (*alu_result) = a_in>>b_in; break;
			case 6: (*alu_result) = a_in*b_in; break;
			case 7: (*alu_result) = a_in^b_in; break;
			default: (*alu_result) = 0; break;
		}
		(*zero_flag) = (*alu_result == 0)? 1 : 0;
	}
}
