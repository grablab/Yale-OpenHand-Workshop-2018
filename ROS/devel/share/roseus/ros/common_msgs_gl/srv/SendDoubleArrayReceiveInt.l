;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SendDoubleArrayReceiveInt)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SendDoubleArrayReceiveInt (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEINT")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEINT"))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEINTREQUEST")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEINTREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEINTRESPONSE")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEINTRESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::SendDoubleArrayReceiveIntRequest
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::SendDoubleArrayReceiveIntRequest
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0.0 :element-type :float))
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
    ;; float64[] _data
    (* 8    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass common_msgs_gl::SendDoubleArrayReceiveIntResponse
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::SendDoubleArrayReceiveIntResponse
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

(defclass common_msgs_gl::SendDoubleArrayReceiveInt
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SendDoubleArrayReceiveInt :md5sum-) "e192e1ed09b2c0baf14ccafbc9c08e6c")
(setf (get common_msgs_gl::SendDoubleArrayReceiveInt :datatype-) "common_msgs_gl/SendDoubleArrayReceiveInt")
(setf (get common_msgs_gl::SendDoubleArrayReceiveInt :request) common_msgs_gl::SendDoubleArrayReceiveIntRequest)
(setf (get common_msgs_gl::SendDoubleArrayReceiveInt :response) common_msgs_gl::SendDoubleArrayReceiveIntResponse)

(defmethod common_msgs_gl::SendDoubleArrayReceiveIntRequest
  (:response () (instance common_msgs_gl::SendDoubleArrayReceiveIntResponse :init)))

(setf (get common_msgs_gl::SendDoubleArrayReceiveIntRequest :md5sum-) "e192e1ed09b2c0baf14ccafbc9c08e6c")
(setf (get common_msgs_gl::SendDoubleArrayReceiveIntRequest :datatype-) "common_msgs_gl/SendDoubleArrayReceiveIntRequest")
(setf (get common_msgs_gl::SendDoubleArrayReceiveIntRequest :definition-)
      "float64[] data
---
int32 data

")

(setf (get common_msgs_gl::SendDoubleArrayReceiveIntResponse :md5sum-) "e192e1ed09b2c0baf14ccafbc9c08e6c")
(setf (get common_msgs_gl::SendDoubleArrayReceiveIntResponse :datatype-) "common_msgs_gl/SendDoubleArrayReceiveIntResponse")
(setf (get common_msgs_gl::SendDoubleArrayReceiveIntResponse :definition-)
      "float64[] data
---
int32 data

")



(provide :common_msgs_gl/SendDoubleArrayReceiveInt "e192e1ed09b2c0baf14ccafbc9c08e6c")


