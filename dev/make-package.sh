#!/bin/bash

[ "$1" == "" ] && { echo Missing package name; exit 1; }

rm -rf {build,install}/"$1"
source ./dev/setup.bash
colcon build --packages-select "$1" --event-handlers console_direct+
