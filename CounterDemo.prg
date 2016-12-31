-- /SBA: Program Details -------------------------------------------------------
--
-- Project Name: Counter
-- Title: Simple counter demo for SBA
-- Version: 0.1.1
-- Date: 2015/06/20
-- Author: Miguel A. Risco-Castillo
-- Description: This demo implement a simple 16bits counter, the output of the 
-- counter is shown in a four digits display.
-- 
-- /SBA: End -------------------------------------------------------------------

-- /SBA: User Registers and Constants ------------------------------------------
  variable count   : unsigned(15 downto 0);
  variable Dlytmp  : unsigned(23 downto 0);      -- Delay 16 bit register

-- /SBA: End -------------------------------------------------------------------

-- /SBA: User Program ----------------------------------------------------------

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
=> clr(count);

-- /L:CounterLoop
=> SBAWrite(D7S_S,count);
   Dlytmp:=(others=>'1');
   SBACall(Delay);
=> inc(count);
   SBAJump(CounterLoop);

-- /SBA: End -------------------------------------------------------------------
