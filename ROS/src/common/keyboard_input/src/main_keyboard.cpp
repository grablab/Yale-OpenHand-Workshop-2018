#include "keyboard_input/keyboard.hpp"
int main(int argc, char** argv){
	ros::init(argc, argv, "keyboard_input");	
	Keyboard k;
	k.spin();

	return 0;
}
