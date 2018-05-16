pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package rclx.x86_64_linux_gnu_bits_floatn_h is

  -- Macros to control TS 18661-3 glibc features on x86.
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

  -- Defined to 1 if the current compiler invocation provides a
  --   floating-point type with the IEEE 754 binary128 format, and this
  --   glibc includes corresponding *f128 interfaces for it.  The required
  --   libgcc support was added some time after the basic compiler
  --   support, for x86_64 and x86.   

  -- Defined to 1 if __HAVE_FLOAT128 is 1 and the type is ABI-distinct
  --   from the default float, double and long double types in this glibc.   

  -- Defined to 1 if the current compiler invocation provides a
  --   floating-point type with the right format for _Float64x, and this
  --   glibc includes corresponding *f64x interfaces for it.   

  -- Defined to 1 if __HAVE_FLOAT64X is 1 and _Float64x has the format
  --   of long double.  Otherwise, if __HAVE_FLOAT64X is 1, _Float64x has
  --   the format of _Float128, which must be different from that of long
  --   double.   

  -- Defined to concatenate the literal suffix to be used with _Float128
  --   types, if __HAVE_FLOAT128 is 1.  

  -- The literal suffix f128 exists only since GCC 7.0.   
  -- Defined to a complex binary128 type if __HAVE_FLOAT128 is 1.   
  -- Add a typedef for older GCC compilers which don't natively support
  --   _Complex _Float128.   

   subtype uu_cfloat128 is <complex>;  -- /usr/include/x86_64-linux-gnu/bits/floatn.h:75

  -- The remaining of this file provides support for older compilers.   
  -- The type _Float128 exists only since GCC 7.0.   
   subtype u_Float128 is uu_float128;  -- /usr/include/x86_64-linux-gnu/bits/floatn.h:87

  -- __builtin_huge_valf128 doesn't exist before GCC 7.0.   
  -- Older GCC has only a subset of built-in functions for _Float128 on
  --   x86, and __builtin_infq is not usable in static initializers.
  --   Converting a narrower sNaN to _Float128 produces a quiet NaN, so
  --   attempts to use _Float128 sNaNs will not work properly with older
  --   compilers.   

  -- In math/math.h, __MATH_TG will expand signbit to __builtin_signbit*,
  --   e.g.: __builtin_signbitf128, before GCC 6.  However, there has never
  --   been a __builtin_signbitf128 in GCC and the type-generic builtin is
  --   only available since GCC 6.   

end rclx.x86_64_linux_gnu_bits_floatn_h;
