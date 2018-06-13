; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude SendDouble-request.msg.html

(cl:defclass <SendDouble-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:float
    :initform 0.0))
)

(cl:defclass SendDouble-request (<SendDouble-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendDouble-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendDouble-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendDouble-request> is deprecated: use common_msgs_gl-srv:SendDouble-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SendDouble-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendDouble-request>) ostream)
  "Serializes a message object of type '<SendDouble-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendDouble-request>) istream)
  "Deserializes a message object of type '<SendDouble-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendDouble-request>)))
  "Returns string type for a service object of type '<SendDouble-request>"
  "common_msgs_gl/SendDoubleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDouble-request)))
  "Returns string type for a service object of type 'SendDouble-request"
  "common_msgs_gl/SendDoubleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendDouble-request>)))
  "Returns md5sum for a message object of type '<SendDouble-request>"
  "fdb28210bfa9d7c91146260178d9a584")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendDouble-request)))
  "Returns md5sum for a message object of type 'SendDouble-request"
  "fdb28210bfa9d7c91146260178d9a584")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendDouble-request>)))
  "Returns full string definition for message of type '<SendDouble-request>"
  (cl:format cl:nil "float64 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendDouble-request)))
  "Returns full string definition for message of type 'SendDouble-request"
  (cl:format cl:nil "float64 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendDouble-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendDouble-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendDouble-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude SendDouble-response.msg.html

(cl:defclass <SendDouble-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SendDouble-response (<SendDouble-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendDouble-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendDouble-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendDouble-response> is deprecated: use common_msgs_gl-srv:SendDouble-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendDouble-response>) ostream)
  "Serializes a message object of type '<SendDouble-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendDouble-response>) istream)
  "Deserializes a message object of type '<SendDouble-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendDouble-response>)))
  "Returns string type for a service object of type '<SendDouble-response>"
  "common_msgs_gl/SendDoubleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDouble-response)))
  "Returns string type for a service object of type 'SendDouble-response"
  "common_msgs_gl/SendDoubleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendDouble-response>)))
  "Returns md5sum for a message object of type '<SendDouble-response>"
  "fdb28210bfa9d7c91146260178d9a584")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendDouble-response)))
  "Returns md5sum for a message object of type 'SendDouble-response"
  "fdb28210bfa9d7c91146260178d9a584")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendDouble-response>)))
  "Returns full string definition for message of type '<SendDouble-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendDouble-response)))
  "Returns full string definition for message of type 'SendDouble-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendDouble-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendDouble-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendDouble-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendDouble)))
  'SendDouble-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendDouble)))
  'SendDouble-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendDouble)))
  "Returns string type for a service object of type '<SendDouble>"
  "common_msgs_gl/SendDouble")