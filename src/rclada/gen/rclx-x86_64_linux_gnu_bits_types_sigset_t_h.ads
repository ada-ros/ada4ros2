pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.x86_64_linux_gnu_bits_types_u_sigset_t_h;

package rclx.x86_64_linux_gnu_bits_types_sigset_t_h is

  -- A set of signals to be blocked, unblocked, or waited for.   
   subtype sigset_t is rclx.x86_64_linux_gnu_bits_types_u_sigset_t_h.uu_sigset_t;  -- /usr/include/x86_64-linux-gnu/bits/types/sigset_t.h:7

end rclx.x86_64_linux_gnu_bits_types_sigset_t_h;
