# 	Yale GrabLab					            #
# 	OpenHand Workshop 2018 @Yale University		#
# 	PI: Aaron Dollar 				            #
#	June 14, 2018					            #
#	Recent Edits: Andrew Morgan			        #

#!/usr/bin/python -i
from lib_robotis_mod import *
import time
import numpy as np	#for array handling

#assumptions:
	#only dynamixel servos being used
	#either all RX or MX servos being used (no mixing)
	#different encoder limits for each type
	#motor limits and mov't designated in terms of proportion, not encoder value

act_out0 = []
act_out1 = []

class OpenHand():
	dyn = None		#USB2Dynamixel device
	port = None		#mounted port, /devttyUSB# in Linux, COM# in Windows
	servo_ids = []
	servos = []

	servo_speed = 1.0
	max_torque = 0.4	#Dynamixel suggests capping max torque at 0.4 of stall torque

	motorDir = []
	motorMin = []
	motorMax = []

	amnt_release = 0.0	#values [0,1.0] for degree of closing and opening
	amnt_close = 0.5

	pause = 0.3		#amount of time to wait for move commands and eeprom updates

	HAND_HEIGHT = 0.14	#hand height from base to palm (m) used for arm IK and approach vectors
	WRIST_OFFSET = -np.pi/3	#J5 offset (rad) to accommodate final orientation

	def __init__(self,port,servo_ids,series="RX"):
		self.port = port
		self.dyn = USB2Dynamixel_Device(port)	#always only one
		self.servo_ids = servo_ids
		num_servos = len(servo_ids)

		print ("Initializing...")
		self.servos = []
		for servo_id in self.servo_ids:
			self.servos.append(Robotis_Servo(self.dyn,servo_id,series))
			print ("Adding servo id "+repr(servo_id))
			time.sleep(self.pause)
		for servo in self.servos:
			servo.kill_cont_turn()		#make sure position mode limits are enabled

			time.sleep(self.pause)		#in case eeprom delay is what is causing the issues
			servo.apply_speed(self.servo_speed)
			time.sleep(self.pause)
			servo.apply_max_torque(self.max_torque)

		if len(self.motorDir)!=num_servos or len(self.motorMin)!=num_servos or len(self.motorMax)!=num_servos:
			print("[ERR] Servo number mismatch, resetting motor limits")
			self.motorDir = [1]*num_servos
			self.motorMin = [self.amnt_release]*num_servos
			self.motorMax = [self.amnt_close]*num_servos
		time.sleep(self.pause)
		self.reset()
		print ("Initialization Complete.")

	def reset(self):	#returns everything to zeroed positions, different from release
		print ("[ERR] reset() not implemented")
		return False

	def release(self):	#opens the finger components, doesn't necessarily move non-finger servos
		print ("[ERR] release() not implemented\n")
		return False

	#close functions are normalized regardless of mode such that the operating range [0,1.0] makes sense
	def close(self,amnt=0.5):
		print ("[ERR] close() not implemented\n")
		return False

	#move servo according to amnt, not encoder value, scaled between designated min/max values
	def moveMotor(self,index,amnt):
		if amnt < 0. or amnt > 1.0:
			print ("[WARNING] motion out of bounds, capping to [0,1]. Index: "+repr(index)+", Cmd:"+repr(amnt))
		amnt = min(max(amnt,0.),1.0)
		if (index < 0 or index >= len(self.servos)):
			print ("[ERR] invalid motor index "+repr(index))
		else:
			servo = self.servos[index]
			print ("Now moving servo "+repr(index)+" to position "+ repr(amnt))
			offset =0
			if index == 0:
				offset = 0 #(FOR GR2)
				#offset = 0.08 # (FOR T42)
			if index == 1:
				offset = 0.00 #(FOR GR2)
				#offset = 0 # (FOR T42)

			global act_out0, act_out1, act0, act1, enc0, enc1

			if self.motorDir[index]>0:	#normal case

				act0, enc0 = self.readMotor(0)
				act_out0.append(act0)
				act1, enc1 = self.readMotor(1)
				act_out1.append(act1)

				servo.move_to_encoder(int(servo.settings["max_encoder"]*(self.motorMin[index] + amnt*(self.motorMax[index]-self.motorMin[index]) + offset)))
				act0, enc0 = self.readMotor(0)
				act_out0.append(act0)
				act1, enc1 = self.readMotor(1)
				act_out1.append(act1)

			else:				#reverse
				act0, enc0 = self.readMotor(0)
				act_out0.append(act0)
				act1, enc1 = self.readMotor(1)
				act_out1.append(act1)

				servo.move_to_encoder(int(servo.settings["max_encoder"]*(self.motorMax[index] - amnt*(self.motorMax[index]-self.motorMin[index]) + offset)))
				act0, enc0 = self.readMotor(0)
				act_out0.append(act0)
				act1, enc1 = self.readMotor(1)
				act_out1.append(act1)

			if not self.modes[index]:	#restore position-control mode if necessary - want to register new encoder target first before re-applying system torque
				self.modes[index] = True
				servo.apply_max_torque(self.max_torque)

	def getCurrDir(self):
		global currdir, take_no, act_out0, act_out1
		act_out0 = []
		act_out1 = []
		print ('Current directory: ')
		currdir = raw_input()
		print ('Take number: ')
		take_no = raw_input()

	def moveHand(self,vals):
		if len(vals)!=len(self.servos):
			print ("[ERR] Motor number mismatch")
		else:
			for i in range(len(vals)):
				self.moveMotor(i,vals[i])

	#returns motor position amnt, between designated min and max values
	def readMotor(self,index):
		servo = self.servos[index]
		enc = servo.read_encoder()
		if self.motorDir[index]>0:
			val = (enc/float(servo.settings["max_encoder"])-self.motorMin[index]) / (self.motorMax[index]-self.motorMin[index])
		else:
			val = (self.motorMax[index]-enc/float(servo.settings["max_encoder"])) / (self.motorMax[index]-self.motorMin[index])
		return val,enc

	def readHand(self):
		amnts = np.array([0.]*len(self.servos))
		encs = np.array([0]*len(self.servos))

		for i in range(len(self.servos)):
			amnt,enc = self.readMotor(i)
			amnts[i] = amnt
			encs[i] = enc

		return amnts, encs

	def readLoads(self):
		for servo in self.servos:
			print ("---")
			print ("Servo ID: "+repr(servo.servo_id))
			print ("Load: "+repr(servo.read_load()))

	def readMotorMins(self):
		index=0
		for servo in self.servos:
			print ("---")
			print ("Servo ID: "+repr(servo.servo_id))
			print ("Motor Mins: "+ repr(self.motorMin[index]))
			index=index+1

	#takes the current location and sets either the min or max
	def setMotorMin(self):
		amnts,encs = self.readHand()
		self.motorMin = (encs/float(self.servos[0].settings['max_encoder'])).tolist()
	def setMotorMax(self):
		amnts,encs = self.readHand()
		self.motorMax = (encs/float(self.servos[0].settings['max_encoder'])).tolist()

	#setting the max torque (shortcut for torque-based closing motions)
	def setMaxTorque(self,val=0.4):
		for servo in self.servos:
			servo.apply_max_torque(val)
			time.sleep(self.pause)	#helps mitigate eeprom delay issues?

	#moves to the current encoder value and locks servos in place to minimize current draw
	def preventAllLoadErrors(self,offset_scale = 0):
		for i in range(len(self.servos)):
			self.preventLoadError(i,offset_scale)
	def preventLoadError(self,i,offset_scale = 0):
		if abs(self.servos[i].read_load()) > 80:	#arbitrary load threshold
			value = offset_scale*10 + self.servos[i].read_encoder()
			if value < self.servos[i].settings['max_encoder']:
				self.servos[i].move_to_encoder(value)
			else:
				if value < 0:
					self.servos[i].move_to_encoder(0)
				else:
					self.servos[i].move_to_encoder(self.servos[i].settings['max_encoder'])

	def diagnostics(self):
		for servo in self.servos:
			print ("---")
			print ("Servo ID: "+repr(servo.servo_id))
			print ("Load: "+repr(servo.read_load()))
			print ("Temperature: "+repr(servo.read_temperature()))
			print ("Target Encoder: "+repr(servo.read_target_encoder()))
			print ("Current Encoder: "+repr(servo.read_encoder()))

