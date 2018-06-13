#include "dexterous_manipulation/keyboard.hpp"
#include "std_srvs/Empty.h"

Keyboard::Keyboard(){
	sub_keyboard_number_ = node_handle_.subscribe("/system/user_number_input",1,&Keyboard::callbackKeyboardNumber, this);
	sub_clicked_points_ = node_handle_.subscribe("/click_out/clicked_point",1,&Keyboard::callbackClickedPoints, this);
	pub_vs_ref_ = node_handle_.advertise<common_msgs_gl::PointArray>("/visualization/vector_reference",1);
	pub_vs_features_ = node_handle_.advertise<common_msgs_gl::PointArray>("/feature_detector/detected_features",1);
	pub_line_ref_ = node_handle_.advertise<common_msgs_gl::PointArray>("/visualization/line_reference",1);
}
void Keyboard::readSpecificParameters(){
	if(!node_handle_.getParam("/gripper/type",gripper_type_)){
		throw std::runtime_error("[gripper] The parameter /gripper/type is not set.");
	}
}
void Keyboard::getReadyExtras(){
/*
	ROS_INFO("[InHandManipulationManager]: waiting for the references clicks.");
	waitForFeatures();
	ROS_INFO("[InHandManipulationManager]: done.");
	sendRefenceToVS();
	ROS_INFO("[InHandManipulationManager]: waiting for the feature clicks.");
	waitForFeatures();
	ROS_INFO("[InHandManipulationManager]: done.");
	sendFeaturesToTracker();
	ROS_INFO("[InHandManipulationManager]: waiting for the line features.");
	waitForFeatures();
	ROS_INFO("[InHandManipulationManager]: done.");
	sendLineReference();
	std_srvs::Empty srv;
	srvclnt_feature_detector_trigger_.call(srv);
	ros::Duration(1.0).sleep();
*/	
	vel_ref_ = {0.0,0.0,0.0,0.0,0.0,0.0};
	runLoop();
}

void Keyboard::velocityLoopExtras(){

}

void Keyboard::runLoopExtras(){
	system_mode_ = running;
}

void Keyboard::convertCartesianVeltoActuatorVel(const std::vector<double>& car_vel, std::vector<double>& act_vel){
	if(gripper_type_.compare("t42") == 0){
		act_vel.resize(2);
		double rotation[2];
/*
		if(car_vel[5] < 0){
//			rotation[0] =  std::fabs(car_vel[5]);
//			rotation[1] = -0.8* std::fabs(car_vel[5]);
			rotation[0] = car_vel[5];
			rotation[1] = 0;
		}
		else{
//			rotation[0] = -0.8*std::fabs(car_vel[5]);
//			rotation[1] = std::fabs(car_vel[5]);
			rotation[1] = car_vel[5];
			rotation[0] = 0;
		}
*/

		rotation[0] = car_vel[4];
		rotation[1] = car_vel[5];
		act_vel[0] = car_vel[0] + car_vel[1] + rotation[0];
		act_vel[1] = -car_vel[0] + car_vel[1] + rotation[1];
	/*	if(!isSystemStable(finger_angles_, act_vel) && stability_check_enabled_){
			act_vel[0] = 0;
			act_vel[1] = 0;
			std_msgs::Int32 msg;
			if (std::fabs(car_vel[0])<0.0001 && std::fabs(car_vel[1])<0.0001)
				msg.data = 5;
			else
				msg.data = 0;
			pub_vis_state_.publish(msg);
		}
		else{

		}*/

	}		
	else if(gripper_type_.compare("m2") == 0){
		act_vel.resize(2);
		double rotation[2];
		if(car_vel[5] < 0){
			rotation[0] =  std::fabs(car_vel[5]);
			rotation[1] = -0.8* std::fabs(car_vel[5]);
		}
		else{
			rotation[0] = -0.8*std::fabs(car_vel[5]);
			rotation[1] = std::fabs(car_vel[5]);
		}
		act_vel[1] = -car_vel[0] + rotation[0];
		act_vel[0] =  car_vel[0] + car_vel[1]+ rotation[1];

	/*	if(!isSystemStable(finger_angles_, act_vel) && stability_check_enabled_){
			act_vel[0] = 0;
			act_vel[1] = 0;
			std_msgs::Int32 msg;
			if (std::fabs(car_vel[0])<0.0001 && std::fabs(car_vel[1])<0.0001)
				msg.data = 5;
			else
				msg.data = 0;
			pub_vis_state_.publish(msg);
		}
		else{

		}*/

	}	

	else if(gripper_type_.compare("sliding") == 0){
		act_vel.resize(2);
		double rotation[2];
		if(car_vel[5] < 0){
			rotation[0] =  std::fabs(car_vel[5]);
			rotation[1] = -0.8* std::fabs(car_vel[5]);
		}
		else{
			rotation[0] = -0.8*std::fabs(car_vel[5]);
			rotation[1] = std::fabs(car_vel[5]);
		}
		act_vel[0] = -car_vel[0] + 0.5*car_vel[1] + rotation[0];
		act_vel[1] =  car_vel[0] + car_vel[1] + rotation[1];
	/*	if(!isSystemStable(finger_angles_, act_vel) && stability_check_enabled_){
			act_vel[0] = 0;
			act_vel[1] = 0;
			std_msgs::Int32 msg;
			if (std::fabs(car_vel[0])<0.0001 && std::fabs(car_vel[1])<0.0001)
				msg.data = 5;
			else
				msg.data = 0;
			pub_vis_state_.publish(msg);
		}
		else{

		}*/

	}	
	else{
		act_vel.resize(2);
		double rotation[2];
		if(car_vel[5] < 0){
			rotation[0] =  std::fabs(car_vel[5]);
			rotation[1] = -0.8* std::fabs(car_vel[5]);
		}
		else{
			rotation[0] = -0.8*std::fabs(car_vel[5]);
			rotation[1] = std::fabs(car_vel[5]);
		}
		act_vel[0] = -car_vel[0] + car_vel[1] + rotation[0];
		act_vel[1] =  car_vel[0] + car_vel[1] + rotation[1];
	/*	if(!isSystemStable(finger_angles_, act_vel) && stability_check_enabled_){
			act_vel[0] = 0;
			act_vel[1] = 0;
			std_msgs::Int32 msg;
			if (std::fabs(car_vel[0])<0.0001 && std::fabs(car_vel[1])<0.0001)
				msg.data = 5;
			else
				msg.data = 0;
			pub_vis_state_.publish(msg);
		}
		else{

		}*/

	}	

//	}
}

