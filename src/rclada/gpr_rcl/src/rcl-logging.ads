with Rcutils_Logging_H; use Rcutils_Logging_H;

package RCL.Logging with Elaborate_Body is

   type Levels is range
     RCUTILS_LOG_SEVERITY_UNSET .. RCUTILS_LOG_SEVERITY_FATAL;
   
   Include_Source_Location : constant Boolean := False;
   --  For now disabled. Using the (expensive) symbolic traceback facilities,
   --    it could be possible to add this info to each logging call.
   
   type Log_Location (<>) is private;
   
   No_Location : constant Log_Location;
   
   procedure Set_Name (Name : String);
   --  A global name can be set that will be used when no other name is given
   
   function Location (Subprogram  : String;
                      File_Name   : String;
                      Line_Number : Natural) return Log_Location;
   
   function Initialized return Boolean;
   
   procedure Log (Severity : Levels;
                  Message  : String;
                  Locate   : Boolean := False; -- see Include_Source_Location
                  Location : Log_Location := No_Location; -- Manual location
                  Name     : String  := ""     -- Identify a particular logger
                 );
   --  Not really practical to be called directly, intended to be used by 
   --  the others:
   
   procedure Debug (Message  : String;
                    Locate   : Boolean      := False;
                    Location : Log_Location := No_Location;
                    Name     : String       := "");
   
   procedure Info (Message  : String;
                    Locate   : Boolean      := False;
                    Location : Log_Location := No_Location;
                    Name     : String       := "");
   
   procedure Warn (Message  : String;
                    Locate   : Boolean      := False;
                    Location : Log_Location := No_Location;
                    Name     : String       := "");
   
   procedure Error (Message  : String;
                    Locate   : Boolean      := False;
                    Location : Log_Location := No_Location;
                    Name     : String       := "");
   
   procedure Fatal (Message  : String;
                    Locate   : Boolean      := False;
                    Location : Log_Location := No_Location;
                    Name     : String       := "");
   
   procedure Shutdown;      
   
private

   function Initialized return Boolean is 
     (G_Rcutils_Logging_Initialized /= 0);
   
   type Log_Location (Sub_Len, File_Len : Natural) is record
      Subprogram  : String (1 .. Sub_Len);
      File_Name   : String (1 .. File_Len);
      Line_Number : Natural;
   end record;

   function Location (Subprogram  : String;
                      File_Name   : String;
                      Line_Number : Natural) return Log_Location is
     (Sub_Len     => Subprogram'Length,
      File_Len    => File_Name'Length,
      Subprogram  => Subprogram,
      File_Name   => File_Name,
      Line_Number => Line_Number);
   
   No_Location : constant Log_Location := Location ("", "", 0);
   
end RCL.Logging;