class GR2(OpenHand):

	motorDir = [1,1]
	motorMin = [0.05,0.05]	#should always be symmetric here?
	motorMax = [0.7,0.7]

	modes = [True,True]

	HOLD_TORQUE = 0.2
	OVERSHOOT = 0.15

	pause = 0.2

	def __init__(self,port="/dev/ttyUSB0",s1=1,s2=2,dyn_model="RX"):
		OpenHand.__init__(self,port,[s1,s2],dyn_model)

	def moveMotor(self,index,val):
		val = min(1.0,max(val,0))
		amnt = val * (self.motorMax[index]-self.motorMin[index]) + self.motorMin[index]
		enc = int(self.servos[index].settings['max_encoder'] * amnt)
		self.servos[index].move_to_encoder(enc)

		if not self.modes[index]:
			self.servos[index].apply_max_torque(self.max_torque)
			self.modes[index] = True

	def torqueMotor(self,index,val,pos_val=None):
		val = min(1.0,max(val,0))	#by design, can exceed default max torque value
		self.modes[index] = False
		s = self.servos[index]
		if pos_val is None:
			enc = int(s.read_encoder()+self.OVERSHOOT * s.settings['max_encoder'])
		else:
			pos_val = min(max(0,pos_val),1.0)
			enc = int((pos_val * (self.motorMax[index]-self.motorMin[index])+self.motorMin[index]) * s.settings['max_encoder'])

		s.apply_max_torque(val)
		s.move_to_encoder(enc)

	def reset(self):
		self.release()
	def release(self):
		self.moveMotor(0,self.amnt_release)
		self.moveMotor(1,self.amnt_release)
	def close(self,amnt=0.3):
		self.moveMotor(0,amnt)
		self.moveMotor(1,amnt)
	def hold(self):
		for i in range(2):
			amnt,enc = self.readMotor(i)
			self.moveMotor(i,amnt)	#accounts for possible transition from torque mode
	def close_torque(self):
		for i in range(2):
			self.torqueMotor(i,self.HOLD_TORQUE,1.0)
		i = 0
		while i<10:
			if not self.servos[0].is_moving() or not self.servos[1].is_moving():
				break
			time.sleep(self.pause)
			i+=1
		self.hold()

	def shift(self,index,val):
		other_index = (index+1)%2
		vals,encs = self.readHand()

		if val<vals[index]:
			self.torqueMotor(index,0.)
			self.moveMotor(other_index,vals[other_index]+(vals[index]-val))
		else:
			self.torqueMotor(other_index,0.)
			self.moveMotor(index,val)

		i=0
		while i<10:
			s_val,s_enc = self.readMotor(index)
			s_val_err = abs(s_val-val)
			print ("Shifting error: "+repr(round(s_val_err,4)))
			if s_val_err<0.005:
				break
			time.sleep(self.pause)
			i+=1

		print ("Final shift error: "+repr(round(abs(val-s_val),4)))
		self.hold()

