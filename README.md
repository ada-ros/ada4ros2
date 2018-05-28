# ada4ros2
Main repository of the ada-ros project. Currently available for linux. A recent GNAT compiler is necessary (debian testing or Ubuntu 17.10+).

This repository is actually a ROS2 workspace. It can be checked out directly and compiled as any other ROS2 overlay:

## Instructions

1. Follow the official instructions to install ROS2. This project has been tested using the "[from source](https://github.com/ros2/ros2/wiki/Linux-Development-Setup)" way.
1. Clone this repository with submodules: `$ git clone --recurse-submodules`.
1. Enter this repository root folder and issue `$ ament build`
1. Source the ./install/local_setup.bash script (or the one right for you).
1. Try to run some example nodes: `$ ros2 run rclada_examples listener`. Tab completion should work too.

## Creating Ada nodes

The ada4ros2 project provides two ways of building Ada nodes. One is using the **cmake** build type (since the rest seem to be in a state of flux) and another is using the Ada-only colcon_ada [build type](https://github.com/ament/ament_tools/blob/master/doc/development/build_types.rst).

### cmake build type

To simplify the integration of GPR-based Ada projects, the rclada package provides the following CMake functions:

- `add_ada_executable(TARGET GPRFILE OUTFILE)`
    - TARGET is the executable being built
    - GPRFILE is the *.gpr file that provides that executable
    - OUTFILE is the subfolder+name in which the TARGET is built. It __must__ be different from the plain TARGET.

### colcon_ada build type

Not yet implemented.

[colcon](http://colcon.readthedocs.io/en/released/) is still being deployed into ROS2, and the ada4ros2 project is awaiting for the first ROS2 source version that includes it in its official documentation (see pull request [#168](https://github.com/ros2/design/pull/168)).

## Using the ROS Client Library binding (rclada).

The library is provided by the rclada node, on which your own node has to depend.

The GPR project file is named `rcl.gpr`, that you have to with on your own project file.

There are two hierarchies of Ada packages in the Ada RCL binding:

1. `RCL.*` packages form the high-level, manually curated binding. It is currently being completed.
1. `RCLx.*` is the automatically generated binding (with `g++ -fdump-ada-spec`). It is not intended for direct use but it should be complete if something is still missing in the high-level binding.

### Implementation status

#### RCL client library:

These statuses refer to the high-level binding; the low-level one is always generated.

- Main features:
    - `RCL.Node`: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
    - `RCL.Publisher`: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)
    - `RCL.Subscription`: Partial ![yellow](https://placehold.it/8/ffbb00/000000?text=+)
    - `RCL.Client`: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)
    - `RCL.Service`: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)    
- Support:
    - `RCL.Graph`: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)
    - `RCL.Time`: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)
    - `RCL.Timer`: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)
    - `RCL.Wait`: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)

Note that some features of the C RCL that are natively supported by Ada (e.g., concurrency and real-time) are low-priority and may remain unported if no clear need arises.

#### IDL message generator for Ada

- Dynamic access: Partial ![yellow](https://placehold.it/8/ffbb00/000000?text=+)
  - Simple types: Partial ![yellow](https://placehold.it/8/ffbb00/000000?text=+)
  - Array types: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)
  - Nested types: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)
- Static access:
  - Simple types: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)
  - Nested types: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)

#### ColCon integration

- cmake build type: Partial ![yellow](https://placehold.it/8/ffbb00/000000?text=+)
  - Stand-alone executables: Complete ![green](https://placehold.it/8/00aa00/000000?text=+)
  - Exportable libraries: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)
- colcon_ada build type: Pending ![red](https://placehold.it/8/ff0000/000000?text=+)

## Extras

Since rclada somewhat follows the ros2_java project structure, I did these dependency graphs on the java_examples package.
This one is simplified removing some common and indirect dependencies, you can see the full one [here](doc/java_example_depends.png).

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
