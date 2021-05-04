#!/bin/bash

[ "$1" == "" ] && { echo Missing package name; exit 1; }

rm -rf ./{build,install}/"$1"
