pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_generator_c.builtin_interfaces_msg_duration_ustruct_h;
with Interfaces.C.Extensions;
with rosidl_generator_c.stddef_h;

package rosidl_generator_c.builtin_interfaces_msg_duration_ufunctions_h is

  -- generated from rosidl_generator_c/resource/msg__functions.h.em
  -- generated code does not contain a copyright notice
  --/ Initialize builtin_interfaces/Duration message.
  --*
  -- * If the init function is called twice for the same message without
  -- * calling fini inbetween previously allocated memory will be leaked.
  -- * \param[in,out] msg The previously allocated message pointer.
  -- * Fields without a default value will not be initialized by this function.
  -- * You might want to call memset(msg, 0, sizeof(builtin_interfaces__msg__Duration)) before
  -- * or use builtin_interfaces__msg__Duration__create() to allocate and initialize the message.
  -- * \return true if initialization was successful, otherwise false
  --  

   function builtin_interfaces_u_msg_u_Duration_u_init (msg : access rosidl_generator_c.builtin_interfaces_msg_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/duration__functions.h:32
   pragma Import (C, builtin_interfaces_u_msg_u_Duration_u_init, "builtin_interfaces__msg__Duration__init");

  --/ Finalize builtin_interfaces/Duration message.
  --*
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure builtin_interfaces_u_msg_u_Duration_u_fini (msg : access rosidl_generator_c.builtin_interfaces_msg_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration);  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/duration__functions.h:40
   pragma Import (C, builtin_interfaces_u_msg_u_Duration_u_fini, "builtin_interfaces__msg__Duration__fini");

  --/ Create builtin_interfaces/Duration message.
  --*
  -- * It allocates the memory for the message, sets the memory to zero, and
  -- * calls builtin_interfaces__msg__Duration__init().
  -- * \return The pointer to the initialized message if successful,
  -- * otherwise NULL
  --  

   function builtin_interfaces_u_msg_u_Duration_u_create return access rosidl_generator_c.builtin_interfaces_msg_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration;  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/duration__functions.h:51
   pragma Import (C, builtin_interfaces_u_msg_u_Duration_u_create, "builtin_interfaces__msg__Duration__create");

  --/ Destroy builtin_interfaces/Duration message.
  --*
  -- * It calls builtin_interfaces__msg__Duration__fini() and frees the memory of the message.
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure builtin_interfaces_u_msg_u_Duration_u_destroy (msg : access rosidl_generator_c.builtin_interfaces_msg_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration);  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/duration__functions.h:60
   pragma Import (C, builtin_interfaces_u_msg_u_Duration_u_destroy, "builtin_interfaces__msg__Duration__destroy");

  --/ Initialize array of builtin_interfaces/Duration messages.
  --*
  -- * It allocates the memory for the number of elements and
  -- * calls builtin_interfaces__msg__Duration__init() for each element of the array.
  -- * \param[in,out] array The allocated array pointer.
  -- * \param[in] size The size / capacity of the array.
  -- * \return true if initialization was successful, otherwise false
  -- * If the array pointer is valid and the size is zero it is guaranteed
  -- # to return true.
  --  

   function builtin_interfaces_u_msg_u_Duration_u_Array_u_init (c_array : access rosidl_generator_c.builtin_interfaces_msg_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/duration__functions.h:75
   pragma Import (C, builtin_interfaces_u_msg_u_Duration_u_Array_u_init, "builtin_interfaces__msg__Duration__Array__init");

  --/ Finalize array of builtin_interfaces/Duration messages.
  --*
  -- * It calls builtin_interfaces__msg__Duration__fini() for each element of the array and
  -- * frees the memory for the number of elements.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure builtin_interfaces_u_msg_u_Duration_u_Array_u_fini (c_array : access rosidl_generator_c.builtin_interfaces_msg_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/duration__functions.h:85
   pragma Import (C, builtin_interfaces_u_msg_u_Duration_u_Array_u_fini, "builtin_interfaces__msg__Duration__Array__fini");

  --/ Create array of builtin_interfaces/Duration messages.
  --*
  -- * It allocates the memory for the array and
  -- * calls builtin_interfaces__msg__Duration__Array__init().
  -- * \param[in] size The size / capacity of the array.
  -- * \return The pointer to the initialized array if successful, otherwise NULL
  --  

   function builtin_interfaces_u_msg_u_Duration_u_Array_u_create (size : rosidl_generator_c.stddef_h.size_t) return access rosidl_generator_c.builtin_interfaces_msg_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration_u_Array;  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/duration__functions.h:96
   pragma Import (C, builtin_interfaces_u_msg_u_Duration_u_Array_u_create, "builtin_interfaces__msg__Duration__Array__create");

  --/ Destroy array of builtin_interfaces/Duration messages.
  --*
  -- * It calls builtin_interfaces__msg__Duration__Array__fini() on the array,
  -- * and frees the memory of the array.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure builtin_interfaces_u_msg_u_Duration_u_Array_u_destroy (c_array : access rosidl_generator_c.builtin_interfaces_msg_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/duration__functions.h:106
   pragma Import (C, builtin_interfaces_u_msg_u_Duration_u_Array_u_destroy, "builtin_interfaces__msg__Duration__Array__destroy");

end rosidl_generator_c.builtin_interfaces_msg_duration_ufunctions_h;
