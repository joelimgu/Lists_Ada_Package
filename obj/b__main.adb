pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E070 : Short_Integer; pragma Import (Ada, E070, "system__os_lib_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__exceptions_E");
   E011 : Short_Integer; pragma Import (Ada, E011, "system__soft_links_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exception_table_E");
   E038 : Short_Integer; pragma Import (Ada, E038, "ada__containers_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada__io_exceptions_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "ada__strings_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__strings__maps_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__strings__maps__constants_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "interfaces__c_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exceptions_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "system__object_reader_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "system__dwarf_lines_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__soft_links__initialize_E");
   E037 : Short_Integer; pragma Import (Ada, E037, "system__traceback__symbolic_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "ada__tags_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "ada__streams_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "system__file_control_block_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "system__finalization_root_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "ada__finalization_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "system__file_io_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "system__storage_pools_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "system__finalization_masters_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "system__storage_pools__subpools_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "ada__strings__unbounded_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "ada__text_io_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "lists_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E138 := E138 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "ada__text_io__finalize_spec");
      begin
         F1;
      end;
      E105 := E105 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__strings__unbounded__finalize_spec");
      begin
         F2;
      end;
      E113 := E113 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__storage_pools__subpools__finalize_spec");
      begin
         F3;
      end;
      E115 := E115 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__finalization_masters__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__file_io__finalize_body");
      begin
         E142 := E142 - 1;
         F5;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E023 := E023 + 1;
      Ada.Containers'Elab_Spec;
      E038 := E038 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E066 := E066 + 1;
      Ada.Strings'Elab_Spec;
      E050 := E050 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E052 := E052 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E056 := E056 + 1;
      Interfaces.C'Elab_Spec;
      E076 := E076 + 1;
      System.Exceptions'Elab_Spec;
      E025 := E025 + 1;
      System.Object_Reader'Elab_Spec;
      E078 := E078 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E045 := E045 + 1;
      System.Os_Lib'Elab_Body;
      E070 := E070 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E019 := E019 + 1;
      E011 := E011 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E037 := E037 + 1;
      E006 := E006 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E099 := E099 + 1;
      Ada.Streams'Elab_Spec;
      E097 := E097 + 1;
      System.File_Control_Block'Elab_Spec;
      E143 := E143 + 1;
      System.Finalization_Root'Elab_Spec;
      E120 := E120 + 1;
      Ada.Finalization'Elab_Spec;
      E118 := E118 + 1;
      System.File_Io'Elab_Body;
      E142 := E142 + 1;
      System.Storage_Pools'Elab_Spec;
      E122 := E122 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E115 := E115 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E113 := E113 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E105 := E105 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E138 := E138 + 1;
      E145 := E145 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\joeli\OneDrive\Documents_Me\Insa\2A\Algo\S2\TP2\obj\lists.o
   --   C:\Users\joeli\OneDrive\Documents_Me\Insa\2A\Algo\S2\TP2\obj\main.o
   --   -LC:\Users\joeli\OneDrive\Documents_Me\Insa\2A\Algo\S2\TP2\obj\
   --   -LC:\Users\joeli\OneDrive\Documents_Me\Insa\2A\Algo\S2\TP2\obj\
   --   -LC:/gnat/2020/lib/gcc/x86_64-pc-mingw32/9.3.1/adalib/
   --   -static
   --   -lgnat
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
