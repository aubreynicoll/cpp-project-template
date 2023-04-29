cmake_minimum_required(VERSION 3.26.3)
project(temp VERSION 1.0.0)

# prevent accidentally building in src or root
if(${CMAKE_BINARY_DIR} STREQUAL ${CMAKE_SOURCE_DIR} OR ${CMAKE_BINARY_DIR} STREQUAL ${CMAKE_SOURCE_DIR}/src)
	message(FATAL_ERROR "building in root or src dir disallowed")
endif()

# export for clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

add_library(compile_flags INTERFACE)
list(APPEND LIBS compile_flags)

target_compile_features(compile_flags INTERFACE cxx_std_20)

# add warnings if gcc or clang
set(is_gcc_like "$<COMPILE_LANG_AND_ID:CXX,AppleClang,Clang,GNU>")
target_compile_options(compile_flags INTERFACE "$<${is_gcc_like}:-Wall;-Wextra;-Werror;>")

# move binary to root of build directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

add_subdirectory(src)
