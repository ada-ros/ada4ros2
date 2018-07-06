find src -name obj -o -name lib -o -name bin | while read dir; do rm -rf "$dir"; done
