#!/bin/bash

if [ "$1" != "" ]; then
    up_to="--packages-up-to $1"
fi

source ./dev/setup.bash
colcon build $up_to --event-handlers console_direct+
