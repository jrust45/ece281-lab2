----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 01:23:01 PM
-- Design Name: 
-- Module Name: sevenSegDecoder_tb - Behavioral
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
