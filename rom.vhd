library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity rom is
	port( clk : in std_logic;
		  endereco : in unsigned(15 downto 0);
		  dado : out unsigned(14 downto 0)
		);
end entity;

architecture a_rom of rom is
	type mem is array (0 to 100) of unsigned(14 downto 0); 
	constant conteudo_rom : mem := (
      	-- caso endereco => conteudo
		0=> "010101101100000",
		1=> "010101101100000",
		2=> "010101101100000",
		3=> "010101101100000",
		4=> "010101101100000",
		--5=> "00000000000000000000000000000011",
		--6=> "00000000000000000000000000000111",
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