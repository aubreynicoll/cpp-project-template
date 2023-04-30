#!/bin/bash

conan install . --output-folder=build --build=missing --profile=default # may want to change profile to release in the future
cmake -B build . -DCMAKE_TOOLCHAIN_FILE=./build/conan_toolchain.cmake
cmake --build build
