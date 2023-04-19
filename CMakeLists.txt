cmake_minimum_required(VERSION 3.26.3)
project(cpp-project-template VERSION 1.0.0)

# set C++ std
add_library(compiler_flags INTERFACE)
target_compile_features(compiler_flags INTERFACE cxx_std_17)

# add warnings if gcc or clang
set(is_gcc_like "$<COMPILE_LANG_AND_ID:CXX,AppleClang,Clang,GNU>")
target_compile_options(compiler_flags INTERFACE "$<1:-Wall;-Wextra;-Werror;>")

# add compiler_flags to LIBS
list(APPEND LIBS compiler_flags)

add_subdirectory(src)
