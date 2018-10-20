library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity un_controle is
	port(clk: in std_logic;
         rst: in std_logic;
		 pc_wr_en: out std_logic;
		 regs_wr_en: out std_logic;
         jump_en: out std_logic;
		 opcode: in unsigned(3 downto 0)
	);
end entity;

architecture a_un_controle of un_controle is

	component maqEstados -- flipflop_T substituido por maquina de estados
	port( clk: in std_logic;
		  rst: in std_logic;
		  opcode : in unsigned(4 downto 0);
		  estado : out unsigned(1 downto 0)
	);
   	end component;

	signal estado: unsigned(1 downto 0);
    begin

    maqEstados: maqEstados port map(clk=>clk, rst=>rst, opcode=>opcode, estado=>estado);

    jump_en <= '1' when opcode="11111" else --redefinir para cada estado
    '0';
    pc_wr_en <= '1' when estado='0' else
    '0';
	regs_wr_en <= '1' when opcode="11111" else
    '0';

end architecture;
