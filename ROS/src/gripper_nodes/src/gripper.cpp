//#define DYNAMIXEL_XM
#include "gripper.hpp"
#include "openhand/ReadServos.h"
#include "std_msgs/Float64MultiArray.h"
#include "common_msgs_gl/SendDoubleArray.h"
#include "common_msgs_gl/GetDoubleArray.h"
#include "common_msgs_gl/SendIntArray.h"
Gripper::Gripper() : node_handle_("~"){
	initialize();
}

void Gripper::initialize(){
	readParametersFromServer();
	subscribeTopicsServices();
}

void Gripper::callbackRefreshParameters(std_msgs::Empty msg){
	readParametersFromServer();
}

void Gripper::subscribeTopicsServices(){
#ifndef DYNAMIXEL_XM
	srvclnt_send_gripper_commands_ = node_handle_.serviceClient<openhand::MoveServos>("/MoveServos");
	srvclnt_read_gripper_data_ = node_handle_.serviceClient<openhand::ReadServos>("/ReadServos");
#else
	srvclnt_send_gripper_commands_ = node_handle_.serviceClient<common_msgs_gl::SendDoubleArray>("/cmd_pos");
	srvclnt_read_gripper_data_ = node_handle_.serviceClient<common_msgs_gl::GetDoubleArray>("/read_pos");
	srvclnt_set_operating_mode_ = node_handle_.serviceClient<common_msgs_gl::SendIntArray>("/set_operating_mode");
#endif

	srvsrvr_open_ = node_handle_.advertiseService("open", &Gripper::open, this);
	srvsrvr_close_ = node_handle_.advertiseService("close", &Gripper::close, this);
	srvsrvr_command_trajectory_ = node_handle_.advertiseService("command_trajectory", &Gripper::callbackCommandTrajectory, this);
	srvsrvr_set_offsets_ = node_handle_.advertiseService("offsets", &Gripper::callbackSetOffsets, this);
	srvsrvr_vel_ref_ = node_handle_.advertiseService("vel_ref", &Gripper::callbackVelRef, this);
	srvsrvr_vel_cont_init_pos_ = node_handle_.advertiseService("/vel_cont_init_pos", &Gripper::callbackVelContInitPos, this);
	sub_stop_ = node_handle_.subscribe("stop",1,&Gripper::stop, this);
	sub_refresh_parameters_ = node_handle_.subscribe("/system/refresh_parameters",1,&Gripper::callbackRefreshParameters, this);
	pub_pos_ref_ = node_handle_.advertise<std_msgs::Float64MultiArray>("pos_ref_monitor",1);
	pub_vel_ref_ = node_handle_.advertise<std_msgs::Float64MultiArray>("vel_ref_monitor",1);
}

void Gripper::readParametersFromServer(){
	if(!node_handle_.getParam("/gripper/finger_initial_offset",finger_initial_offset_)){
		ROS_WARN("[gripper] The parameter /gripper/finger_initial_offset is not set. Setting the initial offset to zero.");
		finger_initial_offset_.resize(4);
		finger_initial_offset_[0] = 0;//0.0;//0.085;
		finger_initial_offset_[1] = 0;//0.135;//0.125;
		finger_initial_offset_[2] = 0;//0.135;//0.125;
		finger_initial_offset_[3] = 0;//0.135;//0.125;
	}
	if(!node_handle_.getParam("/gripper/finger_closing_position",finger_closing_position_)){
		ROS_WARN("[gripper] The parameter /gripper/finger_closing_position is not set. Setting the closing offset to zero.");
		finger_closing_position_.resize(4);
		finger_closing_position_[0] = 0;//0.0;//0.085;
		finger_closing_position_[1] = 0;//0.135;//0.125;
		finger_closing_position_[2] = 0;//0.135;//0.125;
		finger_closing_position_[3] = 0;//0.135;//0.125;
	}
	if(!node_handle_.getParam("/gripper/finger_opening_position",finger_opening_position_)){
		ROS_WARN("[gripper] The parameter /gripper/finger_opening_position_ is not set. Setting the closing offset to zero.");
		finger_opening_position_.resize(4);
		finger_opening_position_[0] = 0;//0.0;//0.085;
		finger_opening_position_[1] = 0;//0.135;//0.125;
		finger_opening_position_[2] = 0;//0.135;//0.125;
		finger_opening_position_[3] = 0;//0.135;//0.125;
	}
	for (size_t i = 0; i < finger_closing_position_.size(); i++){
		finger_closing_position_[i] = finger_closing_position_[i] + finger_initial_offset_[i];
		finger_opening_position_[i] = finger_opening_position_[i] + finger_initial_offset_[i];
	}
	for (size_t i = 0; i < finger_closing_position_.size(); i++){
		vel_ref_.resize(2);
		vel_ref_[i] = 0;
	}
}

