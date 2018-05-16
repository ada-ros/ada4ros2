pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package rclx.x86_64_linux_gnu_bits_types_u_mbstate_t_h is

  -- Integral type unchanged by default argument promotions that can
  --   hold any value corresponding to members of the extended character
  --   set, as well as at least one value that does not correspond to any
  --   member of the extended character set.   

  -- Conversion state information.   
   type uu_mbstate_t;
   subtype uu_mbstate_t_uu_wchb_array is Interfaces.C.char_array (0 .. 3);
   type anon_3 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_wch : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h:18
         when others =>
            uu_wchb : aliased uu_mbstate_t_uu_wchb_array;  -- /usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h:19
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_3);
   pragma Unchecked_Union (anon_3);type uu_mbstate_t is record
      uu_count : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h:15
      uu_value : aliased anon_3;  -- /usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h:20
   end record;
   pragma Convention (C_Pass_By_Copy, uu_mbstate_t);  -- /usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h:21

   --  skipped anonymous struct anon_2

  -- Value so far.   
end rclx.x86_64_linux_gnu_bits_types_u_mbstate_t_h;
