; Auto-generated. Do not edit!


(cl:in-package gripper_nodes-srv)


;//! \htmlinclude CommandTrajectory-request.msg.html

(cl:defclass <CommandTrajectory-request> (roslisp-msg-protocol:ros-message)
  ((pos
    :reader pos
    :initarg :pos
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass CommandTrajectory-request (<CommandTrajectory-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CommandTrajectory-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CommandTrajectory-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gripper_nodes-srv:<CommandTrajectory-request> is deprecated: use gripper_nodes-srv:CommandTrajectory-request instead.")))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <CommandTrajectory-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gripper_nodes-srv:pos-val is deprecated.  Use gripper_nodes-srv:pos instead.")
  (pos m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <CommandTrajectory-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gripper_nodes-srv:speed-val is deprecated.  Use gripper_nodes-srv:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CommandTrajectory-request>) ostream)
  "Serializes a message object of type '<CommandTrajectory-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'pos))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CommandTrajectory-request>) istream)
  "Deserializes a message object of type '<CommandTrajectory-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pos) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pos)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CommandTrajectory-request>)))
  "Returns string type for a service object of type '<CommandTrajectory-request>"
  "gripper_nodes/CommandTrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CommandTrajectory-request)))
  "Returns string type for a service object of type 'CommandTrajectory-request"
  "gripper_nodes/CommandTrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CommandTrajectory-request>)))
  "Returns md5sum for a message object of type '<CommandTrajectory-request>"
  "0b7d86359979bf7cfc9d521b2deb7302")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CommandTrajectory-request)))
  "Returns md5sum for a message object of type 'CommandTrajectory-request"
  "0b7d86359979bf7cfc9d521b2deb7302")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CommandTrajectory-request>)))
  "Returns full string definition for message of type '<CommandTrajectory-request>"
  (cl:format cl:nil "float64[] pos~%float64 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CommandTrajectory-request)))
  "Returns full string definition for message of type 'CommandTrajectory-request"
  (cl:format cl:nil "float64[] pos~%float64 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CommandTrajectory-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CommandTrajectory-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CommandTrajectory-request
    (cl:cons ':pos (pos msg))
    (cl:cons ':speed (speed msg))
))
;//! \htmlinclude CommandTrajectory-response.msg.html

(cl:defclass <CommandTrajectory-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass CommandTrajectory-response (<CommandTrajectory-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CommandTrajectory-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CommandTrajectory-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gripper_nodes-srv:<CommandTrajectory-response> is deprecated: use gripper_nodes-srv:CommandTrajectory-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CommandTrajectory-response>) ostream)
  "Serializes a message object of type '<CommandTrajectory-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CommandTrajectory-response>) istream)
  "Deserializes a message object of type '<CommandTrajectory-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CommandTrajectory-response>)))
  "Returns string type for a service object of type '<CommandTrajectory-response>"
  "gripper_nodes/CommandTrajectoryResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CommandTrajectory-response)))
  "Returns string type for a service object of type 'CommandTrajectory-response"
  "gripper_nodes/CommandTrajectoryResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CommandTrajectory-response>)))
  "Returns md5sum for a message object of type '<CommandTrajectory-response>"
  "0b7d86359979bf7cfc9d521b2deb7302")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CommandTrajectory-response)))
  "Returns md5sum for a message object of type 'CommandTrajectory-response"
  "0b7d86359979bf7cfc9d521b2deb7302")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CommandTrajectory-response>)))
  "Returns full string definition for message of type '<CommandTrajectory-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CommandTrajectory-response)))
  "Returns full string definition for message of type 'CommandTrajectory-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CommandTrajectory-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CommandTrajectory-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CommandTrajectory-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CommandTrajectory)))
  'CommandTrajectory-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CommandTrajectory)))
  'CommandTrajectory-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CommandTrajectory)))
  "Returns string type for a service object of type '<CommandTrajectory>"
  "gripper_nodes/CommandTrajectory")