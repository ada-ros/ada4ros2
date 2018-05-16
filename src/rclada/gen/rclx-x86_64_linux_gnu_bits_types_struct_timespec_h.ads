pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.x86_64_linux_gnu_bits_types_h;

package rclx.x86_64_linux_gnu_bits_types_struct_timespec_h is

  -- POSIX.1b structure for a time value.  This is like a `struct timeval' but
  --   has nanoseconds instead of microseconds.   

  -- Seconds.   
   type timespec is record
      tv_sec : aliased rclx.x86_64_linux_gnu_bits_types_h.uu_time_t;  -- /usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h:10
      tv_nsec : aliased rclx.x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h:11
   end record;
   pragma Convention (C_Pass_By_Copy, timespec);  -- /usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h:8

  -- Nanoseconds.   
end rclx.x86_64_linux_gnu_bits_types_struct_timespec_h;
