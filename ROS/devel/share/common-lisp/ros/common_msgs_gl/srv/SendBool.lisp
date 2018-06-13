; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude SendBool-request.msg.html

(cl:defclass <SendBool-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SendBool-request (<SendBool-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendBool-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendBool-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendBool-request> is deprecated: use common_msgs_gl-srv:SendBool-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SendBool-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendBool-request>) ostream)
  "Serializes a message object of type '<SendBool-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'data) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendBool-request>) istream)
  "Deserializes a message object of type '<SendBool-request>"
    (cl:setf (cl:slot-value msg 'data) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendBool-request>)))
  "Returns string type for a service object of type '<SendBool-request>"
  "common_msgs_gl/SendBoolRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendBool-request)))
  "Returns string type for a service object of type 'SendBool-request"
  "common_msgs_gl/SendBoolRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendBool-request>)))
  "Returns md5sum for a message object of type '<SendBool-request>"
  "8b94c1b53db61fb6aed406028ad6332a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendBool-request)))
  "Returns md5sum for a message object of type 'SendBool-request"
  "8b94c1b53db61fb6aed406028ad6332a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendBool-request>)))
  "Returns full string definition for message of type '<SendBool-request>"
  (cl:format cl:nil "bool data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendBool-request)))
  "Returns full string definition for message of type 'SendBool-request"
  (cl:format cl:nil "bool data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendBool-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendBool-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendBool-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude SendBool-response.msg.html

(cl:defclass <SendBool-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SendBool-response (<SendBool-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendBool-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendBool-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendBool-response> is deprecated: use common_msgs_gl-srv:SendBool-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendBool-response>) ostream)
  "Serializes a message object of type '<SendBool-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendBool-response>) istream)
  "Deserializes a message object of type '<SendBool-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendBool-response>)))
  "Returns string type for a service object of type '<SendBool-response>"
  "common_msgs_gl/SendBoolResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendBool-response)))
  "Returns string type for a service object of type 'SendBool-response"
  "common_msgs_gl/SendBoolResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendBool-response>)))
  "Returns md5sum for a message object of type '<SendBool-response>"
  "8b94c1b53db61fb6aed406028ad6332a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendBool-response)))
  "Returns md5sum for a message object of type 'SendBool-response"
  "8b94c1b53db61fb6aed406028ad6332a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendBool-response>)))
  "Returns full string definition for message of type '<SendBool-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendBool-response)))
  "Returns full string definition for message of type 'SendBool-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendBool-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendBool-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendBool-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendBool)))
  'SendBool-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendBool)))
  'SendBool-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendBool)))
  "Returns string type for a service object of type '<SendBool>"
  "common_msgs_gl/SendBool")