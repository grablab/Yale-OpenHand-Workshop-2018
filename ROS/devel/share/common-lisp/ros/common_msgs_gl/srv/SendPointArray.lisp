; Auto-generated. Do not edit!


(cl:in-package common_msgs_gl-srv)


;//! \htmlinclude SendPointArray-request.msg.html

(cl:defclass <SendPointArray-request> (roslisp-msg-protocol:ros-message)
  ((points
    :reader points
    :initarg :points
    :type common_msgs_gl-msg:PointArray
    :initform (cl:make-instance 'common_msgs_gl-msg:PointArray)))
)

(cl:defclass SendPointArray-request (<SendPointArray-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendPointArray-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendPointArray-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendPointArray-request> is deprecated: use common_msgs_gl-srv:SendPointArray-request instead.")))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <SendPointArray-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs_gl-srv:points-val is deprecated.  Use common_msgs_gl-srv:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendPointArray-request>) ostream)
  "Serializes a message object of type '<SendPointArray-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'points) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendPointArray-request>) istream)
  "Deserializes a message object of type '<SendPointArray-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'points) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendPointArray-request>)))
  "Returns string type for a service object of type '<SendPointArray-request>"
  "common_msgs_gl/SendPointArrayRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendPointArray-request)))
  "Returns string type for a service object of type 'SendPointArray-request"
  "common_msgs_gl/SendPointArrayRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendPointArray-request>)))
  "Returns md5sum for a message object of type '<SendPointArray-request>"
  "9dbb4bd593812628a7a52a04aefa8ecb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendPointArray-request)))
  "Returns md5sum for a message object of type 'SendPointArray-request"
  "9dbb4bd593812628a7a52a04aefa8ecb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendPointArray-request>)))
  "Returns full string definition for message of type '<SendPointArray-request>"
  (cl:format cl:nil "common_msgs_gl/PointArray points~%~%================================================================================~%MSG: common_msgs_gl/PointArray~%int32[] x~%int32[] y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendPointArray-request)))
  "Returns full string definition for message of type 'SendPointArray-request"
  (cl:format cl:nil "common_msgs_gl/PointArray points~%~%================================================================================~%MSG: common_msgs_gl/PointArray~%int32[] x~%int32[] y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendPointArray-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'points))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendPointArray-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SendPointArray-request
    (cl:cons ':points (points msg))
))
;//! \htmlinclude SendPointArray-response.msg.html

(cl:defclass <SendPointArray-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SendPointArray-response (<SendPointArray-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SendPointArray-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SendPointArray-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs_gl-srv:<SendPointArray-response> is deprecated: use common_msgs_gl-srv:SendPointArray-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SendPointArray-response>) ostream)
  "Serializes a message object of type '<SendPointArray-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SendPointArray-response>) istream)
  "Deserializes a message object of type '<SendPointArray-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SendPointArray-response>)))
  "Returns string type for a service object of type '<SendPointArray-response>"
  "common_msgs_gl/SendPointArrayResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendPointArray-response)))
  "Returns string type for a service object of type 'SendPointArray-response"
  "common_msgs_gl/SendPointArrayResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SendPointArray-response>)))
  "Returns md5sum for a message object of type '<SendPointArray-response>"
  "9dbb4bd593812628a7a52a04aefa8ecb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SendPointArray-response)))
  "Returns md5sum for a message object of type 'SendPointArray-response"
  "9dbb4bd593812628a7a52a04aefa8ecb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SendPointArray-response>)))
  "Returns full string definition for message of type '<SendPointArray-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SendPointArray-response)))
  "Returns full string definition for message of type 'SendPointArray-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SendPointArray-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SendPointArray-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SendPointArray-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SendPointArray)))
  'SendPointArray-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SendPointArray)))
  'SendPointArray-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SendPointArray)))
  "Returns string type for a service object of type '<SendPointArray>"
  "common_msgs_gl/SendPointArray")