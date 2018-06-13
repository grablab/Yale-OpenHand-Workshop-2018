#include "dynamixel_motors/dynamixel_node.hpp"

int main(int argc, char** argv){
	ros::init(argc, argv, "dynamixel_node");
	ros::NodeHandle node_handle;
	std::string dyn_type = "XM", port_name = "/dev/ttyUSB0";
	std::vector<int> dyn_ids = {20,21}, direction = {1,1}, operating_mode = {3,3};
	std::vector<double> current_limits = {1.0,1.0};
	float protocol_version = 2.0;
	int baud_rate = 57600;
	if(!node_handle.getParam("/gripper/dyn_type",dyn_type))
		ROS_WARN("[dynamixel_node]: The parameter /gripper/dyn_type is not found.");
	if(!node_handle.getParam("/gripper/dyn_ids",dyn_ids))
		ROS_WARN("[dynamixel_node]: The parameter /gripper/dyn_ids is not found.");
	if(!node_handle.getParam("/gripper/dyn_port_name",port_name))
		ROS_WARN("[dynamixel_node]: The parameter /gripper/dyn_port_name is not found.");
	if(!node_handle.getParam("/gripper/dyn_protocol_version",protocol_version))
		ROS_WARN("[dynamixel_node]: The parameter /gripper/dyn_protocol_version is not found.");
	if(!node_handle.getParam("/gripper/dyn_baud_rate",baud_rate))
		ROS_WARN("[dynamixel_node]: The parameter /gripper/dyn_baud_rate is not found.");
	if(!node_handle.getParam("/gripper/finger_direction", direction))
		ROS_WARN("[dynamixel_node]: The parameter /gripper/finger_direction is not found.");
	if(!node_handle.getParam("/gripper/finger_operating_mode", operating_mode))
		ROS_WARN("[dynamixel_node]: The parameter /gripper/operating_mode is not found.");
	if(!node_handle.getParam("/gripper/current_limits", current_limits))
		ROS_WARN("[dynamixel_node]: The parameter /gripper/current_limits is not found.");



	DynamixelNode dyn_node(dyn_type, dyn_ids, port_name, direction, operating_mode, protocol_version, baud_rate, current_limits);
	ros::spin();
	return 0;
}
