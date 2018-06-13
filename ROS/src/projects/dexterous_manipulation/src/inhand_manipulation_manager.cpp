#include "dexterous_manipulation/inhand_manipulation_manager.hpp"
#include "std_srvs/Empty.h"
#include "common_msgs_gl/SendDoubleArray.h"
#include "gripper_nodes/CommandTrajectory.h"
#include "std_msgs/Empty.h"
#include "std_msgs/Int32.h"
#include <iostream>

InHandManipulationManager::InHandManipulationManager(){
}

void InHandManipulationManager::initialize(){
	readGeneralParameters();
	readSpecificParameters();
	srvclnt_gripper_open_ = node_handle_.serviceClient<std_srvs::Empty>("/gripper_t42/open");
	srvclnt_gripper_close_ = node_handle_.serviceClient<std_srvs::Empty>("/gripper_t42/close");
	srvclnt_set_offsets_ = node_handle_.serviceClient<common_msgs_gl::SendDoubleArray>("/gripper_t42/offset");
	srvclnt_command_trajectory_ = node_handle_.serviceClient<gripper_nodes::CommandTrajectory>("/gripper_t42/command_trajectory");
	srvclnt_actuator_vel_ref_ = node_handle_.serviceClient<common_msgs_gl::SendDoubleArray>("/gripper_t42/vel_ref");
	srvsrvr_set_mode_ = node_handle_.advertiseService("/manipulation_manager/set_mode",&InHandManipulationManager::callbackSetMode, this);
	srvsrvr_get_vel_ref_ = node_handle_.advertiseService("/visual_servoing/vel_ref",&InHandManipulationManager::callbackVelRef, this);
	srvsrvr_calibrate_system_ = node_handle_.advertiseService("/system/calibrate",&InHandManipulationManager::callbackCalibrateSystem, this);
	srvclnt_feature_detector_trigger_ = node_handle_.serviceClient<std_srvs::Empty>("/feature_detector/trigger");
	pub_stop_ = node_handle_.advertise<std_msgs::Empty>("/gripper_t42/stop",1);
	pub_system_reset_ = node_handle_.advertise<std_msgs::Empty>("/system/reset",1);
	pub_system_state_ = node_handle_.advertise<std_msgs::Int32>("/system/state",1);
	sub_vs_vel_ref_ = node_handle_.subscribe("/visual_servoing/vel_ref_monitor",1,&InHandManipulationManager::callbackVelRefMsg, this);
	sub_refresh_param_ = node_handle_.subscribe("/system/refresh_parameters", 1, &InHandManipulationManager::callbackRefreshParam, this);
}

void InHandManipulationManager::readGeneralParameters(){
	if(!node_handle_.getParam("/gripper/finger_closing_position",finger_closing_position_)){
		throw std::runtime_error("[gripper] The parameter /gripper/finger_closing_position is not set.");
	}
	vel_ref_.clear();
	for (int i = 0; i < finger_closing_position_.size(); i++)
		vel_ref_.push_back(0);

}

void InHandManipulationManager::callbackRefreshParam(std_msgs::Empty msg){
	readGeneralParameters();
	readSpecificParameters();
}

bool InHandManipulationManager::callbackVelRef(common_msgs_gl::SendDoubleArray::Request& req, common_msgs_gl::SendDoubleArray::Response& res){
	for (size_t i = 0; i < req.data.size(); i++){
		vel_ref_[i] = req.data[i];
	}
	return true;
}

void InHandManipulationManager::callbackVelRefMsg(std_msgs::Float64MultiArray msg){
	for (size_t i = 0; i < msg.data.size(); i++){
		vel_ref_[i] = msg.data[i];
	}
}

void InHandManipulationManager::openGripper() {
	std_srvs::Empty srv;
	if(!srvclnt_gripper_open_.call(srv))
		ROS_ERROR("[InHandManipulationManager] Cannot connect to service for openning the gripper.");
}

bool InHandManipulationManager::callbackCalibrateSystem(std_srvs::Empty::Request&, std_srvs::Empty::Response&){
	calibrateSystem();
	return true;
}

bool InHandManipulationManager::callbackSetMode(common_msgs_gl::SendInt::Request& req, common_msgs_gl::SendInt::Response& res){
	if(req.data == 0)
		received_command_ = get_ready;
	else if (req.data == 1)
		received_command_ = start;
	else if (req.data == 2)
		received_command_ = stop;
	else
		received_command_ = undefined;

	if(received_command_ == get_ready)
		system_mode_ = getting_ready;
	else if(received_command_ == stop)
		system_mode_ = stopping;
	else if(received_command_ == start && system_mode_ == ready)
		system_mode_ = running;
	else if(received_command_ == start && system_mode_ != ready)
		ROS_WARN("[InHandManipulationManager] Start command have been received, system is running...");
	return true;
}

void InHandManipulationManager::publishSystemStateOnChange(){
	if(system_mode_ != system_mode_old_){
		std_msgs::Int32 msg;
		if(system_mode_ == stopped)
			msg.data = 0;
		else if (system_mode_ == running)
			msg.data = 1;
		else if (system_mode_ == vel_control)
			msg.data = 2;
		else if (system_mode_ == ready)
			msg.data = 3;
		else if (system_mode_ == getting_ready)
			msg.data = 4;
		else if (system_mode_ == stopping)
			msg.data = 5;
		else if (system_mode_ == idle)
			msg.data = 6;
		else
			msg.data = -1;

		pub_system_state_.publish(msg);
		system_mode_old_ = system_mode_;
	}
}
void InHandManipulationManager::closeGripper() {
	std_srvs::Empty srv;
	if(!srvclnt_gripper_close_.call(srv))
		ROS_ERROR("[InHandManipulationManager]: Cannot connect to service for closing the gripper.");
}

