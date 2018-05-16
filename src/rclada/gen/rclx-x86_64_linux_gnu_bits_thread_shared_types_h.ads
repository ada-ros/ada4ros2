pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package rclx.x86_64_linux_gnu_bits_thread_shared_types_h is

  -- Common threading primitives definitions for both POSIX and C11.
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

  -- Arch-specific definitions.  Each architecture must define the following
  --   macros to define the expected sizes of pthread data types:
  --   __SIZEOF_PTHREAD_ATTR_T        - size of pthread_attr_t.
  --   __SIZEOF_PTHREAD_MUTEX_T       - size of pthread_mutex_t.
  --   __SIZEOF_PTHREAD_MUTEXATTR_T   - size of pthread_mutexattr_t.
  --   __SIZEOF_PTHREAD_COND_T        - size of pthread_cond_t.
  --   __SIZEOF_PTHREAD_CONDATTR_T    - size of pthread_condattr_t.
  --   __SIZEOF_PTHREAD_RWLOCK_T      - size of pthread_rwlock_t.
  --   __SIZEOF_PTHREAD_RWLOCKATTR_T  - size of pthread_rwlockattr_t.
  --   __SIZEOF_PTHREAD_BARRIER_T     - size of pthread_barrier_t.
  --   __SIZEOF_PTHREAD_BARRIERATTR_T - size of pthread_barrierattr_t.
  --   Also, the following macros must be define for internal pthread_mutex_t
  --   struct definitions (struct __pthread_mutex_s):
  --   __PTHREAD_COMPAT_PADDING_MID   - any additional members after 'kind'
  --				    and before '__spin' (for 64 bits) or
  --				    '__nusers' (for 32 bits).
  --   __PTHREAD_COMPAT_PADDING_END   - any additional members at the end of
  --				    the internal structure.
  --   __PTHREAD_MUTEX_LOCK_ELISION   - 1 if the architecture supports lock
  --				    elision or 0 otherwise.
  --   __PTHREAD_MUTEX_NUSERS_AFTER_KIND - control where to put __nusers.  The
  --				       preferred value for new architectures
  --				       is 0.
  --   __PTHREAD_MUTEX_USE_UNION      - control whether internal __spins and
  --				    __list will be place inside a union for
  --				    linuxthreads compatibility.
  --				    The preferred value for new architectures
  --				    is 0.
  --   For a new port the preferred values for the required defines are:
  --   #define __PTHREAD_COMPAT_PADDING_MID
  --   #define __PTHREAD_COMPAT_PADDING_END
  --   #define __PTHREAD_MUTEX_LOCK_ELISION         0
  --   #define __PTHREAD_MUTEX_NUSERS_AFTER_KIND    0
  --   #define __PTHREAD_MUTEX_USE_UNION            0
  --   __PTHREAD_MUTEX_LOCK_ELISION can be set to 1 if the hardware plans to
  --   eventually support lock elision using transactional memory.
  --   The additional macro defines any constraint for the lock alignment
  --   inside the thread structures:
  --   __LOCK_ALIGNMENT - for internal lock/futex usage.
  --   Same idea but for the once locking primitive:
  --   __ONCE_ALIGNMENT - for pthread_once_t/once_flag definition.
  --   And finally the internal pthread_rwlock_t (struct __pthread_rwlock_arch_t)
  --   must be defined.
  --  

  -- Common definition of pthread_mutex_t.  
   type uu_pthread_internal_list is record
      uu_prev : access uu_pthread_internal_list;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:84
      uu_next : access uu_pthread_internal_list;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:85
   end record;
   pragma Convention (C_Pass_By_Copy, uu_pthread_internal_list);  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:82

   subtype uu_pthread_list_t is uu_pthread_internal_list;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:86

  -- Lock elision support.   
  -- Mutex __spins initializer used by PTHREAD_MUTEX_INITIALIZER.   
   type uu_pthread_mutex_s is record
      uu_lock : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:120
      uu_count : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:121
      uu_owner : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:122
      uu_nusers : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:124
      uu_kind : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:128
      uu_spins : aliased short;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:134
      uu_elision : aliased short;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:134
      uu_list : aliased uu_pthread_list_t;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:135
   end record;
   pragma Convention (C_Pass_By_Copy, uu_pthread_mutex_s);  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:118

  -- KIND must stay at this position in the structure to maintain
  --     binary compatibility with static initializers.   

  -- Common definition of pthread_cond_t.  
   type uu_pthread_cond_s;
   type anon_13;
   type anon_14 is record
      uu_low : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:158
      uu_high : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:159
   end record;
   pragma Convention (C_Pass_By_Copy, anon_14);
   type anon_13 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_wseq : aliased Extensions.unsigned_long_long;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:155
         when others =>
            uu_wseq32 : aliased anon_14;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:160
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_13);
   pragma Unchecked_Union (anon_13);type anon_15;
   type anon_16 is record
      uu_low : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:167
      uu_high : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:168
   end record;
   pragma Convention (C_Pass_By_Copy, anon_16);
   type anon_15 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_g1_start : aliased Extensions.unsigned_long_long;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:164
         when others =>
            uu_g1_start32 : aliased anon_16;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:169
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_15);
   pragma Unchecked_Union (anon_15);type uu_pthread_cond_s_uu_g_refs_array is array (0 .. 1) of aliased unsigned;
   type uu_pthread_cond_s_uu_g_size_array is array (0 .. 1) of aliased unsigned;
   type uu_pthread_cond_s_uu_g_signals_array is array (0 .. 1) of aliased unsigned;
   type uu_pthread_cond_s is record
      parent : aliased anon_13;
      field_2 : aliased anon_15;
      uu_g_refs : aliased uu_pthread_cond_s_uu_g_refs_array;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:171
      uu_g_size : aliased uu_pthread_cond_s_uu_g_size_array;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:172
      uu_g1_orig_size : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:173
      uu_wrefs : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:174
      uu_g_signals : aliased uu_pthread_cond_s_uu_g_signals_array;  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:175
   end record;
   pragma Convention (C_Pass_By_Copy, uu_pthread_cond_s);  -- /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:151

end rclx.x86_64_linux_gnu_bits_thread_shared_types_h;
