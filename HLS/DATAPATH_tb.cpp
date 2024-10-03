#include <iostream>
#include <ap_int.h>

// Assuming DATAPATH is implemented somewhere
void DATAPATH (ap_uint<5> read_reg_num1, ap_uint<5> read_reg_num2, ap_uint<5> write_reg,
               ap_uint<4> alu_control, ap_uint<1> regwrite, ap_uint<1> reset, ap_uint<1>* zero_flag);
void REG_FILE (ap_uint<5>, ap_uint<5>, ap_uint<5>,
               ap_uint<32>, ap_uint<32> *, ap_uint<32> *,
               ap_uint<1> , ap_uint<1>);// REG_FILE function prototype

int main() {
    ap_uint<5> read_reg_num1, read_reg_num2, write_reg;
    ap_uint<4> alu_control;
    ap_uint<1> regwrite, reset, zero_flag;

    // Resetting the system
    reset = 1;
    DATAPATH(read_reg_num1, read_reg_num2, write_reg, alu_control, regwrite, reset, &zero_flag);

    // Reset complete
    reset = 0;
    read_reg_num1 = 10;
    read_reg_num2 = 5;
    regwrite = 1;  // Enable writing
    alu_control = 2;
    write_reg = 15;

    DATAPATH(read_reg_num1, read_reg_num2, write_reg, alu_control, regwrite, reset, &zero_flag);

    regwrite = 0;
    ap_uint<32> read_data1, read_data2;
    // Correct arguments for REG_FILE function call
    REG_FILE(15, 20, 0, 0, &read_data1, &read_data2, regwrite, reset);

    // Output result
    std::cout << "READ_OUT_1: " << read_data1 << ", READ_OUT_2: " << read_data2 << ", Zero_Flag: " << zero_flag <<std::endl;

    return 0;
}
