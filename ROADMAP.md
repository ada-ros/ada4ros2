Integration in ROS2 build process:
- rclada_common (done)
- rosidl_generator_ada (partial: missing the rosidl high-level binding)
- rclada (missing)
- rclada_examples (missing)

ROSIDL_GENERATOR_ADA:
- Generate autobinding for requested non-std msgs (missing)
- Generate High-level wrapper Ada messages over all low-level (missing)
  - Can it be done processing templates?
  - Is it better to generate a custom ada program that leverages
    the introspection functions for every message type?

RCLADA:
- Complete binding
- High-level subscription executors a-la python/c++