bool Gripper::velMode(){
	return velocity_mode_on_;
}

bool Gripper::callbackVelRef(common_msgs_gl::SendDoubleArray::Request& req, common_msgs_gl::SendDoubleArray::Response& res){
	vel_ref_.resize(req.data.size());
	for(size_t i = 0; i < req.data.size(); i++){
		vel_ref_[i] = req.data[i];
	}
	if(velocity_mode_on_ == false){
		if(!initial_motor_pos_set_)
			motor_pos_ref_ = readData();
		else
			motor_pos_ref_ = vel_cont_init_motor_pos_;
	}
	velocity_mode_on_ = true;
	return true;
}

bool Gripper::callbackVelContInitPos(common_msgs_gl::SendDoubleArray::Request& req, common_msgs_gl::SendDoubleArray::Response& res){
	vel_cont_init_motor_pos_.resize(req.data.size());
	for(size_t i = 0; i < req.data.size(); i++)
		vel_cont_init_motor_pos_[i] = req.data[i];
	initial_motor_pos_set_ = true;
	return true;
}

void Gripper::velocityModeStep(){
	double rate = 100;
	auto motor_pos = readData();
	for(size_t i = 0; i<vel_ref_.size(); i++){ 
		if((motor_pos_ref_[i] < (0.01 + finger_initial_offset_[i])) && vel_ref_[i]<0){
			motor_pos_ref_[i] = 0.01 + finger_initial_offset_[i];				// do nothing.. stay where you are.
		}
		else if((motor_pos_ref_[i] > (1.3+finger_initial_offset_[i])) && vel_ref_[i]>0)
			motor_pos_ref_[i] = 1.3+finger_initial_offset_[i];
		else{
//			if(vel_ref_[i] > 0 && (motor_pos_ref_[i]-motor_pos[i]>0.2)){}
//			else if(vel_ref_[i] < 0 && (motor_pos_ref_[i]-motor_pos[i]<-0.2)){}
//			else
			motor_pos_ref_[i] = motor_pos_ref_[i] + vel_ref_[i]*1.0/rate;
		}
	}
	std::vector<double> out;

//	XXX: This modification below is done to have a positive position offset all the time while applying velocity control in order to kepp contact with the object.
//	out.assign(motor_pos_ref_.begin(), motor_pos_ref_.end());
	out.resize(motor_pos_ref_.size());
	for(size_t i = 0; i<motor_pos_ref_.size(); i++)
		out[i] = motor_pos_ref_[i];//+0.05;
	
	sendCommand(out);
}

bool Gripper::callbackCommandTrajectory(gripper_nodes::CommandTrajectory::Request& req, gripper_nodes::CommandTrajectory::Response& res){
	velocity_mode_on_ = false;
	for (size_t i = 0; i< req.pos.size();i++)
		req.pos[i] = req.pos[i] + finger_initial_offset_[i];
	//req.pos[1] = req.pos[1] + finger_closing_offset_;
	sendCommandTraj(req.pos, req.speed);
	return true;
}

bool Gripper::callbackSetOffsets(common_msgs_gl::SendDoubleArray::Request& req, common_msgs_gl::SendDoubleArray::Response& res){
	velocity_mode_on_ = false;
	if(finger_initial_offset_.size() != req.data.size()){
		ROS_ERROR("[gripper_node]: Failed setting gripper position offsets. Vector size does not match with gripper motor number which is : %d", (int)finger_initial_offset_.size());
		return true;
	}
	std::copy(req.data.begin(),req.data.end(),finger_initial_offset_.begin());
	return true;
}