class Model_M2(OpenHand):
	servo_speed = 1.0
	max_torque = 0.4
	pos_err = 0.05	#error value for position checking

	motorDir = [1,1]
	motorMin = [0.05,0.05]
	motorMax = [0.6,0.6]

	SCALE_ANTAGONIST = 1.25
	SCALE_TRACKING = 0.35

	#initial id is antagonist, secondary id is agonist
	def __init__(self,port="/dev/ttyUSB0",s1=1,s2=2,dyn_model="MX"):
		OpenHand.__init__(self,port,[s1,s2],dyn_model)

	def reset(self):
		self.release()
	def release(self):	#moving both tendons to slack position
		self.moveMotor(0,self.amnt_release)
		self.moveMotor(1,self.amnt_release)
	def close(self,amnt=0.5):
		#check that antagonist is slack:
		curr_amnt,enc = self.readMotor(0)
		if curr_amnt>(self.amnt_release+self.pos_err):
			print( "[ERR] Had to reset antagonist for close, try again")
			self.moveMotor(0,self.amnt_release)
		else:
			self.moveMotor(1,amnt)
	def precision_close(self,amnt=0.5):
		#check that agonist is slack:
		curr_amnt,enc = self.readMotor(0)
		if curr_amnt>(self.amnt_release+self.pos_err):
			print ("[ERR] Had to reset agonist for precision close, try again")
			self.moveMotor(1,self.amnt_release)
		else:
			self.moveMotor(0,amnt)

