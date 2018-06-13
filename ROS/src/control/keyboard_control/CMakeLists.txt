cmake_minimum_required(VERSION 2.8.3)
project(keyboard_control)

set(CMAKE_CXX_FLAGS "-std=c++11")
find_package(catkin REQUIRED COMPONENTS
  roscpp
  keyboard_input
  common_msgs_gl
)

catkin_package(
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_executable(keyboard_control src/keyboard_control.cpp src/main_keyboard_control.cpp)

add_dependencies(keyboard_control common_msgs_gl_gencpp)
target_link_libraries(keyboard_control
  ${catkin_LIBRARIES}
)
