----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 01:25:53 PM
-- Design Name: 
-- Module Name: top_basys3_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


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
