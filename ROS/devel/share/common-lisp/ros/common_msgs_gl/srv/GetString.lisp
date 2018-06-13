; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude GetString-request.msg.html

(cl:defclass <GetString-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetString-request (<GetString-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetString-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetString-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<GetString-request> is deprecated: use common_msgs_gl-srv:GetString-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetString-request>) ostream)
  "Serializes a message object of type '<GetString-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetString-request>) istream)
  "Deserializes a message object of type '<GetString-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetString-request>)))
  "Returns string type for a service object of type '<GetString-request>"
  "common_msgs_gl/GetStringRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetString-request)))
  "Returns string type for a service object of type 'GetString-request"
  "common_msgs_gl/GetStringRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetString-request>)))
  "Returns md5sum for a message object of type '<GetString-request>"
  "992ce8a1687cec8c8bd883ec73ca41d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetString-request)))
  "Returns md5sum for a message object of type 'GetString-request"
  "992ce8a1687cec8c8bd883ec73ca41d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetString-request>)))
  "Returns full string definition for message of type '<GetString-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetString-request)))
  "Returns full string definition for message of type 'GetString-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetString-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetString-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetString-request
))
;//! \htmlinclude GetString-response.msg.html

(cl:defclass <GetString-response> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:string
    :initform ""))
)

(cl:defclass GetString-response (<GetString-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetString-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetString-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<GetString-response> is deprecated: use common_msgs_gl-srv:GetString-response instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <GetString-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetString-response>) ostream)
  "Serializes a message object of type '<GetString-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetString-response>) istream)
  "Deserializes a message object of type '<GetString-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetString-response>)))
  "Returns string type for a service object of type '<GetString-response>"
  "common_msgs_gl/GetStringResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetString-response)))
  "Returns string type for a service object of type 'GetString-response"
  "common_msgs_gl/GetStringResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetString-response>)))
  "Returns md5sum for a message object of type '<GetString-response>"
  "992ce8a1687cec8c8bd883ec73ca41d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetString-response)))
  "Returns md5sum for a message object of type 'GetString-response"
  "992ce8a1687cec8c8bd883ec73ca41d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetString-response>)))
  "Returns full string definition for message of type '<GetString-response>"
  (cl:format cl:nil "string data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetString-response)))
  "Returns full string definition for message of type 'GetString-response"
  (cl:format cl:nil "string data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetString-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetString-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetString-response
    (cl:cons ':data (data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetString)))
  'GetString-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetString)))
  'GetString-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetString)))
  "Returns string type for a service object of type '<GetString>"
  "common_msgs_gl/GetString")