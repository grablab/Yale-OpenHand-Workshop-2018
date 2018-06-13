; Auto-generated. Do not edit!


(cl:in-package openhand-srv)


;//! \htmlinclude HoldServos-request.msg.html

(cl:defclass <HoldServos-request> (roslisp-msg-protocol:ros-message)
  ((offset_scale
    :reader offset_scale
    :initarg :offset_scale
    :type cl:integer
    :initform 0))
)

(cl:defclass HoldServos-request (<HoldServos-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HoldServos-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HoldServos-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand-srv:<HoldServos-request> is deprecated: use openhand-srv:HoldServos-request instead.")))

(cl:ensure-generic-function 'offset_scale-val :lambda-list '(m))
(cl:defmethod offset_scale-val ((m <HoldServos-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand-srv:offset_scale-val is deprecated.  Use openhand-srv:offset_scale instead.")
  (offset_scale m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HoldServos-request>) ostream)
  "Serializes a message object of type '<HoldServos-request>"
  (cl:let* ((signed (cl:slot-value msg 'offset_scale)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HoldServos-request>) istream)
  "Deserializes a message object of type '<HoldServos-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'offset_scale) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HoldServos-request>)))
  "Returns string type for a service object of type '<HoldServos-request>"
  "openhand/HoldServosRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HoldServos-request)))
  "Returns string type for a service object of type 'HoldServos-request"
  "openhand/HoldServosRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HoldServos-request>)))
  "Returns md5sum for a message object of type '<HoldServos-request>"
  "9012ec588f6488638f420162efc2fcb2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HoldServos-request)))
  "Returns md5sum for a message object of type 'HoldServos-request"
  "9012ec588f6488638f420162efc2fcb2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HoldServos-request>)))
  "Returns full string definition for message of type '<HoldServos-request>"
  (cl:format cl:nil "int32 offset_scale~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HoldServos-request)))
  "Returns full string definition for message of type 'HoldServos-request"
  (cl:format cl:nil "int32 offset_scale~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HoldServos-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HoldServos-request>))
  "Converts a ROS message object to a list"
  (cl:list 'HoldServos-request
    (cl:cons ':offset_scale (offset_scale msg))
))
;//! \htmlinclude HoldServos-response.msg.html

(cl:defclass <HoldServos-response> (roslisp-msg-protocol:ros-message)
  ((err
    :reader err
    :initarg :err
    :type cl:integer
    :initform 0))
)

(cl:defclass HoldServos-response (<HoldServos-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HoldServos-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HoldServos-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand-srv:<HoldServos-response> is deprecated: use openhand-srv:HoldServos-response instead.")))

(cl:ensure-generic-function 'err-val :lambda-list '(m))
(cl:defmethod err-val ((m <HoldServos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand-srv:err-val is deprecated.  Use openhand-srv:err instead.")
  (err m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HoldServos-response>) ostream)
  "Serializes a message object of type '<HoldServos-response>"
  (cl:let* ((signed (cl:slot-value msg 'err)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HoldServos-response>) istream)
  "Deserializes a message object of type '<HoldServos-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'err) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HoldServos-response>)))
  "Returns string type for a service object of type '<HoldServos-response>"
  "openhand/HoldServosResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HoldServos-response)))
  "Returns string type for a service object of type 'HoldServos-response"
  "openhand/HoldServosResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HoldServos-response>)))
  "Returns md5sum for a message object of type '<HoldServos-response>"
  "9012ec588f6488638f420162efc2fcb2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HoldServos-response)))
  "Returns md5sum for a message object of type 'HoldServos-response"
  "9012ec588f6488638f420162efc2fcb2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HoldServos-response>)))
  "Returns full string definition for message of type '<HoldServos-response>"
  (cl:format cl:nil "int32 err~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HoldServos-response)))
  "Returns full string definition for message of type 'HoldServos-response"
  (cl:format cl:nil "int32 err~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HoldServos-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HoldServos-response>))
  "Converts a ROS message object to a list"
  (cl:list 'HoldServos-response
    (cl:cons ':err (err msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'HoldServos)))
  'HoldServos-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'HoldServos)))
  'HoldServos-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HoldServos)))
  "Returns string type for a service object of type '<HoldServos>"
  "openhand/HoldServos")