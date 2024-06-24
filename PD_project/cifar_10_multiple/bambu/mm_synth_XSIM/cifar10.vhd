-- 
-- Politecnico di Milano
-- Code created using PandA - Version: PandA 2023.1 - Revision 04336c437a53bc96ae90b74052c455629946ec8b-main - Date 2024-06-10T16:22:49
-- /tmp/.mount_bambu-k21gxt/usr/bin/bambu executed with: /tmp/.mount_bambu-k21gxt/usr/bin/bambu --top-fname=cifar10 --soft-float --flopoco --simulate --evaluation --device-name=asap7-BC --simulator=XSIM --experimental-setup=BAMBU-PERFORMANCE-MP /home/gaetan/PD_project/PD_project/cifar_10_multiple/cpu_functions/cpu_functions.cpp 
-- 
-- Send any bug to: panda-info@polimi.it
-- ************************************************************************
-- The following text holds for all the components tagged with PANDA_LGPLv3.
-- They are all part of the BAMBU/PANDA IP LIBRARY.
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 3 of the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with the PandA framework; see the files COPYING.LIB
-- If not, see <http://www.gnu.org/licenses/>.
-- ************************************************************************


library IEEE;
use IEEE.numeric_std.all;

package panda_pkg is
   function resize_signed(input : signed; size : integer) return signed;
end;

package body panda_pkg is
   function resize_signed(input : signed; size : integer) return signed is
   begin
     if (size > input'length) then
       return resize(input, size);
     else
       return input(size-1+input'right downto input'right);
     end if;
   end function;
end package body;


