; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude SendString-request.msg.html

(cl:defclass <SendString-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:string
    :initform ""))
)

(cl:defclass SendString-request (<SendString-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendString-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendString-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendString-request> is deprecated: use common_msgs_gl-srv:SendString-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SendString-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendString-request>) ostream)
  "Serializes a message object of type '<SendString-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendString-request>) istream)
  "Deserializes a message object of type '<SendString-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendString-request>)))
  "Returns string type for a service object of type '<SendString-request>"
  "common_msgs_gl/SendStringRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendString-request)))
  "Returns string type for a service object of type 'SendString-request"
  "common_msgs_gl/SendStringRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendString-request>)))
  "Returns md5sum for a message object of type '<SendString-request>"
  "992ce8a1687cec8c8bd883ec73ca41d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendString-request)))
  "Returns md5sum for a message object of type 'SendString-request"
  "992ce8a1687cec8c8bd883ec73ca41d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendString-request>)))
  "Returns full string definition for message of type '<SendString-request>"
  (cl:format cl:nil "string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendString-request)))
  "Returns full string definition for message of type 'SendString-request"
  (cl:format cl:nil "string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendString-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendString-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendString-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude SendString-response.msg.html

(cl:defclass <SendString-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SendString-response (<SendString-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendString-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendString-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendString-response> is deprecated: use common_msgs_gl-srv:SendString-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendString-response>) ostream)
  "Serializes a message object of type '<SendString-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendString-response>) istream)
  "Deserializes a message object of type '<SendString-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendString-response>)))
  "Returns string type for a service object of type '<SendString-response>"
  "common_msgs_gl/SendStringResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendString-response)))
  "Returns string type for a service object of type 'SendString-response"
  "common_msgs_gl/SendStringResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendString-response>)))
  "Returns md5sum for a message object of type '<SendString-response>"
  "992ce8a1687cec8c8bd883ec73ca41d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendString-response)))
  "Returns md5sum for a message object of type 'SendString-response"
  "992ce8a1687cec8c8bd883ec73ca41d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendString-response>)))
  "Returns full string definition for message of type '<SendString-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendString-response)))
  "Returns full string definition for message of type 'SendString-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendString-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendString-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendString-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendString)))
  'SendString-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendString)))
  'SendString-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendString)))
  "Returns string type for a service object of type '<SendString>"
  "common_msgs_gl/SendString")