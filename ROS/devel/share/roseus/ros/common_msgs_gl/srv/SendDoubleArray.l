;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SendDoubleArray)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SendDoubleArray (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAY")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAY"))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYREQUEST")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRESPONSE")
  (make-package "COMMON_MSGS_GL::SENDDOUBLEARRAYRESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::SendDoubleArrayRequest
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::SendDoubleArrayRequest
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

(defclass common_msgs_gl::SendDoubleArrayResponse
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::SendDoubleArrayResponse
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

(defclass common_msgs_gl::SendDoubleArray
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SendDoubleArray :md5sum-) "788898178a3da2c3718461eecda8f714")
(setf (get common_msgs_gl::SendDoubleArray :datatype-) "common_msgs_gl/SendDoubleArray")
(setf (get common_msgs_gl::SendDoubleArray :request) common_msgs_gl::SendDoubleArrayRequest)
(setf (get common_msgs_gl::SendDoubleArray :response) common_msgs_gl::SendDoubleArrayResponse)

(defmethod common_msgs_gl::SendDoubleArrayRequest
  (:response () (instance common_msgs_gl::SendDoubleArrayResponse :init)))

(setf (get common_msgs_gl::SendDoubleArrayRequest :md5sum-) "788898178a3da2c3718461eecda8f714")
(setf (get common_msgs_gl::SendDoubleArrayRequest :datatype-) "common_msgs_gl/SendDoubleArrayRequest")
(setf (get common_msgs_gl::SendDoubleArrayRequest :definition-)
      "float64[] data
---

")

(setf (get common_msgs_gl::SendDoubleArrayResponse :md5sum-) "788898178a3da2c3718461eecda8f714")
(setf (get common_msgs_gl::SendDoubleArrayResponse :datatype-) "common_msgs_gl/SendDoubleArrayResponse")
(setf (get common_msgs_gl::SendDoubleArrayResponse :definition-)
      "float64[] data
---

")



(provide :common_msgs_gl/SendDoubleArray "788898178a3da2c3718461eecda8f714")


