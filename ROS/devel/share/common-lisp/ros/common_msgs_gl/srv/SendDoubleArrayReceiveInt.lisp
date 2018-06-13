; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude SendDoubleArrayReceiveInt-request.msg.html

(cl:defclass <SendDoubleArrayReceiveInt-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SendDoubleArrayReceiveInt-request (<SendDoubleArrayReceiveInt-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendDoubleArrayReceiveInt-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendDoubleArrayReceiveInt-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendDoubleArrayReceiveInt-request> is deprecated: use common_msgs_gl-srv:SendDoubleArrayReceiveInt-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SendDoubleArrayReceiveInt-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendDoubleArrayReceiveInt-request>) ostream)
  "Serializes a message object of type '<SendDoubleArrayReceiveInt-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
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
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendDoubleArrayReceiveInt-request>) istream)
  "Deserializes a message object of type '<SendDoubleArrayReceiveInt-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendDoubleArrayReceiveInt-request>)))
  "Returns string type for a service object of type '<SendDoubleArrayReceiveInt-request>"
  "common_msgs_gl/SendDoubleArrayReceiveIntRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDoubleArrayReceiveInt-request)))
  "Returns string type for a service object of type 'SendDoubleArrayReceiveInt-request"
  "common_msgs_gl/SendDoubleArrayReceiveIntRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendDoubleArrayReceiveInt-request>)))
  "Returns md5sum for a message object of type '<SendDoubleArrayReceiveInt-request>"
  "e192e1ed09b2c0baf14ccafbc9c08e6c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendDoubleArrayReceiveInt-request)))
  "Returns md5sum for a message object of type 'SendDoubleArrayReceiveInt-request"
  "e192e1ed09b2c0baf14ccafbc9c08e6c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendDoubleArrayReceiveInt-request>)))
  "Returns full string definition for message of type '<SendDoubleArrayReceiveInt-request>"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendDoubleArrayReceiveInt-request)))
  "Returns full string definition for message of type 'SendDoubleArrayReceiveInt-request"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendDoubleArrayReceiveInt-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendDoubleArrayReceiveInt-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendDoubleArrayReceiveInt-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude SendDoubleArrayReceiveInt-response.msg.html

(cl:defclass <SendDoubleArrayReceiveInt-response> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:integer
    :initform 0))
)

(cl:defclass SendDoubleArrayReceiveInt-response (<SendDoubleArrayReceiveInt-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendDoubleArrayReceiveInt-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendDoubleArrayReceiveInt-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendDoubleArrayReceiveInt-response> is deprecated: use common_msgs_gl-srv:SendDoubleArrayReceiveInt-response instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SendDoubleArrayReceiveInt-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendDoubleArrayReceiveInt-response>) ostream)
  "Serializes a message object of type '<SendDoubleArrayReceiveInt-response>"
  (cl:let* ((signed (cl:slot-value msg 'data)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendDoubleArrayReceiveInt-response>) istream)
  "Deserializes a message object of type '<SendDoubleArrayReceiveInt-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendDoubleArrayReceiveInt-response>)))
  "Returns string type for a service object of type '<SendDoubleArrayReceiveInt-response>"
  "common_msgs_gl/SendDoubleArrayReceiveIntResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDoubleArrayReceiveInt-response)))
  "Returns string type for a service object of type 'SendDoubleArrayReceiveInt-response"
  "common_msgs_gl/SendDoubleArrayReceiveIntResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendDoubleArrayReceiveInt-response>)))
  "Returns md5sum for a message object of type '<SendDoubleArrayReceiveInt-response>"
  "e192e1ed09b2c0baf14ccafbc9c08e6c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendDoubleArrayReceiveInt-response)))
  "Returns md5sum for a message object of type 'SendDoubleArrayReceiveInt-response"
  "e192e1ed09b2c0baf14ccafbc9c08e6c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendDoubleArrayReceiveInt-response>)))
  "Returns full string definition for message of type '<SendDoubleArrayReceiveInt-response>"
  (cl:format cl:nil "int32 data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendDoubleArrayReceiveInt-response)))
  "Returns full string definition for message of type 'SendDoubleArrayReceiveInt-response"
  (cl:format cl:nil "int32 data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendDoubleArrayReceiveInt-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendDoubleArrayReceiveInt-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendDoubleArrayReceiveInt-response
    (cl:cons ':data (data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendDoubleArrayReceiveInt)))
  'SendDoubleArrayReceiveInt-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendDoubleArrayReceiveInt)))
  'SendDoubleArrayReceiveInt-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDoubleArrayReceiveInt)))
  "Returns string type for a service object of type '<SendDoubleArrayReceiveInt>"
  "common_msgs_gl/SendDoubleArrayReceiveInt")