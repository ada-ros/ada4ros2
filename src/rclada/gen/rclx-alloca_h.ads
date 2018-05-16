pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.stddef_h;
with System;

package rclx.alloca_h is

   --  arg-macro: procedure alloca (size)
   --    __builtin_alloca (size)
  -- Copyright (C) 1992-2018 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <http://www.gnu.org/licenses/>.   

  -- Remove any previous definitions.   
  -- Allocate a block that will be freed when the calling function exits.   
   function alloca (uu_size : rclx.stddef_h.size_t) return System.Address;  -- /usr/include/alloca.h:32
   pragma Import (C, alloca, "alloca");

end rclx.alloca_h;
