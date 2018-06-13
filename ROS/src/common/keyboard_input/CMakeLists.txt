cmake_minimum_required(VERSION 2.8.3)
project(keyboard_input)
set(CMAKE_CXX_FLAGS "-std=c++11")
find_package(catkin REQUIRED COMPONENTS
  roscpp
  common_msgs_gl
)

catkin_package(
  INCLUDE_DIRS include
)

include_directories(
  ${catkin_INCLUDE_DIRS}
  include
)

add_executable(keyboard_input src/keyboard.cpp src/main_keyboard.cpp)

target_link_libraries(keyboard_input
  ${catkin_LIBRARIES}
)

add_dependencies(keyboard_input common_msgs_gl_gencpp)
