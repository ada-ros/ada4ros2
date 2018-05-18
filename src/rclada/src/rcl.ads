pragma Warnings (Off);
with Ada.Text_Io; use Ada.Text_IO;
pragma Warnings (On);

with Ada.Unchecked_Conversion; -- Uh oh...

with Interfaces.C.Strings;

with RCLx; pragma Unreferenced (Rclx); 
with RCLx.Rcl_Types_H;

package RCL is
   
   ROS_Exception : exception;   

private
   
   --  To simplify the use of the low-level binding through child packages,
   --    some convenience things are declared here, not intended for the
   --    actual users of this library.
  
   package CS renames Interfaces.C.Strings;
   
   use RCLx;
   
   use all type RCLx.C.size_t;
   use all type RCLx.C.unsigned_char;
   
   procedure Check (Ret : RCLx.rcl_types_h.Rcl_Ret_T);
   
   function Correct (Ret : RCLx.CX.Bool) return Boolean is (Ret = 0);
   
   type C_String (Len : C.size_t) is tagged record
      Cstr : aliased C.Char_Array (1 .. Len);
   end record;
   --  Convenience type for the many conversions       
   
   ----------
   -- To_C --
   ----------

   function To_C (S : String) return C_String is
     (Len => S'Length + 1, 
      Cstr => C.To_C (S));   
   
   type Char_Access is access all C.Char;
   
   ------------------------------
   -- Char_Access_To_Chars_Ptr --
   ------------------------------

   function Char_Access_To_Chars_Ptr is new 
     Ada.Unchecked_Conversion (Char_Access, CS.Chars_Ptr);
   
   ------------
   -- To_Ptr --
   ------------

   function To_Ptr (Str : in out C_String) return CS.Chars_Ptr is
     (Char_Access_To_Chars_Ptr (Str.Cstr (Str.Cstr'First)'Unchecked_Access));
   --  This obviously presumes the pointer won't be kept elsewhere.
   --  We shall see if this blows up in our face or what.
   
end RCL;
