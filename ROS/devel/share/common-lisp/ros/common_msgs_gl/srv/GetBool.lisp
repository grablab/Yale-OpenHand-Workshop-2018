; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude GetBool-request.msg.html

(cl:defclass <GetBool-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetBool-request (<GetBool-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetBool-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetBool-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<GetBool-request> is deprecated: use common_msgs_gl-srv:GetBool-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetBool-request>) ostream)
  "Serializes a message object of type '<GetBool-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetBool-request>) istream)
  "Deserializes a message object of type '<GetBool-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetBool-request>)))
  "Returns string type for a service object of type '<GetBool-request>"
  "common_msgs_gl/GetBoolRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBool-request)))
  "Returns string type for a service object of type 'GetBool-request"
  "common_msgs_gl/GetBoolRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetBool-request>)))
  "Returns md5sum for a message object of type '<GetBool-request>"
  "8b94c1b53db61fb6aed406028ad6332a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetBool-request)))
  "Returns md5sum for a message object of type 'GetBool-request"
  "8b94c1b53db61fb6aed406028ad6332a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetBool-request>)))
  "Returns full string definition for message of type '<GetBool-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetBool-request)))
  "Returns full string definition for message of type 'GetBool-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetBool-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetBool-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetBool-request
))
;//! \htmlinclude GetBool-response.msg.html

(cl:defclass <GetBool-response> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GetBool-response (<GetBool-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetBool-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetBool-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<GetBool-response> is deprecated: use common_msgs_gl-srv:GetBool-response instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <GetBool-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetBool-response>) ostream)
  "Serializes a message object of type '<GetBool-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'data) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetBool-response>) istream)
  "Deserializes a message object of type '<GetBool-response>"
    (cl:setf (cl:slot-value msg 'data) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetBool-response>)))
  "Returns string type for a service object of type '<GetBool-response>"
  "common_msgs_gl/GetBoolResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBool-response)))
  "Returns string type for a service object of type 'GetBool-response"
  "common_msgs_gl/GetBoolResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetBool-response>)))
  "Returns md5sum for a message object of type '<GetBool-response>"
  "8b94c1b53db61fb6aed406028ad6332a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetBool-response)))
  "Returns md5sum for a message object of type 'GetBool-response"
  "8b94c1b53db61fb6aed406028ad6332a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetBool-response>)))
  "Returns full string definition for message of type '<GetBool-response>"
  (cl:format cl:nil "bool data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetBool-response)))
  "Returns full string definition for message of type 'GetBool-response"
  (cl:format cl:nil "bool data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetBool-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetBool-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetBool-response
    (cl:cons ':data (data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetBool)))
  'GetBool-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetBool)))
  'GetBool-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBool)))
  "Returns string type for a service object of type '<GetBool>"
  "common_msgs_gl/GetBool")