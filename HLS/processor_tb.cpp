#include <iostream>
#include <ap_int.h>

void processor(ap_uint<1> *, ap_uint<1>);
void REG_FILE (ap_uint<5>, ap_uint<5>, ap_uint<5>,
               ap_uint<32>, ap_uint<32> *, ap_uint<32> *,
               ap_uint<1> , ap_uint<1>);

int main(){
	ap_uint<1> zero_flag;
	processor(&zero_flag, 1);
	processor(&zero_flag, 0);

	ap_uint<32> data1, data2;
	REG_FILE (0, 0, 0, 0, &data1, &data2,0,0);

	std::cout<<"result: "<< data1 <<std::endl;
	return 0;
}
