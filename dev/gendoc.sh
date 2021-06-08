#!/bin/bash

set -o errexit

project=doc/rclada_api.gpr

colcon build
echo Sourcing environment
source <(./printenv_ada)
gprbuild -j0 -p -P $project
~/opt/gnat/2021/bin/gnatdoc -l -P $project
