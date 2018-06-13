;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SendBool)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SendBool (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SENDBOOL")
  (make-package "COMMON_MSGS_GL::SENDBOOL"))
(unless (find-package "COMMON_MSGS_GL::SENDBOOLREQUEST")
  (make-package "COMMON_MSGS_GL::SENDBOOLREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SENDBOOLRESPONSE")
  (make-package "COMMON_MSGS_GL::SENDBOOLRESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::SendBoolRequest
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::SendBoolRequest
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

(defclass common_msgs_gl::SendBoolResponse
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::SendBoolResponse
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

(defclass common_msgs_gl::SendBool
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SendBool :md5sum-) "8b94c1b53db61fb6aed406028ad6332a")
(setf (get common_msgs_gl::SendBool :datatype-) "common_msgs_gl/SendBool")
(setf (get common_msgs_gl::SendBool :request) common_msgs_gl::SendBoolRequest)
(setf (get common_msgs_gl::SendBool :response) common_msgs_gl::SendBoolResponse)

(defmethod common_msgs_gl::SendBoolRequest
  (:response () (instance common_msgs_gl::SendBoolResponse :init)))

(setf (get common_msgs_gl::SendBoolRequest :md5sum-) "8b94c1b53db61fb6aed406028ad6332a")
(setf (get common_msgs_gl::SendBoolRequest :datatype-) "common_msgs_gl/SendBoolRequest")
(setf (get common_msgs_gl::SendBoolRequest :definition-)
      "bool data
---

")

(setf (get common_msgs_gl::SendBoolResponse :md5sum-) "8b94c1b53db61fb6aed406028ad6332a")
(setf (get common_msgs_gl::SendBoolResponse :datatype-) "common_msgs_gl/SendBoolResponse")
(setf (get common_msgs_gl::SendBoolResponse :definition-)
      "bool data
---

")



(provide :common_msgs_gl/SendBool "8b94c1b53db61fb6aed406028ad6332a")


