#include <rosidl_generator_c/message_type_support_struct.h>
//#include <@_ros_msg_pkg@/msg/@_ros_msg_type@.h>
#include <std_msgs/msg/string.h>

const rosidl_message_type_support_t *
ada_get_msg_typesupport__std_msgs__msg__string () {
//    return ROSIDL_GET_MSG_TYPE_SUPPORT(@_ros_msg_pkg@, msg, @_ros_msg_type@);
     return ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, String);
}
