pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with rclx.stddef_h;
with Interfaces.C.Strings;
with rclx.x86_64_linux_gnu_bits_types_locale_t_h;

package rclx.strings_h is

  -- Copyright (C) 1991-2018 Free Software Foundation, Inc.
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

  -- Tell the caller that we provide correct C++ prototypes.   
  -- Compare N bytes of S1 and S2 (same as memcmp).   
   function bcmp
     (uu_s1 : System.Address;
      uu_s2 : System.Address;
      uu_n : rclx.stddef_h.size_t) return int;  -- /usr/include/strings.h:34
   pragma Import (C, bcmp, "bcmp");

  -- Copy N bytes of SRC to DEST (like memmove, but args reversed).   
   procedure bcopy
     (uu_src : System.Address;
      uu_dest : System.Address;
      uu_n : rclx.stddef_h.size_t);  -- /usr/include/strings.h:38
   pragma Import (C, bcopy, "bcopy");

  -- Set N bytes of S to 0.   
   procedure bzero (uu_s : System.Address; uu_n : rclx.stddef_h.size_t);  -- /usr/include/strings.h:42
   pragma Import (C, bzero, "bzero");

  -- Find the first occurrence of C in S (same as strchr).   
   function index (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/strings.h:48
   pragma Import (C, index, "index");

   function index (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/strings.h:50
   pragma Import (C, index, "index");

  -- Find the last occurrence of C in S (same as strrchr).   
   function rindex (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/strings.h:76
   pragma Import (C, rindex, "rindex");

   function rindex (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/strings.h:78
   pragma Import (C, rindex, "rindex");

  -- Return the position of the first bit set in I, or 0 if none are set.
  --   The least-significant bit is position 1, the most-significant 32.   

   function ffs (uu_i : int) return int;  -- /usr/include/strings.h:104
   pragma Import (C, ffs, "ffs");

  -- The following two functions are non-standard but necessary for non-32 bit
  --   platforms.   

   function ffsl (uu_l : long) return int;  -- /usr/include/strings.h:110
   pragma Import (C, ffsl, "ffsl");

   function ffsll (uu_ll : Long_Long_Integer) return int;  -- /usr/include/strings.h:111
   pragma Import (C, ffsll, "ffsll");

  -- Compare S1 and S2, ignoring case.   
   function strcasecmp (uu_s1 : Interfaces.C.Strings.chars_ptr; uu_s2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/strings.h:116
   pragma Import (C, strcasecmp, "strcasecmp");

  -- Compare no more than N chars of S1 and S2, ignoring case.   
   function strncasecmp
     (uu_s1 : Interfaces.C.Strings.chars_ptr;
      uu_s2 : Interfaces.C.Strings.chars_ptr;
      uu_n : rclx.stddef_h.size_t) return int;  -- /usr/include/strings.h:120
   pragma Import (C, strncasecmp, "strncasecmp");

  -- POSIX.1-2008 extended locale interface (see locale.h).   
  -- Compare S1 and S2, ignoring case, using collation rules from LOC.   
   function strcasecmp_l
     (uu_s1 : Interfaces.C.Strings.chars_ptr;
      uu_s2 : Interfaces.C.Strings.chars_ptr;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return int;  -- /usr/include/strings.h:128
   pragma Import (C, strcasecmp_l, "strcasecmp_l");

  -- Compare no more than N chars of S1 and S2, ignoring case, using
  --   collation rules from LOC.   

   function strncasecmp_l
     (uu_s1 : Interfaces.C.Strings.chars_ptr;
      uu_s2 : Interfaces.C.Strings.chars_ptr;
      uu_n : rclx.stddef_h.size_t;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return int;  -- /usr/include/strings.h:133
   pragma Import (C, strncasecmp_l, "strncasecmp_l");

  -- Functions with security checks.   
end rclx.strings_h;
