with Rcl.Imports;

package body RCL.Subscriptions is

   function Take_Raw (This   :      in out Subscription;
                      Buffer :         out Stream_Element_Array;
                      Info   :         out Message_Info)
                      return               Boolean is
   begin
      return False;
   end Take_Raw;

   overriding procedure Finalize (This : in out Subscription) is null;

end RCL.Subscriptions;
