; Auto-generated. Do not edit!


(cl:in-package openhand-srv)


;//! \htmlinclude ReadCurrent-request.msg.html

(cl:defclass <ReadCurrent-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ReadCurrent-request (<ReadCurrent-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadCurrent-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadCurrent-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand-srv:<ReadCurrent-request> is deprecated: use openhand-srv:ReadCurrent-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadCurrent-request>) ostream)
  "Serializes a message object of type '<ReadCurrent-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadCurrent-request>) istream)
  "Deserializes a message object of type '<ReadCurrent-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadCurrent-request>)))
  "Returns string type for a service object of type '<ReadCurrent-request>"
  "openhand/ReadCurrentRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadCurrent-request)))
  "Returns string type for a service object of type 'ReadCurrent-request"
  "openhand/ReadCurrentRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadCurrent-request>)))
  "Returns md5sum for a message object of type '<ReadCurrent-request>"
  "640c8d4d28b8ccb823cd749d0957df5a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadCurrent-request)))
  "Returns md5sum for a message object of type 'ReadCurrent-request"
  "640c8d4d28b8ccb823cd749d0957df5a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadCurrent-request>)))
  "Returns full string definition for message of type '<ReadCurrent-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadCurrent-request)))
  "Returns full string definition for message of type 'ReadCurrent-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadCurrent-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadCurrent-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadCurrent-request
))
;//! \htmlinclude ReadCurrent-response.msg.html

(cl:defclass <ReadCurrent-response> (roslisp-msg-protocol:ros-message)
  ((curr
    :reader curr
    :initarg :curr
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ReadCurrent-response (<ReadCurrent-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadCurrent-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadCurrent-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand-srv:<ReadCurrent-response> is deprecated: use openhand-srv:ReadCurrent-response instead.")))

(cl:ensure-generic-function 'curr-val :lambda-list '(m))
(cl:defmethod curr-val ((m <ReadCurrent-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand-srv:curr-val is deprecated.  Use openhand-srv:curr instead.")
  (curr m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadCurrent-response>) ostream)
  "Serializes a message object of type '<ReadCurrent-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'curr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'curr))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadCurrent-response>) istream)
  "Deserializes a message object of type '<ReadCurrent-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'curr) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'curr)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadCurrent-response>)))
  "Returns string type for a service object of type '<ReadCurrent-response>"
  "openhand/ReadCurrentResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadCurrent-response)))
  "Returns string type for a service object of type 'ReadCurrent-response"
  "openhand/ReadCurrentResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadCurrent-response>)))
  "Returns md5sum for a message object of type '<ReadCurrent-response>"
  "640c8d4d28b8ccb823cd749d0957df5a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadCurrent-response)))
  "Returns md5sum for a message object of type 'ReadCurrent-response"
  "640c8d4d28b8ccb823cd749d0957df5a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadCurrent-response>)))
  "Returns full string definition for message of type '<ReadCurrent-response>"
  (cl:format cl:nil "float32[] curr~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadCurrent-response)))
  "Returns full string definition for message of type 'ReadCurrent-response"
  (cl:format cl:nil "float32[] curr~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadCurrent-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'curr) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadCurrent-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadCurrent-response
    (cl:cons ':curr (curr msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ReadCurrent)))
  'ReadCurrent-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ReadCurrent)))
  'ReadCurrent-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadCurrent)))
  "Returns string type for a service object of type '<ReadCurrent>"
  "openhand/ReadCurrent")