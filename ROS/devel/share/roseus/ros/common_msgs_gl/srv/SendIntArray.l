;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SendIntArray)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SendIntArray (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SENDINTARRAY")
  (make-package "COMMON_MSGS_GL::SENDINTARRAY"))
(unless (find-package "COMMON_MSGS_GL::SENDINTARRAYREQUEST")
  (make-package "COMMON_MSGS_GL::SENDINTARRAYREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SENDINTARRAYRESPONSE")
  (make-package "COMMON_MSGS_GL::SENDINTARRAYRESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::SendIntArrayRequest
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::SendIntArrayRequest
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
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
    ;; int32[] _data
    (* 4    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-long (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass common_msgs_gl::SendIntArrayResponse
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::SendIntArrayResponse
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

(defclass common_msgs_gl::SendIntArray
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SendIntArray :md5sum-) "563b27884d008b0d2adff54dc1f9e4f5")
(setf (get common_msgs_gl::SendIntArray :datatype-) "common_msgs_gl/SendIntArray")
(setf (get common_msgs_gl::SendIntArray :request) common_msgs_gl::SendIntArrayRequest)
(setf (get common_msgs_gl::SendIntArray :response) common_msgs_gl::SendIntArrayResponse)

(defmethod common_msgs_gl::SendIntArrayRequest
  (:response () (instance common_msgs_gl::SendIntArrayResponse :init)))

(setf (get common_msgs_gl::SendIntArrayRequest :md5sum-) "563b27884d008b0d2adff54dc1f9e4f5")
(setf (get common_msgs_gl::SendIntArrayRequest :datatype-) "common_msgs_gl/SendIntArrayRequest")
(setf (get common_msgs_gl::SendIntArrayRequest :definition-)
      "int32[] data
---

")

(setf (get common_msgs_gl::SendIntArrayResponse :md5sum-) "563b27884d008b0d2adff54dc1f9e4f5")
(setf (get common_msgs_gl::SendIntArrayResponse :datatype-) "common_msgs_gl/SendIntArrayResponse")
(setf (get common_msgs_gl::SendIntArrayResponse :definition-)
      "int32[] data
---

")



(provide :common_msgs_gl/SendIntArray "563b27884d008b0d2adff54dc1f9e4f5")


