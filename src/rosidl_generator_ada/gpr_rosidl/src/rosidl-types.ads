with Interfaces.C;

package Rosidl.Types is
   
   package C renames Interfaces.C;

   --  Predefined types and their Ada equivalent
   subtype ROS_Bool is Boolean;
   subtype ROS_Byte is Natural range 0 .. 2**8 - 1;

end Rosidl.Types;
