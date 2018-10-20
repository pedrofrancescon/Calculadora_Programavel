library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula is
 port( entr0 : in unsigned(15 downto 0);
 	   entr1 : in unsigned(15 downto 0);
 	   sel : in unsigned(1 downto 0);
 	   result : out unsigned(15 downto 0);
 	   maiorIgual : out std_logic );
end entity;

architecture a_ula of ula is
begin
 			 result <= entr0+entr1 when sel = "00" else
 			 		   entr0-entr1 when sel = "01" else
 			 		   entr0 and entr1 when sel = "10" else
 			 		   entr0 or entr1 when sel = "11" else
 			 		  "0000000000000000"; -- saida 16 bits -> 16 zeros

 			 maiorIgual <= '1' when entr0 > entr1 else
 			 			   '0';
end architecture;
