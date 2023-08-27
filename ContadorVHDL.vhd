library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ContadorVHDL is
	port( C: buffer integer range 0 to 9;
			D: buffer integer range 0 to 9;
			U: buffer integer range 0 to 9;
			CP: in integer range 0 to 9;
			RST, STR, CLK: in std_logic);
end entity;

architecture BEAS of ContadorVHDL is
begin

process(CLK,RST,STR)
begin
	if rising_edge(CLK) then
		IF RST= '0' THEN
			C<=0; D<=0; U<=0;
		ELSIF STR = '0' THEN
			C<=C; D<=D; U<=U;
		ELSE
		
		if U = 9 then
			U <= 0;
			if D = 9 then
				D <= 0;
				if C = CP then
					C <= 0;
				else
					C<= C+1;
					D <= 0; U <=0;
				end if;
			else
				D<= D+1;
				U <= 0;
			end if;
		else
			U<= U+1;
		end if;
	end if;
end if;
end process;
end BEAS;