; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude SetOrientation-request.msg.html

(cl:defclass <SetOrientation-request> (roslisp-msg-protocol:ros-message)
  ((orientation
    :reader orientation
    :initarg :orientation
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion)))
)

(cl:defclass SetOrientation-request (<SetOrientation-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetOrientation-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetOrientation-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SetOrientation-request> is deprecated: use common_msgs_gl-srv:SetOrientation-request instead.")))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <SetOrientation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:orientation-val is deprecated.  Use common_msgs_gl-srv:orientation instead.")
  (orientation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetOrientation-request>) ostream)
  "Serializes a message object of type '<SetOrientation-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'orientation) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetOrientation-request>) istream)
  "Deserializes a message object of type '<SetOrientation-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'orientation) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetOrientation-request>)))
  "Returns string type for a service object of type '<SetOrientation-request>"
  "common_msgs_gl/SetOrientationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetOrientation-request)))
  "Returns string type for a service object of type 'SetOrientation-request"
  "common_msgs_gl/SetOrientationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetOrientation-request>)))
  "Returns md5sum for a message object of type '<SetOrientation-request>"
  "8ed1de3b69473461225107f55ad59b9d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetOrientation-request)))
  "Returns md5sum for a message object of type 'SetOrientation-request"
  "8ed1de3b69473461225107f55ad59b9d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetOrientation-request>)))
  "Returns full string definition for message of type '<SetOrientation-request>"
  (cl:format cl:nil "geometry_msgs/Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetOrientation-request)))
  "Returns full string definition for message of type 'SetOrientation-request"
  (cl:format cl:nil "geometry_msgs/Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetOrientation-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'orientation))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetOrientation-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetOrientation-request
    (cl:cons ':orientation (orientation msg))
))
;//! \htmlinclude SetOrientation-response.msg.html

(cl:defclass <SetOrientation-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetOrientation-response (<SetOrientation-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetOrientation-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetOrientation-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SetOrientation-response> is deprecated: use common_msgs_gl-srv:SetOrientation-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetOrientation-response>) ostream)
  "Serializes a message object of type '<SetOrientation-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetOrientation-response>) istream)
  "Deserializes a message object of type '<SetOrientation-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetOrientation-response>)))
  "Returns string type for a service object of type '<SetOrientation-response>"
  "common_msgs_gl/SetOrientationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetOrientation-response)))
  "Returns string type for a service object of type 'SetOrientation-response"
  "common_msgs_gl/SetOrientationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetOrientation-response>)))
  "Returns md5sum for a message object of type '<SetOrientation-response>"
  "8ed1de3b69473461225107f55ad59b9d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetOrientation-response)))
  "Returns md5sum for a message object of type 'SetOrientation-response"
  "8ed1de3b69473461225107f55ad59b9d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetOrientation-response>)))
  "Returns full string definition for message of type '<SetOrientation-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetOrientation-response)))
  "Returns full string definition for message of type 'SetOrientation-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetOrientation-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetOrientation-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetOrientation-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetOrientation)))
  'SetOrientation-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetOrientation)))
  'SetOrientation-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetOrientation)))
  "Returns string type for a service object of type '<SetOrientation>"
  "common_msgs_gl/SetOrientation")