library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity un_controle is
	port(clk: in std_logic;
         rst: in std_logic;
		 pc_wr_en: out std_logic;
		 regs_wr_en: out std_logic;
         jump_en: out std_logic;
		 origemJump: out std_logic;
		 operacao: out unsigned(1 downto 0);
		 tipoOperacao: out std_logic; --R ou I
		 opcode: in unsigned(3 downto 0)
	);
end entity;

architecture a_un_controle of un_controle is

	component maquinaEst -- flipflop_T substituido por maquina de estados
	port( clk: in std_logic;
		  rst: in std_logic;
		  opcode : in unsigned(3 downto 0);
		  estado : out unsigned(1 downto 0)
	);
   	end component;

	signal estado: unsigned(1 downto 0);
    begin

    maqEstados: maquinaEst port map(clk=>clk, rst=>rst, opcode=>opcode, estado=>estado);

<<<<<<< HEAD
    jump_en <= '1' when opcode="0110" and estado="00" else --redefinir para cada estado
    '0';
=======
    jump_en <= '1' when (opcode="0110" or opcode="1110") --casos de jump a definir
	and estado="11" else '0';

>>>>>>> a58ea650cab112f17f174b5c03b7c51003266da2
    pc_wr_en <= '1' when estado="00" else
    '0';
	regs_wr_en <= '1' when estado="10" or estado="01"  else
    '0';
	origemJump <= '1' when opcode="0110" else
	'0';
	operacao <= "00" when opcode="0001" or opcode="0010" else --soma
	 			"01" when opcode="0011" or opcode="0100" else --subtracao
	 			"00";

	tipoOperacao <= '0' when estado="01" else --R
					'1' when estado="10" else --I
					'0';

end architecture;
