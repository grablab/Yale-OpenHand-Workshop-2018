; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude SendDoubleArrayReceiveIntDouble-request.msg.html

(cl:defclass <SendDoubleArrayReceiveIntDouble-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SendDoubleArrayReceiveIntDouble-request (<SendDoubleArrayReceiveIntDouble-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendDoubleArrayReceiveIntDouble-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendDoubleArrayReceiveIntDouble-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendDoubleArrayReceiveIntDouble-request> is deprecated: use common_msgs_gl-srv:SendDoubleArrayReceiveIntDouble-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SendDoubleArrayReceiveIntDouble-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendDoubleArrayReceiveIntDouble-request>) ostream)
  "Serializes a message object of type '<SendDoubleArrayReceiveIntDouble-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendDoubleArrayReceiveIntDouble-request>) istream)
  "Deserializes a message object of type '<SendDoubleArrayReceiveIntDouble-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendDoubleArrayReceiveIntDouble-request>)))
  "Returns string type for a service object of type '<SendDoubleArrayReceiveIntDouble-request>"
  "common_msgs_gl/SendDoubleArrayReceiveIntDoubleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDoubleArrayReceiveIntDouble-request)))
  "Returns string type for a service object of type 'SendDoubleArrayReceiveIntDouble-request"
  "common_msgs_gl/SendDoubleArrayReceiveIntDoubleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendDoubleArrayReceiveIntDouble-request>)))
  "Returns md5sum for a message object of type '<SendDoubleArrayReceiveIntDouble-request>"
  "ca79180c13450f9faa7d51f5b725d04b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendDoubleArrayReceiveIntDouble-request)))
  "Returns md5sum for a message object of type 'SendDoubleArrayReceiveIntDouble-request"
  "ca79180c13450f9faa7d51f5b725d04b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendDoubleArrayReceiveIntDouble-request>)))
  "Returns full string definition for message of type '<SendDoubleArrayReceiveIntDouble-request>"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendDoubleArrayReceiveIntDouble-request)))
  "Returns full string definition for message of type 'SendDoubleArrayReceiveIntDouble-request"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendDoubleArrayReceiveIntDouble-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendDoubleArrayReceiveIntDouble-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendDoubleArrayReceiveIntDouble-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude SendDoubleArrayReceiveIntDouble-response.msg.html

(cl:defclass <SendDoubleArrayReceiveIntDouble-response> (roslisp-msg-protocol:ros-message)
  ((data_int
    :reader data_int
    :initarg :data_int
    :type cl:integer
    :initform 0)
   (data_double
    :reader data_double
    :initarg :data_double
    :type cl:float
    :initform 0.0))
)

(cl:defclass SendDoubleArrayReceiveIntDouble-response (<SendDoubleArrayReceiveIntDouble-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendDoubleArrayReceiveIntDouble-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendDoubleArrayReceiveIntDouble-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendDoubleArrayReceiveIntDouble-response> is deprecated: use common_msgs_gl-srv:SendDoubleArrayReceiveIntDouble-response instead.")))

(cl:ensure-generic-function 'data_int-val :lambda-list '(m))
(cl:defmethod data_int-val ((m <SendDoubleArrayReceiveIntDouble-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data_int-val is deprecated.  Use common_msgs_gl-srv:data_int instead.")
  (data_int m))

(cl:ensure-generic-function 'data_double-val :lambda-list '(m))
(cl:defmethod data_double-val ((m <SendDoubleArrayReceiveIntDouble-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data_double-val is deprecated.  Use common_msgs_gl-srv:data_double instead.")
  (data_double m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendDoubleArrayReceiveIntDouble-response>) ostream)
  "Serializes a message object of type '<SendDoubleArrayReceiveIntDouble-response>"
  (cl:let* ((signed (cl:slot-value msg 'data_int)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'data_double))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendDoubleArrayReceiveIntDouble-response>) istream)
  "Deserializes a message object of type '<SendDoubleArrayReceiveIntDouble-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data_int) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'data_double) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendDoubleArrayReceiveIntDouble-response>)))
  "Returns string type for a service object of type '<SendDoubleArrayReceiveIntDouble-response>"
  "common_msgs_gl/SendDoubleArrayReceiveIntDoubleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDoubleArrayReceiveIntDouble-response)))
  "Returns string type for a service object of type 'SendDoubleArrayReceiveIntDouble-response"
  "common_msgs_gl/SendDoubleArrayReceiveIntDoubleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendDoubleArrayReceiveIntDouble-response>)))
  "Returns md5sum for a message object of type '<SendDoubleArrayReceiveIntDouble-response>"
  "ca79180c13450f9faa7d51f5b725d04b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendDoubleArrayReceiveIntDouble-response)))
  "Returns md5sum for a message object of type 'SendDoubleArrayReceiveIntDouble-response"
  "ca79180c13450f9faa7d51f5b725d04b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendDoubleArrayReceiveIntDouble-response>)))
  "Returns full string definition for message of type '<SendDoubleArrayReceiveIntDouble-response>"
  (cl:format cl:nil "int32 data_int~%float64 data_double~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendDoubleArrayReceiveIntDouble-response)))
  "Returns full string definition for message of type 'SendDoubleArrayReceiveIntDouble-response"
  (cl:format cl:nil "int32 data_int~%float64 data_double~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendDoubleArrayReceiveIntDouble-response>))
  (cl:+ 0
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendDoubleArrayReceiveIntDouble-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendDoubleArrayReceiveIntDouble-response
    (cl:cons ':data_int (data_int msg))
    (cl:cons ':data_double (data_double msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendDoubleArrayReceiveIntDouble)))
  'SendDoubleArrayReceiveIntDouble-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendDoubleArrayReceiveIntDouble)))
  'SendDoubleArrayReceiveIntDouble-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDoubleArrayReceiveIntDouble)))
  "Returns string type for a service object of type '<SendDoubleArrayReceiveIntDouble>"
  "common_msgs_gl/SendDoubleArrayReceiveIntDouble")