void Keyboard::callbackKeyboardNumber(std_msgs::Int32 msg){
	if(msg.data == 5){
		ROS_INFO("get ready command received");
		system_mode_ = getting_ready;;
	}
}
void Keyboard::callbackClickedPoints(common_msgs_gl::PointArray msg){
	clicked_points_.clear();
	for(size_t i = 0; i<msg.x.size(); i++){
		Keyboard::point p;
		p.x = msg.x[i];
		p.y = msg.y[i];
		clicked_points_.push_back(p);
	}
	new_points_arrived_ = true;
	ROS_INFO("[IBVSTxRz]: New Points Arrived.");
}
void Keyboard::waitForFeatures(){
	ros::Rate loop_rate(10);
	while(ros::ok() && !new_points_arrived_){
		ros::spinOnce();
		loop_rate.sleep();
	}
	new_points_arrived_ = false;
}
void Keyboard::sendFeaturesToTracker(){
	common_msgs_gl::PointArray msg;
	msg.x.resize(clicked_points_.size());
	msg.y.resize(clicked_points_.size());
	for(size_t i = 0; i<clicked_points_.size(); i++){
		msg.x[i] = clicked_points_[i].x;
		msg.y[i] = clicked_points_[i].y;
	}
	pub_vs_features_.publish(msg);
}
void Keyboard::sendRefenceToVS(){
	common_msgs_gl::PointArray msg;
	msg.x.resize(clicked_points_.size());
	msg.y.resize(clicked_points_.size());
	for(size_t i = 0; i<clicked_points_.size(); i++){
		msg.x[i] = clicked_points_[i].x;
		msg.y[i] = clicked_points_[i].y;
	}
	pub_vs_ref_.publish(msg);
}
void Keyboard::sendLineReference(){
	common_msgs_gl::PointArray msg;
	msg.x.resize(clicked_points_.size());
	msg.y.resize(clicked_points_.size());
	for(size_t i = 0; i<clicked_points_.size(); i++){
		msg.x[i] = clicked_points_[i].x;
		msg.y[i] = clicked_points_[i].y;
	}
	pub_line_ref_.publish(msg);
}
