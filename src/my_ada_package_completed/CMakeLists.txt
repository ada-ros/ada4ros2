cmake_minimum_required(VERSION 3.5)
project(my_ada_package_completed)

find_package(ament_cmake REQUIRED)
find_package(rclada_common REQUIRED)

ada_begin_package()	# Retrieves Ada context from other Ada packages that are dependencies

ada_add_executables(
	ada_code	    # This is a CMake target name, so anything goes.
	${PROJECT_SOURCE_DIR}/ada_code # ABSOLUTE path to the GNAT project root inside the package
    obj             # Relative path to the binary output, as defined in the project file
    main		    # Resulting executable, without path
    )

ada_end_package()	# Exports the updated Ada context for possible dependent
