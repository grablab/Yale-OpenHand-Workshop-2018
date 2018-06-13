; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude SendInt-request.msg.html

(cl:defclass <SendInt-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:integer
    :initform 0))
)

(cl:defclass SendInt-request (<SendInt-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendInt-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendInt-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendInt-request> is deprecated: use common_msgs_gl-srv:SendInt-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SendInt-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendInt-request>) ostream)
  "Serializes a message object of type '<SendInt-request>"
  (cl:let* ((signed (cl:slot-value msg 'data)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendInt-request>) istream)
  "Deserializes a message object of type '<SendInt-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendInt-request>)))
  "Returns string type for a service object of type '<SendInt-request>"
  "common_msgs_gl/SendIntRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendInt-request)))
  "Returns string type for a service object of type 'SendInt-request"
  "common_msgs_gl/SendIntRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendInt-request>)))
  "Returns md5sum for a message object of type '<SendInt-request>"
  "da5909fbe378aeaf85e547e830cc1bb7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendInt-request)))
  "Returns md5sum for a message object of type 'SendInt-request"
  "da5909fbe378aeaf85e547e830cc1bb7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendInt-request>)))
  "Returns full string definition for message of type '<SendInt-request>"
  (cl:format cl:nil "int32 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendInt-request)))
  "Returns full string definition for message of type 'SendInt-request"
  (cl:format cl:nil "int32 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendInt-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendInt-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendInt-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude SendInt-response.msg.html

(cl:defclass <SendInt-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SendInt-response (<SendInt-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendInt-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendInt-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendInt-response> is deprecated: use common_msgs_gl-srv:SendInt-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendInt-response>) ostream)
  "Serializes a message object of type '<SendInt-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendInt-response>) istream)
  "Deserializes a message object of type '<SendInt-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendInt-response>)))
  "Returns string type for a service object of type '<SendInt-response>"
  "common_msgs_gl/SendIntResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendInt-response)))
  "Returns string type for a service object of type 'SendInt-response"
  "common_msgs_gl/SendIntResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendInt-response>)))
  "Returns md5sum for a message object of type '<SendInt-response>"
  "da5909fbe378aeaf85e547e830cc1bb7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendInt-response)))
  "Returns md5sum for a message object of type 'SendInt-response"
  "da5909fbe378aeaf85e547e830cc1bb7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendInt-response>)))
  "Returns full string definition for message of type '<SendInt-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendInt-response)))
  "Returns full string definition for message of type 'SendInt-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendInt-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendInt-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendInt-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendInt)))
  'SendInt-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendInt)))
  'SendInt-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendInt)))
  "Returns string type for a service object of type '<SendInt>"
  "common_msgs_gl/SendInt")