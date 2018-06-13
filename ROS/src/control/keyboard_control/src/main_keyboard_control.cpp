#include "keyboard_control/keyboard_control.hpp"


int main(int argc, char** argv){
	ros::init(argc, argv, "keyboard_control");
	KeyboardControl KeyboardControl;
	ros::spin();
	return 0;
}
