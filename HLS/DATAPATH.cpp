#include <ap_int.h>
void ALU (ap_uint<32>, ap_uint<32>, ap_uint<4>, ap_uint<32> *, ap_uint<1> *,ap_uint<1>);  // ALU function prototype
void REG_FILE (ap_uint<5>, ap_uint<5>, ap_uint<5>,
               ap_uint<32>, ap_uint<32> *, ap_uint<32> *,
               ap_uint<1> , ap_uint<1>); // REG_FILE function prototype

void DATAPATH (ap_uint<5> read_reg_num1, ap_uint<5> read_reg_num2, ap_uint<5> write_reg,
		ap_uint<4> alu_control, ap_uint<1> regwrite, ap_uint<1> *zero_flag, ap_uint<1> reset)
{
	ap_uint<32> read_data1, read_data2, write_data;

	REG_FILE(read_reg_num1, read_reg_num2, write_reg, write_data, &read_data1, &read_data2, regwrite, reset);
	ALU (read_data1, read_data2, alu_control, &write_data, zero_flag, reset);
	REG_FILE(read_reg_num1, read_reg_num2, write_reg, write_data, &read_data1, &read_data2, regwrite, reset);
}