class Model_M(OpenHand):
	servo_speed = 1.0
	max_torque = 0.4

	motorDir = [1,1]
	motorMin = [0.05]
	motorMax = [0.7]

	def __init__(self,port="/dev/ttyUSB0",s1=1,dyn_model="RX"):
		OpenHand.__init__(self,port,[s1],dyn_model)

	def reset(self):
		self.release()
	def release(self):
		self.moveMotor(0,self.amnt_release)
	def close(self,amnt=0.4):
		self.moveMotor(0,amnt)

class Model_O(OpenHand):
	servo_speed = 1.0
	max_torque = 0.4
	amnt_close = 0.5 #default close position
	max_close = 0.7 #max motor movement from open to close for individual hand

	modes = [True,True,True,True] #True if in position control

	HOLD_TORQUE = 0.2
	OVERSHOOT = 0.15

	#RESET THE MOTOR MINS FOR FASTER INITIALIZATION
	motorDir = [1,1,-1,1] # one finger is opposite due to placement on the openhand base
	motorMin = [0.0,0.22,0.13,0.27]
	motorMax = [motorMin[0]+0.48,motorMin[1]+max_close,motorMin[2]+max_close,motorMin[3]+max_close]

	HAND_HEIGHT = 0.14
	WRIST_OFFSET = -np.pi/4

	def __init__(self,port="/dev/ttyUSB0",s1=2,s2=1,s3=3,s4=4,dyn_model="RX",s1_min=motorMin[0],s2_min=motorMin[1],s3_min=motorMin[2],s4_min=motorMin[3]):
		#s1: adduction/abduction motor for spread
		#s2: forward-driving finger
		#s3: reverse-driving finger
		#s4: thumb
		mot_offset = [s1_min,s2_min,s3_min,s4_min]
		if(mot_offset != self.motorMin):  #update motor mins if initialized to different values
			print ('Setting new motor minimums according to initialization...')
			print (' ')
			self.motorMin = mot_offset
			self.motorMax = [self.motorMin[0]+0.48,self.motorMin[1]+self.max_close,self.motorMin[2]+self.max_close,self.motorMin[3]+self.max_close]
		OpenHand.__init__(self,port,[s1,s2,s3,s4],dyn_model)

	def reset(self):
		self.release()
		time.sleep(0.5)
		self.moveMotor(0,0.)	#moves fingers into lateral pinch mode with fingers orthogonal to thumb

	def release(self):
		self.moveMotor(1,0.)
		self.moveMotor(2,0.)
		self.moveMotor(3,0.)

	def open(self):
		self.moveMotor(1,0.)
		self.moveMotor(2,0.)
		self.moveMotor(3,0.)

	def close(self,amnt=0.5):
		self.moveMotor(1,amnt)
		self.moveMotor(2,amnt)
		self.moveMotor(3,amnt)

	def change_motor_min(self,index, val):
		if (index < 0 or index >= len(self.servos)):
			print ("[ERR] invalid motor index "+repr(index))
		else:
			if (index >0):
				self.motorMin[index]=val
				self.motorMax[index]=val+self.max_close
			else:	#case of the adduction motor
				self.motorMin[index]=val
				self.motorMax[index]=val+0.5
			self.reset()
			print ('Index changed successfully...')

	#abduct/adduct fingers - if no param given, move to power grasp
	def adduct(self,amnt=1):
		self.moveMotor(0,amnt)

    #abduct fingers - then pinch close
	def pinch_close(self,amnt=0.4):
		adduct_loc, enc = self.readHand()
		if(adduct_loc[0] > 0.05):
			self.reset()
			time.sleep(1.5) #pause for 1.5 seconds to allow reset
		self.moveMotor(1,amnt)
		self.moveMotor(2,amnt)

	#adduct fingers - then power close
	def power_close(self,amnt=0.6):
		adduct_loc, enc = self.readHand()
		if(adduct_loc[0] < 0.95):
			self.release()
			time.sleep(1) #pause for 1 second to allow release
			self.adduct(1)  #move fingers facing thumb
			time.sleep(1)
		self.close(amnt)

    #Example why torque control is required for fingertip manipulation
	def pinch_object_move(self,delta_amnt=0.03, left=True, down = False): #These cannot be the same or else we will move diagonal
		adduct_loc, enc = self.readHand()
		if(adduct_loc[0] > 0.05):
			print ('[ERR] Hand is not in a pinch grasp')
			return
		else:
			locs, enc = self.readHand()
			if left==True and down == False:		#move left
				self.moveMotor(1,locs[1]+delta_amnt)
				self.moveMotor(2,locs[2]-delta_amnt)
			elif left==False and down == False: 		#move right
				self.moveMotor(1,locs[1]-delta_amnt)
				self.moveMotor(2,locs[2]+delta_amnt)
			elif left==False and down == True: 		#move down
				self.moveMotor(1,locs[1]+delta_amnt)
				self.moveMotor(2,locs[2]+delta_amnt)
			else: 						#move up
				self.moveMotor(1,locs[1]-delta_amnt)
				self.moveMotor(2,locs[2]-delta_amnt)

	#replacement for preventAllLoadErrors() due to servo state constraints
	def hold(self):
		for i in [1,2]:
			amnt,enc = self.readMotor(i)
			self.modes[i] = True
			self.servos[i].apply_max_torque(self.max_torque)
			self.moveMotor(i,amnt+0.025)	#accounts for possible transition from torque mode

	#tval: torque value
	#dpos: delta in position from current (may force operation into compliance region)
	def close_torque(self,tval=None,dpos=1.0):
		if tval is None:
			tval = self.HOLD_TORQUE
		self._close_torques(tval,dpos)

	#Sets the motor into a torque mode so that fingertip manipulation is possible
	def torqueMotor(self,index,val,pos_val=None):
		val = min(1.0,max(val,0))	#by design, can exceed default max torque value
		self.modes[index] = False   #turn into torque mode
		s = self.servos[index]
		if pos_val is None:
			enc = int(s.read_encoder()+self.OVERSHOOT * s.settings['max_encoder'])
		else:
			pos_val = min(max(0,pos_val),1.0)
			enc = int((pos_val * (self.motorMax[index].modes-self.motorMin[index])+self.motorMin[index]) * s.settings['max_encoder'])

		s.apply_max_torque(val)

	#assumes operation starts with grasp w/ full contact
	#either pushing or relaxing a finger
	#shifts object to the edge of the workspace
	def shift(self,index,val, wait_range=None):
		if index != 1 and index !=2:
			print ("[ERR] Can only shift using power grasp with opposing fingers 1 and 2")
			return

		other_index=1
		if (index == 1):
			other_index=2
		vals,encs = self.readHand()

		if val<vals[index]:
			self.torqueMotor(index,0.03)
			self.moveMotor(other_index,vals[other_index]+(self.motorDir[index])*(vals[index]-val))
		else:
			self.torqueMotor(other_index,0.03)
			self.moveMotor(index,val)

		if wait_range == None:
			wait_range = 7

		for i in range(wait_range):
			s_val,s_enc = self.readMotor(index)
			s_val_err = abs(s_val-val)
			if s_val_err<0.005:
				break
			time.sleep(self.pause)

		print ("Final shift error: "+repr(round(abs(val-s_val),4)))
		self.hold()
		return s_val_err

	#demo motion that moves object back and forth with shift (assumes symmetry in operation)
	def sweep(self,val=None):
		adduct_loc, enc = self.readHand()
		if(adduct_loc[0] > 0.05):
			print ('[ERR] Hand must be in pinch_close mode before sweep')
			return

		amnts,encs = self.readHand() #record starting pose to return to
		if val == None:
			val=amnts[1]+0.10
		self.shift(1,val,7)
		time.sleep(0.5)
		self.shift(2,val,12)
		time.sleep(0.5)
		self.shift(1,val-0.05,10)
		time.sleep(0.5)
		self.shift(2,val-0.05,10)
		time.sleep(0.5)
		self.shift(1,amnts[1])
		time.sleep(self.pause)
		print ("Sweep Completed..")

	#jiggling the fingers closed. Does not work as intended
	def close_jiggle(self,amnt=0.5,da=0.05,nsteps=5,pause=0.25):
		amnt_start,amnt_enc = self.readHand()
		s_amnt = amnt_start[0]
		if s_amnt<0.5:
			print ("[WARNING] Fingers may be spread too far apart for closing motion")

		amnt_goal = np.array([amnt,amnt,amnt,s_amnt])
		da_arr = np.array([da,-da,0.,0.])
		for i in range(nsteps):
			amnt_arr = amnt_start+(amnt_goal-amnt_curr)*float(i)/nsteps+da_arr*(-1)**i

			self.moveHand(amnt_arr)
			time.sleep(pause)
		self.moveHand(amnt_goal)

