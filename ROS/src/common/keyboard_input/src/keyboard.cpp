#include "keyboard_input/keyboard.hpp"
#include "std_msgs/UInt32.h"

Keyboard::Keyboard(double loop_frequency){
	loop_frequency_ = loop_frequency;
	pub_pressed_key_ = node_handle_.advertise<std_msgs::UInt32>("/keyboard_input",1);
	srvsrvr_enable_ = node_handle_.advertiseService("/keyboard_input/enable",&Keyboard::callbackEnable,this);
	system ("/bin/stty raw");
}

bool Keyboard::callbackEnable(common_msgs_gl::SendBool::Request& req, common_msgs_gl::SendBool::Response& res){
	enable_ = req.data;
	return true;
}

void Keyboard::initialize(){
	tcgetattr(kfd_, &cooked_);
	memcpy(&raw_, &cooked_, sizeof(struct termios));
	raw_.c_lflag &=~ (ICANON | ECHO);
	// Setting a new line, then end of file                         
	raw_.c_cc[VEOL] = 1;
	raw_.c_cc[VEOF] = 2;
	tcsetattr(kfd_, TCSANOW, &raw_);
}

unsigned int Keyboard::readKey(){
	char c;
	if(read(kfd_, &c, 1) < 0)
	{
		perror("read():");
		exit(-1);
	}
	if ((int) c == 27)
		throw -1;
	return (int)c;
}

void Keyboard::spin(){
	ros::Rate loop_rate(loop_frequency_);
	while(ros::ok()){
	try{
		publishPressedKey(readKey());
		ros::spinOnce();
		loop_rate.sleep();

	}
	catch (int e){
		break;
	}
		ros::spinOnce();
		loop_rate.sleep();
	}
}

void Keyboard::publishPressedKey(unsigned int value){
	std_msgs::UInt32 msg;
	msg.data = value;
	if(enable_)
		pub_pressed_key_.publish(msg);
}
Keyboard::~Keyboard(){
	system ("/bin/stty cooked");
}
