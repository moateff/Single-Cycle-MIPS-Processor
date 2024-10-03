#include <ap_int.h>

void REG_FILE (ap_uint<5> read_reg_num1, ap_uint<5> read_reg_num2, ap_uint<5> write_reg,
               ap_uint<32> write_data, ap_uint<32> *read_data1, ap_uint<32> *read_data2,
               ap_uint<1> regwrite, ap_uint<1> reset)
{
    static ap_uint<32> reg_memory[32]; // 32 locations, each location is 32 bits wide

    if (reset)
        for (int i = 0; i < 32; i++)
            reg_memory[i] = i;

    else if (regwrite)
        reg_memory[write_reg] = write_data; // Corrected the variable name

    (*read_data1) = reg_memory[read_reg_num1];
    (*read_data2) = reg_memory[read_reg_num2];
}
