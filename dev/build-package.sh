#!/bin/bash

[ "$1" == "" ] && { echo Missing package name; exit 1; }

source ./dev/setup.bash
colcon build --packages-select "$@" --event-handlers console_direct+
