echo REMEMBER TO RUN THIS SCRIPT EVERY TIME UNTIL ALL THE GENERATION ERRORS IN
echo ROSIDL_GENERATOR_ADA / RCLADA ARE SOLVED!! IT\'S NOT ENOUGH TO REMOVE
echo THE build, install FOLDERS!
echo
echo Also, note that there are some manual header overrides "(in rclada notably)"
echo that should be tested for possible elimination on compiler/ros updates.
echo Barring that, it would be convenient to refresh them from the original
echo generated file or check them for differences that could be silently breaking.

./dev/clean.sh
./dev/del_autobindings.sh

rm -rf build install
