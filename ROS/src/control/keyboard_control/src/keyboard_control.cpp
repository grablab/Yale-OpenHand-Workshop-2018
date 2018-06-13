#include "keyboard_control/keyboard_control.hpp"
#include "keyboard_input/input_coding.hpp"
#include "common_msgs_gl/SendDoubleArray.h"
#include "std_msgs/Float64MultiArray.h"
#include "std_msgs/Int32.h"
#include "std_srvs/Empty.h"
KeyboardControl::KeyboardControl(){
	if(!node_handle_.getParam("/keyboard_control/gain",gain_)){
		ROS_WARN("[keyboard_control] The parameter /keyboard_control/gain is not found. Using the default value: %f", gain_);
	}
	sub_keyboard_input_ = node_handle_.subscribe("/keyboard_input", 1, &KeyboardControl::callbackKeyboardInput, this);
	srvclnt_send_output_ = node_handle_.serviceClient<common_msgs_gl::SendDoubleArray>("/visual_servoing/vel_ref");
	srvclnt_space_pressed_ = node_handle_.serviceClient<std_srvs::Empty>("/keyboard/space_pressed");
	srvsrvr_enable_ = node_handle_.advertiseService("/keyboard/enable",&KeyboardControl::callbackEnable, this);
	pub_vel_ref_monitor_ = node_handle_.advertise<std_msgs::Float64MultiArray>("/visual_servoing/vel_ref_monitor",1);
	pub_number_ = node_handle_.advertise<std_msgs::Int32>("/system/user_number_input",1);
}

bool KeyboardControl::callbackEnable(common_msgs_gl::SendBool::Request& req, common_msgs_gl::SendBool::Response& res){
	enable_ = req.data;		
	return true;
}

void KeyboardControl::callbackKeyboardInput(std_msgs::UInt32 msg){
	if(!enable_)
		return;
	key_pressed_ = msg.data;
	publishOutput(prepareControlVector(key_pressed_));
	publishNumber(prepareNumber(key_pressed_));
}

int KeyboardControl::prepareNumber(unsigned int key){
	if (key == KEY_1)
		return 1;
	else if (key == KEY_2)
		return 2;
	else if (key == KEY_3)
		return 3;
	else if (key == KEY_4)
		return 4;
	else if (key == KEY_5)
		return 5;
	else if (key == KEY_SPACE)
		return -2;

	else
		return -1;
}

std::vector<double> KeyboardControl::prepareControlVector(unsigned int key){
	if (key == KEY_Q)
		return {gain_,-gain_,0.0,0.0,0.0,0.0};
	else if (key == KEY_W)
		return {0.0,-gain_,0.0,0.0,0.0,0.0};
	else if (key == KEY_E)
		return {-gain_,-gain_,0.0,0.0,0.0,0.0};
	else if (key == KEY_D)
		return {-gain_,0.0,.0,0.0,0.0,0.0};
	else if (key == KEY_C)
		return {-gain_,gain_,0.0,0.0,0.0,0.0};
	else if (key == KEY_X)
		return {0.0,gain_,0.0,0.0,0.0,0.0};
	else if (key == KEY_Z)
		return {gain_,gain_,0.0,0.0,0.0,0.0};
	else if (key == KEY_A)
		return {gain_,0.0,0.0,0.0,0.0,0.0};
	else if (key == KEY_S)
		return {0.0,0.0,0.0,0.0,0.0,0.0};
	else if (key == KEY_R)
		return {0.0,0.0,0.0,0.0,0.0,-gain_*0.5};
	else if (key == KEY_T)
		return {0.0,0.0,0.0,0.0,-gain_*0.5,0.0};
	else if (key == KEY_F)
		return {0.0,0.0,0.0,0.0,0.0,gain_*0.5};
	else if (key == KEY_G)
		return {0.0,0.0,0.0,0.0,gain_*0.5,0.0};

	else{
//		ROS_WARN("[keyboard_control] undefined key pressed.");
		return {};
	}
	
}

void KeyboardControl::publishOutput(std::vector<double> output_vector){
	if (output_vector.size() == 0)
		return; 
	common_msgs_gl::SendDoubleArray srv_out;
	srv_out.request.data = output_vector;
	if(!srvclnt_send_output_.call(srv_out)){
		throw std::runtime_error("[KeyboardControl] Cannot send the keyboard control reference.");
	}
	std_msgs::Float64MultiArray msg;
	msg.data = output_vector;
	pub_vel_ref_monitor_.publish(msg);
}
void KeyboardControl::publishNumber(int in){
	std_msgs::Int32 msg;
	msg.data = in;
	pub_number_.publish(msg);
}
