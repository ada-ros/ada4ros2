# ada4ros2
Main repository of the ada-ros project. Currently available for linux. A recent GNAT compiler is necessary (debian testing or Ubuntu 17.10+).

This repository is actually a ROS2 workspace. It can be checked out directly and compiled as any other ROS2 overlay.

## Instructions
This project relies on the system's default Ada compiler, which nowadays is GNAT FSF 7. Installing the `gnat` and `gprbuild` packages should be enough in Ubuntu/Debian.

1. Follow the official instructions to install ROS2. This project has been tested using the "[from source](https://github.com/ros2/ros2/wiki/Linux-Development-Setup)" way.
1. Clone this repository with submodules: `$ git clone --recurse-submodules`.
1. Enter this repository root folder and issue `$ ament build`
1. Source the ./install/local_setup.bash script (or the one right for you).
1. Try to run some example nodes: `$ ros2 run rclada_examples listener`. Tab completion should work too.

Alternatively, you can import with `vcs` the [ada4ros2.repos](https://raw.githubusercontent.com/ada-ros/ada4ros2/master/ada4ros2.repos) file in this repository to prepare the Ada workspace overlay:

1. Detailed instructions to come soon.

## Testing your installation

Assuming, you have successfully built the ada4ros2 overlay and sourced it, you can run its examples and self-test node to ensure it works as expected:

- `ros2 run rclada rclada_selftest`: tests all rclada binding features.
- `ros2 run rclada_test_multicore <n>`: tests the pooled executor, with _n_ threads.    

- `ros2 run rclada_examples <executable>`, which executable one of:
    - talker, listener, add_two_ints_server, add_two_ints_client[_async]: examples compatible with the ones in the demo_nodes_cpp/demo_nodes_py packages.
    - listener_metadata: as listener, but additionally dumps thorough metadata information about received messages
    - graph_info: shows topological information about the topics/subscriptions/services.
    - pong_class, pong_generic: nodes that send messages to each other illustrating the two ways of node extension in Ada, either using generics or using classwide inheritance.
## Creating Ada nodes

Nodes can be entirely written in Ada, without the need for any C/C++ files or main program.
Please check the examples in the [rclada_examples](https://github.com/ada-ros/rclada_examples) repository for some ideas.

Ada code is compiled using gprbuild. This project provides some CMake functions to greatly simplify
the inclusion of a GPR project in the ROS2 build process:

- Your ROS2 package should use the **cmake** or **ament_cmake** build method of ament/colcon.
- See the next section and the package `rclada_examples` to see the available CMake functions.

### cmake build type

To simplify the integration of GPR-based Ada projects, the rclada package provides the following CMake functions (all of them starting with `ada_*`. The two first ones are the most important, and the rest could be useful for special Ada projects (like bindings):

- `ada_add_executables(TARGET SRCDIR DSTDIR EXECUTABLES)` declares the Ada targets built by the package:
    - TARGET is a name on which other targets may depend.
    - SRCDIR is a relative path in the package containing an Ada/GPR project.
    - OUTDIR is the relative path from the .gpr project file in which the final executables are built.
    - EXECUTABLES is the remainder of arguments, which are the executables built by the Ada project.
    
- `ada_add_library(TARGET SRCDIR GPRFILE)` declares an Ada library that is made available to other packages:
    - TARGET (same as above)
    - SRCDIR (same as above)
    - GPRFILE: GPR library project which will be built and installed in the Ada environment.

- `ada_export_package()`
    - Similar to `ament_package`, must be called last to ensure Ada environment settings are propagated.

- `ada_import_msgs(PKG_NAME)`
    - Force the generation of the Ada specification files corresponding to messages and services in PKG_NAME. They are made available through a GPR project of name `ros2_typesupport_PKG_NAME.gpr`
    - Note that if rclada is already installed in your workspace, any new .msg or .srv files will be automatically processed in their corresponding packages

- `ada_import_c_libraries(ARGN)`
    - ARGN is a list of library files (*.so, *.a) that will be made available to the Ada environment as `clib_*` GPR project files.

- `ada_generate_binding(TARGET SRCDIR GPRFILE INCLUDE)` generates a supporting low-level Ada binding for the given C header files, with `g++ -fdump-ada-spec`, that is integrated in a high-level Ada project:
    - TARGET (as above)
    - SRCDIR (as above), contains the high-level Ada project.
    - GPRFILE (as above)
    - INCLUDE: semicolon-separated list of C headers

[colcon](http://colcon.readthedocs.io/en/released/) is being deployed into ROS2, and the ada4ros2 project is awaiting for the first ROS2 version that includes it in its official documentation (see pull request [#168](https://github.com/ros2/design/pull/168)) to migrate any necessary facilities.

## Using the rclada ROS2 Client Library binding.

The library is provided by the rclada package, on which your own package has to depend.

The GPR projects that you can use in your nodes, that you have to `with` on your own project files, are:

- `rcl.gpr`, which makes available the Ada RCL equivalent client library.
- `rosidl.gpr`, which provides dynamic support for messages and typesupports.
- `ros2_typesupport_*.gpr`, which are necessary to use messages/services from other packages.
    - An exception are the `builtin_msgs` and `std_msgs` packages, which are always available.

There are two hierarchies of Ada packages in the Ada RCL binding:

1. `RCL.*` packages form the high-level, manually curated binding.
1. `RCLx.*` is the automatically generated binding (with `g++ -fdump-ada-spec`). It is not intended for direct use but it should be complete if something is still missing in the high-level binding. It also ensures that changes in the C RCL are detected and properly integrated in the Ada high-level binding.

Additionally, there is both a high-level and low-level binding to `rosidl` packages:

1. `ROSIDL.*` packages are used by `RCL.*`, and by users to deal with messages/services.
1. The low level bindings to `rosidl_generator_c`, `rosidl_typesupport_c`, and `rosidl_typesupport_introspection_c` 
are too autogenerated, and should not be needed unless you use something from `RCLx.*`, which should not be the case.

### Implementation status

#### RCL client library:

These statuses refer to the high-level binding; the low-level one is always generated.

- Main features:
    - `RCL.Node`: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
    - `RCL.Publisher`: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
    - `RCL.Subscription`: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
    - `RCL.Client`: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
    - `RCL.Service`: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)   
- Support:
    - `RCL.Allocators`: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
    - `RCL.Calendar`: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
    - `RCL.Executors`: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
    - `RCL.Graph`: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)    
    - `RCL.Options`: Partial ![yellow](https://placehold.it/8/ffbb00/000000?text=+) (always default QoS)
    - `RCL.Timer`: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
    - `RCL.Wait`: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)

#### ROSIDL message support for Ada

- Dynamic access: 
  - Typesupport: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
  - Simple types: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
  - Nested types: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
  - Array types: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
  - Matrix types: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
- Static access:
  - Typesupport: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)
  - Simple types: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)
  - Nested types: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)
  - Array types: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)
  - Matrix types: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)

