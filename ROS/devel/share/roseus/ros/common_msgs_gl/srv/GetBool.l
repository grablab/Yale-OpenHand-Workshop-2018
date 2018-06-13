;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::GetBool)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'GetBool (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::GETBOOL")
  (make-package "COMMON_MSGS_GL::GETBOOL"))
(unless (find-package "COMMON_MSGS_GL::GETBOOLREQUEST")
  (make-package "COMMON_MSGS_GL::GETBOOLREQUEST"))
(unless (find-package "COMMON_MSGS_GL::GETBOOLRESPONSE")
  (make-package "COMMON_MSGS_GL::GETBOOLRESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::GetBoolRequest
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::GetBoolRequest
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

(defclass common_msgs_gl::GetBoolResponse
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::GetBoolResponse
  (:init
   (&key
    ((:data __data) nil)
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; bool _data
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _data
       (if _data (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _data
     (setq _data (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass common_msgs_gl::GetBool
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::GetBool :md5sum-) "8b94c1b53db61fb6aed406028ad6332a")
(setf (get common_msgs_gl::GetBool :datatype-) "common_msgs_gl/GetBool")
(setf (get common_msgs_gl::GetBool :request) common_msgs_gl::GetBoolRequest)
(setf (get common_msgs_gl::GetBool :response) common_msgs_gl::GetBoolResponse)

(defmethod common_msgs_gl::GetBoolRequest
  (:response () (instance common_msgs_gl::GetBoolResponse :init)))

(setf (get common_msgs_gl::GetBoolRequest :md5sum-) "8b94c1b53db61fb6aed406028ad6332a")
(setf (get common_msgs_gl::GetBoolRequest :datatype-) "common_msgs_gl/GetBoolRequest")
(setf (get common_msgs_gl::GetBoolRequest :definition-)
      "---
bool data

")

(setf (get common_msgs_gl::GetBoolResponse :md5sum-) "8b94c1b53db61fb6aed406028ad6332a")
(setf (get common_msgs_gl::GetBoolResponse :datatype-) "common_msgs_gl/GetBoolResponse")
(setf (get common_msgs_gl::GetBoolResponse :definition-)
      "---
bool data

")



(provide :common_msgs_gl/GetBool "8b94c1b53db61fb6aed406028ad6332a")