class Model_Q(OpenHand):
	servo_speed = 0.25

	amnt_close = 0.35

	motorDir = [1,-1,1,1]
	motorMin = [0.32,0.4,0.05,0.05]
	motorMax = [0.67,0.9,0.5,0.5]

	HAND_HEIGHT = 0.12
	WRIST_OFFSET = -np.pi/4

	def __init__(self,port="/dev/ttyUSB0",s1=13,s2=12,s3=11,s4=10,dyn_model="MX"):
		#s1: internal twist between fingers
		#s2: adaptive two-finger power-grasp
		#s3: single finger 1 (usually the forefinger)
		#s4: single finger 2 (usually the thumb or shorter finger if implemented as such)
		OpenHand.__init__(self,port,[s1,s2,s3,s4],dyn_model)

	#default OpenHand commands
	def release(self):
		#self.reset()
		self.moveMotor(1,0.)
		self.moveMotor(2,0.)
		self.moveMotor(3,0.)
		time.sleep(self.pause)
		self.preventAllLoadErrors()
	def close(self,amnt=0.35):
		self.moveMotor(1,amnt)
		self.moveMotor(2,amnt)
		self.moveMotor(3,amnt)
		time.sleep(self.pause)
		self.preventAllLoadErrors()
	def reset(self):
		self.moveMotor(0,0.5)
		self.moveMotor(1,0.)
		self.moveMotor(2,0.)
		self.moveMotor(3,0.)
		time.sleep(self.pause)
		self.preventAllLoadErrors()

	#model-specific commands
	def closeFF(self,amnt):
		self.moveMotor(1,amnt-0.1)
		time.sleep(self.pause)
		self.preventLoadError(1)

	def closeFP(self,amnt):
		self.moveMotor(2,amnt)
		self.moveMotor(3,amnt)
		time.sleep(self.pause)
		self.preventLoadError(2)
		self.preventLoadError(3)

	def twist(self,direction=1,amnt=0.5,num=5):
		num = max(0,num)
		self.closeFP(self.amnt_release)
		for i in range(0,num):
			self.closeFF(amnt)
			self.closeFP(self.amnt_release)
			if direction>0:
				self.moveMotor(0,0.)
				time.sleep(self.pause)
				self.preventLoadError(0)
				self.closeFP(amnt)
				self.closeFF(0.)
				self.moveMotor(0,1.)
			else:
				self.moveMotor(0,1.)
				time.sleep(self.pause)
				self.preventLoadError(0)
				self.closeFP(amnt)
				self.closeFF(0.)
				self.moveMotor(0,0.)
			time.sleep(self.pause)
			self.preventLoadError(0)

	def pinchPower(self,pinchAmnt=0.5,offsetAmnt=0.2,num=3):
		num = max(0,num)
		self.closeFP(self.amnt_release)
		for i in range(num):
			self.closeFF(pinchAmnt)
			self.closeFP(self.amnt_release)	#finger replacement/recycle
			self.closeFP(pinchAmnt)		#begin grasp exchange
			self.closeFF(self.amnt_release)
			self.closeFP(pinchAmnt+offsetAmnt)	#pull finger closer inward
		self.closeFF(pinchAmnt)
		self.closeFP(self.amnt_release)
		self.closeFP(pinchAmnt)

