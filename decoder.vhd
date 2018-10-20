library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is
	port( instr : in unsigned(14 downto 0);
		  opcode : out unsigned(3 downto 0);
          valor : out unsigned(15 downto 0);
          selReg1 : out unsigned(2 downto 0);
		  selReg2 : out unsigned(2 downto 0)
		);
end entity;

architecture a_decoder of decoder is
begin
	opcode <= instr(14 downto 11);
	valor <= instr(7 downto 0);
	selReg2 <= instr(10 downto 8);
	selReg1 <= instr(7 downto 5);
end architecture;
