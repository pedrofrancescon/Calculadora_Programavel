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
      	-- caso endereco => conteudo
		0=> "000000000000000",
		1=> "001001100000101",
		2=> "001001000001000",
		3=> "000101110000000",
		4=> "010110101100000",
		5=> "010010100000001",
		6=> "011000000010100",
		20=> "010101110100000",
		21=> "011000000000011",
		--7=> "00000000000000000000000000001000",
		--8=> "00000000000000000000000000001001",
		--9=> "00000000000000000000000000001010",
		--10=> "00000000000000000000000000001011",
		-- abaixo: casos omissos => (zero em todos os bits)
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
