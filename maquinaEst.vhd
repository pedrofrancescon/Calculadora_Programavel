library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maquinaEst is
	port( clk: in std_logic;
		  rst: in std_logic;
		  opcode : in unsigned(4 downto 0);
 	  	  estado : out unsigned(1 downto 0)
	);
end entity;

architecture a_maquinaEst of maquinaEst is
	signal estado_s : unsigned(1 downto 0);
begin
 process(clk,rst)
  begin
 	if rst='1' then
 		estado_s <= "00";
 	elsif rising_edge(clk) then
	 	case estado_s is
		 	when "00" => -- fetch
		 		if opcode="00000" then
		 			estado_s <= "01";
		 		else
		 			estado_s <= "10";
		 		end if;
		 	when "01" => -- decode_R
		 		estado_s <= "11";
			when "10" => -- decode_I
		 		estado_s <= "11";
		 	when "11" => -- execute
		 		estado_s <= "00";
		 	when others => -- cobre casos como "UU" ou "XX"
		 		null;
	 	end case;
 	end if;
 end process;
 estado <= estado_s;
end architecture;
