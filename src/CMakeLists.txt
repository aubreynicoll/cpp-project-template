configure_file(cmakevars.h.in cmakevars.h)

find_package(ZLIB REQUIRED)
list(APPEND LIBS ZLIB::ZLIB)

list(APPEND FILES
	main.cpp
)

add_executable(${CMAKE_PROJECT_NAME} ${FILES})
target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC ${LIBS})
target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_BINARY_DIR}/src # cmakevars.h
)

install(TARGETS ${CMAKE_PROJECT_NAME} DESTINATION bin)
