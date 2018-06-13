#include "ros/ros.h"
#include <vector>
#include "common_msgs_gl/SendInt.h"
#include "common_msgs_gl/SendDoubleArray.h"
#include "std_msgs/Float64MultiArray.h"
#include "std_srvs/Empty.h"
#include "std_msgs/Empty.h"
class InHandManipulationManager{
	bool time_displayed_;
	ros::Time time_start_;
	ros::Subscriber sub_refresh_param_;
	ros::ServiceClient srvclnt_gripper_open_;
	ros::ServiceClient srvclnt_gripper_close_;
	ros::ServiceClient srvclnt_set_offsets_;
	ros::ServiceClient srvclnt_actuator_vel_ref_;
	ros::ServiceServer srvsrvr_set_mode_, srvsrvr_get_vel_ref_, srvsrvr_calibrate_system_;

	bool callbackSetMode(common_msgs_gl::SendInt::Request&, common_msgs_gl::SendInt::Response&);
	bool callbackCalibrateSystem(std_srvs::Empty::Request&, std_srvs::Empty::Response&);
	bool callbackVelRef(common_msgs_gl::SendDoubleArray::Request&, common_msgs_gl::SendDoubleArray::Response&);
	void callbackVelRefMsg(std_msgs::Float64MultiArray msg);
	void callbackRefreshParam(std_msgs::Empty msg);

	void sendActuatorVelRef(const std::vector<double>& act_vel_ref);

	void readGeneralParameters();
	void publishSystemStateOnChange();
protected:
	enum cmd_ {start, stop, get_ready, undefined};
	cmd_ received_command_;
	double recorded_distance_ = 0;
	std::vector<double> vel_ref_, finger_closing_position_;
	enum mode_ {running, ready, stopped, getting_ready, stopping, vel_control, idle};
	mode_ system_mode_ = stopped;
	mode_ system_mode_old_ = stopped;
	ros::NodeHandle node_handle_;
	ros::ServiceClient srvclnt_feature_detector_trigger_;
	ros::ServiceClient srvclnt_command_trajectory_;
	ros::Subscriber sub_vs_vel_ref_;
	ros::Publisher pub_stop_, pub_system_reset_, pub_system_state_;
	void closeWithTrajectory(const std::vector<double>& pos_ref, const double& speed);
	virtual void getReady();
	virtual void getReadyExtras();
	virtual void velocityControl();
	virtual void runLoop();
	virtual void runLoopExtras();
	virtual void stopExtras();
	virtual void velocityLoopExtras(){};
	virtual void readyLoopExtras(){};
	virtual void readyLoop(){};
	virtual void calibrateSystem(){};
	virtual void readSpecificParameters(){};
	virtual void convertCartesianVeltoActuatorVel(const std::vector<double>& car_vel, std::vector<double>& acc_vel);
	void setInitialPositionOffsets(const std::vector<double>& offsets);
public:
	InHandManipulationManager();
	void initialize();
	void openGripper();
	void closeGripper();
	void spin();
	void stopGripper();
};
