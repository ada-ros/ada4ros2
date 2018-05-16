pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.x86_64_linux_gnu_bits_types_h;
with rclx.x86_64_linux_gnu_bits_types_u_mbstate_t_h;

package rclx.x86_64_linux_gnu_bits_uG_config_h is

  -- This file is needed by libio to define various configuration parameters.
  --   These are always the same in the GNU C library.   

  -- Define types for libio in terms of the standard internal type names.   
   type u_G_fpos_t is record
      uu_pos : aliased rclx.x86_64_linux_gnu_bits_types_h.uu_off_t;  -- /usr/include/x86_64-linux-gnu/bits/_G_config.h:28
      uu_state : aliased rclx.x86_64_linux_gnu_bits_types_u_mbstate_t_h.uu_mbstate_t;  -- /usr/include/x86_64-linux-gnu/bits/_G_config.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, u_G_fpos_t);  -- /usr/include/x86_64-linux-gnu/bits/_G_config.h:30

   --  skipped anonymous struct anon_4

   type u_G_fpos64_t is record
      uu_pos : aliased rclx.x86_64_linux_gnu_bits_types_h.uu_off64_t;  -- /usr/include/x86_64-linux-gnu/bits/_G_config.h:33
      uu_state : aliased rclx.x86_64_linux_gnu_bits_types_u_mbstate_t_h.uu_mbstate_t;  -- /usr/include/x86_64-linux-gnu/bits/_G_config.h:34
   end record;
   pragma Convention (C_Pass_By_Copy, u_G_fpos64_t);  -- /usr/include/x86_64-linux-gnu/bits/_G_config.h:35

   --  skipped anonymous struct anon_5

  -- These library features are always available in the GNU C library.   
  -- This is defined by <bits/stat.h> if `st_blksize' exists.   
end rclx.x86_64_linux_gnu_bits_uG_config_h;
