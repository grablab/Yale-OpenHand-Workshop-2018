;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SendPointArray)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SendPointArray (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SENDPOINTARRAY")
  (make-package "COMMON_MSGS_GL::SENDPOINTARRAY"))
(unless (find-package "COMMON_MSGS_GL::SENDPOINTARRAYREQUEST")
  (make-package "COMMON_MSGS_GL::SENDPOINTARRAYREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SENDPOINTARRAYRESPONSE")
  (make-package "COMMON_MSGS_GL::SENDPOINTARRAYRESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::SendPointArrayRequest
  :super ros::object
  :slots (_points ))

(defmethod common_msgs_gl::SendPointArrayRequest
  (:init
   (&key
    ((:points __points) (instance common_msgs_gl::PointArray :init))
    )
   (send-super :init)
   (setq _points __points)
   self)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; common_msgs_gl/PointArray _points
    (send _points :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; common_msgs_gl/PointArray _points
       (send _points :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; common_msgs_gl/PointArray _points
     (send _points :deserialize buf ptr-) (incf ptr- (send _points :serialization-length))
   ;;
   self)
  )

(defclass common_msgs_gl::SendPointArrayResponse
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::SendPointArrayResponse
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

(defclass common_msgs_gl::SendPointArray
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SendPointArray :md5sum-) "9dbb4bd593812628a7a52a04aefa8ecb")
(setf (get common_msgs_gl::SendPointArray :datatype-) "common_msgs_gl/SendPointArray")
(setf (get common_msgs_gl::SendPointArray :request) common_msgs_gl::SendPointArrayRequest)
(setf (get common_msgs_gl::SendPointArray :response) common_msgs_gl::SendPointArrayResponse)

(defmethod common_msgs_gl::SendPointArrayRequest
  (:response () (instance common_msgs_gl::SendPointArrayResponse :init)))

(setf (get common_msgs_gl::SendPointArrayRequest :md5sum-) "9dbb4bd593812628a7a52a04aefa8ecb")
(setf (get common_msgs_gl::SendPointArrayRequest :datatype-) "common_msgs_gl/SendPointArrayRequest")
(setf (get common_msgs_gl::SendPointArrayRequest :definition-)
      "common_msgs_gl/PointArray points

================================================================================
MSG: common_msgs_gl/PointArray
int32[] x
int32[] y
---

")

(setf (get common_msgs_gl::SendPointArrayResponse :md5sum-) "9dbb4bd593812628a7a52a04aefa8ecb")
(setf (get common_msgs_gl::SendPointArrayResponse :datatype-) "common_msgs_gl/SendPointArrayResponse")
(setf (get common_msgs_gl::SendPointArrayResponse :definition-)
      "common_msgs_gl/PointArray points

================================================================================
MSG: common_msgs_gl/PointArray
int32[] x
int32[] y
---

")



(provide :common_msgs_gl/SendPointArray "9dbb4bd593812628a7a52a04aefa8ecb")


