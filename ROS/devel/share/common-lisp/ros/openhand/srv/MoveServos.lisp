; Auto-generated. Do not edit!


(cl:in-package openhand-srv)


;//! \htmlinclude MoveServos-request.msg.html

(cl:defclass <MoveServos-request> (roslisp-msg-protocol:ros-message)
  ((pos
    :reader pos
    :initarg :pos
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass MoveServos-request (<MoveServos-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveServos-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveServos-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand-srv:<MoveServos-request> is deprecated: use openhand-srv:MoveServos-request instead.")))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <MoveServos-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand-srv:pos-val is deprecated.  Use openhand-srv:pos instead.")
  (pos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveServos-request>) ostream)
  "Serializes a message object of type '<MoveServos-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'pos))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveServos-request>) istream)
  "Deserializes a message object of type '<MoveServos-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pos) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pos)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveServos-request>)))
  "Returns string type for a service object of type '<MoveServos-request>"
  "openhand/MoveServosRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveServos-request)))
  "Returns string type for a service object of type 'MoveServos-request"
  "openhand/MoveServosRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveServos-request>)))
  "Returns md5sum for a message object of type '<MoveServos-request>"
  "183031e0becb89936a926d61b84a7478")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveServos-request)))
  "Returns md5sum for a message object of type 'MoveServos-request"
  "183031e0becb89936a926d61b84a7478")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveServos-request>)))
  "Returns full string definition for message of type '<MoveServos-request>"
  (cl:format cl:nil "float32[] pos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveServos-request)))
  "Returns full string definition for message of type 'MoveServos-request"
  (cl:format cl:nil "float32[] pos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveServos-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveServos-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveServos-request
    (cl:cons ':pos (pos msg))
))
;//! \htmlinclude MoveServos-response.msg.html

(cl:defclass <MoveServos-response> (roslisp-msg-protocol:ros-message)
  ((err
    :reader err
    :initarg :err
    :type cl:integer
    :initform 0))
)

(cl:defclass MoveServos-response (<MoveServos-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveServos-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveServos-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand-srv:<MoveServos-response> is deprecated: use openhand-srv:MoveServos-response instead.")))

(cl:ensure-generic-function 'err-val :lambda-list '(m))
(cl:defmethod err-val ((m <MoveServos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand-srv:err-val is deprecated.  Use openhand-srv:err instead.")
  (err m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveServos-response>) ostream)
  "Serializes a message object of type '<MoveServos-response>"
  (cl:let* ((signed (cl:slot-value msg 'err)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveServos-response>) istream)
  "Deserializes a message object of type '<MoveServos-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'err) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveServos-response>)))
  "Returns string type for a service object of type '<MoveServos-response>"
  "openhand/MoveServosResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveServos-response)))
  "Returns string type for a service object of type 'MoveServos-response"
  "openhand/MoveServosResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveServos-response>)))
  "Returns md5sum for a message object of type '<MoveServos-response>"
  "183031e0becb89936a926d61b84a7478")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveServos-response)))
  "Returns md5sum for a message object of type 'MoveServos-response"
  "183031e0becb89936a926d61b84a7478")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveServos-response>)))
  "Returns full string definition for message of type '<MoveServos-response>"
  (cl:format cl:nil "int32 err~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveServos-response)))
  "Returns full string definition for message of type 'MoveServos-response"
  (cl:format cl:nil "int32 err~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveServos-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveServos-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveServos-response
    (cl:cons ':err (err msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveServos)))
  'MoveServos-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveServos)))
  'MoveServos-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveServos)))
  "Returns string type for a service object of type '<MoveServos>"
  "openhand/MoveServos")