; Auto-generated. Do not edit!


(cl:in-package openhand-srv)


;//! \htmlinclude ReadServos-request.msg.html

(cl:defclass <ReadServos-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ReadServos-request (<ReadServos-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadServos-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadServos-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand-srv:<ReadServos-request> is deprecated: use openhand-srv:ReadServos-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadServos-request>) ostream)
  "Serializes a message object of type '<ReadServos-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadServos-request>) istream)
  "Deserializes a message object of type '<ReadServos-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadServos-request>)))
  "Returns string type for a service object of type '<ReadServos-request>"
  "openhand/ReadServosRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadServos-request)))
  "Returns string type for a service object of type 'ReadServos-request"
  "openhand/ReadServosRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadServos-request>)))
  "Returns md5sum for a message object of type '<ReadServos-request>"
  "662e32bfc46f37715bb1455cf7d299a9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadServos-request)))
  "Returns md5sum for a message object of type 'ReadServos-request"
  "662e32bfc46f37715bb1455cf7d299a9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadServos-request>)))
  "Returns full string definition for message of type '<ReadServos-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadServos-request)))
  "Returns full string definition for message of type 'ReadServos-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadServos-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadServos-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadServos-request
))
;//! \htmlinclude ReadServos-response.msg.html

(cl:defclass <ReadServos-response> (roslisp-msg-protocol:ros-message)
  ((pos
    :reader pos
    :initarg :pos
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (enc
    :reader enc
    :initarg :enc
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (ref
    :reader ref
    :initarg :ref
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ReadServos-response (<ReadServos-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadServos-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadServos-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand-srv:<ReadServos-response> is deprecated: use openhand-srv:ReadServos-response instead.")))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <ReadServos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand-srv:pos-val is deprecated.  Use openhand-srv:pos instead.")
  (pos m))

(cl:ensure-generic-function 'enc-val :lambda-list '(m))
(cl:defmethod enc-val ((m <ReadServos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand-srv:enc-val is deprecated.  Use openhand-srv:enc instead.")
  (enc m))

(cl:ensure-generic-function 'ref-val :lambda-list '(m))
(cl:defmethod ref-val ((m <ReadServos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand-srv:ref-val is deprecated.  Use openhand-srv:ref instead.")
  (ref m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadServos-response>) ostream)
  "Serializes a message object of type '<ReadServos-response>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'enc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'enc))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ref))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'ref))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadServos-response>) istream)
  "Deserializes a message object of type '<ReadServos-response>"
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'enc) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'enc)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ref) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ref)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadServos-response>)))
  "Returns string type for a service object of type '<ReadServos-response>"
  "openhand/ReadServosResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadServos-response)))
  "Returns string type for a service object of type 'ReadServos-response"
  "openhand/ReadServosResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadServos-response>)))
  "Returns md5sum for a message object of type '<ReadServos-response>"
  "662e32bfc46f37715bb1455cf7d299a9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadServos-response)))
  "Returns md5sum for a message object of type 'ReadServos-response"
  "662e32bfc46f37715bb1455cf7d299a9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadServos-response>)))
  "Returns full string definition for message of type '<ReadServos-response>"
  (cl:format cl:nil "float32[] pos~%int32[] enc~%float32[] ref~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadServos-response)))
  "Returns full string definition for message of type 'ReadServos-response"
  (cl:format cl:nil "float32[] pos~%int32[] enc~%float32[] ref~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadServos-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'enc) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ref) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadServos-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadServos-response
    (cl:cons ':pos (pos msg))
    (cl:cons ':enc (enc msg))
    (cl:cons ':ref (ref msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ReadServos)))
  'ReadServos-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ReadServos)))
  'ReadServos-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadServos)))
  "Returns string type for a service object of type '<ReadServos>"
  "openhand/ReadServos")