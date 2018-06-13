;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SendInt)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SendInt (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SENDINT")
  (make-package "COMMON_MSGS_GL::SENDINT"))
(unless (find-package "COMMON_MSGS_GL::SENDINTREQUEST")
  (make-package "COMMON_MSGS_GL::SENDINTREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SENDINTRESPONSE")
  (make-package "COMMON_MSGS_GL::SENDINTRESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::SendIntRequest
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::SendIntRequest
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

(defclass common_msgs_gl::SendIntResponse
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::SendIntResponse
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

(defclass common_msgs_gl::SendInt
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SendInt :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get common_msgs_gl::SendInt :datatype-) "common_msgs_gl/SendInt")
(setf (get common_msgs_gl::SendInt :request) common_msgs_gl::SendIntRequest)
(setf (get common_msgs_gl::SendInt :response) common_msgs_gl::SendIntResponse)

(defmethod common_msgs_gl::SendIntRequest
  (:response () (instance common_msgs_gl::SendIntResponse :init)))

(setf (get common_msgs_gl::SendIntRequest :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get common_msgs_gl::SendIntRequest :datatype-) "common_msgs_gl/SendIntRequest")
(setf (get common_msgs_gl::SendIntRequest :definition-)
      "int32 data
---

")

(setf (get common_msgs_gl::SendIntResponse :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get common_msgs_gl::SendIntResponse :datatype-) "common_msgs_gl/SendIntResponse")
(setf (get common_msgs_gl::SendIntResponse :definition-)
      "int32 data
---

")



(provide :common_msgs_gl/SendInt "da5909fbe378aeaf85e547e830cc1bb7")


