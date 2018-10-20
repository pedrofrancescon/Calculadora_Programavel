library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity processador is
end entity;

architecture a_processador of a_processador is

    component pc
        port( clk: in std_logic;
    		  rst: in std_logic;
    		  wr_en: in std_logic;
    		  jump_en: in std_logic;
    		  data_in: in unsigned(15 downto 0); --proximo endereco pro jump
    		  data_out: out unsigned(15 downto 0) --endereco atual
    	);
   	end component;

   	component rom
    	port( clk : in std_logic;
		  	  endereco : in unsigned(15 downto 0);
		      dado : out unsigned(14 downto 0)
		);
    end component;

    component un_controle
        port(clk: in std_logic;
             rst: in std_logic;
             pc_wr_en: out std_logic;
             regs_wr_en: out std_logic;
             jump_en: out std_logic;
             opcode: in unsigned(3 downto 0)
        );
    end component;

    component decoder
    	port( instr : in unsigned(14 downto 0);
    		  opcode : out unsigned(3 downto 0);
              valor : out unsigned(15 downto 0);
              selReg1 : out unsigned(2 downto 0);
    		  selReg2 : out unsigned(2 downto 0)
    	);
    end component;

    component bank8regs
        port ( selOut1: in unsigned(2 downto 0);
    		   selOut2: in unsigned(2 downto 0);
    		   dataIn: in unsigned(15 downto 0);
    		   selIn: in unsigned(2 downto 0);
    		   wr_en: in std_logic;
    		   clk: in std_logic;
    		   rst: in std_logic;
    		   out1: out unsigned(15 downto 0);
    		   out2: out unsigned(15 downto 0)
    	);
    end component;

    component ula
        port(  entr0 : in unsigned(15 downto 0);
               entr1 : in unsigned(15 downto 0);
               sel : in unsigned(1 downto 0);
               result : out unsigned(15 downto 0);
               maiorIgual : out std_logic
        );
    end component;

    component mux16b_2in
        port(entr0 : in unsigned(15 downto 0);
             entr1 : in unsigned(15 downto 0);
             sel : in std_logic;
             saida : out unsigned(15 downto 0)
        );
    end component;


    signal DadoPcToRom : unsigned(15 downto 0); --falta um monte

begin

end architecture;
