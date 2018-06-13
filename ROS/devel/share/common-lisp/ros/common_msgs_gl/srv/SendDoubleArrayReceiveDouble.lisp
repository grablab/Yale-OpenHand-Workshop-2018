; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude SendDoubleArrayReceiveDouble-request.msg.html

(cl:defclass <SendDoubleArrayReceiveDouble-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SendDoubleArrayReceiveDouble-request (<SendDoubleArrayReceiveDouble-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendDoubleArrayReceiveDouble-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendDoubleArrayReceiveDouble-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendDoubleArrayReceiveDouble-request> is deprecated: use common_msgs_gl-srv:SendDoubleArrayReceiveDouble-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SendDoubleArrayReceiveDouble-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendDoubleArrayReceiveDouble-request>) ostream)
  "Serializes a message object of type '<SendDoubleArrayReceiveDouble-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendDoubleArrayReceiveDouble-request>) istream)
  "Deserializes a message object of type '<SendDoubleArrayReceiveDouble-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendDoubleArrayReceiveDouble-request>)))
  "Returns string type for a service object of type '<SendDoubleArrayReceiveDouble-request>"
  "common_msgs_gl/SendDoubleArrayReceiveDoubleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDoubleArrayReceiveDouble-request)))
  "Returns string type for a service object of type 'SendDoubleArrayReceiveDouble-request"
  "common_msgs_gl/SendDoubleArrayReceiveDoubleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendDoubleArrayReceiveDouble-request>)))
  "Returns md5sum for a message object of type '<SendDoubleArrayReceiveDouble-request>"
  "b748ef2ada544bd1cd84f38aa7adb516")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendDoubleArrayReceiveDouble-request)))
  "Returns md5sum for a message object of type 'SendDoubleArrayReceiveDouble-request"
  "b748ef2ada544bd1cd84f38aa7adb516")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendDoubleArrayReceiveDouble-request>)))
  "Returns full string definition for message of type '<SendDoubleArrayReceiveDouble-request>"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendDoubleArrayReceiveDouble-request)))
  "Returns full string definition for message of type 'SendDoubleArrayReceiveDouble-request"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendDoubleArrayReceiveDouble-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendDoubleArrayReceiveDouble-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendDoubleArrayReceiveDouble-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude SendDoubleArrayReceiveDouble-response.msg.html

(cl:defclass <SendDoubleArrayReceiveDouble-response> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:float
    :initform 0.0))
)

(cl:defclass SendDoubleArrayReceiveDouble-response (<SendDoubleArrayReceiveDouble-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendDoubleArrayReceiveDouble-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendDoubleArrayReceiveDouble-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendDoubleArrayReceiveDouble-response> is deprecated: use common_msgs_gl-srv:SendDoubleArrayReceiveDouble-response instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SendDoubleArrayReceiveDouble-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendDoubleArrayReceiveDouble-response>) ostream)
  "Serializes a message object of type '<SendDoubleArrayReceiveDouble-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendDoubleArrayReceiveDouble-response>) istream)
  "Deserializes a message object of type '<SendDoubleArrayReceiveDouble-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'data) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendDoubleArrayReceiveDouble-response>)))
  "Returns string type for a service object of type '<SendDoubleArrayReceiveDouble-response>"
  "common_msgs_gl/SendDoubleArrayReceiveDoubleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDoubleArrayReceiveDouble-response)))
  "Returns string type for a service object of type 'SendDoubleArrayReceiveDouble-response"
  "common_msgs_gl/SendDoubleArrayReceiveDoubleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendDoubleArrayReceiveDouble-response>)))
  "Returns md5sum for a message object of type '<SendDoubleArrayReceiveDouble-response>"
  "b748ef2ada544bd1cd84f38aa7adb516")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendDoubleArrayReceiveDouble-response)))
  "Returns md5sum for a message object of type 'SendDoubleArrayReceiveDouble-response"
  "b748ef2ada544bd1cd84f38aa7adb516")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendDoubleArrayReceiveDouble-response>)))
  "Returns full string definition for message of type '<SendDoubleArrayReceiveDouble-response>"
  (cl:format cl:nil "float64 data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendDoubleArrayReceiveDouble-response)))
  "Returns full string definition for message of type 'SendDoubleArrayReceiveDouble-response"
  (cl:format cl:nil "float64 data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendDoubleArrayReceiveDouble-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendDoubleArrayReceiveDouble-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendDoubleArrayReceiveDouble-response
    (cl:cons ':data (data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendDoubleArrayReceiveDouble)))
  'SendDoubleArrayReceiveDouble-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendDoubleArrayReceiveDouble)))
  'SendDoubleArrayReceiveDouble-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDoubleArrayReceiveDouble)))
  "Returns string type for a service object of type '<SendDoubleArrayReceiveDouble>"
  "common_msgs_gl/SendDoubleArrayReceiveDouble")