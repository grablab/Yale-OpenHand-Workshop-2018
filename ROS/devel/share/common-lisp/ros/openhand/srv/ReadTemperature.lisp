; Auto-generated. Do not edit!


(cl:in-package openhand-srv)


;//! \htmlinclude ReadTemperature-request.msg.html

(cl:defclass <ReadTemperature-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ReadTemperature-request (<ReadTemperature-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadTemperature-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadTemperature-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand-srv:<ReadTemperature-request> is deprecated: use openhand-srv:ReadTemperature-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadTemperature-request>) ostream)
  "Serializes a message object of type '<ReadTemperature-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadTemperature-request>) istream)
  "Deserializes a message object of type '<ReadTemperature-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadTemperature-request>)))
  "Returns string type for a service object of type '<ReadTemperature-request>"
  "openhand/ReadTemperatureRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadTemperature-request)))
  "Returns string type for a service object of type 'ReadTemperature-request"
  "openhand/ReadTemperatureRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadTemperature-request>)))
  "Returns md5sum for a message object of type '<ReadTemperature-request>"
  "52444e69c3eaa80dd939a5bad6dbe319")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadTemperature-request)))
  "Returns md5sum for a message object of type 'ReadTemperature-request"
  "52444e69c3eaa80dd939a5bad6dbe319")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadTemperature-request>)))
  "Returns full string definition for message of type '<ReadTemperature-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadTemperature-request)))
  "Returns full string definition for message of type 'ReadTemperature-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadTemperature-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadTemperature-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadTemperature-request
))
;//! \htmlinclude ReadTemperature-response.msg.html

(cl:defclass <ReadTemperature-response> (roslisp-msg-protocol:ros-message)
  ((temp
    :reader temp
    :initarg :temp
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ReadTemperature-response (<ReadTemperature-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadTemperature-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadTemperature-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand-srv:<ReadTemperature-response> is deprecated: use openhand-srv:ReadTemperature-response instead.")))

(cl:ensure-generic-function 'temp-val :lambda-list '(m))
(cl:defmethod temp-val ((m <ReadTemperature-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand-srv:temp-val is deprecated.  Use openhand-srv:temp instead.")
  (temp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadTemperature-response>) ostream)
  "Serializes a message object of type '<ReadTemperature-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'temp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'temp))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadTemperature-response>) istream)
  "Deserializes a message object of type '<ReadTemperature-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'temp) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'temp)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadTemperature-response>)))
  "Returns string type for a service object of type '<ReadTemperature-response>"
  "openhand/ReadTemperatureResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadTemperature-response)))
  "Returns string type for a service object of type 'ReadTemperature-response"
  "openhand/ReadTemperatureResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadTemperature-response>)))
  "Returns md5sum for a message object of type '<ReadTemperature-response>"
  "52444e69c3eaa80dd939a5bad6dbe319")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadTemperature-response)))
  "Returns md5sum for a message object of type 'ReadTemperature-response"
  "52444e69c3eaa80dd939a5bad6dbe319")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadTemperature-response>)))
  "Returns full string definition for message of type '<ReadTemperature-response>"
  (cl:format cl:nil "float32[] temp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadTemperature-response)))
  "Returns full string definition for message of type 'ReadTemperature-response"
  (cl:format cl:nil "float32[] temp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadTemperature-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'temp) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadTemperature-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadTemperature-response
    (cl:cons ':temp (temp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ReadTemperature)))
  'ReadTemperature-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ReadTemperature)))
  'ReadTemperature-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadTemperature)))
  "Returns string type for a service object of type '<ReadTemperature>"
  "openhand/ReadTemperature")