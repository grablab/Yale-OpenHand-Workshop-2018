;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::GetInt)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'GetInt (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::GETINT")
  (make-package "COMMON_MSGS_GL::GETINT"))
(unless (find-package "COMMON_MSGS_GL::GETINTREQUEST")
  (make-package "COMMON_MSGS_GL::GETINTREQUEST"))
(unless (find-package "COMMON_MSGS_GL::GETINTRESPONSE")
  (make-package "COMMON_MSGS_GL::GETINTRESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::GetIntRequest
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::GetIntRequest
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

(defclass common_msgs_gl::GetIntResponse
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::GetIntResponse
  (:init
   (&key
    ((:data __data) 0)
    )
   (send-super :init)
   (setq _data (round __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; int32 _data
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _data
       (write-long _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _data
     (setq _data (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common_msgs_gl::GetInt
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::GetInt :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get common_msgs_gl::GetInt :datatype-) "common_msgs_gl/GetInt")
(setf (get common_msgs_gl::GetInt :request) common_msgs_gl::GetIntRequest)
(setf (get common_msgs_gl::GetInt :response) common_msgs_gl::GetIntResponse)

(defmethod common_msgs_gl::GetIntRequest
  (:response () (instance common_msgs_gl::GetIntResponse :init)))

(setf (get common_msgs_gl::GetIntRequest :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get common_msgs_gl::GetIntRequest :datatype-) "common_msgs_gl/GetIntRequest")
(setf (get common_msgs_gl::GetIntRequest :definition-)
      "---
int32 data

")

(setf (get common_msgs_gl::GetIntResponse :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get common_msgs_gl::GetIntResponse :datatype-) "common_msgs_gl/GetIntResponse")
(setf (get common_msgs_gl::GetIntResponse :definition-)
      "---
int32 data

")



(provide :common_msgs_gl/GetInt "da5909fbe378aeaf85e547e830cc1bb7")


