cmake_minimum_required(VERSION 2.8.3)
project(dynamixel_motors)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  dynamixel_sdk
  roscpp
  common_msgs_gl
)

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES dynamixel_motors
  CATKIN_DEPENDS dynamixel_sdk
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
 include
  ${catkin_INCLUDE_DIRS}
)

## Declare a C++ library
add_library(dynamixel_motors
  src/dyn_xm_motor.cpp
  src/dynamixel_node.cpp
  src/dynamixel_motor.cpp
)

add_dependencies(${PROJECT_NAME} ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})


