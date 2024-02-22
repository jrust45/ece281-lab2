--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2018 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : top_basys3.vhd
--| AUTHOR(S)     : C3C John Rust III
--| CREATED       : 02/20/2024 Last modified 02/22/2024
--| DESCRIPTION   : This file implements the test bench for sevenSegDecoder which tests the 
--|                 functionality of the code with various assert statements.
--|
--|					Inputs:  i_D (3:0)  --> 4-bit signal to deternmine 7SD value to be diplayed
--|
--|					Output:  o_S (6:0) --> 7-bit signal to activate the individual segments (active low)
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std
--|    Files     : sevenSegDecoder.vhd
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenSegDecoder_tb is
end sevenSegDecoder_tb;

architecture test_bench of sevenSegDecoder_tb is

component sevenSegDecoder is 
    Port ( i_D : in STD_LOGIC_VECTOR (3 downto 0);
           o_S : out STD_LOGIC_VECTOR (6 downto 0)
          );
    end component;
    
    signal w_iD : std_logic_vector (3 downto 0) := (others => '0');
    signal w_oS : std_logic_vector (6 downto 0) := (others => '0');
    
begin

    sevenSegDecoder_inst : sevenSegDecoder port map (
        i_D => w_iD,
        o_S => w_oS
    );

    test_process : process
    begin
        w_iD <= x"0"; wait for 10 ns;
            assert w_oS = "1000000" report "bad for 0x0" severity failure;
        w_iD <= x"1"; wait for 10 ns;
            assert w_oS = "1111001" report "bad for 0x1" severity failure;
        w_iD <= x"2"; wait for 10 ns;
             assert w_oS = "0100100" report "bad for 0x2" severity failure;
        w_iD <= x"3"; wait for 10 ns;
             assert w_oS = "0110000" report "bad for 0x3" severity failure;
        w_iD <= x"4"; wait for 10 ns;
             assert w_oS = "0011001" report "bad for 0x4" severity failure;
        w_iD <= x"5"; wait for 10 ns;
             assert w_oS = "0010010" report "bad for 0x5" severity failure;  
        w_iD <= x"6"; wait for 10 ns;
             assert w_oS = "0000010" report "bad for 0x6" severity failure;
        w_iD <= x"7"; wait for 10 ns;
             assert w_oS = "1111000" report "bad for 0x7" severity failure;
        w_iD <= x"8"; wait for 10 ns;
             assert w_oS = "0000000" report "bad for 0x8" severity failure;
        w_iD <= x"9"; wait for 10 ns;
             assert w_oS = "0011000" report "bad for 0x9" severity failure; 
        w_iD <= x"A"; wait for 10 ns;
             assert w_oS = "0001000" report "bad for 0xA" severity failure;  
        w_iD <= x"B"; wait for 10 ns;
             assert w_oS = "0000011" report "bad for 0xB" severity failure;
        w_iD <= x"C"; wait for 10 ns;
             assert w_oS = "0100111" report "bad for 0xC" severity failure;
        w_iD <= x"D"; wait for 10 ns;
             assert w_oS = "0100001" report "bad for 0xD" severity failure;
        w_iD <= x"E"; wait for 10 ns;
             assert w_oS = "0000110" report "bad for 0xE" severity failure;
        w_iD <= x"F"; wait for 10 ns;
             assert w_oS = "0001110" report "bad for 0xF" severity failure;
    wait;
    end process;
        
end test_bench;
