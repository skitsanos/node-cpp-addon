cmake_minimum_required(VERSION 3.5)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)  # not necessary, but encouraged

project(demo CXX)

#include node headers
message("headers: $ENV{NODE_HEADERS}")
include_directories(${CMAKE_JS_INC} $ENV{NODE_HEADERS})


file(GLOB SOURCE_FILES "./src/*.cpp" "./src/*.h")

# This line will tell CMake that we're building a shared library
# from the above source files
# named after the project's name
add_library(${PROJECT_NAME} SHARED ${SOURCE_FILES})

# This line will give our library file a .node extension
# without any "lib" prefix
set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "" SUFFIX ".node")

# Essential library files to link to a node addon,
# you should add this line in every CMake.js based project.
target_link_libraries(${PROJECT_NAME} ${CMAKE_JS_LIB})