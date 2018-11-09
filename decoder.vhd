library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is
	port( instr: in unsigned(14 downto 0);
		  opcode: out unsigned(3 downto 0);
          valor: out unsigned(15 downto 0);
          selReg1: out unsigned(2 downto 0);
		  selReg2: out unsigned(2 downto 0);
		  endereco: out unsigned(15 downto 0)
		);
end entity;

architecture a_decoder of decoder is
	
	signal opcode_s: unsigned(3 downto 0);

	begin

	opcode_s <= instr(14 downto 11);

	-- sinais para reutilizar os sinais de saida em outras saidas (?)

	opcode <= opcode_s;
	valor <= "00000000" & instr(7 downto 0);
	selReg2 <= instr(2 downto 0) when opcode_s="0110" else 
			   instr(10 downto 8);
	selReg1 <= instr(7 downto 5);
	endereco <=  "00000" & instr(10 downto 0) when opcode_s="0110" else
	"0000000000000000"; --inserir endereco por registrador when opcode="XXXX" else --depois de redefinir nossos jumps, trocar por calculo de endereço relativo

end architecture;
