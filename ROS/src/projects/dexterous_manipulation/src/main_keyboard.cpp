#include "ros/ros.h"
#include "dexterous_manipulation/keyboard.hpp"
int main(int argc, char** argv){
	ros::init(argc,argv,"keyboard");
	Keyboard manager;
	manager.initialize();
	manager.spin();
	return 0;
}
