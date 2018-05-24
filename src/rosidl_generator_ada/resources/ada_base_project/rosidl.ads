with Interfaces.C.Extensions;

package Rosidl with Preelaborate is

   package Typesupport is

      type Msg_Support_Ptr is access constant Interfaces.C.Extensions.Opaque_Structure_Def
        with Storage_Size => 0;

   end Typesupport;

end Rosidl;
