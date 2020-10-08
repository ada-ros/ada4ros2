echo REMEMBER TO RUN THIS SCRIPT EVERY TIME UNTIL ALL THE GENERATION ERRORS IN
echo ROSIDL_GENERATOR_ADA / RCLADA ARE SOLVED!! IT\'S NOT ENOUGH TO REMOVE
echo THE build, install FOLDERS!

./dev/clean.sh
./dev/del_autobindings.sh

rm -rf build install
