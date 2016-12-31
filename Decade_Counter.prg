-- /SBA: Program Details =======================================================
-- Program: Decade Counter
-- Version: 0.1.1
-- Date: 2016/12/26
-- Author: Miguel A. Risco Castillo
-- Description: 16 bits decade counter
-- /SBA: End Program Details ---------------------------------------------------

-- /SBA: User Registers and Constants ==========================================

  variable Dlytmp  : unsigned(21 downto 0);      -- Delay 22 bit register
  variable count   : unsigned(15 downto 0);      -- Counter

-- /SBA: End User Registers and Constants --------------------------------------

-- /SBA: User Program ==========================================================

=> SBAjump(Init);

-------------------------------- ROUTINES ---------------------------------------
-- /L:Delay
=> if Dlytmp/=0 then
     dec(Dlytmp);
     SBAjump(Delay);
   else
     SBARet;
   end if;
------------------------------ MAIN PROGRAM ------------------------------------

-- /L:Init
=> count:=(others=>'0');

-- /L:LoopCount

=> SBAWrite(DSPLY,count);
=> inc(count);

=> for i in 0 to 2 loop                        -- Decade counter
     if count(3+4*i downto 0+4*i)="1010" then  -- is nibble x"A"?
       inc(count(7+4*i downto 4+4*i));         -- increment next nibble
       count(3+4*i downto 0+4*i):="0000";      -- and clear
     end if;
   end loop;
   if count(15 downto 12)="1010" then          -- is last nible x"A"
     count:=(others=>'0');                     -- clear all
   end if;

=> Dlytmp := (others=>'1');
   SBACall(Delay);

=> SBAjump(LoopCount);

-- /SBA: End User Program ------------------------------------------------------
