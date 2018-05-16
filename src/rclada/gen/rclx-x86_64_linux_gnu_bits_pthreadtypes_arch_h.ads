pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package rclx.x86_64_linux_gnu_bits_pthreadtypes_arch_h is

  -- Copyright (C) 2002-2018 Free Software Foundation, Inc.
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

  -- Definitions for internal mutex struct.   
   type uu_pthread_rwlock_arch_t_uu_pad1_array is array (0 .. 6) of aliased unsigned_char;
   type uu_pthread_rwlock_arch_t is record
      uu_readers : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:67
      uu_writers : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:68
      uu_wrphase_futex : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:69
      uu_writers_futex : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:70
      uu_pad3 : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:71
      uu_pad4 : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:72
      uu_cur_writer : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:74
      uu_shared : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:75
      uu_rwelision : aliased signed_char;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:76
      uu_pad1 : aliased uu_pthread_rwlock_arch_t_uu_pad1_array;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:81
      uu_pad2 : aliased unsigned_long;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:84
      uu_flags : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:87
   end record;
   pragma Convention (C_Pass_By_Copy, uu_pthread_rwlock_arch_t);  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:65

  -- FLAGS must stay at this position in the structure to maintain
  --     binary compatibility.   

  -- FLAGS must stay at this position in the structure to maintain
  --     binary compatibility.   

  -- Extra attributes for the cleanup functions.   
end rclx.x86_64_linux_gnu_bits_pthreadtypes_arch_h;
