#include "ros/ros.h"
#include "std_msgs/UInt32.h"
#include "common_msgs_gl/SendBool.h"
class KeyboardControl{
	bool enable_ = true;
	ros::NodeHandle node_handle_;	
	ros::Subscriber sub_keyboard_input_;
	ros::Publisher pub_vel_ref_monitor_, pub_number_;
	ros::ServiceClient srvclnt_send_output_, srvclnt_space_pressed_;
	ros::ServiceServer srvsrvr_enable_;
	unsigned int key_pressed_;
	double gain_ = 0.03;
public:
	KeyboardControl();
	void callbackKeyboardInput(std_msgs::UInt32 msg);
private:
	void publishOutput(std::vector<double>);
	void publishNumber(int);
	int prepareNumber(unsigned int key);
	std::vector<double> prepareControlVector(unsigned int key);
	bool callbackEnable(common_msgs_gl::SendBool::Request& req, common_msgs_gl::SendBool::Response& res);
};
