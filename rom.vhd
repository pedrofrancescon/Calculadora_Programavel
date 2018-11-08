library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom is
	port( clk : in std_logic;
		  endereco : in unsigned(15 downto 0);
		  dado : out unsigned(14 downto 0) --instrução
		);
end entity;

architecture a_rom of rom is
	type mem is array (0 to 2047) of unsigned(14 downto 0);
	constant conteudo_rom : mem := (
		0=> "000000000000000", -- NOP
		1=> "001001100000101", -- ADD reg3,5
		2=> "001010000001000", -- ADD reg4,8
		3=> "000101110000000", -- ADD reg3,reg4
		4=> "010110101100000", -- MOV reg5,reg3
		5=> "010010100000001", -- SUB reg5,1
		6=> "011000000010100", -- SWITCH 20
		20=> "010101110100000", -- MOV reg3,reg5
		21=> "011000000000011", -- SWITCH 3
		others => (others=>'0')
	);
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			dado <= conteudo_rom(to_integer(endereco));
		end if;
	end process;
end architecture;
