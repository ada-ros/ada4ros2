pragma Warnings (Off);
with Ada.Text_Io; use Ada.Text_IO;
pragma Warnings (On);

with Ada.Unchecked_Conversion; -- Uh oh...

with Interfaces.C.Extensions;
with Interfaces.C.Strings;

with Rcl_Types_H;

package RCL is
   
   ROS_Exception : exception;   

private
   
   --  To simplify the use of the low-level binding through child packages,
   --    some convenience things are declared here, not intended for the
   --    actual users of this library.
  
   package C  renames Interfaces.C;
   package CS renames Interfaces.C.Strings;
   package CX renames Interfaces.C.Extensions;
   
   use all type C.int;
   use all type C.size_t;
   use all type C.unsigned_char;
   
   procedure Check (Ret : rcl_types_h.Rcl_Ret_T);
   
   function Correct (Ret : CX.Bool) return Boolean is (Ret = 0);
   
   Null_Ptr : CS.Chars_Ptr renames CS.Null_Ptr;
   
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
   
   type Char_Access is access constant C.Char;
   
   ------------------------------
   -- Char_Access_To_Chars_Ptr --
   ------------------------------

   function Char_Access_To_Chars_Ptr is new 
     Ada.Unchecked_Conversion (Char_Access, CS.Chars_Ptr);
   
   ------------
   -- To_Ptr --
   ------------

   function To_Ptr (Str                   : C_String;
                    Null_Instead_Of_Empty : Boolean := True) 
                    return CS.Chars_Ptr is
     (if Null_Instead_Of_Empty and then Str.Len = 0 
      then Null_Ptr
      else Char_Access_To_Chars_Ptr (Str.Cstr (Str.Cstr'First)'Unchecked_Access));
   --  This obviously presumes the pointer won't be kept elsewhere.
   --  We shall see if this blows up in our face or what.
   
end RCL;
