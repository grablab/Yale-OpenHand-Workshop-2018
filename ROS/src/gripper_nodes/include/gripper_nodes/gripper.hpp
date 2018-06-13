#include "ros/ros.h"
#include "openhand/MoveServos.h"
#include <vector>
#include "std_msgs/Empty.h"
#include "std_srvs/Empty.h"
#include "gripper_nodes/CommandTrajectory.h"
#include "common_msgs_gl/SendDoubleArray.h"
class Gripper{
	std::vector<double> finger_initial_offset_, finger_closing_position_, finger_opening_position_;
	ros::ServiceClient srvclnt_send_gripper_commands_;
	ros::ServiceClient srvclnt_read_gripper_data_, srvclnt_set_operating_mode_;
	ros::ServiceServer srvsrvr_open_,srvsrvr_set_offsets_, srvsrvr_close_, srvsrvr_vel_cont_init_pos_;
	ros::Subscriber sub_stop_, sub_refresh_parameters_;
	ros::Publisher pub_pos_ref_, pub_vel_ref_;
	ros::ServiceServer srvsrvr_command_trajectory_;
	ros::ServiceServer srvsrvr_vel_ref_;
	bool velocity_mode_on_ = false;
	bool initial_motor_pos_set_ = false;
	std::vector<float> vel_cont_init_motor_pos_;
	std::vector<double> vel_ref_;
	std::vector<float> motor_pos_ref_;
	bool callbackCommandTrajectory(gripper_nodes::CommandTrajectory::Request& req, gripper_nodes::CommandTrajectory::Response& res);
	bool callbackSetOffsets(common_msgs_gl::SendDoubleArray::Request& req, common_msgs_gl::SendDoubleArray::Response& res);
	bool callbackVelRef(common_msgs_gl::SendDoubleArray::Request& req, common_msgs_gl::SendDoubleArray::Response& res);
	bool callbackVelContInitPos(common_msgs_gl::SendDoubleArray::Request& req, common_msgs_gl::SendDoubleArray::Response& res);
	void subscribeTopicsServices();
	void readParametersFromServer();
public:
	Gripper();
	bool velMode();
	void velocityModeStep();
protected:
	ros::NodeHandle node_handle_;
	bool stop_trigger_ = false, executing_trajectory_ = false;
	void sendCommand(std::vector<double>);
	std::vector<float> readData();
	void sendCommandTraj(std::vector<double> command, double speed);
	void stop(std_msgs::Empty msg);
	void stop();
	bool open(std_srvs::Empty::Request& req, std_srvs::Empty::Response& res);
	bool close(std_srvs::Empty::Request& req, std_srvs::Empty::Response& res);
	void callbackRefreshParameters(std_msgs::Empty msg);
	void initialize();
}; 
