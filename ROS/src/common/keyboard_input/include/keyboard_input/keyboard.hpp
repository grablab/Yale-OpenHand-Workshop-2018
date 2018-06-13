#include "ros/ros.h"
#include "termios.h"
#include "common_msgs_gl/SendBool.h"
#include <stdio.h>
class Keyboard{
	bool enable_ = true;
	ros::NodeHandle node_handle_;
	ros::Publisher pub_pressed_key_;
	ros::ServiceServer srvsrvr_enable_;
	int kfd_ = 0;
	struct termios cooked_, raw_;
	double loop_frequency_;
public:
	Keyboard(double loop_frequency = 10);
	~Keyboard();
	void spin();
private:
	unsigned int readKey();
	void initialize();
	void publishPressedKey(unsigned int value);
	bool callbackEnable(common_msgs_gl::SendBool::Request& req, common_msgs_gl::SendBool::Response& res);
};
