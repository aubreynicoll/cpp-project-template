configure_file(cmakevars.h.in cmakevars.h)

list(APPEND FILES
	main.cpp
)

add_executable(${binary_name} ${FILES})
target_link_libraries(${binary_name} PUBLIC ${LIBS})
target_include_directories(${binary_name} PUBLIC
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_BINARY_DIR}/src # cmakevars.h
)

install(TARGETS ${binary_name} DESTINATION bin)
