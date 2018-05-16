pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
with rclx.x86_64_linux_gnu_bits_types_h;
with rclx.stddef_h;

package rclx.x86_64_linux_gnu_bits_libio_h is

   EOF : constant := (-1);  --  /usr/include/x86_64-linux-gnu/bits/libio.h:66

  -- Copyright (C) 1991-2018 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   Written by Per Bothner <bothner@cygnus.com>.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <http://www.gnu.org/licenses/>.
  --   As a special exception, if you link the code in this file with
  --   files compiled with a GNU compiler to produce an executable,
  --   that does not cause the resulting executable to be covered by
  --   the GNU Lesser General Public License.  This exception does not
  --   however invalidate any other reasons why the executable file
  --   might be covered by the GNU Lesser General Public License.
  --   This exception applies to code released by its copyright holders
  --   in files containing the exception.   

  -- ALL of these should be defined in _G_config.h  
  -- This define avoids name pollution if we're using GNU stdarg.h  
  -- Magic numbers and bits for the _flags field.
  --   The magic numbers use the high-order bits of _flags;
  --   the remaining bits are available for variable flags.
  --   Note: The magic numbers must all be negative if stdio
  --   emulation is desired.  

  -- These are "formatting flags" matching the iostream fmtflags enum values.  
   --  skipped empty struct u_IO_jump_t

  -- During the build of glibc itself, _IO_lock_t will already have been
  --   defined by internal headers.   

   subtype u_IO_lock_t is System.Address;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:154

  -- A streammarker remembers a position in a buffer.  
   type u_IO_FILE;
   type u_IO_marker is record
      u_next : access u_IO_marker;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:161
      u_sbuf : access u_IO_FILE;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:162
      u_pos : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:166
   end record;
   pragma Convention (C_Pass_By_Copy, u_IO_marker);  -- /usr/include/x86_64-linux-gnu/bits/libio.h:160

  -- If _pos >= 0
  -- it points to _buf->Gbase()+_pos. FIXME comment  

  -- if _pos < 0, it points to _buf->eBptr()+_pos. FIXME comment  
  -- This is the structure from the libstdc++ codecvt class.   
   type uu_codecvt_result is 
     (uu_codecvt_ok,
      uu_codecvt_partial,
      uu_codecvt_error,
      uu_codecvt_noconv);
   pragma Convention (C, uu_codecvt_result);  -- /usr/include/x86_64-linux-gnu/bits/libio.h:180

  -- The order of the elements in the following struct must match the order
  --   of the virtual functions in the libstdc++ codecvt class.   

  -- Extra data for wide character streams.   
  -- Current read pointer  
  -- End of get area.  
  -- Start of putback+get area.  
  -- Start of put area.  
  -- Current put pointer.  
  -- End of put area.  
  -- Start of reserve area.  
  -- End of reserve area.  
  -- The following fields are used to support backing up and undo.  
  -- Pointer to start of non-current get area.  
  -- Pointer to first valid character of
  --				   backup area  

  -- Pointer to end of non-current get area.  
  -- High-order word is _IO_MAGIC; rest is flags.  
   type u_IO_FILE is record
      u_flags : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:246
      u_IO_read_ptr : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:251
      u_IO_read_end : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:252
      u_IO_read_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:253
      u_IO_write_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:254
      u_IO_write_ptr : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:255
      u_IO_write_end : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:256
      u_IO_buf_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:257
      u_IO_buf_end : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:258
      u_IO_save_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:260
      u_IO_backup_base : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:261
      u_IO_save_end : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:262
      u_markers : access u_IO_marker;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:264
      u_chain : access u_IO_FILE;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:266
      u_fileno : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:268
      u_flags2 : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:272
      u_old_offset : aliased rclx.x86_64_linux_gnu_bits_types_h.uu_off_t;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:274
      u_cur_column : aliased unsigned_short;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:278
      u_vtable_offset : aliased signed_char;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:279
      u_shortbuf : aliased u_IO_FILE_u_shortbuf_array;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:280
      u_lock : System.Address;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:284
      u_offset : aliased rclx.x86_64_linux_gnu_bits_types_h.uu_off64_t;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:293
      uu_pad1 : System.Address;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:301
      uu_pad2 : System.Address;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:302
      uu_pad3 : System.Address;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:303
      uu_pad4 : System.Address;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:304
      uu_pad5 : aliased rclx.stddef_h.size_t;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:306
      u_mode : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:307
      u_unused2 : aliased u_IO_FILE_u_unused2_array;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:309
   end record;
   pragma Convention (C_Pass_By_Copy, u_IO_FILE);  -- /usr/include/x86_64-linux-gnu/bits/libio.h:245

  -- The following pointers correspond to the C++ streambuf protocol.  
  -- Note:  Tk uses the _IO_read_ptr and _IO_read_end fields directly.  
  -- Current read pointer  
  -- End of get area.  
  -- Start of putback+get area.  
  -- Start of put area.  
  -- Current put pointer.  
  -- End of put area.  
  -- Start of reserve area.  
  -- End of reserve area.  
  -- The following fields are used to support backing up and undo.  
  -- Pointer to start of non-current get area.  
  -- Pointer to first valid character of backup area  
  -- Pointer to end of non-current get area.  
  -- This used to be _offset but it's too small.   
  -- 1+column number of pbase(); 0 is unknown.  
  --  char* _save_gptr;  char* _save_egptr;  
  -- Wide character stream stuff.   
  -- Make sure we don't get into trouble again.   
   --  skipped empty struct u_IO_FILE_plus

  -- Functions to do I/O and file management for a stream.   
  -- Read NBYTES bytes from COOKIE into a buffer pointed to by BUF.
  --   Return number of bytes read.   

   --  skipped function type uu_io_read_fn

  -- Write N bytes pointed to by BUF to COOKIE.  Write all N bytes
  --   unless there is an error.  Return number of bytes written.  If
  --   there is an error, return 0 and do not write anything.  If the file
  --   has been opened for append (__mode.__append set), then set the file
  --   pointer to the end of the file and then do the write; if not, just
  --   write at the current file pointer.   

   --  skipped function type uu_io_write_fn

  -- Move COOKIE's file position to *POS bytes from the
  --   beginning of the file (if W is SEEK_SET),
  --   the current position (if W is SEEK_CUR),
  --   or the end of the file (if W is SEEK_END).
  --   Set *POS to the new file position.
  --   Returns zero if successful, nonzero if not.   

   --  skipped function type uu_io_seek_fn

  -- Close COOKIE.   
   --  skipped function type uu_io_close_fn

  -- User-visible names for the above.   
   --  skipped function type cookie_read_function_t

   --  skipped function type cookie_write_function_t

   --  skipped function type cookie_seek_function_t

   --  skipped function type cookie_close_function_t

  -- The structure with the cookie function pointers.   
  -- Read bytes.   
   type u_IO_cookie_io_functions_t is record
      read : access function
           (arg1 : System.Address;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : rclx.stddef_h.size_t) return rclx.x86_64_linux_gnu_bits_types_h.uu_ssize_t;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:370
      write : access function
           (arg1 : System.Address;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : rclx.stddef_h.size_t) return rclx.x86_64_linux_gnu_bits_types_h.uu_ssize_t;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:371
      seek : access function
           (arg1 : System.Address;
            arg2 : access rclx.x86_64_linux_gnu_bits_types_h.uu_off64_t;
            arg3 : int) return int;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:372
      close : access function (arg1 : System.Address) return int;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:373
   end record;
   pragma Convention (C_Pass_By_Copy, u_IO_cookie_io_functions_t);  -- /usr/include/x86_64-linux-gnu/bits/libio.h:374

   --  skipped anonymous struct anon_6

  -- Write bytes.   
  -- Seek/tell file position.   
  -- Close file.   
   subtype cookie_io_functions_t is u_IO_cookie_io_functions_t;  -- /usr/include/x86_64-linux-gnu/bits/libio.h:375

   --  skipped empty struct u_IO_cookie_file

  -- Initialize one of those.   
   --  skipped func _IO_cookie_init

   --  skipped func __underflow

   --  skipped func __uflow

   --  skipped func __overflow

   --  skipped func _IO_getc

   --  skipped func _IO_putc

   --  skipped func _IO_feof

   --  skipped func _IO_ferror

   --  skipped func _IO_peekc_locked

  -- This one is for Emacs.  
   --  skipped func _IO_flockfile

   --  skipped func _IO_funlockfile

   --  skipped func _IO_ftrylockfile

   --  skipped func _IO_vfscanf

   --  skipped func _IO_vfprintf

   --  skipped func _IO_padn

   --  skipped func _IO_sgetn

   --  skipped func _IO_seekoff

   --  skipped func _IO_seekpos

   --  skipped func _IO_free_backup_area

  -- While compiling glibc we have to handle compatibility with very old
  --   versions.   

  -- A special optimized version of the function above.  It optimizes the
  --   case of initializing an unoriented byte stream.   

end rclx.x86_64_linux_gnu_bits_libio_h;
