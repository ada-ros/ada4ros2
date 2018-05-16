pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.x86_64_linux_gnu_bits_types_h;

package rclx.x86_64_linux_gnu_bits_types_clockid_t_h is

  -- Clock ID used in clock and timer functions.   
   subtype clockid_t is rclx.x86_64_linux_gnu_bits_types_h.uu_clockid_t;  -- /usr/include/x86_64-linux-gnu/bits/types/clockid_t.h:7

end rclx.x86_64_linux_gnu_bits_types_clockid_t_h;
