library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.All;

entity Lab2Part4 is
GENERIC(N:INTEGER:=31);
Port(
Clock: IN STD_LOGIC;
SW:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
KEY: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
LED: OUT STD_LOGIC
);
end entity lab2part4;

architecture behavioural of Lab2part4 is
signal Q1,Q2: STD_LOGIC_VECTOR(N-1 downto 0);
signal count1,count2,countA,countB,countC,countD,countE,countF,countG,countH:STD_LOGIC_VECTOR(N-1 downto 0):=(OTHERS=>'0');
SIGNAL ENABLE:std_logic;
Signal flag,jhenda:std_logic;
signal count3:STD_LOGIC_VECTOR(29 downto 0):=(OTHERS=>'0');
signal s:STD_LOGIC_vector(1 downto 0);
begin

process(key(1),key(0),clock,SW)
VARIABLE RST: STD_LOGIC;
begin
if((key(0)='1' and key(1)='0' and flag='0') OR RST='1') then
count1<=(OTHERS=>'0');
count2<=(OTHERS=>'0');
LED<='0';
RST:='0';
jhenda<= '0';
count3<=(OTHERS=>'0');
s <= "00";
flag<= '1';
elsif(rising_edge(clock)) then
   if(key(2) = '0') then 
	jhenda <= '1';
	end if;
	if(key(1) = '0') then
      Led <= '0';
	   s<= "00";
	   jhenda <= '0';
	elsif(jhenda='1' and s=0) then
	   if((count3<=25000000) or (count3>50000000 and count3<= 75000000) or (count3>100000000 and count3<= 125000000) ) then
		count3 <= count3+1;
		LED<= '1';
		elsif((count3>25000000 and count3<= 50000000) or (count3>75000000 and count3<= 100000000) or (count3>125000000 and count3< 150000000))then
		LED<= '0';
		count3 <= count3 +1;
		elsif(count3 = 150000000)then
		count3<=(OTHERS=>'0');
		s <= "01";
	   end if;
	elsif(jhenda = '1' and s=1) then
      if((count3<=75000000) or (count3>100000000 and count3<= 175000000) or (count3>200000000 and count3<= 275000000) ) then
		count3 <= count3+1;
		LED<= '1';
		elsif((count3>75000000 and count3<= 100000000) or (count3>175000000 and count3<= 200000000) or (count3>275000000 and count3< 300000000))then
		LED<= '0';
		count3 <= count3 +1;
		elsif(count3 = 300000000)then
		count3<=(OTHERS=>'0');
		s <= "10";
	   end if;
	elsif(jhenda = '1' and s=2 ) then
		if((count3<=25000000) or (count3>50000000 and count3<= 75000000) or (count3>100000000 and count3<= 125000000) ) then
		count3 <= count3+1;
		LED<= '1';
		elsif((count3>25000000 and count3<= 50000000) or (count3>75000000 and count3<= 100000000) or (count3>125000000 and count3< 150000000))then
		LED<= '0';
		count3 <= count3 +1;
		elsif(count3 = 150000000)then
		count3<=(OTHERS=>'0');
		s <= "00";
	   end if;		
	elsif(key(0)='0' and key(1)='1') then
	ENABLE<='1';
	flag <= '0';
	count3<=(OTHERS=>'0');
	jhenda<= '0';
	end if;

if(flag='0')then
IF(eNABLE='1') THEN
if(count1 <25000000) then
	if((SW="000" and countA=0) OR (SW="001" and (countB=2 or countB=4 OR countB=6)) OR (SW="010" and (countC=2 or countC=6)) OR (SW="011" and (countD=2 or countD=4)) OR (SW="100" and countE=0) OR (SW="101" and (countF=0 or countF=2 or countF=6)) OR (SW="110" and countG=4) OR (SW="111" and (countH=0 or countH=2 or countH=4 OR countH=6))) then
	count1<=count1+1;
	LED<='1';
	end if;
	if((SW="000" and countA=1) OR (SW="001" and (countB=1 or countB=3 OR countB=5)) OR (SW="010" and (countC=1 or countC=3 or countC=5)) OR (SW="011" and (countD=1 or countD=3)) OR (SW="101" and (countF=1 or countF=3 or countF=5)) OR (SW="110" and (countG=1 or countG=3)) OR (SW="111" and (countH=1 or countH=3 or countH=5))) then
	count1<=count1+1;
	LED<='0';
	end if;	
end if;
	
if(count1=25000000) then
	count1<=(OTHERS=>'0');
	if(SW="000") then
	countA<=countA+1;
	elsif(SW="001") then
	countB<=countB+1;
	elsif(SW="010") then
	countC<=countC+1;
	elsif(SW="011") then
	countD<=countD+1;
	elsif(SW="100") then
	countE<=countE+1;
	elsif(SW="101") then
	countF<=countF+1;
	elsif(SW="110") then
	countG<=countG+1;
	elsif(SW="111") then
	countH<=countH+1;
	end if;
end if;

if(count2<75000000) then
	if((SW="000" and countA=2) OR (SW="001" and (countB=0)) OR (SW="010" and (countC=0 OR countC=4)) OR (SW="011" and (countD=0)) OR (SW="101" and (countF=4)) OR (SW="110" and (countG=0 OR countG=2))) then
	count2<=count2+1;
	LED<='1';
	end if;
end if;

if(count2=75000000) then
	count2<=(OTHERS=>'0');
	if(SW="000") then
	countA<=countA+1;
	elsif(SW="001") then
	countB<=countB+1;
	elsif(SW="010") then
	countC<=countC+1;
	elsif(SW="011") then
	countD<=countD+1;
	elsif(SW="100") then
	countE<=countE+1;
	elsif(SW="101") then
	countF<=countF+1;
	elsif(SW="110") then
	countG<=countG+1;
	elsif(SW="111") then
	countH<=countH+1;
	end if;
end if;

if(countA=3) then
	countA<=(OTHERS=>'0');
	count1<=(others=>'0');
	count2<=(others=>'0');
	ENABLE<='0';
	rst:='1';
	elsif(countB=7) then
	countB<=(OTHERS=>'0');
	count1<=(others=>'0');
	count2<=(others=>'0');
	ENABLE<='0';
	rst:='1';
	elsif(countC=7) then
	countC<=(OTHERS=>'0');
	count1<=(others=>'0');
	count2<=(others=>'0');
	ENABLE<='0';
	rst:='1';
	elsif(countD=5) then
	countD<=(OTHERS=>'0');
	count1<=(others=>'0');
	count2<=(others=>'0');
	ENABLE<='0';
	rst:='1';
	elsif(countE=1) then
	countE<=(OTHERS=>'0');
	count1<=(others=>'0');
	count2<=(others=>'0');
	ENABLE<='0';
	rst:='1';
	elsif(countF=7) then
	countF<=(OTHERS=>'0');
	count1<=(others=>'0');
	count2<=(others=>'0');
	ENABLE<='0';
	rst:='1';
	elsif(countG=5) then
	countG<=(OTHERS=>'0');
	count1<=(others=>'0');
	count2<=(others=>'0');
	ENABLE<='0';
	rst:='1';
	elsif(countH=7) then
	countH<=(OTHERS=>'0');
	count1<=(others=>'0');
	count2<=(others=>'0');
	ENABLE<='0';
	rst:='1';
	flag <= '1';
end if;
Q1<=count1;
Q2<=count2;
end if;
end if;
end if;
end process;


end behavioural;