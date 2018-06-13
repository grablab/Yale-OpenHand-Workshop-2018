; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude SendDoubleArrayReceiveDoubleArray-request.msg.html

(cl:defclass <SendDoubleArrayReceiveDoubleArray-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SendDoubleArrayReceiveDoubleArray-request (<SendDoubleArrayReceiveDoubleArray-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendDoubleArrayReceiveDoubleArray-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendDoubleArrayReceiveDoubleArray-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendDoubleArrayReceiveDoubleArray-request> is deprecated: use common_msgs_gl-srv:SendDoubleArrayReceiveDoubleArray-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SendDoubleArrayReceiveDoubleArray-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendDoubleArrayReceiveDoubleArray-request>) ostream)
  "Serializes a message object of type '<SendDoubleArrayReceiveDoubleArray-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendDoubleArrayReceiveDoubleArray-request>) istream)
  "Deserializes a message object of type '<SendDoubleArrayReceiveDoubleArray-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendDoubleArrayReceiveDoubleArray-request>)))
  "Returns string type for a service object of type '<SendDoubleArrayReceiveDoubleArray-request>"
  "common_msgs_gl/SendDoubleArrayReceiveDoubleArrayRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDoubleArrayReceiveDoubleArray-request)))
  "Returns string type for a service object of type 'SendDoubleArrayReceiveDoubleArray-request"
  "common_msgs_gl/SendDoubleArrayReceiveDoubleArrayRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendDoubleArrayReceiveDoubleArray-request>)))
  "Returns md5sum for a message object of type '<SendDoubleArrayReceiveDoubleArray-request>"
  "cf5053d681e2a2bc33c6323af1d83e31")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendDoubleArrayReceiveDoubleArray-request)))
  "Returns md5sum for a message object of type 'SendDoubleArrayReceiveDoubleArray-request"
  "cf5053d681e2a2bc33c6323af1d83e31")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendDoubleArrayReceiveDoubleArray-request>)))
  "Returns full string definition for message of type '<SendDoubleArrayReceiveDoubleArray-request>"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendDoubleArrayReceiveDoubleArray-request)))
  "Returns full string definition for message of type 'SendDoubleArrayReceiveDoubleArray-request"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendDoubleArrayReceiveDoubleArray-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendDoubleArrayReceiveDoubleArray-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendDoubleArrayReceiveDoubleArray-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude SendDoubleArrayReceiveDoubleArray-response.msg.html

(cl:defclass <SendDoubleArrayReceiveDoubleArray-response> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SendDoubleArrayReceiveDoubleArray-response (<SendDoubleArrayReceiveDoubleArray-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendDoubleArrayReceiveDoubleArray-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendDoubleArrayReceiveDoubleArray-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendDoubleArrayReceiveDoubleArray-response> is deprecated: use common_msgs_gl-srv:SendDoubleArrayReceiveDoubleArray-response instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SendDoubleArrayReceiveDoubleArray-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendDoubleArrayReceiveDoubleArray-response>) ostream)
  "Serializes a message object of type '<SendDoubleArrayReceiveDoubleArray-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendDoubleArrayReceiveDoubleArray-response>) istream)
  "Deserializes a message object of type '<SendDoubleArrayReceiveDoubleArray-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendDoubleArrayReceiveDoubleArray-response>)))
  "Returns string type for a service object of type '<SendDoubleArrayReceiveDoubleArray-response>"
  "common_msgs_gl/SendDoubleArrayReceiveDoubleArrayResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDoubleArrayReceiveDoubleArray-response)))
  "Returns string type for a service object of type 'SendDoubleArrayReceiveDoubleArray-response"
  "common_msgs_gl/SendDoubleArrayReceiveDoubleArrayResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendDoubleArrayReceiveDoubleArray-response>)))
  "Returns md5sum for a message object of type '<SendDoubleArrayReceiveDoubleArray-response>"
  "cf5053d681e2a2bc33c6323af1d83e31")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendDoubleArrayReceiveDoubleArray-response)))
  "Returns md5sum for a message object of type 'SendDoubleArrayReceiveDoubleArray-response"
  "cf5053d681e2a2bc33c6323af1d83e31")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendDoubleArrayReceiveDoubleArray-response>)))
  "Returns full string definition for message of type '<SendDoubleArrayReceiveDoubleArray-response>"
  (cl:format cl:nil "float64[] data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendDoubleArrayReceiveDoubleArray-response)))
  "Returns full string definition for message of type 'SendDoubleArrayReceiveDoubleArray-response"
  (cl:format cl:nil "float64[] data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendDoubleArrayReceiveDoubleArray-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendDoubleArrayReceiveDoubleArray-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendDoubleArrayReceiveDoubleArray-response
    (cl:cons ':data (data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendDoubleArrayReceiveDoubleArray)))
  'SendDoubleArrayReceiveDoubleArray-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendDoubleArrayReceiveDoubleArray)))
  'SendDoubleArrayReceiveDoubleArray-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDoubleArrayReceiveDoubleArray)))
  "Returns string type for a service object of type '<SendDoubleArrayReceiveDoubleArray>"
  "common_msgs_gl/SendDoubleArrayReceiveDoubleArray")