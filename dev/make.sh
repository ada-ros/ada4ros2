#!/bin/bash

if [ "$1" != "" ]; then
    up_to="--packages-up-to $1"
fi

./dev/uberclean.sh
unset AMENT_PREFIX_PATH
unset GPR_PROJECT_PATH
unset LD_LIBRARY_PATH
source ./dev/setup.bash
colcon build $up_to --event-handlers console_direct+
