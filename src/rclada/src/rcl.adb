with RCL.Errors;

package body RCL is

   generic
      type Int is range <>;
   procedure Generic_Check (I : Int);

   -------------------
   -- Generic_Check --
   -------------------

   procedure Generic_Check (I : Int) is
      use Errors;
   begin
      if To_Error (Integer (I)) /= Ok then
         raise ROS_Exception with "Code:" & I'Img;
      end if;
   end Generic_Check;

   -----------
   -- Check --
   -----------

   procedure Check (Ret : RCLx.rcl_types_h.Rcl_Ret_T) is
      procedure Internal is new Generic_Check (RCLx.Rcl_Types_H.Rcl_Ret_T);
   begin
      Internal (Ret);
   end Check;

end RCL;
