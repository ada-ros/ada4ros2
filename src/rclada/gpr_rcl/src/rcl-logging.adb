with RCL.Utils;

package body RCL.Logging is

   Autoshut : Utils.Initshut (On_Initialize => null,
                              On_Finalize   => Shutdown'Access) with Unreferenced;

   Global_Name : access String := new String'("");

   procedure Set_Name (Name : String) is
   begin
      Global_Name := new String'(Name);
   end Set_Name;

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

      Cloc : aliased constant Rcutils_Log_Location_T :=
               (To_C (Location.Subprogram).To_Ptr,
                To_C (Location.File_Name).To_Ptr,
                C.Size_T (Location.Line_Number));
   begin
      Rcutils_Log (Cloc'Access,
                   C.Int (Severity),
                   To_C ((if Name /= "" then Name else Global_Name.all)).To_Ptr,
                   To_C (Message).To_Ptr);
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
