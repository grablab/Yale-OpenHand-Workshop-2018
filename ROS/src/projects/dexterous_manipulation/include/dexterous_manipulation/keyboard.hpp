#include "dexterous_manipulation/inhand_manipulation_manager.hpp"
#include "common_msgs_gl/PointArray.h"
#include "std_msgs/Int32.h"
class Keyboard : public InHandManipulationManager{
	ros::ServiceClient srvclnt_vs_enable_;
	ros::Publisher pub_vs_ref_, pub_vs_features_, pub_line_ref_;
	ros::Subscriber sub_clicked_points_, sub_keyboard_number_;
	std::string gripper_type_;
	bool new_points_arrived_ = false;
	struct point{
		int x;
		int y;
	};

	std::vector<Keyboard::point> clicked_points_;
public:
	Keyboard();
	void getReadyExtras();
	void runLoopExtras();
	void velocityLoopExtras();
	void callbackClickedPoints(common_msgs_gl::PointArray msg);
	void callbackKeyboardNumber(std_msgs::Int32 msg);
	void readSpecificParameters();
	void convertCartesianVeltoActuatorVel(const std::vector<double>& car_vel, std::vector<double>& act_vel);
	void waitForFeatures();
	void sendFeaturesToTracker();
	void sendRefenceToVS();
	void sendLineReference();
};
