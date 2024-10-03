#include <ap_int.h>
#include <bitset>
void IFU(ap_uint<32> *Instruction_Code, ap_uint<1> reset);

void CONTROL(ap_uint<7> funct7, ap_uint<3> funct3, ap_uint<7> opcode,
		ap_uint<4> *alu_control, ap_uint<1> *regwrite_control);

void DATAPATH (ap_uint<5> read_reg_num1, ap_uint<5> read_reg_num2, ap_uint<5> write_reg,
		ap_uint<4> alu_control, ap_uint<1> regwrite, ap_uint<1> *zero_flag, ap_uint<1> reset);

void processor(ap_uint<1> *zero_flag, ap_uint<1> reset)
{
	static ap_uint<32> Instruction_Code;
	static ap_uint<4> alu_control;
	static ap_uint<1> regwrite;

	IFU(&Instruction_Code, reset);
	//std::cout << "Instruction: " << std::hex << Instruction_Code << std::endl;

	ap_uint<7> opcode = (Instruction_Code & 0x0000007f);
	ap_uint<5> write_reg = ((Instruction_Code >> 7) & 0x0000001f);
	ap_uint<3> funct3 = ((Instruction_Code >> 12) & 0x0000007);
	ap_uint<5> read_reg_num1 = ((Instruction_Code >> 15) & 0x0000001f);
	ap_uint<5> read_reg_num2 = ((Instruction_Code >> 20) & 0x0000001f);
	ap_uint<7> funct7 = ((Instruction_Code >> 25) & 0x0000007f);

	CONTROL(funct7, funct3, opcode, &alu_control, &regwrite);

	DATAPATH (read_reg_num1, read_reg_num2, write_reg, alu_control, regwrite, zero_flag, reset);
}
