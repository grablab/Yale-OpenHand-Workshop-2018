; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude SendIntArray-request.msg.html

(cl:defclass <SendIntArray-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass SendIntArray-request (<SendIntArray-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendIntArray-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendIntArray-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendIntArray-request> is deprecated: use common_msgs_gl-srv:SendIntArray-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SendIntArray-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendIntArray-request>) ostream)
  "Serializes a message object of type '<SendIntArray-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendIntArray-request>) istream)
  "Deserializes a message object of type '<SendIntArray-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendIntArray-request>)))
  "Returns string type for a service object of type '<SendIntArray-request>"
  "common_msgs_gl/SendIntArrayRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendIntArray-request)))
  "Returns string type for a service object of type 'SendIntArray-request"
  "common_msgs_gl/SendIntArrayRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendIntArray-request>)))
  "Returns md5sum for a message object of type '<SendIntArray-request>"
  "563b27884d008b0d2adff54dc1f9e4f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendIntArray-request)))
  "Returns md5sum for a message object of type 'SendIntArray-request"
  "563b27884d008b0d2adff54dc1f9e4f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendIntArray-request>)))
  "Returns full string definition for message of type '<SendIntArray-request>"
  (cl:format cl:nil "int32[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendIntArray-request)))
  "Returns full string definition for message of type 'SendIntArray-request"
  (cl:format cl:nil "int32[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendIntArray-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendIntArray-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendIntArray-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude SendIntArray-response.msg.html

(cl:defclass <SendIntArray-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SendIntArray-response (<SendIntArray-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendIntArray-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendIntArray-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendIntArray-response> is deprecated: use common_msgs_gl-srv:SendIntArray-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendIntArray-response>) ostream)
  "Serializes a message object of type '<SendIntArray-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendIntArray-response>) istream)
  "Deserializes a message object of type '<SendIntArray-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendIntArray-response>)))
  "Returns string type for a service object of type '<SendIntArray-response>"
  "common_msgs_gl/SendIntArrayResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendIntArray-response)))
  "Returns string type for a service object of type 'SendIntArray-response"
  "common_msgs_gl/SendIntArrayResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendIntArray-response>)))
  "Returns md5sum for a message object of type '<SendIntArray-response>"
  "563b27884d008b0d2adff54dc1f9e4f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendIntArray-response)))
  "Returns md5sum for a message object of type 'SendIntArray-response"
  "563b27884d008b0d2adff54dc1f9e4f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendIntArray-response>)))
  "Returns full string definition for message of type '<SendIntArray-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendIntArray-response)))
  "Returns full string definition for message of type 'SendIntArray-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendIntArray-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendIntArray-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendIntArray-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendIntArray)))
  'SendIntArray-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendIntArray)))
  'SendIntArray-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendIntArray)))
  "Returns string type for a service object of type '<SendIntArray>"
  "common_msgs_gl/SendIntArray")