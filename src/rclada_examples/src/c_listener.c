#include <rcl/rcl.h>
#include <rosidl_generator_c/message_type_support_struct.h>
#include <std_msgs/msg/string.h>
#include <stdio.h>

int main(int argc, const char *argv[]) {

  rcl_init(argc, argv, rcl_get_default_allocator());

  rcl_node_t node = rcl_get_zero_initialized_node();
  rcl_node_options_t node_ops = rcl_node_get_default_options();
  rcl_ret_t ret = rcl_node_init(&node, "c_listener", "/", &node_ops);

  printf("Node inited: %d\n", ret);

  // ... error handling
  const rosidl_message_type_support_t * ts = ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, String);

  printf("SUPPORT: %p\n", (void*) ts);

  rcl_subscription_t subscription = rcl_get_zero_initialized_subscription();
  rcl_subscription_options_t subscription_ops = rcl_subscription_get_default_options();
  ret = rcl_subscription_init(&subscription, &node, ts, "chatter", &subscription_ops);

  printf("Subscr inited: %d\n", ret);

  ret = rcl_subscription_fini(&subscription, &node);

  printf("Subscr fin: %d\n", ret);

  ret = rcl_node_fini(&node);

  printf("Node fin: %d\n", ret);

  return 0;
}
