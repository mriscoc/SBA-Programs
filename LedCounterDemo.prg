-- /SBA: Program Details -------------------------------------------------------
--
-- Project Name: LedCounter
-- Title: Simple led counter demo
-- Version: 0.1.1
-- Date: 2015/06/30
-- Author: Miguel A. Risco-Castillo
-- Description: 8 Led Counter demo
-- 
-- /SBA: End -------------------------------------------------------------------

-- /SBA: User Registers and Constants ------------------------------------------
  variable Dlytmp  : unsigned(21 downto 0);      -- Delay 22 bit register
  variable Count   : unsigned(7 downto 0);       -- Counter variable

-- /SBA: End -------------------------------------------------------------------

-- /SBA: User Program ----------------------------------------------------------

=> SBAjump(Init);

-------------------------------- RUTINES ---------------------------------------
-- /L:Delay
=> if Dlytmp/=0 then
     dec(Dlytmp);
     SBAjump(Delay);
   else
     SBARet;
   end if;


------------------------------ MAIN PROGRAM ------------------------------------

-- /L:Init
=> clr(Count);

-- /L:MainLoop
=> SBAWrite(GPIO,Count);
   Dlytmp:=(others=>'1');
   SBACall(Delay);

=> inc(Count);
   SBAjump(MainLoop);

-- /SBA: End -------------------------------------------------------------------
