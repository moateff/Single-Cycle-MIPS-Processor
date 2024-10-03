#include <ap_int.h>

// Byte addressable memory with 32 locations
static ap_uint<8> Memory[32];

// Function to handle instruction memory
void INST_MEM(ap_uint<32> PC, ap_uint<32> *Instruction_Code, ap_uint<1> reset)
{
    if (reset)
    {
        // Initialize memory with predefined 32-bit instructions
        Memory[3]  = 0x00;
        Memory[2]  = 0x94;
        Memory[1]  = 0x03;
        Memory[0]  = 0x33;  // add t1, s0, s1 => 0x00940333

        Memory[7]  = 0x41;
        Memory[6]  = 0x39;
        Memory[5]  = 0x03;
        Memory[4]  = 0xb3;  // sub t2, s2, s3 => 0x413903b3

        Memory[11] = 0x03;
        Memory[10] = 0x5a;
        Memory[9]  = 0x02;
        Memory[8]  = 0xb3;  // mul t0, s4, s5 => 0x035a02b3

        Memory[15] = 0x01;
        Memory[14] = 0x7b;
        Memory[13] = 0x4e;
        Memory[12] = 0x33;  // xor t3, s6, s7 => 0x017b4e33

        Memory[19] = 0x01;
        Memory[18] = 0x9c;
        Memory[17] = 0x1e;
        Memory[16] = 0xb3;  // sll t4, s8, s9 => 0x019c1eb3

        Memory[23] = 0x01;
        Memory[22] = 0xbd;
        Memory[21] = 0x5f;
        Memory[20] = 0x33;  // srl t5, s10, s11 => 0x01bd5f33

        Memory[27] = 0x00;
        Memory[26] = 0xd6;
        Memory[25] = 0x7f;
        Memory[24] = 0xb3;  // and t6, a2, a3 => 0x00d67fb3

        Memory[31] = 0x00;
        Memory[30] = 0xf7;
        Memory[29] = 0x68;
        Memory[28] = 0xb3;  // or a7, a4, a5 => 0x00f768b3

        Memory[43] = 0x00;
		Memory[42] = 0x32;
		Memory[41] = 0x00;
		Memory[40] = 0x33;  // add 16 + 2 and store in reg location 31
    }
    // Read 32-bit instruction from memory
	(*Instruction_Code) = ((ap_uint<32>)Memory[PC + 3] << 24 )|
					   	  ((ap_uint<32>)Memory[PC + 2] << 16 )|
						  ((ap_uint<32>)Memory[PC + 1] << 8 )|
						  ((ap_uint<32>)Memory[PC]);
}