bool Gripper::close(std_srvs::Empty::Request& req, std_srvs::Empty::Response& res){
	velocity_mode_on_ = false;
#ifdef DYNAMIXEL_XM
	common_msgs_gl::SendIntArray srv_operating_mode;
	srv_operating_mode.request.data.resize(2);
	srv_operating_mode.request.data[0] = 3;
	srv_operating_mode.request.data[1] = 3;
	srvclnt_set_operating_mode_.call(srv_operating_mode);
#endif
	sendCommand(finger_closing_position_);	
}

bool Gripper::open(std_srvs::Empty::Request& req, std_srvs::Empty::Response& res){
	velocity_mode_on_ = false;

#ifdef DYNAMIXEL_XM
	common_msgs_gl::SendIntArray srv_operating_mode;
	srv_operating_mode.request.data.resize(2);
	srv_operating_mode.request.data[0] = 3;
	srv_operating_mode.request.data[1] = 3;
	srvclnt_set_operating_mode_.call(srv_operating_mode);
#endif
//	sendCommand(finger_opening_position_);
	sendCommandTraj(finger_opening_position_, 0.05);

	return true;
}

std::vector<float> Gripper::readData(){

#ifndef DYNAMIXEL_XM
	openhand::ReadServos srv;
	srvclnt_read_gripper_data_.call(srv);
	return srv.response.pos;
#else
	common_msgs_gl::GetDoubleArray srv;
	srvclnt_read_gripper_data_.call(srv);
	std::vector<float> out (srv.response.data.begin(), srv.response.data.end());
	return out;
#endif
}

void Gripper::sendCommand(std::vector<double> commands){

#ifndef DYNAMIXEL_XM
	openhand::MoveServos srv;
	srv.request.pos.assign(commands.begin(), commands.end());
#else
	common_msgs_gl::SendDoubleArray srv;
	srv.request.data.assign(commands.begin(), commands.end());
#endif
	std_msgs::Float64MultiArray msg_pos, msg_vel;
	msg_pos.data.assign(commands.begin(), commands.end());
	pub_pos_ref_.publish(msg_pos);
	msg_vel.data.assign(vel_ref_.begin(), vel_ref_.end());
	pub_vel_ref_.publish(msg_vel);

	int trial_no = 0;
	while(!srvclnt_send_gripper_commands_.call(srv) && ros::ok()){
		trial_no++;
		if(trial_no>3){
			//throw std::runtime_error("[gripper_m2]: The service for sending position commands to gripper motors has failed."); 
		}
	}
}

void Gripper::stop(){
	std_msgs::Empty msg;
	stop(msg);
}

void Gripper::stop(std_msgs::Empty msg){
	velocity_mode_on_ = false;
	if(executing_trajectory_)
		stop_trigger_ = true;
	auto motor_pos = readData();
	std::vector<double> out;
	for(size_t i = 0; i<motor_pos.size(); i++)
		out.push_back(motor_pos[i]);
	sendCommand(out);
}

double sign(double n){
	if (n > 0)
		return 1.0;
	else if (n < 0)
		return -1.0;
	else
		return 0.0;

}

void Gripper::sendCommandTraj(std::vector<double> command, double speed){
	if(speed <= 0)
		sendCommand(command);
	else{
		double rate = 10;
		ros::Rate loop_rate(rate);
		auto motor_pos = readData();
		bool finished;
		executing_trajectory_ = true;
		while (ros::ok()){
			if(stop_trigger_ == true)
				break;
			for(size_t i = 0; i<command.size(); i++){ 
				motor_pos[i] = motor_pos[i] + sign(-motor_pos[i] + command[i])*speed*1.0/rate;
				if (std::fabs(motor_pos[i] - command[i]) <= speed*1.0/rate){
					motor_pos[i] = command[i];
				}
			}
			finished = true;
			for (size_t i= 0; i<command.size(); i++){
				if(std::fabs(motor_pos[i] - command[i])>0.007){
					finished =false;
					break;
				}
			}
			std::vector<double> out;
			out.assign(motor_pos.begin(), motor_pos.end());
			sendCommand(out);
			if(finished)
				break;
			loop_rate.sleep();
			ros::spinOnce();
		}
		executing_trajectory_ = false;
		stop_trigger_ = false;
	}
}
