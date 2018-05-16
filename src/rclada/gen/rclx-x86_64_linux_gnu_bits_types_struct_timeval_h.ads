pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.x86_64_linux_gnu_bits_types_h;

package rclx.x86_64_linux_gnu_bits_types_struct_timeval_h is

  -- A time value that is accurate to the nearest
  --   microsecond but also has a range of years.   

  -- Seconds.   
   type timeval is record
      tv_sec : aliased rclx.x86_64_linux_gnu_bits_types_h.uu_time_t;  -- /usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h:10
      tv_usec : aliased rclx.x86_64_linux_gnu_bits_types_h.uu_suseconds_t;  -- /usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h:11
   end record;
   pragma Convention (C_Pass_By_Copy, timeval);  -- /usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h:8

  -- Microseconds.   
end rclx.x86_64_linux_gnu_bits_types_struct_timeval_h;