void InHandManipulationManager::setInitialPositionOffsets(const std::vector<double>& offsets){
	common_msgs_gl::SendDoubleArray srv;
	srv.request.data.insert(srv.request.data.end(),offsets.begin(),offsets.end());
	if(!srvclnt_set_offsets_.call(srv))
		ROS_ERROR("[InHandManipulationManager]: Cannot connect to service for setting initial position offsets of the gripper.");
}

void InHandManipulationManager::closeWithTrajectory(const std::vector<double>& pos_ref, const double& speed) {
	gripper_nodes::CommandTrajectory srv;
	srv.request.pos.insert(srv.request.pos.end(), pos_ref.begin(), pos_ref.end());
	srv.request.speed = speed;
	if(!srvclnt_command_trajectory_.call(srv))
		ROS_ERROR("[InHandManipulationManager]: Cannot connect to service for sending a trajectory command to the gripper.");
}

void InHandManipulationManager::convertCartesianVeltoActuatorVel(const std::vector<double>& car_vel, std::vector<double>& act_vel) {
	act_vel.resize(2);
	//act_vel[0] = -car_vel[0];
	//act_vel[1] = car_vel[0];
	double rotation[2];
	if(car_vel[5] < 0){
		rotation[0] =  std::fabs(car_vel[5]);
		rotation[1] = -0.8* std::fabs(car_vel[5]);
	}
	else{
		rotation[0] = -0.8*std::fabs(car_vel[5]);
		rotation[1] = std::fabs(car_vel[5]);
	}	
//	act_vel[0] = -car_vel[0] + car_vel[1] + rotation[0];
//	act_vel[1] =  car_vel[0] + car_vel[1] + rotation[1];
	act_vel[0] = -car_vel[0] + car_vel[1];
	act_vel[1] =  car_vel[0] + car_vel[1];

}	

void InHandManipulationManager::sendActuatorVelRef(const std::vector<double>& act_vel_ref){
	common_msgs_gl::SendDoubleArray srv;
	srv.request.data.insert(srv.request.data.begin(),act_vel_ref.begin(), act_vel_ref.end());
	if(!srvclnt_actuator_vel_ref_.call(srv)){
		ROS_ERROR("[InHandManipulationManager]: Cannot connect to service for sending velocity references to the gripper actuators.");
	}
}

void InHandManipulationManager::velocityControl(){
	std::vector<double>actuator_vel;
	convertCartesianVeltoActuatorVel(vel_ref_, actuator_vel);
	sendActuatorVelRef(actuator_vel);	
	// read the motor position.
	// read keep that distance and move right and left.
}

void InHandManipulationManager::getReady(){
	std_msgs::Empty msg_reset;
	pub_system_reset_.publish(msg_reset);
	ros::Duration(1.0).sleep();
	closeWithTrajectory(finger_closing_position_,0.1);
	ros::spinOnce();
	getReadyExtras();
	if(system_mode_ != getting_ready)
		return;
	system_mode_ = ready;
	ROS_INFO("[InHandManipulationManager] The system is ready.");
}

void InHandManipulationManager::getReadyExtras(){
	
}



void InHandManipulationManager::stopGripper(){
	std_msgs::Empty msg;
	pub_stop_.publish(msg);
}

void InHandManipulationManager::runLoop(){
	runLoopExtras();
	if(system_mode_ != running)
		return;
	time_start_ = ros::Time::now();
	time_displayed_ = false;
	ros::spinOnce();
	system_mode_ = vel_control;
	ROS_INFO("[InHandManipulationManager] The system is running.");
}

void InHandManipulationManager::runLoopExtras() {
	
}
void InHandManipulationManager::stopExtras() {
	ROS_INFO("[InHandManipulationManager] The system has stopped.");
}

void InHandManipulationManager::spin() {
	ros::Rate loop_rate(100);
	while(ros::ok()){
		if(system_mode_ == getting_ready){
			getReady();
		}
		else if(system_mode_ == running){
			runLoop();
		}
		else if(system_mode_ == vel_control){
			velocityControl();
			velocityLoopExtras();
//			ROS_INFO("[InHandManipulationManager] vel loop. vel_ref[0] = %f, vel_ref[1] = %f", vel_ref_[0], vel_ref_[1]);
		}
		else if(system_mode_ == ready){
			readyLoop();
			readyLoopExtras();
		}
		else if(system_mode_ == stopping){
			stopExtras();
			openGripper();
			system_mode_ = idle;
		}
		else if(system_mode_ == idle){
			if(!time_displayed_){
				ROS_INFO("[inhand_manipulation_manager] Time elapsed: %f", (ros::Time::now()-time_start_).toSec());
				ROS_INFO("[inhand_manipulation_manager] Total Distance: %f", recorded_distance_);
				time_displayed_ = true;
			}
		}
	

		publishSystemStateOnChange();
		ros::spinOnce();
		loop_rate.sleep();
	}
}
