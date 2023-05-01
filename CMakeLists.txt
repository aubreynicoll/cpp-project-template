cmake_minimum_required(VERSION 3.26.3)
project(temp VERSION 1.0.0)

# prevent accidentally building in src or root
if(${CMAKE_BINARY_DIR} STREQUAL ${CMAKE_SOURCE_DIR} OR ${CMAKE_BINARY_DIR} STREQUAL ${CMAKE_SOURCE_DIR}/src)
	message(FATAL_ERROR "building in root or src dir disallowed")
endif()

# map configs to release (conan)
set(CMAKE_MAP_IMPORTED_CONFIG_DEBUG RELEASE)
set(CMAKE_MAP_IMPORTED_CONFIG_ASAN RELEASE)
set(CMAKE_MAP_IMPORTED_CONFIG_LSAN RELEASE)
set(CMAKE_MAP_IMPORTED_CONFIG_TSAN RELEASE)
set(CMAKE_MAP_IMPORTED_CONFIG_MSAN RELEASE)
set(CMAKE_MAP_IMPORTED_CONFIG_UBSAN RELEASE)

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

if(is_gcc_like)
	# error on warning for gcc & clang
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")

	# handle Sanitizer flags
	set(CMAKE_CXX_FLAGS_ASAN "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=address")
	set(CMAKE_CXX_FLAGS_LSAN "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=leak")
	set(CMAKE_CXX_FLAGS_TSAN "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=thread")
	set(CMAKE_CXX_FLAGS_MSAN "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=memory")
	set(CMAKE_CXX_FLAGS_UBSAN "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=undefined")
endif()

# move binary to root of build directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

add_subdirectory(src)
