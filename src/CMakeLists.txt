list(APPEND FILES
	main.cpp
)

# build & link target
add_executable(a.out ${FILES})
target_link_libraries(a.out PUBLIC compile_flags)
target_include_directories(a.out PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
