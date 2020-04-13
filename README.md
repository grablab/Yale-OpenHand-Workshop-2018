# Yale OpenHand Workshop 2018

***Please note that the code for the Yale Openhand models is constantly being updated. This workshop repository will remain static. For updated code, that may admittedly have less documentation, please refer to our current software repository, [OpenHand Software Github](https://github.com/grablab/openhand_node).***


Welcome to the Yale Grab Lab OpenHand Workshop 2018. Throughout the course of this workshop, we will be assembling and controlling a Model O gripper from the Yale OpenHand Project. All 3D files are openly available on the [OpenHand Hardware Github](https://github.com/grablab/openhand-hardware). The code provided for this workshop is extended from that of the [OpenHand Software Github](https://github.com/grablab/openhand_node) to include support for Python 3 and ROS control. Other models are available on the [OpenHand Website](http://www.eng.yale.edu/grablab/openhand/) with instruction manuals for fabrication and assembly. The python code provided in this workshop will allow you to control an array of hands that are available on the website, though we will be focusing mainly on the Model O. 

More information about the lab and present/previous work is available on the [Grab Lab Website](https://www.eng.yale.edu/grablab/).

## Requirements
Python 2 or Python 3 is required for simple control of the hand with a USB2Dynamixel controller interface ([U2D2](http://www.robotis.us/u2d2/) controller as provided). The provided code was built and tested on Python 2.7 and 3.6. Serial communication is provided through the PySerial 3.x library and value storage utilizes the Numpy 1.X library, both of which you may have to install separately (see instructions later in the document). A power supply of 12V (max ~ 1.2A required) should be connected to power the Dynamixel motors through the [hub](http://www.trossenrobotics.com/6-port-rx-power-hub) or similar. *NOTE: The USB2Dynamixel(U2D2) device cannot power the motors. Please be sure to use the hub provided*
  
An additional ROS catkin_ws (names ROS in the repository) is provided for extended control of the gripper. This workspace was built and tested with ROS Kinetic. A simple keyboard controller is provided and will be further discussed in a subsequent section.  

## Python Control
Python code is used for easy control of the Dynamixel-based OpenHand designs. These Python objects depend on a modified version of the 'lib_robotis.py' library from Georgia Tech (included in our repository). The library has been updated to properly control both MX and RX series servos, as well as accounting for possible header miscues as suggested by the pydynamixel library. Each hand object has pre-tested settings for servo bounds and torque output that we routinely use in our experiments. These values may vary for different hardware implementations or assembly processes. 

Before you begin, you will need to have a working (preferably updated) version of either Python 2 or Python 3. This installation is available at [python.org](https://www.python.org/) for your designated operating system, and should include the `pip` installation as well. You will also be required to have the ```numpy``` and ```pyserial``` libraries installed. Once you have your preferred version of python installed, in your terminal (or command prompt) window, you should easily be able to install these libraries with the following commands on any directory level:

```python -m pip install pyserial```   
```python -m pip install numpy```    

USB port names are required for serial communication with the motors. This naming convention is different on every operating system, but can typically be found using the following commands (terminal for MacOS/Linux and command prompt for Windows). At this time, the hand should be powered through the USB hub via the wall adapter and the U2D2 controller should be plugged into your computer via USB:

#### Linux
`$ ls /dev/ttyUSB*`  
`/dev/ttyUSB0`  
#### Mac
`$ ls /dev/tty.usb*`  
`/dev/tty.usbserial-AI03QF0H`  
#### Windows
`$ mode`   
`COM3`   


Please note that an additional [driver](http://www.ftdichip.com/Drivers/D2XX.htm) may be required for serial communication for Windows. Also note single quotations around the name of the port will typically be required later for running these programs. 

#### Finding Dynamixels Command: 

Record the port name presented in the terminal window. You will now also need to know the address of each Dynamixel you intend to control. Addresses can be changed using the [Dynamixel Wizard](http://www.robotis.us/roboplus1/), in Windows or by using the command line tool presented later on. For the Model O case, we should expect to see 4 unique addresses when looking for the motor addresses. To find the addresses of your dynamixels, run the following command in a terminal window:
 
Basic (write python3 if not using Python 2, depending on your system configuration, and you may also need to use the ```sudo``` command before ```python``` or ```python3```):  
`$ python lib_robotis_mod.py -d <YOUR_COM_PORT> --scan`  __OR__  
`$ sudo python lib_robotis_mod.py -d <YOUR_COM_PORT> --scan` 

Example:  
`$ python lib_robotis_mod.py -d '/dev/ttyUSB0' --scan`  
`$ python lib_robotis_mod.py -d 'COM9' --scan`

NOTE: This process can often be difficult to cancel out of in Windows (use ```ctrl + \``` in unix-based systems). Once dynamixels are found, you may close out of and restart the terminal without any changes to the configuration. If you have multiple dynamixels (daisy chain) connected and you are missing an ID for one or more motors, it is likely that there are motors in your system that share the same (address) ID. In this event, you will have to change the ID of matching motors so that they are unique in your system. While connecting just one motor to the serial module, you can run the following command:

#### Setting New ID for Dynamixel Motors:  

Basic:  
`$ python lib_robotis_mod.py -d <YOUR_COM_PORT>--setID <old_id> <new_id>`

Example:  
`$ python lib_robotis_mod.py -d '/dev/ttyUSB0' --setID 2 3`  
`$ python lib_robotis_mod.py -d 'COM9' --setID 2 3`  

With recorded port names and dynamixel addresses, you can now control your OpenHand. Pressing ```ctrl + d``` will exit the Python program. There may be times that you may need to exit the program using ```ctrl + \``` depending on the most recent command. 

#### Validating Your Motor Assignments  
  
To visually validate that you are correctly talking to your motors, we have added another function that will move all motors in the chain. To use this command, you can run the following:

`$ python lib_robotis_mod.py -d '/dev/ttyUSB0' --moveTest "1 2 3 4"`

If all motors are connected properly (note the string of integers can be as big or as little as desired), you should see all motors move and a confirmation echo in the terminal. 

### Tuning:  
Tuning your OpenHand is one of the most important steps during the set up process. Due to the set screw gap in the dynamixel pulleys, it is often very difficult to tune the OpenHand perfectly without changing offsets in the code. We have implemented a simple function to find the correct offsets for each of the motors. This step may require a few iterations. 

#### Finding the correct offset   
It is important to recognize the correct order of IDs for initialization in the python command. The adduction motor should always be the first in the list, with the right finger next, left follows, and finally the thumb. We seek to set up the hand such that home position is with the tendons taught, but not moving the fingers, and the fingers to be perpendicular to the thumb. You are able to 'reset' or 'home' your hand if these offsets are correct which means we need to change the the minimum actuator value (which is implemented as a range from 0-1). You can find these offsets by iterating through values for each motor until the correct offset is recognized. For example:  

`$ python -i openhand.py`

```python
 T = Model_O("/dev/ttyUSB0", 2, 1, 3, 4, "RX")  
 T.change_motor_min(1, 0.13)
 #user recognizes that the finger tendon is not taught. Note that the user should
 #be looking at the finger tendon and not the proximal reset tendon. 
 T.change_motor_min(1, 0.16)
 #tendon is now taught - offset is 0.16
```
For this initialization, the user notices that the tendon is tight without moving the finger. This value can be recorded for later use and implementation. Repeat the same command for each of the motors. Note that the abduction motor should be 'homed' when the two fingers are perpendicular to the thumb. When all offsets have been found, you can either change the initial offsets in the ```openhand.py``` code (approximately line 331 and preferred), change each of them upon startup using the same ```change_motor_min()``` function call (example 1 below), or you can initialize each of them during your Model_O object call (example 2 below). The two examples are analogous to one another. 

##### Example 1
`$python -i openhand.py`  
```python
T=Model_O('/dev/ttyUSB0', 2, 1, 3, 4, "RX")
T.change_motor_min(0,0.0)
T.change_motor_min(1,0.2)
T.change_motor_min(2,0.16)
T.change_motor_min(3,0.18)
```  
##### Example 2
`$python -i openhand.py`  
```python
T=Model_O('/dev/ttyUSB0', 2, 1, 3, 4, "RX", 0.0, 0.2, 0.16, 0.18)
```  
The last four numbers are the motorMins of motors for index 0-3, respectively. These relate to the motor index, not the motor address.  

### Basic Usage:  

`$ python -i openhand.py`

```python
T = Model_O)([port name], [abduction servo[1] id], [right forward servo[2] id],[left reverse servo[3] id],[thumb servo[4] id], [Dynamixel series ("RX", "MX")])  
T.close([desired tendon length for close (0.0-1.0)])
T.reset()
T.release()  
```
### Example Usage:

`$ python -i openhand.py`

```python
 T = Model_O("/dev/ttyUSB0",2,1,3,4,"RX")  
 T.close(0.6)  
 T.release()  
 T.moveMotor(0,0.6)  
 T.moveMotor(1,0.6)  
 T.release()
 T.adduct()
 T.close(0.5)
 T.power_close(0.6)
```    
NOTE: Once initializing your openhand, the motor addresses are no longer used for control - these are only used for initialization. The motors will now be reference by index (zero-based) according to the order you specified in the object initialization. That is, for the Model O:{Index 0 = adduction, Index 1 = right finger, Index 2= left finger, Index 3= thumb). This configuration is specified when the Y is in the correct orientation. 

#### Available functions for the Model O
Please note that in the table below <obj_name> is the same as `T` in the example above. Additionally, there are some model-specific functions available for each openhand design. If another model is controlled, take a look at `openhand.py` to understand additional functionality. 

| Function Call                                  | Description                                                                         |
|------------------------------------------------|-------------------------------------------------------------------------------------|
| <obj_name>.reset( )                            | Moves fingers back to zero position                                         |                                              
| <obj_name>.release( )                          | Opens fingers, does not reset other non-finger servos                       |       
| <obj_name>.close(amt)                          | Closes the fingers by some specified amount ranging from 0.0 to 1.0         |               
| <obj_name>.moveMotor(motor_index, amt)         | Moves a motor (according to the index and not the address) by some specified amount |
| <obj_name>.adduct(amt)                         | Changes adduction/abduction location - default 0.5                          |
| <obj_name>.pinch_close(amt)                    | Setup pinch grasp with opposing fingers - default 0.4                       |
| <obj_name>.power_close(amnt)                   | Setup power grasp with fingers parallel to thumb - default 0.6              |
| <obj_name>.change_motor_min(motor_index, amt)  | Changes motor position minimum for correct reset() and closing              |
| <obj_name>.shift(motor_index, amt)             | Shifts the motor specified to a position beyond its current one. If the position is not beyond its current position, it will drop the object. This funciton uses torque control to maintain a stable grasp and assumes that the hand is already in a stable pinch_close() position.               |
| <obj_name>.sweep(amt)                          | Sweeps a pinch_close() object back and forth. This function may be tuned according to the size and shape of the object - default moves 0.1 beyond current position             |
| <obj_name>.readMotor(motor_index)              | Returns the position of the motor                                           |    
| <obj_name>.readMotorMins()                     | Returns the motor min value, used for resetting motor to initial position   |                                          
| <obj_name>.readLoads()                         | Returns the motor loads for the entire hand                                 |                   
| <obj_name>.readHand( )                         | Returns the positions of each motor in the hand                             |                        
| <obj_name>.diagnostics( )                      | Presents load, temperature, and encoder location for each motor in the hand |         


  

## ROS Control   

A ROS catkin_ws is provided for further extension and functionality of the hands. This code was built using ROS Kinetic and requires Python 2 for hand control. A simple keyboard controller was developed for easy control of the hand. Assuming a stable grasp the keyboard controls are are as follows (response is direction in which object will move) :   

<center>
NOTE: Directions are according to a top down view of the gripper.   
  
  
| Key | Response   | Description                                                 |
|-----|------------|-------------------------------------------------------------|
| S   | Stop       | Stops the within-hand object movement                       |
| W   | Up         | Moves the object away from the base of the gripper          |
| A   | Left       | Moves the object towards the left                           |
| D   | Right      | Moves the object towards the right                          |
| X   | Down       | Moves the object towards the base of the gripper            |
| Q   | Up-Left    | Moves the object out from the base and towards the left     |
| E   | Up-Right   | Moves the object out from the base and towards the right    | 
| Z   | Down-Left  | Moves the object in towards the base and towards the left   |
| C   | Down-Right | Moves the object in towards the base and towards the right  |

</center>


### Building and Running
Before running your file, you will need to navigate to ```src/projects/dexterous_manipulation/param/model_t42.yaml```. In this file, you will be able to change the servo IDs and COM port names according to your system. These must be correct in order for the openhand node to launch. You may also be interested in changing parameters in the ```gripper.yaml``` and ```keyboard.yaml``` files according to your setup. Increasing the keyboard gain will allow the gripper to move faster. It is recommended that parameters in ```gripper.yaml``` are calibrated according ot individual systems before use. 

In order to build the ROS directory, move to the ROS folder where ```src``` is located. Then run the command ```$ catkin_make``` to build the project. Once built, navigate to the ```src``` folder where a file named ```keyboard_control.launch``` is located. Finally, run ```$ roslaunch keyboard_control.launch``` in order to run the file. 

Upon running ```roslaunch``` you should not see any ROS errors in your terminal window. To activate the hand, open another terminal and type the following command: ```rosservice call /manipulation_manager/set_mode 0```. At that point, your gripper will open and initialize itself to a closed-grasp state. Once the gripper is initialized to this state, now type ```rosservice call /manipulation_manager/set_mode 1``` in the same terminal window. At this point the hand is available for control.

Return to the original ```roslaunch``` terminal, which is not listening to your keyboard input. According to the table above, use the keyboard commands to control the gripper. NOTE: You do not need to hold in the keys in order to control in a given direction. Dynamixel motors are limited in their power output and could crash if their torque limits are exceeded - this would require a system/power reset. 


## Thank you  
Thank you for attending the Yale Openhand Workshop 2018. If you have any questions or interests in any of our other openhand designs and projects, please consider contributing to the opensource software. As always, feel free to contact maintainers of the project from the [OpenHand Contacts Page](https://www.eng.yale.edu/grablab/openhand/#contact). 

