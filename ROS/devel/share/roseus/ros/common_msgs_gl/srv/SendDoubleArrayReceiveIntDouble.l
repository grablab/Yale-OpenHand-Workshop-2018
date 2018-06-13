;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SendDoubleArrayReceiveIntDouble)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SendDoubleArrayReceiveIntDouble (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEINTDOUBLE")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEINTDOUBLE"))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEINTDOUBLEREQUEST")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEINTDOUBLEREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEINTDOUBLERESPONSE")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEINTDOUBLERESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::SendDoubleArrayReceiveIntDoubleRequest
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::SendDoubleArrayReceiveIntDoubleRequest
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

(defclass common_msgs_gl::SendDoubleArrayReceiveIntDoubleResponse
  :super ros::object
  :slots (_data_int _data_double ))

(defmethod common_msgs_gl::SendDoubleArrayReceiveIntDoubleResponse
  (:init
   (&key
    ((:data_int __data_int) 0)
    ((:data_double __data_double) 0.0)
    )
   (send-super :init)
   (setq _data_int (round __data_int))
   (setq _data_double (float __data_double))
   self)
  (:data_int
   (&optional __data_int)
   (if __data_int (setq _data_int __data_int)) _data_int)
  (:data_double
   (&optional __data_double)
   (if __data_double (setq _data_double __data_double)) _data_double)
  (:serialization-length
   ()
   (+
    ;; int32 _data_int
    4
    ;; float64 _data_double
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _data_int
       (write-long _data_int s)
     ;; float64 _data_double
       (sys::poke _data_double (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _data_int
     (setq _data_int (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _data_double
     (setq _data_double (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass common_msgs_gl::SendDoubleArrayReceiveIntDouble
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SendDoubleArrayReceiveIntDouble :md5sum-) "ca79180c13450f9faa7d51f5b725d04b")
(setf (get common_msgs_gl::SendDoubleArrayReceiveIntDouble :datatype-) "common_msgs_gl/SendDoubleArrayReceiveIntDouble")
(setf (get common_msgs_gl::SendDoubleArrayReceiveIntDouble :request) common_msgs_gl::SendDoubleArrayReceiveIntDoubleRequest)
(setf (get common_msgs_gl::SendDoubleArrayReceiveIntDouble :response) common_msgs_gl::SendDoubleArrayReceiveIntDoubleResponse)

(defmethod common_msgs_gl::SendDoubleArrayReceiveIntDoubleRequest
  (:response () (instance common_msgs_gl::SendDoubleArrayReceiveIntDoubleResponse :init)))

(setf (get common_msgs_gl::SendDoubleArrayReceiveIntDoubleRequest :md5sum-) "ca79180c13450f9faa7d51f5b725d04b")
(setf (get common_msgs_gl::SendDoubleArrayReceiveIntDoubleRequest :datatype-) "common_msgs_gl/SendDoubleArrayReceiveIntDoubleRequest")
(setf (get common_msgs_gl::SendDoubleArrayReceiveIntDoubleRequest :definition-)
      "float64[] data
---
int32 data_int
float64 data_double

")

(setf (get common_msgs_gl::SendDoubleArrayReceiveIntDoubleResponse :md5sum-) "ca79180c13450f9faa7d51f5b725d04b")
(setf (get common_msgs_gl::SendDoubleArrayReceiveIntDoubleResponse :datatype-) "common_msgs_gl/SendDoubleArrayReceiveIntDoubleResponse")
(setf (get common_msgs_gl::SendDoubleArrayReceiveIntDoubleResponse :definition-)
      "float64[] data
---
int32 data_int
float64 data_double

")



(provide :common_msgs_gl/SendDoubleArrayReceiveIntDouble "ca79180c13450f9faa7d51f5b725d04b")


