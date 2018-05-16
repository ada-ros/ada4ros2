pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rclx.x86_64_linux_gnu_bits_types_struct_timeval_h;
limited with rclx.x86_64_linux_gnu_bits_types_struct_timespec_h;
limited with rclx.x86_64_linux_gnu_bits_types_u_sigset_t_h;

package rclx.x86_64_linux_gnu_sys_select_h is

   --  unsupported macro: FD_SETSIZE __FD_SETSIZE
   --  unsupported macro: NFDBITS __NFDBITS
   --  arg-macro: procedure FD_SET (fd, fdsetp)
   --    __FD_SET (fd, fdsetp)
   --  arg-macro: procedure FD_CLR (fd, fdsetp)
   --    __FD_CLR (fd, fdsetp)
   --  arg-macro: procedure FD_ISSET (fd, fdsetp)
   --    __FD_ISSET (fd, fdsetp)
   --  arg-macro: procedure FD_ZERO (fdsetp)
   --    __FD_ZERO (fdsetp)
  -- `fd_set' type and related macros, and `select'/`pselect' declarations.
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

  --	POSIX 1003.1g: 6.2 Select from File Descriptor Sets <sys/select.h>   
  -- Get definition of needed basic types.   
  -- Get __FD_* definitions.   
  -- Get sigset_t.   
  -- Get definition of timer specification structures.   
  -- The fd_set member is required to be an array of longs.   
   subtype uu_fd_mask is long;  -- /usr/include/x86_64-linux-gnu/sys/select.h:49

  -- Some versions of <linux/posix_types.h> define this macros.   
  -- It's easier to assume 8-bit bytes than to get CHAR_BIT.   
  -- fd_set for select and pselect.   
  -- XPG4.2 requires this member name.  Otherwise avoid the name
  --       from the global namespace.   

   type fd_set_fds_bits_array is array (0 .. 15) of aliased uu_fd_mask;
   type fd_set is record
      fds_bits : aliased fd_set_fds_bits_array;  -- /usr/include/x86_64-linux-gnu/sys/select.h:64
   end record;
   pragma Convention (C_Pass_By_Copy, fd_set);  -- /usr/include/x86_64-linux-gnu/sys/select.h:70

   --  skipped anonymous struct anon_12

  -- Maximum number of file descriptors in `fd_set'.   
  -- Sometimes the fd_set member is assumed to have this type.   
   subtype fd_mask is uu_fd_mask;  -- /usr/include/x86_64-linux-gnu/sys/select.h:77

  -- Number of bits per word of `fd_set' (some code assumes this is 32).   
  -- Access macros for `fd_set'.   
  -- Check the first NFDS descriptors each in READFDS (if not NULL) for read
  --   readiness, in WRITEFDS (if not NULL) for write readiness, and in EXCEPTFDS
  --   (if not NULL) for exceptional conditions.  If TIMEOUT is not NULL, time out
  --   after waiting the interval specified therein.  Returns the number of ready
  --   descriptors, or -1 for errors.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function c_select
     (uu_nfds : int;
      uu_readfds : access fd_set;
      uu_writefds : access fd_set;
      uu_exceptfds : access fd_set;
      uu_timeout : access rclx.x86_64_linux_gnu_bits_types_struct_timeval_h.timeval) return int;  -- /usr/include/x86_64-linux-gnu/sys/select.h:101
   pragma Import (C, c_select, "select");

  -- Same as above only that the TIMEOUT value is given with higher
  --   resolution and a sigmask which is been set temporarily.  This version
  --   should be used.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function pselect
     (uu_nfds : int;
      uu_readfds : access fd_set;
      uu_writefds : access fd_set;
      uu_exceptfds : access fd_set;
      uu_timeout : access constant rclx.x86_64_linux_gnu_bits_types_struct_timespec_h.timespec;
      uu_sigmask : access constant rclx.x86_64_linux_gnu_bits_types_u_sigset_t_h.uu_sigset_t) return int;  -- /usr/include/x86_64-linux-gnu/sys/select.h:113
   pragma Import (C, pselect, "pselect");

  -- Define some inlines helping to catch common problems.   
end rclx.x86_64_linux_gnu_sys_select_h;
