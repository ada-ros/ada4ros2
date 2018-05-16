pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package rclx.x86_64_linux_gnu_bits_floatn_common_h is

  -- Macros to control TS 18661-3 glibc features where the same
  --   definitions are appropriate for all platforms.
  --   Copyright (C) 2017-2018 Free Software Foundation, Inc.
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

  -- This header should be included at the bottom of each bits/floatn.h.
  --   It defines the following macros for each _FloatN and _FloatNx type,
  --   where the same definitions, or definitions based only on the macros
  --   in bits/floatn.h, are appropriate for all glibc configurations.   

  -- Defined to 1 if the current compiler invocation provides a
  --   floating-point type with the right format for this type, and this
  --   glibc includes corresponding *fN or *fNx interfaces for it.   

  -- Defined to 1 if the corresponding __HAVE_<type> macro is 1 and the
  --   type is the first with its format in the sequence of (the default
  --   choices for) float, double, long double, _Float16, _Float32,
  --   _Float64, _Float128, _Float32x, _Float64x, _Float128x for this
  --   glibc; that is, if functions present once per floating-point format
  --   rather than once per type are present for this type.
  --   All configurations supported by glibc have _Float32 the same format
  --   as float, _Float64 and _Float32x the same format as double, the
  --   _Float64x the same format as either long double or _Float128.  No
  --   configurations support _Float128x or, as of GCC 7, have compiler
  --   support for a type meeting the requirements for _Float128x.   

  -- Defined to 1 if any _FloatN or _FloatNx types that are not
  --   ABI-distinct are however distinct types at the C language level (so
  --   for the purposes of __builtin_types_compatible_p and _Generic).   

  -- Defined to concatenate the literal suffix to be used with _FloatN
  --   or _FloatNx types, if __HAVE_<type> is 1.  The corresponding
  --   literal suffixes exist since GCC 7, for C only.   

  -- No corresponding suffix available for this type.   
  -- Defined to a complex type if __HAVE_<type> is 1.   
  -- The remaining of this file provides support for older compilers.   
   subtype u_Float32 is float;  -- /usr/include/x86_64-linux-gnu/bits/floatn-common.h:207

  -- If double, long double and _Float64 all have the same set of
  --   values, TS 18661-3 requires the usual arithmetic conversions on
  --   long double and _Float64 to produce _Float64.  For this to be the
  --   case when building with a compiler without a distinct _Float64
  --   type, _Float64 must be a typedef for long double, not for
  --   double.   

   subtype u_Float64 is double;  -- /usr/include/x86_64-linux-gnu/bits/floatn-common.h:244

   subtype u_Float32x is double;  -- /usr/include/x86_64-linux-gnu/bits/floatn-common.h:261

   subtype u_Float64x is long_double;  -- /usr/include/x86_64-linux-gnu/bits/floatn-common.h:278

end rclx.x86_64_linux_gnu_bits_floatn_common_h;
