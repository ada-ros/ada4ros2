with Rosidl_Generator_C_Message_Type_Support_Struct_H; use Rosidl_Generator_C_Message_Type_Support_Struct_H;

package Rosidl is

   package Typesupport is

      type Msg_Support_Ptr is access constant rosidl_message_type_support_t
        with Storage_Size => 0;

   end Typesupport;

end Rosidl;
