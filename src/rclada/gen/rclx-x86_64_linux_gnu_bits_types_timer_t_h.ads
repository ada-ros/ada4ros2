pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.x86_64_linux_gnu_bits_types_h;

package rclx.x86_64_linux_gnu_bits_types_timer_t_h is

  -- Timer ID returned by `timer_create'.   
   subtype timer_t is rclx.x86_64_linux_gnu_bits_types_h.uu_timer_t;  -- /usr/include/x86_64-linux-gnu/bits/types/timer_t.h:7

end rclx.x86_64_linux_gnu_bits_types_timer_t_h;
