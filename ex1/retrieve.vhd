--
-- Copyright 2006 Mentor Graphics Corporation
--
-- All Rights Reserved.
--
-- THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS THE PROPERTY OF 
-- MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.
--   

-- Produces the output pointer logic.

library ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 

ENTITY retrieve IS
   GENERIC (
      counter_size : integer := 8;
      buffer_size : integer := 256
   );
   PORT (
      outstrobe : IN std_logic;
      ramadrs : IN std_logic_vector((counter_size * 2) DOWNTO 0);
      buffers : IN std_logic_vector((buffer_size -1) DOWNTO 0);
      rxda : OUT std_logic
   );
END retrieve;

ARCHITECTURE RTL OF retrieve IS
  signal rd0a : std_logic;
BEGIN

-- Produces the decode logic which pointers
-- to each location of the shift register.
retriever : PROCESS (buffers,ramadrs((counter_size-1) downto 0))
  variable index: integer;
BEGIN
  index := to_integer(unsigned(ramadrs((counter_size - 1) downto 0)));
  rd0a <= buffers(index);
  --for i in 0 to (buffer_size - 1) loop
    --IF (i = ramadrs((counter_size - 1) downto 0)) THEN
      --rd0a <= buffers(i);      
      --exit;
    --END IF;
  --end loop ;
END PROCESS;

rxda <= rd0a and outstrobe;

END RTL;


