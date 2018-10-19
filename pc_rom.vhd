library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_rom is
	port( clk: in std_logic;
		  rst: in std_logic;
		  jump: in std_logic;
		  wr_en: in std_logic;
		  data_in: in unsigned(15 downto 0); --endereço do jump
		  data_out: out unsigned(14 downto 0)
	);
end entity;

architecture a_pc_rom of pc_rom is

	component pc16bits
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

    signal data_s: unsigned(15 downto 0);

    begin

    	readonlymemory: rom port map ( clk => clk,
		   					 	 endereco => data_s,
							 	 dado => data_out
							   );

    	pc: pc16bits port map ( clk => clk,
		   						rst => rst,
								jump_en => jump,
								wr_en => wr_en,
								data_in => data_in,
								data_out => data_s
						   	  );

end architecture;
