pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with rclx.x86_64_linux_gnu_bits_floatn_common_h;
with rclx.x86_64_linux_gnu_bits_floatn_h;
with Interfaces.C.Extensions;
with rclx.stddef_h;
with rclx.x86_64_linux_gnu_bits_types_locale_t_h;
with rclx.x86_64_linux_gnu_bits_stdint_intn_h;

package rclx.stdlib_h is

   --  arg-macro: procedure WEXITSTATUS (status)
   --    __WEXITSTATUS (status)
   --  arg-macro: procedure WTERMSIG (status)
   --    __WTERMSIG (status)
   --  arg-macro: procedure WSTOPSIG (status)
   --    __WSTOPSIG (status)
   --  arg-macro: procedure WIFEXITED (status)
   --    __WIFEXITED (status)
   --  arg-macro: procedure WIFSIGNALED (status)
   --    __WIFSIGNALED (status)
   --  arg-macro: procedure WIFSTOPPED (status)
   --    __WIFSTOPPED (status)
   --  arg-macro: procedure WIFCONTINUED (status)
   --    __WIFCONTINUED (status)
   RAND_MAX : constant := 2147483647;  --  /usr/include/stdlib.h:86

   EXIT_FAILURE : constant := 1;  --  /usr/include/stdlib.h:91
   EXIT_SUCCESS : constant := 0;  --  /usr/include/stdlib.h:92
   --  unsupported macro: MB_CUR_MAX (__ctype_get_mb_cur_max ())

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

  -- *	ISO C99 Standard: 7.20 General utilities	<stdlib.h>
  --  

  -- Get size_t, wchar_t and NULL from <stddef.h>.   
  -- XPG requires a few symbols from <sys/wait.h> being defined.   
  -- Define the macros <sys/wait.h> also would define this way.   
  -- _FloatN API tests for enablement.   
  -- Returned by `div'.   
  -- Quotient.   
   type div_t is record
      quot : aliased int;  -- /usr/include/stdlib.h:60
      c_rem : aliased int;  -- /usr/include/stdlib.h:61
   end record;
   pragma Convention (C_Pass_By_Copy, div_t);  -- /usr/include/stdlib.h:62

   --  skipped anonymous struct anon_8

  -- Remainder.   
  -- Returned by `ldiv'.   
  -- Quotient.   
   type ldiv_t is record
      quot : aliased long;  -- /usr/include/stdlib.h:68
      c_rem : aliased long;  -- /usr/include/stdlib.h:69
   end record;
   pragma Convention (C_Pass_By_Copy, ldiv_t);  -- /usr/include/stdlib.h:70

   --  skipped anonymous struct anon_9

  -- Remainder.   
  -- Returned by `lldiv'.   
  -- Quotient.   
   type lldiv_t is record
      quot : aliased Long_Long_Integer;  -- /usr/include/stdlib.h:78
      c_rem : aliased Long_Long_Integer;  -- /usr/include/stdlib.h:79
   end record;
   pragma Convention (C_Pass_By_Copy, lldiv_t);  -- /usr/include/stdlib.h:80

   --  skipped anonymous struct anon_10

  -- Remainder.   
  -- The largest number rand will return (same as INT_MAX).   
  -- We define these the same for all machines.
  --   Changes from this to the outside world should be done in `_exit'.   

  -- Maximum length of a multibyte character in the current locale.   
   --  skipped func __ctype_get_mb_cur_max

  -- Convert a string to a floating-point number.   
   function atof (uu_nptr : Interfaces.C.Strings.chars_ptr) return double;  -- /usr/include/stdlib.h:101
   pragma Import (C, atof, "atof");

  -- Convert a string to an integer.   
   function atoi (uu_nptr : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:104
   pragma Import (C, atoi, "atoi");

  -- Convert a string to a long integer.   
   function atol (uu_nptr : Interfaces.C.Strings.chars_ptr) return long;  -- /usr/include/stdlib.h:107
   pragma Import (C, atol, "atol");

  -- Convert a string to a long long integer.   
   function atoll (uu_nptr : Interfaces.C.Strings.chars_ptr) return Long_Long_Integer;  -- /usr/include/stdlib.h:112
   pragma Import (C, atoll, "atoll");

  -- Convert a string to a floating-point number.   
   function strtod (uu_nptr : Interfaces.C.Strings.chars_ptr; uu_endptr : System.Address) return double;  -- /usr/include/stdlib.h:117
   pragma Import (C, strtod, "strtod");

  -- Likewise for `float' and `long double' sizes of floating-point numbers.   
   function strtof (uu_nptr : Interfaces.C.Strings.chars_ptr; uu_endptr : System.Address) return float;  -- /usr/include/stdlib.h:123
   pragma Import (C, strtof, "strtof");

   function strtold (uu_nptr : Interfaces.C.Strings.chars_ptr; uu_endptr : System.Address) return long_double;  -- /usr/include/stdlib.h:126
   pragma Import (C, strtold, "strtold");

  -- Likewise for '_FloatN' and '_FloatNx'.   
   function strtof32 (uu_nptr : Interfaces.C.Strings.chars_ptr; uu_endptr : System.Address) return rclx.x86_64_linux_gnu_bits_floatn_common_h.u_Float32;  -- /usr/include/stdlib.h:140
   pragma Import (C, strtof32, "strtof32");

   function strtof64 (uu_nptr : Interfaces.C.Strings.chars_ptr; uu_endptr : System.Address) return rclx.x86_64_linux_gnu_bits_floatn_common_h.u_Float64;  -- /usr/include/stdlib.h:146
   pragma Import (C, strtof64, "strtof64");

   function strtof128 (uu_nptr : Interfaces.C.Strings.chars_ptr; uu_endptr : System.Address) return rclx.x86_64_linux_gnu_bits_floatn_h.u_Float128;  -- /usr/include/stdlib.h:152
   pragma Import (C, strtof128, "strtof128");

   function strtof32x (uu_nptr : Interfaces.C.Strings.chars_ptr; uu_endptr : System.Address) return rclx.x86_64_linux_gnu_bits_floatn_common_h.u_Float32x;  -- /usr/include/stdlib.h:158
   pragma Import (C, strtof32x, "strtof32x");

   function strtof64x (uu_nptr : Interfaces.C.Strings.chars_ptr; uu_endptr : System.Address) return rclx.x86_64_linux_gnu_bits_floatn_common_h.u_Float64x;  -- /usr/include/stdlib.h:164
   pragma Import (C, strtof64x, "strtof64x");

  -- Convert a string to a long integer.   
   function strtol
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int) return long;  -- /usr/include/stdlib.h:176
   pragma Import (C, strtol, "strtol");

  -- Convert a string to an unsigned long integer.   
   function strtoul
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int) return unsigned_long;  -- /usr/include/stdlib.h:180
   pragma Import (C, strtoul, "strtoul");

  -- Convert a string to a quadword integer.   
   function strtoq
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int) return Long_Long_Integer;  -- /usr/include/stdlib.h:187
   pragma Import (C, strtoq, "strtoq");

  -- Convert a string to an unsigned quadword integer.   
   function strtouq
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int) return Extensions.unsigned_long_long;  -- /usr/include/stdlib.h:192
   pragma Import (C, strtouq, "strtouq");

  -- Convert a string to a quadword integer.   
   function strtoll
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int) return Long_Long_Integer;  -- /usr/include/stdlib.h:200
   pragma Import (C, strtoll, "strtoll");

  -- Convert a string to an unsigned quadword integer.   
   function strtoull
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int) return Extensions.unsigned_long_long;  -- /usr/include/stdlib.h:205
   pragma Import (C, strtoull, "strtoull");

  -- Convert a floating-point number to a string.   
   function strfromd
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_size : rclx.stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_f : double) return int;  -- /usr/include/stdlib.h:212
   pragma Import (C, strfromd, "strfromd");

   function strfromf
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_size : rclx.stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_f : float) return int;  -- /usr/include/stdlib.h:216
   pragma Import (C, strfromf, "strfromf");

   function strfroml
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_size : rclx.stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_f : long_double) return int;  -- /usr/include/stdlib.h:220
   pragma Import (C, strfroml, "strfroml");

   function strfromf32
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_size : rclx.stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_f : rclx.x86_64_linux_gnu_bits_floatn_common_h.u_Float32) return int;  -- /usr/include/stdlib.h:232
   pragma Import (C, strfromf32, "strfromf32");

   function strfromf64
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_size : rclx.stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_f : rclx.x86_64_linux_gnu_bits_floatn_common_h.u_Float64) return int;  -- /usr/include/stdlib.h:238
   pragma Import (C, strfromf64, "strfromf64");

   function strfromf128
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_size : rclx.stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_f : rclx.x86_64_linux_gnu_bits_floatn_h.u_Float128) return int;  -- /usr/include/stdlib.h:244
   pragma Import (C, strfromf128, "strfromf128");

   function strfromf32x
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_size : rclx.stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_f : rclx.x86_64_linux_gnu_bits_floatn_common_h.u_Float32x) return int;  -- /usr/include/stdlib.h:250
   pragma Import (C, strfromf32x, "strfromf32x");

   function strfromf64x
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_size : rclx.stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_f : rclx.x86_64_linux_gnu_bits_floatn_common_h.u_Float64x) return int;  -- /usr/include/stdlib.h:256
   pragma Import (C, strfromf64x, "strfromf64x");

  -- Parallel versions of the functions above which take the locale to
  --   use as an additional parameter.  These are GNU extensions inspired
  --   by the POSIX.1-2008 extended locale API.   

   function strtol_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return long;  -- /usr/include/stdlib.h:274
   pragma Import (C, strtol_l, "strtol_l");

   function strtoul_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return unsigned_long;  -- /usr/include/stdlib.h:278
   pragma Import (C, strtoul_l, "strtoul_l");

   function strtoll_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return Long_Long_Integer;  -- /usr/include/stdlib.h:284
   pragma Import (C, strtoll_l, "strtoll_l");

   function strtoull_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return Extensions.unsigned_long_long;  -- /usr/include/stdlib.h:290
   pragma Import (C, strtoull_l, "strtoull_l");

   function strtod_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return double;  -- /usr/include/stdlib.h:295
   pragma Import (C, strtod_l, "strtod_l");

   function strtof_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return float;  -- /usr/include/stdlib.h:299
   pragma Import (C, strtof_l, "strtof_l");

   function strtold_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return long_double;  -- /usr/include/stdlib.h:303
   pragma Import (C, strtold_l, "strtold_l");

   function strtof32_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return rclx.x86_64_linux_gnu_bits_floatn_common_h.u_Float32;  -- /usr/include/stdlib.h:316
   pragma Import (C, strtof32_l, "strtof32_l");

   function strtof64_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return rclx.x86_64_linux_gnu_bits_floatn_common_h.u_Float64;  -- /usr/include/stdlib.h:323
   pragma Import (C, strtof64_l, "strtof64_l");

   function strtof128_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return rclx.x86_64_linux_gnu_bits_floatn_h.u_Float128;  -- /usr/include/stdlib.h:330
   pragma Import (C, strtof128_l, "strtof128_l");

   function strtof32x_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return rclx.x86_64_linux_gnu_bits_floatn_common_h.u_Float32x;  -- /usr/include/stdlib.h:337
   pragma Import (C, strtof32x_l, "strtof32x_l");

   function strtof64x_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_loc : rclx.x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return rclx.x86_64_linux_gnu_bits_floatn_common_h.u_Float64x;  -- /usr/include/stdlib.h:344
   pragma Import (C, strtof64x_l, "strtof64x_l");

  -- Convert N to base 64 using the digits "./0-9A-Za-z", least-significant
  --   digit first.  Returns a pointer to static storage overwritten by the
  --   next call.   

   function l64a (uu_n : long) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:385
   pragma Import (C, l64a, "l64a");

  -- Read a number from a string S in base 64 as above.   
   function a64l (uu_s : Interfaces.C.Strings.chars_ptr) return long;  -- /usr/include/stdlib.h:388
   pragma Import (C, a64l, "a64l");

  -- we need int32_t...  
  -- These are the functions that actually do things.  The `random', `srandom',
  --   `initstate' and `setstate' functions are those from BSD Unices.
  --   The `rand' and `srand' functions are required by the ANSI standard.
  --   We provide both interfaces to the same random number generator.   

  -- Return a random long integer between 0 and RAND_MAX inclusive.   
   function random return long;  -- /usr/include/stdlib.h:401
   pragma Import (C, random, "random");

  -- Seed the random number generator with the given number.   
   procedure srandom (uu_seed : unsigned);  -- /usr/include/stdlib.h:404
   pragma Import (C, srandom, "srandom");

  -- Initialize the random number generator to use state buffer STATEBUF,
  --   of length STATELEN, and seed it with SEED.  Optimal lengths are 8, 16,
  --   32, 64, 128 and 256, the bigger the better; values less than 8 will
  --   cause an error and values greater than 256 will be rounded down.   

   function initstate
     (uu_seed : unsigned;
      uu_statebuf : Interfaces.C.Strings.chars_ptr;
      uu_statelen : rclx.stddef_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:410
   pragma Import (C, initstate, "initstate");

  -- Switch the random number generator to state buffer STATEBUF,
  --   which should have been previously initialized by `initstate'.   

   function setstate (uu_statebuf : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:415
   pragma Import (C, setstate, "setstate");

  -- Reentrant versions of the `random' family of functions.
  --   These functions all use the following data structure to contain
  --   state, rather than global state variables.   

  -- Front pointer.   
   type random_data is record
      fptr : access rclx.x86_64_linux_gnu_bits_stdint_intn_h.int32_t;  -- /usr/include/stdlib.h:425
      rptr : access rclx.x86_64_linux_gnu_bits_stdint_intn_h.int32_t;  -- /usr/include/stdlib.h:426
      state : access rclx.x86_64_linux_gnu_bits_stdint_intn_h.int32_t;  -- /usr/include/stdlib.h:427
      rand_type : aliased int;  -- /usr/include/stdlib.h:428
      rand_deg : aliased int;  -- /usr/include/stdlib.h:429
      rand_sep : aliased int;  -- /usr/include/stdlib.h:430
      end_ptr : access rclx.x86_64_linux_gnu_bits_stdint_intn_h.int32_t;  -- /usr/include/stdlib.h:431
   end record;
   pragma Convention (C_Pass_By_Copy, random_data);  -- /usr/include/stdlib.h:423

  -- Rear pointer.   
  -- Array of state values.   
  -- Type of random number generator.   
  -- Degree of random number generator.   
  -- Distance between front and rear.   
  -- Pointer behind state table.   
   function random_r (uu_buf : access random_data; uu_result : access rclx.x86_64_linux_gnu_bits_stdint_intn_h.int32_t) return int;  -- /usr/include/stdlib.h:434
   pragma Import (C, random_r, "random_r");

   function srandom_r (uu_seed : unsigned; uu_buf : access random_data) return int;  -- /usr/include/stdlib.h:437
   pragma Import (C, srandom_r, "srandom_r");

   function initstate_r
     (uu_seed : unsigned;
      uu_statebuf : Interfaces.C.Strings.chars_ptr;
      uu_statelen : rclx.stddef_h.size_t;
      uu_buf : access random_data) return int;  -- /usr/include/stdlib.h:440
   pragma Import (C, initstate_r, "initstate_r");

   function setstate_r (uu_statebuf : Interfaces.C.Strings.chars_ptr; uu_buf : access random_data) return int;  -- /usr/include/stdlib.h:445
   pragma Import (C, setstate_r, "setstate_r");

  -- Return a random integer between 0 and RAND_MAX inclusive.   
   function rand return int;  -- /usr/include/stdlib.h:453
   pragma Import (C, rand, "rand");

  -- Seed the random number generator with the given number.   
   procedure srand (uu_seed : unsigned);  -- /usr/include/stdlib.h:455
   pragma Import (C, srand, "srand");

  -- Reentrant interface according to POSIX.1.   
   function rand_r (uu_seed : access unsigned) return int;  -- /usr/include/stdlib.h:459
   pragma Import (C, rand_r, "rand_r");

  -- System V style 48-bit random number generator functions.   
  -- Return non-negative, double-precision floating-point value in [0.0,1.0).   
   function drand48 return double;  -- /usr/include/stdlib.h:467
   pragma Import (C, drand48, "drand48");

   function erand48 (uu_xsubi : access unsigned_short) return double;  -- /usr/include/stdlib.h:468
   pragma Import (C, erand48, "erand48");

  -- Return non-negative, long integer in [0,2^31).   
   function lrand48 return long;  -- /usr/include/stdlib.h:471
   pragma Import (C, lrand48, "lrand48");

   function nrand48 (uu_xsubi : access unsigned_short) return long;  -- /usr/include/stdlib.h:472
   pragma Import (C, nrand48, "nrand48");

  -- Return signed, long integers in [-2^31,2^31).   
   function mrand48 return long;  -- /usr/include/stdlib.h:476
   pragma Import (C, mrand48, "mrand48");

   function jrand48 (uu_xsubi : access unsigned_short) return long;  -- /usr/include/stdlib.h:477
   pragma Import (C, jrand48, "jrand48");

  -- Seed random number generator.   
   procedure srand48 (uu_seedval : long);  -- /usr/include/stdlib.h:481
   pragma Import (C, srand48, "srand48");

   function seed48 (uu_seed16v : access unsigned_short) return access unsigned_short;  -- /usr/include/stdlib.h:482
   pragma Import (C, seed48, "seed48");

   procedure lcong48 (uu_param : access unsigned_short);  -- /usr/include/stdlib.h:484
   pragma Import (C, lcong48, "lcong48");

  -- Data structure for communication with thread safe versions.  This
  --   type is to be regarded as opaque.  It's only exported because users
  --   have to allocate objects of this type.   

  -- Current state.   
   type drand48_data_uu_x_array is array (0 .. 2) of aliased unsigned_short;
   type drand48_data_uu_old_x_array is array (0 .. 2) of aliased unsigned_short;
   type drand48_data is record
      uu_x : aliased drand48_data_uu_x_array;  -- /usr/include/stdlib.h:492
      uu_old_x : aliased drand48_data_uu_old_x_array;  -- /usr/include/stdlib.h:493
      uu_c : aliased unsigned_short;  -- /usr/include/stdlib.h:494
      uu_init : aliased unsigned_short;  -- /usr/include/stdlib.h:495
      uu_a : aliased Extensions.unsigned_long_long;  -- /usr/include/stdlib.h:496
   end record;
   pragma Convention (C_Pass_By_Copy, drand48_data);  -- /usr/include/stdlib.h:490

  -- Old state.   
  -- Additive const. in congruential formula.   
  -- Flag for initializing.   
  -- Factor in congruential
  --						   formula.   

  -- Return non-negative, double-precision floating-point value in [0.0,1.0).   
   function drand48_r (uu_buffer : access drand48_data; uu_result : access double) return int;  -- /usr/include/stdlib.h:501
   pragma Import (C, drand48_r, "drand48_r");

   function erand48_r
     (uu_xsubi : access unsigned_short;
      uu_buffer : access drand48_data;
      uu_result : access double) return int;  -- /usr/include/stdlib.h:503
   pragma Import (C, erand48_r, "erand48_r");

  -- Return non-negative, long integer in [0,2^31).   
   function lrand48_r (uu_buffer : access drand48_data; uu_result : access long) return int;  -- /usr/include/stdlib.h:508
   pragma Import (C, lrand48_r, "lrand48_r");

   function nrand48_r
     (uu_xsubi : access unsigned_short;
      uu_buffer : access drand48_data;
      uu_result : access long) return int;  -- /usr/include/stdlib.h:511
   pragma Import (C, nrand48_r, "nrand48_r");

  -- Return signed, long integers in [-2^31,2^31).   
   function mrand48_r (uu_buffer : access drand48_data; uu_result : access long) return int;  -- /usr/include/stdlib.h:517
   pragma Import (C, mrand48_r, "mrand48_r");

   function jrand48_r
     (uu_xsubi : access unsigned_short;
      uu_buffer : access drand48_data;
      uu_result : access long) return int;  -- /usr/include/stdlib.h:520
   pragma Import (C, jrand48_r, "jrand48_r");

  -- Seed random number generator.   
   function srand48_r (uu_seedval : long; uu_buffer : access drand48_data) return int;  -- /usr/include/stdlib.h:526
   pragma Import (C, srand48_r, "srand48_r");

   function seed48_r (uu_seed16v : access unsigned_short; uu_buffer : access drand48_data) return int;  -- /usr/include/stdlib.h:529
   pragma Import (C, seed48_r, "seed48_r");

   function lcong48_r (uu_param : access unsigned_short; uu_buffer : access drand48_data) return int;  -- /usr/include/stdlib.h:532
   pragma Import (C, lcong48_r, "lcong48_r");

  -- Allocate SIZE bytes of memory.   
   function malloc (uu_size : rclx.stddef_h.size_t) return System.Address;  -- /usr/include/stdlib.h:539
   pragma Import (C, malloc, "malloc");

  -- Allocate NMEMB elements of SIZE bytes each, all initialized to 0.   
   function calloc (uu_nmemb : rclx.stddef_h.size_t; uu_size : rclx.stddef_h.size_t) return System.Address;  -- /usr/include/stdlib.h:541
   pragma Import (C, calloc, "calloc");

  -- Re-allocate the previously allocated block
  --   in PTR, making the new block SIZE bytes long.   

  -- __attribute_malloc__ is not used, because if realloc returns
  --   the same pointer that was passed to it, aliasing needs to be allowed
  --   between objects pointed by the old and new pointers.   

   function realloc (uu_ptr : System.Address; uu_size : rclx.stddef_h.size_t) return System.Address;  -- /usr/include/stdlib.h:549
   pragma Import (C, realloc, "realloc");

  -- Re-allocate the previously allocated block in PTR, making the new
  --   block large enough for NMEMB elements of SIZE bytes each.   

  -- __attribute_malloc__ is not used, because if reallocarray returns
  --   the same pointer that was passed to it, aliasing needs to be allowed
  --   between objects pointed by the old and new pointers.   

   function reallocarray
     (uu_ptr : System.Address;
      uu_nmemb : rclx.stddef_h.size_t;
      uu_size : rclx.stddef_h.size_t) return System.Address;  -- /usr/include/stdlib.h:558
   pragma Import (C, reallocarray, "reallocarray");

  -- Free a block allocated by `malloc', `realloc' or `calloc'.   
   procedure free (uu_ptr : System.Address);  -- /usr/include/stdlib.h:563
   pragma Import (C, free, "free");

  -- Allocate SIZE bytes on a page boundary.  The storage cannot be freed.   
   function valloc (uu_size : rclx.stddef_h.size_t) return System.Address;  -- /usr/include/stdlib.h:572
   pragma Import (C, valloc, "valloc");

  -- Allocate memory of SIZE bytes with an alignment of ALIGNMENT.   
   function posix_memalign
     (uu_memptr : System.Address;
      uu_alignment : rclx.stddef_h.size_t;
      uu_size : rclx.stddef_h.size_t) return int;  -- /usr/include/stdlib.h:577
   pragma Import (C, posix_memalign, "posix_memalign");

  -- ISO C variant of aligned allocation.   
   function aligned_alloc (uu_alignment : rclx.stddef_h.size_t; uu_size : rclx.stddef_h.size_t) return System.Address;  -- /usr/include/stdlib.h:583
   pragma Import (C, aligned_alloc, "aligned_alloc");

  -- Abort execution and generate a core-dump.   
   procedure c_abort;  -- /usr/include/stdlib.h:588
   pragma Import (C, c_abort, "abort");

  -- Register a function to be called when `exit' is called.   
   function atexit (uu_func : access procedure) return int;  -- /usr/include/stdlib.h:592
   pragma Import (C, atexit, "atexit");

  -- Register a function to be called when `quick_exit' is called.   
   function at_quick_exit (uu_func : access procedure) return int;  -- /usr/include/stdlib.h:597
   pragma Import (C, at_quick_exit, "at_quick_exit");

  -- Register a function to be called with the status
  --   given to `exit' and the given argument.   

   function on_exit (uu_func : access procedure (arg1 : int; arg2 : System.Address); uu_arg : System.Address) return int;  -- /usr/include/stdlib.h:607
   pragma Import (C, on_exit, "on_exit");

  -- Call all functions registered with `atexit' and `on_exit',
  --   in the reverse of the order in which they were registered,
  --   perform stdio cleanup, and terminate program execution with STATUS.   

   procedure c_exit (uu_status : int);  -- /usr/include/stdlib.h:614
   pragma Import (C, c_exit, "exit");

  -- Call all functions registered with `at_quick_exit' in the reverse
  --   of the order in which they were registered and terminate program
  --   execution with STATUS.   

   procedure quick_exit (uu_status : int);  -- /usr/include/stdlib.h:620
   pragma Import (C, quick_exit, "quick_exit");

  -- Terminate the program with STATUS without calling any of the
  --   functions registered with `atexit' or `on_exit'.   

   --  skipped func _Exit

  -- Return the value of envariable NAME, or NULL if it doesn't exist.   
   function getenv (uu_name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:631
   pragma Import (C, getenv, "getenv");

  -- This function is similar to the above but returns NULL if the
  --   programs is running with SUID or SGID enabled.   

   function secure_getenv (uu_name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:636
   pragma Import (C, secure_getenv, "secure_getenv");

  -- The SVID says this is in <stdio.h>, but this seems a better place.	 
  -- Put STRING, which is of the form "NAME=VALUE", in the environment.
  --   If there is no `=', remove NAME from the environment.   

   function putenv (uu_string : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:644
   pragma Import (C, putenv, "putenv");

  -- Set NAME to VALUE in the environment.
  --   If REPLACE is nonzero, overwrite an existing value.   

   function setenv
     (uu_name : Interfaces.C.Strings.chars_ptr;
      uu_value : Interfaces.C.Strings.chars_ptr;
      uu_replace : int) return int;  -- /usr/include/stdlib.h:650
   pragma Import (C, setenv, "setenv");

  -- Remove the variable NAME from the environment.   
   function unsetenv (uu_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:654
   pragma Import (C, unsetenv, "unsetenv");

  -- The `clearenv' was planned to be added to POSIX.1 but probably
  --   never made it.  Nevertheless the POSIX.9 standard (POSIX bindings
  --   for Fortran 77) requires this function.   

   function clearenv return int;  -- /usr/include/stdlib.h:661
   pragma Import (C, clearenv, "clearenv");

  -- Generate a unique temporary file name from TEMPLATE.
  --   The last six characters of TEMPLATE must be "XXXXXX";
  --   they are replaced with a string that makes the file name unique.
  --   Always returns TEMPLATE, it's either a temporary file name or a null
  --   string if it cannot get a unique file name.   

   function mktemp (uu_template : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:672
   pragma Import (C, mktemp, "mktemp");

  -- Generate a unique temporary file name from TEMPLATE.
  --   The last six characters of TEMPLATE must be "XXXXXX";
  --   they are replaced with a string that makes the filename unique.
  --   Returns a file descriptor open on the file for reading and writing,
  --   or -1 if it cannot create a uniquely-named file.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function mkstemp (uu_template : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:685
   pragma Import (C, mkstemp, "mkstemp");

   function mkstemp64 (uu_template : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:695
   pragma Import (C, mkstemp64, "mkstemp64");

  -- Similar to mkstemp, but the template can have a suffix after the
  --   XXXXXX.  The length of the suffix is specified in the second
  --   parameter.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function mkstemps (uu_template : Interfaces.C.Strings.chars_ptr; uu_suffixlen : int) return int;  -- /usr/include/stdlib.h:707
   pragma Import (C, mkstemps, "mkstemps");

   function mkstemps64 (uu_template : Interfaces.C.Strings.chars_ptr; uu_suffixlen : int) return int;  -- /usr/include/stdlib.h:717
   pragma Import (C, mkstemps64, "mkstemps64");

  -- Create a unique temporary directory from TEMPLATE.
  --   The last six characters of TEMPLATE must be "XXXXXX";
  --   they are replaced with a string that makes the directory name unique.
  --   Returns TEMPLATE, or a null pointer if it cannot get a unique name.
  --   The directory is created mode 700.   

   function mkdtemp (uu_template : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:728
   pragma Import (C, mkdtemp, "mkdtemp");

  -- Generate a unique temporary file name from TEMPLATE similar to
  --   mkstemp.  But allow the caller to pass additional flags which are
  --   used in the open call to create the file..
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function mkostemp (uu_template : Interfaces.C.Strings.chars_ptr; uu_flags : int) return int;  -- /usr/include/stdlib.h:739
   pragma Import (C, mkostemp, "mkostemp");

   function mkostemp64 (uu_template : Interfaces.C.Strings.chars_ptr; uu_flags : int) return int;  -- /usr/include/stdlib.h:749
   pragma Import (C, mkostemp64, "mkostemp64");

  -- Similar to mkostemp, but the template can have a suffix after the
  --   XXXXXX.  The length of the suffix is specified in the second
  --   parameter.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function mkostemps
     (uu_template : Interfaces.C.Strings.chars_ptr;
      uu_suffixlen : int;
      uu_flags : int) return int;  -- /usr/include/stdlib.h:759
   pragma Import (C, mkostemps, "mkostemps");

   function mkostemps64
     (uu_template : Interfaces.C.Strings.chars_ptr;
      uu_suffixlen : int;
      uu_flags : int) return int;  -- /usr/include/stdlib.h:771
   pragma Import (C, mkostemps64, "mkostemps64");

  -- Execute the given line as a shell command.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function c_system (uu_command : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:781
   pragma Import (C, c_system, "system");

  -- Return a malloc'd string containing the canonical absolute name of the
  --   existing named file.   

   function canonicalize_file_name (uu_name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:787
   pragma Import (C, canonicalize_file_name, "canonicalize_file_name");

  -- Return the canonical absolute name of file NAME.  If RESOLVED is
  --   null, the result is malloc'd; otherwise, if the canonical name is
  --   PATH_MAX chars or more, returns null with `errno' set to
  --   ENAMETOOLONG; if the name fits in fewer than PATH_MAX chars,
  --   returns the name in RESOLVED.   

   function realpath (uu_name : Interfaces.C.Strings.chars_ptr; uu_resolved : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:797
   pragma Import (C, realpath, "realpath");

  -- Shorthand for type of comparison functions.   
   type uu_compar_fn_t is access function (arg1 : System.Address; arg2 : System.Address) return int;
   pragma Convention (C, uu_compar_fn_t);  -- /usr/include/stdlib.h:805

   subtype comparison_fn_t is uu_compar_fn_t;  -- /usr/include/stdlib.h:808

   type uu_compar_d_fn_t is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address) return int;
   pragma Convention (C, uu_compar_d_fn_t);  -- /usr/include/stdlib.h:812

  -- Do a binary search for KEY in BASE, which consists of NMEMB elements
  --   of SIZE bytes each, using COMPAR to perform the comparisons.   

   function bsearch
     (uu_key : System.Address;
      uu_base : System.Address;
      uu_nmemb : rclx.stddef_h.size_t;
      uu_size : rclx.stddef_h.size_t;
      uu_compar : uu_compar_fn_t) return System.Address;  -- /usr/include/stdlib.h:817
   pragma Import (C, bsearch, "bsearch");

  -- Sort NMEMB elements of BASE, of SIZE bytes each,
  --   using COMPAR to perform the comparisons.   

   procedure qsort
     (uu_base : System.Address;
      uu_nmemb : rclx.stddef_h.size_t;
      uu_size : rclx.stddef_h.size_t;
      uu_compar : uu_compar_fn_t);  -- /usr/include/stdlib.h:827
   pragma Import (C, qsort, "qsort");

   procedure qsort_r
     (uu_base : System.Address;
      uu_nmemb : rclx.stddef_h.size_t;
      uu_size : rclx.stddef_h.size_t;
      uu_compar : uu_compar_d_fn_t;
      uu_arg : System.Address);  -- /usr/include/stdlib.h:830
   pragma Import (C, qsort_r, "qsort_r");

  -- Return the absolute value of X.   
   function c_abs (uu_x : int) return int;  -- /usr/include/stdlib.h:837
   pragma Import (C, c_abs, "abs");

   function labs (uu_x : long) return long;  -- /usr/include/stdlib.h:838
   pragma Import (C, labs, "labs");

   function llabs (uu_x : Long_Long_Integer) return Long_Long_Integer;  -- /usr/include/stdlib.h:841
   pragma Import (C, llabs, "llabs");

  -- Return the `div_t', `ldiv_t' or `lldiv_t' representation
  --   of the value of NUMER over DENOM.  

  -- GCC may have built-ins for these someday.   
   function div (uu_numer : int; uu_denom : int) return div_t;  -- /usr/include/stdlib.h:849
   pragma Import (C, div, "div");

   function ldiv (uu_numer : long; uu_denom : long) return ldiv_t;  -- /usr/include/stdlib.h:851
   pragma Import (C, ldiv, "ldiv");

   function lldiv (uu_numer : Long_Long_Integer; uu_denom : Long_Long_Integer) return lldiv_t;  -- /usr/include/stdlib.h:855
   pragma Import (C, lldiv, "lldiv");

  -- Convert floating point numbers to strings.  The returned values are
  --   valid only until another call to the same function.   

  -- Convert VALUE to a string with NDIGIT digits and return a pointer to
  --   this.  Set *DECPT with the position of the decimal character and *SIGN
  --   with the sign of the number.   

   function ecvt
     (uu_value : double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:869
   pragma Import (C, ecvt, "ecvt");

  -- Convert VALUE to a string rounded to NDIGIT decimal digits.  Set *DECPT
  --   with the position of the decimal character and *SIGN with the sign of
  --   the number.   

   function fcvt
     (uu_value : double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:875
   pragma Import (C, fcvt, "fcvt");

  -- If possible convert VALUE to a string with NDIGIT significant digits.
  --   Otherwise use exponential representation.  The resulting string will
  --   be written to BUF.   

   function gcvt
     (uu_value : double;
      uu_ndigit : int;
      uu_buf : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:881
   pragma Import (C, gcvt, "gcvt");

  -- Long double versions of above functions.   
   function qecvt
     (uu_value : long_double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:887
   pragma Import (C, qecvt, "qecvt");

   function qfcvt
     (uu_value : long_double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:890
   pragma Import (C, qfcvt, "qfcvt");

   function qgcvt
     (uu_value : long_double;
      uu_ndigit : int;
      uu_buf : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:893
   pragma Import (C, qgcvt, "qgcvt");

  -- Reentrant version of the functions above which provide their own
  --   buffers.   

   function ecvt_r
     (uu_value : double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_len : rclx.stddef_h.size_t) return int;  -- /usr/include/stdlib.h:899
   pragma Import (C, ecvt_r, "ecvt_r");

   function fcvt_r
     (uu_value : double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_len : rclx.stddef_h.size_t) return int;  -- /usr/include/stdlib.h:902
   pragma Import (C, fcvt_r, "fcvt_r");

   function qecvt_r
     (uu_value : long_double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_len : rclx.stddef_h.size_t) return int;  -- /usr/include/stdlib.h:906
   pragma Import (C, qecvt_r, "qecvt_r");

   function qfcvt_r
     (uu_value : long_double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_len : rclx.stddef_h.size_t) return int;  -- /usr/include/stdlib.h:910
   pragma Import (C, qfcvt_r, "qfcvt_r");

  -- Return the length of the multibyte character
  --   in S, which is no longer than N.   

   function mblen (uu_s : Interfaces.C.Strings.chars_ptr; uu_n : rclx.stddef_h.size_t) return int;  -- /usr/include/stdlib.h:919
   pragma Import (C, mblen, "mblen");

  -- Return the length of the given multibyte character,
  --   putting its `wchar_t' representation in *PWC.   

   function mbtowc
     (uu_pwc : access wchar_t;
      uu_s : Interfaces.C.Strings.chars_ptr;
      uu_n : rclx.stddef_h.size_t) return int;  -- /usr/include/stdlib.h:922
   pragma Import (C, mbtowc, "mbtowc");

  -- Put the multibyte character represented
  --   by WCHAR in S, returning its length.   

   function wctomb (uu_s : Interfaces.C.Strings.chars_ptr; uu_wchar : wchar_t) return int;  -- /usr/include/stdlib.h:926
   pragma Import (C, wctomb, "wctomb");

  -- Convert a multibyte string to a wide char string.   
   function mbstowcs
     (uu_pwcs : access wchar_t;
      uu_s : Interfaces.C.Strings.chars_ptr;
      uu_n : rclx.stddef_h.size_t) return rclx.stddef_h.size_t;  -- /usr/include/stdlib.h:930
   pragma Import (C, mbstowcs, "mbstowcs");

  -- Convert a wide char string to multibyte string.   
   function wcstombs
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_pwcs : access wchar_t;
      uu_n : rclx.stddef_h.size_t) return rclx.stddef_h.size_t;  -- /usr/include/stdlib.h:933
   pragma Import (C, wcstombs, "wcstombs");

  -- Determine whether the string value of RESPONSE matches the affirmation
  --   or negative response expression as specified by the LC_MESSAGES category
  --   in the program's current locale.  Returns 1 if affirmative, 0 if
  --   negative, and -1 if not matching.   

   function rpmatch (uu_response : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:943
   pragma Import (C, rpmatch, "rpmatch");

  -- Parse comma separated suboption from *OPTIONP and match against
  --   strings in TOKENS.  If found return index and set *VALUEP to
  --   optional value introduced by an equal sign.  If the suboption is
  --   not part of TOKENS return in *VALUEP beginning of unknown
  --   suboption.  On exit *OPTIONP is set to the beginning of the next
  --   token or at the terminating NUL character.   

   function getsubopt
     (uu_optionp : System.Address;
      uu_tokens : System.Address;
      uu_valuep : System.Address) return int;  -- /usr/include/stdlib.h:954
   pragma Import (C, getsubopt, "getsubopt");

  -- Setup DES tables according KEY.   
   procedure setkey (uu_key : Interfaces.C.Strings.chars_ptr);  -- /usr/include/stdlib.h:963
   pragma Import (C, setkey, "setkey");

  -- X/Open pseudo terminal handling.   
  -- Return a master pseudo-terminal handle.   
   function posix_openpt (uu_oflag : int) return int;  -- /usr/include/stdlib.h:971
   pragma Import (C, posix_openpt, "posix_openpt");

  -- The next four functions all take a master pseudo-tty fd and
  --   perform an operation on the associated slave:   

  -- Chown the slave to the calling user.   
   function grantpt (uu_fd : int) return int;  -- /usr/include/stdlib.h:979
   pragma Import (C, grantpt, "grantpt");

  -- Release an internal lock so the slave can be opened.
  --   Call after grantpt().   

   function unlockpt (uu_fd : int) return int;  -- /usr/include/stdlib.h:983
   pragma Import (C, unlockpt, "unlockpt");

  -- Return the pathname of the pseudo terminal slave associated with
  --   the master FD is open on, or NULL on errors.
  --   The returned storage is good until the next call to this function.   

   function ptsname (uu_fd : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:988
   pragma Import (C, ptsname, "ptsname");

  -- Store at most BUFLEN characters of the pathname of the slave pseudo
  --   terminal associated with the master FD is open on in BUF.
  --   Return 0 on success, otherwise an error number.   

   function ptsname_r
     (uu_fd : int;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : rclx.stddef_h.size_t) return int;  -- /usr/include/stdlib.h:995
   pragma Import (C, ptsname_r, "ptsname_r");

  -- Open a master pseudo terminal and return its file descriptor.   
   function getpt return int;  -- /usr/include/stdlib.h:999
   pragma Import (C, getpt, "getpt");

  -- Put the 1 minute, 5 minute and 15 minute load averages into the first
  --   NELEM elements of LOADAVG.  Return the number written (never more than
  --   three, but may be less than NELEM), or -1 if an error occurred.   

   function getloadavg (uu_loadavg : access double; uu_nelem : int) return int;  -- /usr/include/stdlib.h:1006
   pragma Import (C, getloadavg, "getloadavg");

  -- Return the index into the active-logins file (utmp) for
  --   the controlling terminal.   

  -- Define some macros helping to catch buffer overflows.   
end rclx.stdlib_h;
