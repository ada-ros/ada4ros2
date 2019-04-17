cmake_minimum_required(VERSION 3.5)

# In order of dependence
add_subdirectory(src/rclada_common)
add_subdirectory(src/rosidl_generator_ada)
add_subdirectory(src/rclada)
add_subdirectory(src/rclada_client_skeleton)
add_subdirectory(src/rclada_examples)