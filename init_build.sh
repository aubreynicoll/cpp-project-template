#!/bin/bash

# use 1st arg, or Debug as default
BUILD_TYPE="${1:-debug}"

./make_clean.sh
conan install . --output-folder=build --build=missing
cmake -B build . -DCMAKE_TOOLCHAIN_FILE=./build/conan_toolchain.cmake -DCMAKE_BUILD_TYPE="$BUILD_TYPE"
cmake --build build
