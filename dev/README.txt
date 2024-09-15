Use make.sh to build from pure scratch all packages up to $1
use make-package.sh to build semi-scratch (no regens) package $1, presumes deps OK
Use update[-package].sh to update all or one packages up to $1

Use colcon <verb> --event-handlers console_direct+ to see all output immediately (even interleaved)
Use colcon <verb> --event-handlers console_cohesion+ to see every package output post hoc

Use colcon graph to see dependencies

Use ../ada4ros2.gpr after a successful build to edit all Ada ros2 packages simultaneously in GPS
Use ../ada4ros2part.gpr with only the projects already generated for incremental fixing.