#### ColCon integration

- cmake build type: Partial ![yellow](https://placehold.it/8/ffbb00/000000?text=+)
  - Stand-alone executables: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
  - Exportable libraries: Partial ![yellow](https://placehold.it/8/ffbb00/000000?text=+) (Only Ada nodes can directly use other Ada libraries (via project files). Of course, node interaction through message/services is possible with any language nodes.

## Extras

Some developer notes I have taken:
- Fixed size arrays are generated in place in the message struct (metadata size=fixed size)
- Variable size arrays are generated as a member message with pointer and size (metadata size=0)

Since rclada initially attempted to follow the ros2_java project structure, I did these dependency graphs on the java_examples package.
This one is simplified removing some common and indirect dependencies, you can see the full one [here](doc/java_example_depends.png).
These might help in understanding some of the interrelations amongst ROS2 packages.

![Simplified dependencies](doc/java_example_depends_lite.png)

### Acknowledgements

This project is done with the support of the following entities:

* AdaCore, provider of the open source Ada 2012 compiler https://www.adacore.com/community
* The Robotics, Perception and Real-Time group, RoPeRT, http://robots.unizar.es
* The Defense University Center of Zaragoza, CUD-Z, http://cud.unizar.es

<p align="center">  
<a href="https://www.adacore.com/community"><img src="http://beta.electronicdesign.com/sites/electronicdesign.com/files/Adacore_Logo_Cropped.jpg" height="33"></a>
<a href="http://robots.unizar.es"><img src="http://robots.unizar.es/wp/wp-content/themes/YellowMagazine/images/logo.png" height="33"></a>
<a href=" http://cud.unizar.es"><img src="http://cud.unizar.es/sites/default/files/imagenes/CUDlogolargo_alta.jpg" height="33"></a>
</p>
