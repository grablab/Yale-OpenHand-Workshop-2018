;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SendDoubleArrayReceiveDouble)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SendDoubleArrayReceiveDouble (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEDOUBLE")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEDOUBLE"))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEDOUBLEREQUEST")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEDOUBLEREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEDOUBLERESPONSE")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEDOUBLERESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::SendDoubleArrayReceiveDoubleRequest
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::SendDoubleArrayReceiveDoubleRequest
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

(defclass common_msgs_gl::SendDoubleArrayReceiveDoubleResponse
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::SendDoubleArrayReceiveDoubleResponse
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

(defclass common_msgs_gl::SendDoubleArrayReceiveDouble
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SendDoubleArrayReceiveDouble :md5sum-) "b748ef2ada544bd1cd84f38aa7adb516")
(setf (get common_msgs_gl::SendDoubleArrayReceiveDouble :datatype-) "common_msgs_gl/SendDoubleArrayReceiveDouble")
(setf (get common_msgs_gl::SendDoubleArrayReceiveDouble :request) common_msgs_gl::SendDoubleArrayReceiveDoubleRequest)
(setf (get common_msgs_gl::SendDoubleArrayReceiveDouble :response) common_msgs_gl::SendDoubleArrayReceiveDoubleResponse)

(defmethod common_msgs_gl::SendDoubleArrayReceiveDoubleRequest
  (:response () (instance common_msgs_gl::SendDoubleArrayReceiveDoubleResponse :init)))

(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleRequest :md5sum-) "b748ef2ada544bd1cd84f38aa7adb516")
(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleRequest :datatype-) "common_msgs_gl/SendDoubleArrayReceiveDoubleRequest")
(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleRequest :definition-)
      "float64[] data
---
float64 data

")

(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleResponse :md5sum-) "b748ef2ada544bd1cd84f38aa7adb516")
(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleResponse :datatype-) "common_msgs_gl/SendDoubleArrayReceiveDoubleResponse")
(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleResponse :definition-)
      "float64[] data
---
float64 data

")



(provide :common_msgs_gl/SendDoubleArrayReceiveDouble "b748ef2ada544bd1cd84f38aa7adb516")


