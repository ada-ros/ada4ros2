with RCL.Utils;

package body RCL.Logging is

   Autoshut : Utils.Initshut (On_Initialize => null,
                              On_Finalize   => Shutdown'Access) with Unreferenced;

   ---------
   -- Log --
   ---------

   procedure Log (Severity : Levels;
                  Message  : String;
                  Locate   : Boolean := False; -- see Include_Source_Location
                  Location : Log_Location := No_Location; -- Manual location
                  Name     : String  := ""     -- Identify a particular logger
                 )
   is
      pragma Unreferenced (Locate);

      Function_Name : C_String := To_C (Location.Subprogram);
      File_Name     : C_String := To_C (Location.File_Name);
      Cname         : C_String := To_C (Name);
      Format        : C_String := To_C (Message);

      Cloc : aliased constant Rcutils_Log_Location_T :=
               (Function_Name.To_Ptr,
                File_Name.To_Ptr,
                C.Size_T (Location.Line_Number));
   begin
      Rcutils_Log (Cloc'Access,
                   C.Int (Severity),
                   Cname.To_Ptr,
                   Format.To_Ptr);
   end Log;


   -----------
   -- Debug --
   -----------

   procedure Debug (Message  : String;
                    Locate   : Boolean      := False;
                    Location : Log_Location := No_Location;
                    Name     : String       := "") is
   begin
      Log (Levels (RCUTILS_LOG_SEVERITY_DEBUG),
           Message,
           Locate,
           Location,
           Name);
   end Debug;

   ----------
   -- Info --
   ----------

   procedure Info (Message  : String;
                    Locate   : Boolean      := False;
                    Location : Log_Location := No_Location;
                    Name     : String       := "") is
   begin
      Log (Levels (RCUTILS_LOG_SEVERITY_INFO),
           Message,
           Locate,
           Location,
           Name);
   end Info;

   ----------
   -- Warn --
   ----------

   procedure Warn (Message  : String;
                    Locate   : Boolean      := False;
                    Location : Log_Location := No_Location;
                    Name     : String       := "") is
   begin
      Log (Levels (RCUTILS_LOG_SEVERITY_WARN),
           Message,
           Locate,
           Location,
           Name);
   end Warn;

   -----------
   -- Error --
   -----------

   procedure Error (Message  : String;
                    Locate   : Boolean      := False;
                    Location : Log_Location := No_Location;
                    Name     : String       := "") is
   begin
      Log (Levels (RCUTILS_LOG_SEVERITY_ERROR),
           Message,
           Locate,
           Location,
           Name);
   end Error;

   -----------
   -- Fatal --
   -----------

   procedure Fatal (Message  : String;
                    Locate   : Boolean      := False;
                    Location : Log_Location := No_Location;
                    Name     : String       := "") is
   begin
      Log (Levels (RCUTILS_LOG_SEVERITY_FATAL),
           Message,
           Locate,
           Location,
           Name);
   end Fatal;

   --------------
   -- Shutdown --
   --------------

   procedure Shutdown is
   begin
      if Initialized then
         Check (Rcutils_Logging_Shutdown);
      end if;
   end Shutdown;

begin
   if not Initialized then
      Check (Rcutils_Logging_Initialize);
   end if;
end RCL.Logging;
