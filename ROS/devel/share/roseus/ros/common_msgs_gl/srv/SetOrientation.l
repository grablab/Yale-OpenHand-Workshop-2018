;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SetOrientation)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SetOrientation (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SETORIENTATION")
  (make-package "COMMON_MSGS_GL::SETORIENTATION"))
(unless (find-package "COMMON_MSGS_GL::SETORIENTATIONREQUEST")
  (make-package "COMMON_MSGS_GL::SETORIENTATIONREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SETORIENTATIONRESPONSE")
  (make-package "COMMON_MSGS_GL::SETORIENTATIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass common_msgs_gl::SetOrientationRequest
  :super ros::object
  :slots (_orientation ))

(defmethod common_msgs_gl::SetOrientationRequest
  (:init
   (&key
    ((:orientation __orientation) (instance geometry_msgs::Quaternion :init))
    )
   (send-super :init)
   (setq _orientation __orientation)
   self)
  (:orientation
   (&rest __orientation)
   (if (keywordp (car __orientation))
       (send* _orientation __orientation)
     (progn
       (if __orientation (setq _orientation (car __orientation)))
       _orientation)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Quaternion _orientation
    (send _orientation :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Quaternion _orientation
       (send _orientation :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Quaternion _orientation
     (send _orientation :deserialize buf ptr-) (incf ptr- (send _orientation :serialization-length))
   ;;
   self)
  )

(defclass common_msgs_gl::SetOrientationResponse
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::SetOrientationResponse
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

(defclass common_msgs_gl::SetOrientation
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SetOrientation :md5sum-) "8ed1de3b69473461225107f55ad59b9d")
(setf (get common_msgs_gl::SetOrientation :datatype-) "common_msgs_gl/SetOrientation")
(setf (get common_msgs_gl::SetOrientation :request) common_msgs_gl::SetOrientationRequest)
(setf (get common_msgs_gl::SetOrientation :response) common_msgs_gl::SetOrientationResponse)

(defmethod common_msgs_gl::SetOrientationRequest
  (:response () (instance common_msgs_gl::SetOrientationResponse :init)))

(setf (get common_msgs_gl::SetOrientationRequest :md5sum-) "8ed1de3b69473461225107f55ad59b9d")
(setf (get common_msgs_gl::SetOrientationRequest :datatype-) "common_msgs_gl/SetOrientationRequest")
(setf (get common_msgs_gl::SetOrientationRequest :definition-)
      "geometry_msgs/Quaternion orientation

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---

")

(setf (get common_msgs_gl::SetOrientationResponse :md5sum-) "8ed1de3b69473461225107f55ad59b9d")
(setf (get common_msgs_gl::SetOrientationResponse :datatype-) "common_msgs_gl/SetOrientationResponse")
(setf (get common_msgs_gl::SetOrientationResponse :definition-)
      "geometry_msgs/Quaternion orientation

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---

")



(provide :common_msgs_gl/SetOrientation "8ed1de3b69473461225107f55ad59b9d")


