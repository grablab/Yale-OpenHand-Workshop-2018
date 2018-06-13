; Auto-generated. Do not edit!


(cl:in-package openhand-srv)


;//! \htmlinclude ReadLoad-request.msg.html

(cl:defclass <ReadLoad-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ReadLoad-request (<ReadLoad-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadLoad-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadLoad-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand-srv:<ReadLoad-request> is deprecated: use openhand-srv:ReadLoad-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadLoad-request>) ostream)
  "Serializes a message object of type '<ReadLoad-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadLoad-request>) istream)
  "Deserializes a message object of type '<ReadLoad-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadLoad-request>)))
  "Returns string type for a service object of type '<ReadLoad-request>"
  "openhand/ReadLoadRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadLoad-request)))
  "Returns string type for a service object of type 'ReadLoad-request"
  "openhand/ReadLoadRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadLoad-request>)))
  "Returns md5sum for a message object of type '<ReadLoad-request>"
  "484bc5de2725aa512e1b0578d3e540c4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadLoad-request)))
  "Returns md5sum for a message object of type 'ReadLoad-request"
  "484bc5de2725aa512e1b0578d3e540c4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadLoad-request>)))
  "Returns full string definition for message of type '<ReadLoad-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadLoad-request)))
  "Returns full string definition for message of type 'ReadLoad-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadLoad-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadLoad-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadLoad-request
))
;//! \htmlinclude ReadLoad-response.msg.html

(cl:defclass <ReadLoad-response> (roslisp-msg-protocol:ros-message)
  ((load
    :reader load
    :initarg :load
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ReadLoad-response (<ReadLoad-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadLoad-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadLoad-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand-srv:<ReadLoad-response> is deprecated: use openhand-srv:ReadLoad-response instead.")))

(cl:ensure-generic-function 'load-val :lambda-list '(m))
(cl:defmethod load-val ((m <ReadLoad-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand-srv:load-val is deprecated.  Use openhand-srv:load instead.")
  (load m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadLoad-response>) ostream)
  "Serializes a message object of type '<ReadLoad-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'load))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'load))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadLoad-response>) istream)
  "Deserializes a message object of type '<ReadLoad-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'load) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'load)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadLoad-response>)))
  "Returns string type for a service object of type '<ReadLoad-response>"
  "openhand/ReadLoadResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadLoad-response)))
  "Returns string type for a service object of type 'ReadLoad-response"
  "openhand/ReadLoadResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadLoad-response>)))
  "Returns md5sum for a message object of type '<ReadLoad-response>"
  "484bc5de2725aa512e1b0578d3e540c4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadLoad-response)))
  "Returns md5sum for a message object of type 'ReadLoad-response"
  "484bc5de2725aa512e1b0578d3e540c4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadLoad-response>)))
  "Returns full string definition for message of type '<ReadLoad-response>"
  (cl:format cl:nil "float32[] load~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadLoad-response)))
  "Returns full string definition for message of type 'ReadLoad-response"
  (cl:format cl:nil "float32[] load~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadLoad-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'load) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadLoad-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadLoad-response
    (cl:cons ':load (load msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ReadLoad)))
  'ReadLoad-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ReadLoad)))
  'ReadLoad-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadLoad)))
  "Returns string type for a service object of type '<ReadLoad>"
  "openhand/ReadLoad")