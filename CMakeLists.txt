cmake_minimum_required(VERSION 3.26.3)
project(cpp-project-template VERSION 1.0.0)

# set C++ std
add_library(compile_flags INTERFACE)
target_compile_features(compile_flags INTERFACE cxx_std_17)

# add warnings if gcc or clang
set(is_gcc_like "$<COMPILE_LANG_AND_ID:CXX,AppleClang,Clang,GNU>")
target_compile_options(compile_flags INTERFACE "$<1:-Wall;-Wextra;-Werror;>")

# set binary output dir
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

# add compile_flags to LIBS
list(APPEND LIBS compile_flags)

add_subdirectory(src)
