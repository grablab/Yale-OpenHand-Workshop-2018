;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SendDoubleArrayReceiveDoubleArray)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SendDoubleArrayReceiveDoubleArray (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEDOUBLEARRAY")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEDOUBLEARRAY"))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEDOUBLEARRAYREQUEST")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEDOUBLEARRAYREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEDOUBLEARRAYRESPONSE")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRECEIVEDOUBLEARRAYRESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::SendDoubleArrayReceiveDoubleArrayRequest
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::SendDoubleArrayReceiveDoubleArrayRequest
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

(defclass common_msgs_gl::SendDoubleArrayReceiveDoubleArrayResponse
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::SendDoubleArrayReceiveDoubleArrayResponse
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

(defclass common_msgs_gl::SendDoubleArrayReceiveDoubleArray
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleArray :md5sum-) "cf5053d681e2a2bc33c6323af1d83e31")
(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleArray :datatype-) "common_msgs_gl/SendDoubleArrayReceiveDoubleArray")
(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleArray :request) common_msgs_gl::SendDoubleArrayReceiveDoubleArrayRequest)
(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleArray :response) common_msgs_gl::SendDoubleArrayReceiveDoubleArrayResponse)

(defmethod common_msgs_gl::SendDoubleArrayReceiveDoubleArrayRequest
  (:response () (instance common_msgs_gl::SendDoubleArrayReceiveDoubleArrayResponse :init)))

(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleArrayRequest :md5sum-) "cf5053d681e2a2bc33c6323af1d83e31")
(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleArrayRequest :datatype-) "common_msgs_gl/SendDoubleArrayReceiveDoubleArrayRequest")
(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleArrayRequest :definition-)
      "float64[] data
---
float64[] data

")

(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleArrayResponse :md5sum-) "cf5053d681e2a2bc33c6323af1d83e31")
(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleArrayResponse :datatype-) "common_msgs_gl/SendDoubleArrayReceiveDoubleArrayResponse")
(setf (get common_msgs_gl::SendDoubleArrayReceiveDoubleArrayResponse :definition-)
      "float64[] data
---
float64[] data

")



(provide :common_msgs_gl/SendDoubleArrayReceiveDoubleArray "cf5053d681e2a2bc33c6323af1d83e31")


