;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::GetDouble)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'GetDouble (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::GETDOUBLE")
  (make-package "COMMON_MSGS_GL::GETDOUBLE"))
(unless (find-package "COMMON_MSGS_GL::GETDOUBLEREQUEST")
  (make-package "COMMON_MSGS_GL::GETDOUBLEREQUEST"))
(unless (find-package "COMMON_MSGS_GL::GETDOUBLERESPONSE")
  (make-package "COMMON_MSGS_GL::GETDOUBLERESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::GetDoubleRequest
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::GetDoubleRequest
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

(defclass common_msgs_gl::GetDoubleResponse
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::GetDoubleResponse
  (:init
   (&key
    ((:data __data) 0.0)
    )
   (send-super :init)
   (setq _data (float __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; float64 _data
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _data
       (sys::poke _data (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _data
     (setq _data (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass common_msgs_gl::GetDouble
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::GetDouble :md5sum-) "fdb28210bfa9d7c91146260178d9a584")
(setf (get common_msgs_gl::GetDouble :datatype-) "common_msgs_gl/GetDouble")
(setf (get common_msgs_gl::GetDouble :request) common_msgs_gl::GetDoubleRequest)
(setf (get common_msgs_gl::GetDouble :response) common_msgs_gl::GetDoubleResponse)

(defmethod common_msgs_gl::GetDoubleRequest
  (:response () (instance common_msgs_gl::GetDoubleResponse :init)))

(setf (get common_msgs_gl::GetDoubleRequest :md5sum-) "fdb28210bfa9d7c91146260178d9a584")
(setf (get common_msgs_gl::GetDoubleRequest :datatype-) "common_msgs_gl/GetDoubleRequest")
(setf (get common_msgs_gl::GetDoubleRequest :definition-)
      "---
float64 data

")

(setf (get common_msgs_gl::GetDoubleResponse :md5sum-) "fdb28210bfa9d7c91146260178d9a584")
(setf (get common_msgs_gl::GetDoubleResponse :datatype-) "common_msgs_gl/GetDoubleResponse")
(setf (get common_msgs_gl::GetDoubleResponse :definition-)
      "---
float64 data

")



(provide :common_msgs_gl/GetDouble "fdb28210bfa9d7c91146260178d9a584")


