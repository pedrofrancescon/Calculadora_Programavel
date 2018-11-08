library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula is
 port( entr0 : in unsigned(15 downto 0);
 	   entr1 : in unsigned(15 downto 0);
 	   sel : in unsigned(1 downto 0);
 	   result : out unsigned(15 downto 0);
 	   maiorIgual : out std_logic ;
       --flags status do programa PSW
       CY: out std_logic; --se deu carry é 1
       OV: out std_logic; --se deu overflow é 1
       S: out std_logic; --0 se o resultado é positivo, 1 se negativo
       Z: out std_logic ); --o famoso que quando é zero o zero é um
end entity;

architecture a_ula of ula is
begin
<<<<<<< HEAD
 			 result <= entr0+entr1 when sel = "00" else
 			 		   entr1-entr0 when sel = "01" else
 			 		   entr0 and entr1 when sel = "10" else
 			 		   entr0 or entr1 when sel = "11" else
=======
 			result <= entr0+entr1 when sel = "00" else
 			 		  entr0-entr1 when sel = "01" else
 			 		  entr0 and entr1 when sel = "10" else
 			 		  entr0 or entr1 when sel = "11" else
>>>>>>> a58ea650cab112f17f174b5c03b7c51003266da2
 			 		  "0000000000000000"; -- saida 16 bits -> 16 zeros

 			maiorIgual <= '1' when entr0 > entr1 else
 			'0';
            Z <= '1' when result = "0000000000000000" else --não tenho certeza mas acho que tem que criar um circuitos pras operações dependerem dessas flags
            '0';
            S <= '1' when result(15 downto 15) = "1" else
            '0';
            OV <= '1' when entr0(15 downto 15)="1" and entr1(15 downto 15)="1" else
            '0';
            CY <= '1' when OV='1' else '0';
end architecture;
