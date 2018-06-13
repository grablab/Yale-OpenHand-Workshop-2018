#include "ros/ros.h"
#include "dexterous_manipulation/inhand_manipulation_manager.hpp"
int main(int argc, char** argv){
	ros::init(argc,argv,"inhand_manipulation");
	InHandManipulationManager manager;
	manager.initialize();
	manager.spin();
	return 0;
}
