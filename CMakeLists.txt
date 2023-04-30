cmake_minimum_required(VERSION 3.26.3)
project(temp VERSION 1.0.0)

# prevent accidentally building in src or root
if(${CMAKE_BINARY_DIR} STREQUAL ${CMAKE_SOURCE_DIR} OR ${CMAKE_BINARY_DIR} STREQUAL ${CMAKE_SOURCE_DIR}/src)
	message(FATAL_ERROR "building in root or src dir disallowed")
endif()

# export for clangd and other variables
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
set(is_gcc_like "$<COMPILE_LANG_AND_ID:CXX,AppleClang,Clang,GNU>")
set(is_debug "$<CONFIG:Debug,RelWithDebInfo>")

# set up interface libraries for appending flags
add_library(compile_flags INTERFACE)
list(APPEND LIBS compile_flags)
add_library(link_flags INTERFACE)
list(APPEND LIBS link_flags)

# C++ std
target_compile_features(compile_flags INTERFACE cxx_std_20)

# error on warning for gcc & clang
target_compile_options(compile_flags INTERFACE "$<${is_gcc_like}:-Wall;-Wextra;-Werror;>")

# handle Address Sanitizer flags
set(set_asan "$<AND:${is_debug},${is_gcc_like}>")
set(asan_flags "$<${set_asan}:-fsanitize=address;>")
target_compile_options(compile_flags INTERFACE ${asan_flags})
target_link_options(link_flags INTERFACE ${asan_flags})

# move binary to root of build directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

add_subdirectory(src)
