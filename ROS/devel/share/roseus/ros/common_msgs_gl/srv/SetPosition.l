;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SetPosition)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SetPosition (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SETPOSITION")
  (make-package "COMMON_MSGS_GL::SETPOSITION"))
(unless (find-package "COMMON_MSGS_GL::SETPOSITIONREQUEST")
  (make-package "COMMON_MSGS_GL::SETPOSITIONREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SETPOSITIONRESPONSE")
  (make-package "COMMON_MSGS_GL::SETPOSITIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass common_msgs_gl::SetPositionRequest
  :super ros::object
  :slots (_position ))

(defmethod common_msgs_gl::SetPositionRequest
  (:init
   (&key
    ((:position __position) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _position __position)
   self)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;;
   self)
  )

(defclass common_msgs_gl::SetPositionResponse
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::SetPositionResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass common_msgs_gl::SetPosition
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SetPosition :md5sum-) "e7bb0ef028c744b081acdc57743b11d8")
(setf (get common_msgs_gl::SetPosition :datatype-) "common_msgs_gl/SetPosition")
(setf (get common_msgs_gl::SetPosition :request) common_msgs_gl::SetPositionRequest)
(setf (get common_msgs_gl::SetPosition :response) common_msgs_gl::SetPositionResponse)

(defmethod common_msgs_gl::SetPositionRequest
  (:response () (instance common_msgs_gl::SetPositionResponse :init)))

(setf (get common_msgs_gl::SetPositionRequest :md5sum-) "e7bb0ef028c744b081acdc57743b11d8")
(setf (get common_msgs_gl::SetPositionRequest :datatype-) "common_msgs_gl/SetPositionRequest")
(setf (get common_msgs_gl::SetPositionRequest :definition-)
      "geometry_msgs/Point position

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")

(setf (get common_msgs_gl::SetPositionResponse :md5sum-) "e7bb0ef028c744b081acdc57743b11d8")
(setf (get common_msgs_gl::SetPositionResponse :datatype-) "common_msgs_gl/SetPositionResponse")
(setf (get common_msgs_gl::SetPositionResponse :definition-)
      "geometry_msgs/Point position

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")



(provide :common_msgs_gl/SetPosition "e7bb0ef028c744b081acdc57743b11d8")


