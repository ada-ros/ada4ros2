cmake_minimum_required(VERSION 3.5)
project(rclada)

set(${PROJECT_NAME}_MAJOR_VERSION 0)
set(${PROJECT_NAME}_MINOR_VERSION 1)
set(${PROJECT_NAME}_PATCH_VERSION 0)
set(${PROJECT_NAME}_VERSION
        ${${PROJECT_NAME}_MAJOR_VERSION}.${${PROJECT_NAME}_MINOR_VERSION}.${${PROJECT_NAME}_PATCH_VERSION})
set(PROJECT_VERSION ${${PROJECT_NAME}_VERSION})

message(" ")
message("${PROJECT_NAME} version ${PROJECT_VERSION}")

if(BUILD_TESTING)
  # Silence a warning (?)
endif()

find_package(rcl REQUIRED)
find_package(rcutils REQUIRED)
find_package(rmw REQUIRED)

find_package(rclada_common REQUIRED)
find_package(rosidl_generator_ada REQUIRED)

# IMPORT THE C LIBRARIES

ada_import_c_library(rcutils)
ada_import_c_library(rcl)

return() ##################################################################################

# Find all headers in rcl and generate automatic ada headers
file(GLOB rcl_headers "${rcl_INCLUDE_DIRS}/rcl/*.h")
message(STATUS "Using RCL headers ${rcl_headers}")

# For some reason rmw folders are duplicated:
list(GET rmw_INCLUDE_DIRS 0 rmw_header_dir)

# Extra headers that we need
set(extra_headers
        ${rcutils_INCLUDE_DIRS}/rcutils/allocator.h
        ${rcutils_INCLUDE_DIRS}/rcutils/error_handling.h
        ${rcutils_INCLUDE_DIRS}/rcutils/logging.h
        ${rcutils_INCLUDE_DIRS}/rcutils/time.h
        ${rcutils_INCLUDE_DIRS}/rcutils/types/string_array.h
        ${rcutils_INCLUDE_DIRS}/rcutils/types/string_map.h
        ${rmw_header_dir}/rmw/names_and_types.h
        ${rmw_header_dir}/rmw/types.h)
message(STATUS "Using EXTRA headers ${extra_headers}")

add_custom_target(rclada_create_folder_for_generated_headers
        ALL
        ${CMAKE_COMMAND} -E make_directory gen)

# Actually generate the low-level binding during build
add_custom_target(rclada_generate_headers
        ALL
        # Note that later standards generate broken bindings at present (g++ v7.3)
        COMMAND g++ -std=c++03
          -I${rcl_INCLUDE_DIRS}
          -fdump-ada-spec-slim
          -C
          -fada-spec-parent=rclx
          ${extra_headers}
          ${rcl_headers}
#          ${rcutils_headers}
        WORKING_DIRECTORY gen)

add_dependencies(rclada_generate_headers rclada_create_folder_for_generated_headers)

# Compile high-level binding
add_custom_target(rclada_build
        ALL
        COMMAND gprbuild
                    -p -j0 -P rcl.gpr
                    -aP ${rclada_INCLUDE_DIR}
                    -XPROJECT_BINARY_DIR=${PROJECT_BINARY_DIR}/gprbuild
        COMMAND gprinstall
                    -f -m -p -P rcl.gpr
                    -aP ${rclada_INCLUDE_DIR}
                    -XPROJECT_BINARY_DIR=${PROJECT_BINARY_DIR}/gprbuild
                    --prefix=${PROJECT_BINARY_DIR}/gprinstall
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})

add_dependencies(rclada_build rclada_generate_headers)

#################################################
# Exported configurations or whatever

#target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_SOURCE_DIR})

set(cmake_version_file ${PROJECT_NAME}ConfigVersion.cmake)
configure_file(
        ${cmake_version_file}.in
        ${PROJECT_BINARY_DIR}/${cmake_version_file})

set(cmake_conf_file ${PROJECT_NAME}Config.cmake)
configure_file(
        ${cmake_conf_file}.in
        ${PROJECT_BINARY_DIR}/${cmake_conf_file})

install(FILES
        ${PROJECT_BINARY_DIR}/${cmake_conf_file}
        ${PROJECT_BINARY_DIR}/${cmake_version_file}
        DESTINATION share/${PROJECT_NAME}/cmake)

# Make this package findable
export(PACKAGE ${PROJECT_NAME})
#export(TARGETS ${PROJECT_NAME} FILE export_${PROJECT_NAME}.cmake)

install(FILES package.xml DESTINATION share/${PROJECT_NAME})
install(FILES cmake/rclada_project.cmake DESTINATION ${PROJECT_BINARY_DIR})

#get_cmake_property(_variableNames VARIABLES)
#list (SORT _variableNames)
#foreach (_variableName ${_variableNames})
#  message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()