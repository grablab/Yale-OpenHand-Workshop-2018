; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude GetBoolArray-request.msg.html

(cl:defclass <GetBoolArray-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetBoolArray-request (<GetBoolArray-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetBoolArray-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetBoolArray-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<GetBoolArray-request> is deprecated: use common_msgs_gl-srv:GetBoolArray-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetBoolArray-request>) ostream)
  "Serializes a message object of type '<GetBoolArray-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetBoolArray-request>) istream)
  "Deserializes a message object of type '<GetBoolArray-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetBoolArray-request>)))
  "Returns string type for a service object of type '<GetBoolArray-request>"
  "common_msgs_gl/GetBoolArrayRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBoolArray-request)))
  "Returns string type for a service object of type 'GetBoolArray-request"
  "common_msgs_gl/GetBoolArrayRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetBoolArray-request>)))
  "Returns md5sum for a message object of type '<GetBoolArray-request>"
  "403a16d9294b908e45c67a6f3c3a5b27")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetBoolArray-request)))
  "Returns md5sum for a message object of type 'GetBoolArray-request"
  "403a16d9294b908e45c67a6f3c3a5b27")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetBoolArray-request>)))
  "Returns full string definition for message of type '<GetBoolArray-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetBoolArray-request)))
  "Returns full string definition for message of type 'GetBoolArray-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetBoolArray-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetBoolArray-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetBoolArray-request
))
;//! \htmlinclude GetBoolArray-response.msg.html

(cl:defclass <GetBoolArray-response> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass GetBoolArray-response (<GetBoolArray-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetBoolArray-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetBoolArray-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<GetBoolArray-response> is deprecated: use common_msgs_gl-srv:GetBoolArray-response instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <GetBoolArray-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:data-val is deprecated.  Use common_msgs_gl-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetBoolArray-response>) ostream)
  "Serializes a message object of type '<GetBoolArray-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetBoolArray-response>) istream)
  "Deserializes a message object of type '<GetBoolArray-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetBoolArray-response>)))
  "Returns string type for a service object of type '<GetBoolArray-response>"
  "common_msgs_gl/GetBoolArrayResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBoolArray-response)))
  "Returns string type for a service object of type 'GetBoolArray-response"
  "common_msgs_gl/GetBoolArrayResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetBoolArray-response>)))
  "Returns md5sum for a message object of type '<GetBoolArray-response>"
  "403a16d9294b908e45c67a6f3c3a5b27")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetBoolArray-response)))
  "Returns md5sum for a message object of type 'GetBoolArray-response"
  "403a16d9294b908e45c67a6f3c3a5b27")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetBoolArray-response>)))
  "Returns full string definition for message of type '<GetBoolArray-response>"
  (cl:format cl:nil "bool[] data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetBoolArray-response)))
  "Returns full string definition for message of type 'GetBoolArray-response"
  (cl:format cl:nil "bool[] data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetBoolArray-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetBoolArray-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetBoolArray-response
    (cl:cons ':data (data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetBoolArray)))
  'GetBoolArray-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetBoolArray)))
  'GetBoolArray-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBoolArray)))
  "Returns string type for a service object of type '<GetBoolArray>"
  "common_msgs_gl/GetBoolArray")