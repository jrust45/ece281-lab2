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
--| DESCRIPTION   : This file implements the test bench for top_basys3. Has not been finished since
--|                 it was not required by the lab website itself.
--|
--|					Inputs:  sw (3:0)  --> 4-bit signal to deternmine 7SD value to be diplayed
--|							 btnC	   --> activate 7SD
--|
--|					Output:  seg (6:0) --> 7-bit signal to activate the individual segments (active low)
--|							 an (3:0)  --> 4-bit signal to control which display turns on (active low)
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

entity top_basys3_tb is
end top_basys3_tb;

architecture test_bench of top_basys3_tb is

component top_basys3 is
    Port ( seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           btnC : in STD_LOGIC
         );
     end component;

    signal w_seg : std_logic_vector (6 downto 0) := (others => '0');
    signal w_an : std_logic_vector (3 downto 0) := (others => '0');
    signal w_sw : std_logic_vector (3 downto 0) := (others => '0');
    signal w_btnC : std_logic := '0';
begin

    top_basys3_inst : top_basys3 port map (
        seg => w_seg,
        an => w_an,
        sw => w_sw,
        btnC => w_btnC
    );
    
    --test_process : process
    --begin
    
    --would do the asserts() in here
    --not sure if top level test bench is actually needed, so this is why this is commented out.
    
    --wait;
    --end process;
    
end test_bench;
