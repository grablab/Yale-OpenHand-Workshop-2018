#!/usr/bin/python 

from openhand import *
from openhand.srv import *
import rospy

#class to handle basic servo commands for Dynamixels
class OpenHandNode():
	hand = None
	sRefs = None

	def __init__(self,hand):
		self.hand = hand
		self.sRefs = [0.]*len(self.hand.servos)
		for i in xrange(len(self.hand.servos)):
			sp,se = self.hand.readMotor(i)
			self.sRefs[i] = sp	

		#initialize service handlers:
		rospy.Service('MoveServos',MoveServos,self.MoveServosProxy)
		rospy.Service('TorqueServos',MoveServos,self.TorqueServosProxy)
		rospy.Service('ReadServos',ReadServos,self.ReadServosProxy)
		rospy.Service('HoldServos',HoldServos,self.HoldServosProxy)
		rospy.Service('ReadCurrent',ReadCurrent,self.ReadCurrentProxy)
		rospy.Service('ReadLoad',ReadLoad,self.ReadLoadProxy)
		rospy.Service('ReadTemperature',ReadTemperature,self.ReadTemperatureProxy)
		rospy.spin()		#blocking
	def HoldServosProxy(self,req):
		#rospy.loginfo("Holding Servos")
		self.hand.preventAllLoadErrors(req.offset_scale);
		resp = HoldServosResponse()
		resp.err = 0

		return resp
	def MoveServosProxy(self,req):
		pos = req.pos
		#rospy.loginfo("Received command: "+repr(pos))
		resp = MoveServosResponse()
		resp.err = 0
		for i in xrange(len(pos)):
			#print ("MOVE PROXXXYYYY: ref %f ", pos[i])
			if i < len(self.hand.servos):
				#rospy.loginfo("Moving motor "+repr(i)+" to "+repr(pos[i]))
				if direction[i] > 0:
					self.hand.moveMotor(i,pos[i])
				else:
					self.hand.moveMotor(i,1-pos[i])
				self.sRefs[i] = pos[i]	#store the reference value sent through ROS
			else:
				resp.err = 1
		return resp
	def TorqueServosProxy(self,req):
		torq = req.pos
		#rospy.loginfo("Received command: "+repr(pos))
		resp = MoveServosResponse()
		resp.err = 0

#		for i in xrange(len(torq)):
#			if i < len(self.hand.servos):
				#rospy.loginfo("Moving motor "+repr(i)+" to "+repr(pos[i]))
#				self.hand.torqueMotor(i,torq[0],torq[1])
		self.hand.torqueMotor(0,torq[0])

		self.hand.moveMotor(1,torq[1])
#		self.hand.torqueMotor(1,1,torq[1])
#		self.sRefs[i] = torq[i]	#store the reference value sent through ROS
#				self.sRefs[i] = torq[i]	#store the reference value sent through ROS
#			else:
#				resp.err = 1
		return resp

	def ReadServosProxy(self,req):	
		pos = [0.]*len(self.hand.servos)
		ref = self.sRefs
		enc = [0]*len(self.hand.servos)	
		for i in xrange(len(self.hand.servos)):
			sp,se = self.hand.readMotor(i)
			pos[i] = sp
			enc[i] = se	
		resp = ReadServosResponse()
		resp.pos = pos
		resp.enc = enc
		resp.ref = ref

		return resp

	def ReadCurrentProxy(self,req):
		curr = [0.]*len(self.hand.servos)
		for i in xrange(len(self.hand.servos)):
			curr[i] = self.hand.servos[i].read_current()
		resp = ReadCurrentResponse()
		resp.curr = curr

		return resp
	def ReadLoadProxy(self,req):
		load = [0.]*len(self.hand.servos)
		for i in xrange(len(self.hand.servos)):
			load[i] = self.hand.servos[i].read_load()
		resp = ReadLoadResponse()
		resp.load = load

		return resp
	def ReadTemperatureProxy(self,req):
		temp = [0.]*len(self.hand.servos)
		for i in xrange(len(self.hand.servos)):
			temp[i] = self.hand.servos[i].read_current()
		resp = ReadTemperatureResponse()
		resp.temp = temp

		return resp



if __name__=="__main__":
	Hand = None
	#initialize ros node elements: (can't read parameters until node is initialized)
	rospy.init_node("OpenHandNode")

	#query launch parameters for hand model, throw exception if invalid
	if rospy.has_param('~openhand_type'):
		model = rospy.get_param('~openhand_type')
		servo_ids = rospy.get_param('~servo_ids')
		port = rospy.get_param('~servo_port')
		series = rospy.get_param('~servo_type')
		direction = rospy.get_param('~direction')

		rospy.loginfo("Initializing "+model+" with servos "+repr(servo_ids)+", port "+port+", Dynamixel model "+series)

		if (model=='Model_T'):		#hand selection from yaml file
			if len(servo_ids)!=1:
				rospy.logerr("ERR: expecting 1 servo id, got "+len(servo_ids))
			try:
				Hand = Model_T(port,servo_ids[0],series)
			except:
				rospy.logerr("ERR: Model T failed to initialize (openhandNode.py)")
				Hand = None
		elif (model=='Model_T42' or model=='t42'):
			if len(servo_ids)!=2:
				rospy.logerr("ERR: expecting 2 servo ids, got "+repr(len(servo_ids)))
			try:
				Hand = Model_T42(port,servo_ids[0],servo_ids[1],series)
			except:
				rospy.logerr("ERR: Model T42 failed to initialize (openhandNode.py)")
				Hand = None
		elif (model=='Model_O'):
			if len(servo_ids)!=4:
				rospy.logerr("ERR: expecting 4 servo ids, got "+repr(len(servo_ids)))
			try:
				Hand = Model_O(port,servo_ids[0],servo_ids[1],servo_ids[2],servo_ids[3],series)
			except:
				rospy.logerr("ERR: Model O failed to initialize (openhandNode.py)")
				Hand = None
		elif (model=='Model_s'):
			if len(servo_ids)!=1:
				rospy.logerr("ERR: expecting 1 servo ids, got "+repr(len(servo_ids)))
			try:
				Hand = Model_s(port,servo_ids[0],series)
			except:
				rospy.logerr("ERR: Model S failed to initialize (openhandNode.py)")
				Hand = None
		elif (model=='Model_Twiddler'):
			if len(servo_ids)!=2:
				rospy.logerr("ERR: expecting 2 servo ids, got "+repr(len(servo_ids)))
			try:
				Hand = Twiddler(port,servo_ids[0],servo_ids[1],series)
			except:
				rospy.logerr("ERR: Model Twiddler failed to initialize (openhandNode.py)")
				Hand = None
	
	#start node
	if Hand is None:
		rospy.logerr("ERR: Cannot Initialize the openhand node, since the hand cannot be initialized (openhandNode.py)")	
	else:
		OpenHandNode(Hand)
