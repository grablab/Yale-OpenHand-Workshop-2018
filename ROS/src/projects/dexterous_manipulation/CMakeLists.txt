cmake_minimum_required(VERSION 2.8.3)

project(dexterous_manipulation)

set(CMAKE_CXX_FLAGS "-std=c++11")

find_package(catkin REQUIRED COMPONENTS
  roscpp
  common_msgs_gl
  gripper_nodes
  roslib
  cmake_modules
)

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES inhand_manipulation_manager 
  DEPENDS common_msgs_gl
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_library(inhand_manipulation_manager src/inhand_manipulation_manager.cpp)
add_dependencies(inhand_manipulation_manager common_msgs_gl_gencpp gripper_nodes_gencpp)

add_executable(keyboard src/inhand_manipulation_manager.cpp src/keyboard.cpp src/main_keyboard.cpp)
add_dependencies(keyboard common_msgs_gl_gencpp gripper_nodes_gencpp)


target_link_libraries(keyboard ${catkin_LIBRARIES} inhand_manipulation_manager)