class Model_T42(OpenHand):
	servo_speed = 0.25

	motorDir = [1,1]
	motorMin = [0.05,0.05]
	motorMax = [1.,1.]

	HAND_HEIGHT = 0.08
	WRIST_OFFSET = -5*np.pi/12

	def __init__(self,port="/dev/ttyUSB0",s1=1,s2=2,dyn_model="RX"):
		#s1: "forefinger"
		#s2: "thumb"
		OpenHand.__init__(self,port,[s1,s2],dyn_model)

	#default OpenHand commands:
	def reset(self):
		self.release()

	def close(self,amnt=0.45):	#position-based closing mechanism
		self.moveMotor(0,amnt)
		self.moveMotor(1,amnt)

	def release(self):
		self.moveMotor(0,self.amnt_release)
		self.moveMotor(1,self.amnt_release)

	#model-specific OpenHand commands:
	def flip_init(self):
		self.moveMotor(0,self.amnt_release)
		self.moveMotor(1,self.amnt_close)

	def flip_close(self):
		self.moveMotor(0,self.amnt_close)
		self.moveMotor(1,self.amnt_close)


class Model_T(OpenHand):
	max_torque = 0.4
	limit_close = 10		#counter for a standard close (to prevent servo stuck in closing mode in event of tendon failure)

	motorDir = [1]
	motorMin = [0.05]
	motorMax = [1.]

	HAND_HEIGHT = 0.14
	WRIST_OFFSET = -np.pi/4

	def __init__(self,port="/dev/ttyUSB0",s1=1,dyn_model="MX"):
		OpenHand.__init__(self,port,[s1],dyn_model)

	def reset(self):
		self.moveMotor(0,self.amnt_release)

	def close_torque(self,amnt=0.5):
		self.servos[0].enable_torque_mode()
		self.servos[0].apply_torque(amnt*self.max_torque)
		time.sleep(self.pause*2)

		i,sp = 0,1.
		while i<self.limit_close and sp>0:
			sp = self.servos[0].read_speed()
			print( "close (speed): "+repr(sp))
			i += 1
			time.sleep(self.pause)

		self.servos[0].disable_torque_mode()
		self.preventLoadError(0)
		return True

	def close_wheel(self,amnt=0.5,speed=0.2):	#closing through wheel mode
		#set torque output to max, use wheel speed to modulate closing force
		self.servos[0].disable_torque_mode()
		self.servos[0].init_cont_turn()
		self.servos[0].apply_speed(speed)
		time.sleep(self.pause*2)

		i,sp = 0,1.
		while i<self.limit_close and sp>0:
			sp = self.servos[0].read_speed()
			print( "close (speed): "+repr(sp))
			i += 1
			time.sleep(self.pause)

		self.servos[0].kill_cont_turn()
		self.preventLoadError(0)
		return True

	def close(self,amnt=0.2):			#closing through position mode and torque limit
		#set target position to furthest limit, but change servo torque limit
		self.servos[0].apply_max_torque(amnt)
		time.sleep(self.pause)
		self.servos[0].move_to_encoder(self.servos[0].settings['max_encoder']-1)
		time.sleep(self.pause)

		i,sp = 0,1.
		while i<self.limit_close and sp>0:
			sp = self.servos[0].read_speed()
			print ("close (speed): "+repr(sp))
			i += 1
			time.sleep(self.pause)

		self.preventLoadError(0)
		self.servos[0].apply_max_torque(self.max_torque)
		return True

	def release(self):					#should work for all previous close cases
		self.servos[0].enable_torque_mode()

		self.servos[0].apply_torque(0.)			#allow natural compliance to loosen grasp for tight grip cases
		time.sleep(self.pause*2)

		self.servos[0].disable_torque_mode()

		self.servos[0].kill_cont_turn()			#back to position mode
		self.servos[0].apply_speed(self.servo_speed)	#check in case it was in wheel mode
		self.moveMotor(0,self.amnt_release)
