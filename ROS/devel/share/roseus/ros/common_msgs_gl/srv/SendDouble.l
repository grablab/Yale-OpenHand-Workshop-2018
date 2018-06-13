;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SendDouble)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SendDouble (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLE")
  (make-package "COMMON_MSGS_GL::SENDDOUBLE"))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEREQUEST")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLERESPONSE")
  (make-package "COMMON_MSGS_GL::SENDDOUBLERESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::SendDoubleRequest
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::SendDoubleRequest
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

(defclass common_msgs_gl::SendDoubleResponse
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::SendDoubleResponse
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

(defclass common_msgs_gl::SendDouble
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SendDouble :md5sum-) "fdb28210bfa9d7c91146260178d9a584")
(setf (get common_msgs_gl::SendDouble :datatype-) "common_msgs_gl/SendDouble")
(setf (get common_msgs_gl::SendDouble :request) common_msgs_gl::SendDoubleRequest)
(setf (get common_msgs_gl::SendDouble :response) common_msgs_gl::SendDoubleResponse)

(defmethod common_msgs_gl::SendDoubleRequest
  (:response () (instance common_msgs_gl::SendDoubleResponse :init)))

(setf (get common_msgs_gl::SendDoubleRequest :md5sum-) "fdb28210bfa9d7c91146260178d9a584")
(setf (get common_msgs_gl::SendDoubleRequest :datatype-) "common_msgs_gl/SendDoubleRequest")
(setf (get common_msgs_gl::SendDoubleRequest :definition-)
      "float64 data
---

")

(setf (get common_msgs_gl::SendDoubleResponse :md5sum-) "fdb28210bfa9d7c91146260178d9a584")
(setf (get common_msgs_gl::SendDoubleResponse :datatype-) "common_msgs_gl/SendDoubleResponse")
(setf (get common_msgs_gl::SendDoubleResponse :definition-)
      "float64 data
---

")



(provide :common_msgs_gl/SendDouble "fdb28210bfa9d7c91146260178d9a584")


