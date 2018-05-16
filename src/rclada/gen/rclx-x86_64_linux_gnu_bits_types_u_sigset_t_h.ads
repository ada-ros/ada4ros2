pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package rclx.x86_64_linux_gnu_bits_types_u_sigset_t_h is

   type uu_sigset_t_uu_val_array is array (0 .. 15) of aliased unsigned_long;
   type uu_sigset_t is record
      uu_val : aliased uu_sigset_t_uu_val_array;  -- /usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h:7
   end record;
   pragma Convention (C_Pass_By_Copy, uu_sigset_t);  -- /usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h:8

   --  skipped anonymous struct anon_11

end rclx.x86_64_linux_gnu_bits_types_u_sigset_t_h;
