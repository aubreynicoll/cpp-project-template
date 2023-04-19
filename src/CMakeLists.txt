# build & link target
file(GLOB FILES *.cpp)
add_executable(a.out ${FILES})
target_link_libraries(a.out PUBLIC ${LIBS})
target_include_directories(a.out PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
