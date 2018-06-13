cmake_minimum_required(VERSION 2.8.3)
project(gripper_nodes)
  
set(CMAKE_CXX_FLAGS "-std=c++11")
find_package(catkin REQUIRED COMPONENTS
  openhand
  roscpp
  common_msgs_gl
  message_generation
  dynamixel_motors
)

add_service_files(
  FILES
  CommandTrajectory.srv
)

generate_messages()

catkin_package(
)

include_directories(
  include/gripper_nodes
  include
  ${catkin_INCLUDE_DIRS}
)


add_executable(gripper_node src/gripper_node.cpp src/gripper.cpp)
add_executable(dynamixel_node src/main_dynamixel_node.cpp)

target_link_libraries(gripper_node
  ${catkin_LIBRARIES}
)
target_link_libraries(dynamixel_node
  ${catkin_LIBRARIES}
)

add_dependencies(gripper_node openhand_gencpp common_msgs_gl_gencpp)


