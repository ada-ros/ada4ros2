with Ada.Unchecked_Conversion;

with Rmw_Types_H; use Rmw_Types_H;

package RCL.Errors is

   type Error is 
     (Ok,
      Unspecified,
      Timeout,
      Other)
     with Size => Integer'Size;
   
   Other_Value : constant := 9999;
   
   for Error use
     (Ok          => RMW_RET_OK,
      Unspecified => RMW_RET_ERROR,
      Timeout     => RMW_RET_TIMEOUT,
      Other       => Other_value);
   
   function To_Error (E : Integer) return Error;
   
private
   
   function Unchecked_To_Error is new Ada.Unchecked_Conversion (Integer, Error);
   
   function To_Error (E : Integer) return Error is
     (if   Unchecked_To_Error (E)'Valid 
      then Unchecked_To_Error (E)
      else Other);

end RCL.Errors;
