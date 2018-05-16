pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.x86_64_linux_gnu_bits_types_h;

package rclx.x86_64_linux_gnu_sys_sysmacros_h is

   --  arg-macro: procedure major (dev)
   --    __SYSMACROS_DM (major) gnu_dev_major (dev)
   --  arg-macro: procedure minor (dev)
   --    __SYSMACROS_DM (minor) gnu_dev_minor (dev)
   --  arg-macro: procedure makedev (maj, min)
   --    __SYSMACROS_DM (makedev) gnu_dev_makedev (maj, min)
  -- Definitions of macros to access `dev_t' values.
  --   Copyright (C) 1996-2018 Free Software Foundation, Inc.
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

  -- If <sys/sysmacros.h> is included after <sys/types.h>, these macros
  --   will already be defined, and we need to redefine them without the
  --   deprecation warnings.  (If they are included in the opposite order,
  --   the outer #ifndef will suppress this entire file and the macros
  --   will be usable without warnings.)   

  -- This is the macro that must be defined to satisfy the misuse check
  --   in bits/sysmacros.h.  

  -- Caution: The text of this deprecation message is unquoted, so that
  --   #symbol can be substituted.  (It is converted to a string by
  --   __SYSMACROS_DM1.)  This means the message must be a sequence of
  --   complete pp-tokens; in particular, English contractions (it's,
  --   can't) cannot be used.
  --   The message has been manually word-wrapped to fit in 80 columns
  --   when output by GCC 5 and 6.  The first line is shorter to leave
  --   some room for the "foo.c:23: warning:" annotation.   

  -- This macro is variadic because the deprecation message above
  --   contains commas.   

   function gnu_dev_major (uu_dev : rclx.x86_64_linux_gnu_bits_types_h.uu_dev_t) return unsigned;  -- /usr/include/x86_64-linux-gnu/sys/sysmacros.h:73
   pragma Import (C, gnu_dev_major, "gnu_dev_major");

   function gnu_dev_minor (uu_dev : rclx.x86_64_linux_gnu_bits_types_h.uu_dev_t) return unsigned;  -- /usr/include/x86_64-linux-gnu/sys/sysmacros.h:74
   pragma Import (C, gnu_dev_minor, "gnu_dev_minor");

   function gnu_dev_makedev (uu_major : unsigned; uu_minor : unsigned) return rclx.x86_64_linux_gnu_bits_types_h.uu_dev_t;  -- /usr/include/x86_64-linux-gnu/sys/sysmacros.h:75
   pragma Import (C, gnu_dev_makedev, "gnu_dev_makedev");

end rclx.x86_64_linux_gnu_sys_sysmacros_h;
