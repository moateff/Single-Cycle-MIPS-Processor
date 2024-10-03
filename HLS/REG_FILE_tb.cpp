#include <iostream>
#include <ap_int.h>

void REG_FILE (ap_uint<5> read_reg_num1, ap_uint<5> read_reg_num2, ap_uint<5> write_reg,
               ap_uint<32> write_data, ap_uint<32> *read_data1, ap_uint<32> *read_data2,
               ap_uint<1> regwrite, ap_uint<1> reset);

int main() {
    ap_uint<5> read_reg_num1 = 0, read_reg_num2 = 0, write_reg = 0;
    ap_uint<1> regwrite = 0, reset = 1;
    ap_uint<32> write_data = 0, read_data1 = 0, read_data2 = 0;

    // Perform reset
    REG_FILE(read_reg_num1, read_reg_num2, write_reg, write_data, &read_data1, &read_data2, regwrite, reset);

    // Disable reset
    reset = 0;

    // Set up a write operation
    regwrite = 1;
    write_reg = 0;
    write_data = 42; // Arbitrary data to write to the register

    read_reg_num1 = 0;
    read_reg_num2 = 25;
    // Write to register 0
    REG_FILE(read_reg_num1, read_reg_num2, write_reg, write_data, &read_data1, &read_data2, regwrite, reset);

    std::cout << "read_data1 =  " << read_data1 << ", read_data2 = " << read_data2 << std::endl;


    // Read from registers
    regwrite = 0; // Disable writing
    read_reg_num1 = 2;
    read_reg_num2 = 19;

    REG_FILE(read_reg_num1, read_reg_num2, write_reg, write_data, &read_data1, &read_data2, regwrite, reset);

    std::cout << "read_data1 = " << read_data1 << ", read_data2 = " << read_data2 << std::endl;

    return 0;
}
