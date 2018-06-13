;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SetPose)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SetPose (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SETPOSE")
  (make-package "COMMON_MSGS_GL::SETPOSE"))
(unless (find-package "COMMON_MSGS_GL::SETPOSEREQUEST")
  (make-package "COMMON_MSGS_GL::SETPOSEREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SETPOSERESPONSE")
  (make-package "COMMON_MSGS_GL::SETPOSERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass common_msgs_gl::SetPoseRequest
  :super ros::object
  :slots (_pose ))

(defmethod common_msgs_gl::SetPoseRequest
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _pose __pose)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass common_msgs_gl::SetPoseResponse
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::SetPoseResponse
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

(defclass common_msgs_gl::SetPose
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SetPose :md5sum-) "f192399f711a48924df9a394d37edd67")
(setf (get common_msgs_gl::SetPose :datatype-) "common_msgs_gl/SetPose")
(setf (get common_msgs_gl::SetPose :request) common_msgs_gl::SetPoseRequest)
(setf (get common_msgs_gl::SetPose :response) common_msgs_gl::SetPoseResponse)

(defmethod common_msgs_gl::SetPoseRequest
  (:response () (instance common_msgs_gl::SetPoseResponse :init)))

(setf (get common_msgs_gl::SetPoseRequest :md5sum-) "f192399f711a48924df9a394d37edd67")
(setf (get common_msgs_gl::SetPoseRequest :datatype-) "common_msgs_gl/SetPoseRequest")
(setf (get common_msgs_gl::SetPoseRequest :definition-)
      "geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---

")

(setf (get common_msgs_gl::SetPoseResponse :md5sum-) "f192399f711a48924df9a394d37edd67")
(setf (get common_msgs_gl::SetPoseResponse :datatype-) "common_msgs_gl/SetPoseResponse")
(setf (get common_msgs_gl::SetPoseResponse :definition-)
      "geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---

")



(provide :common_msgs_gl/SetPose "f192399f711a48924df9a394d37edd67")


