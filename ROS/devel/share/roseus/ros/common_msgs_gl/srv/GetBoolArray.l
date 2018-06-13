;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::GetBoolArray)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'GetBoolArray (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::GETBOOLARRAY")
  (make-package "COMMON_MSGS_GL::GETBOOLARRAY"))
(unless (find-package "COMMON_MSGS_GL::GETBOOLARRAYREQUEST")
  (make-package "COMMON_MSGS_GL::GETBOOLARRAYREQUEST"))
(unless (find-package "COMMON_MSGS_GL::GETBOOLARRAYRESPONSE")
  (make-package "COMMON_MSGS_GL::GETBOOLARRAYRESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::GetBoolArrayRequest
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::GetBoolArrayRequest
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

(defclass common_msgs_gl::GetBoolArrayResponse
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::GetBoolArrayResponse
  (:init
   (&key
    ((:data __data) (let (r) (dotimes (i 0) (push nil r)) r))
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
    ;; bool[] _data
    (* 1    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (if (elt _data i) (write-byte -1 s) (write-byte 0 s))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (make-list n))
     (dotimes (i n)
     (setf (elt _data i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;;
   self)
  )

(defclass common_msgs_gl::GetBoolArray
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::GetBoolArray :md5sum-) "403a16d9294b908e45c67a6f3c3a5b27")
(setf (get common_msgs_gl::GetBoolArray :datatype-) "common_msgs_gl/GetBoolArray")
(setf (get common_msgs_gl::GetBoolArray :request) common_msgs_gl::GetBoolArrayRequest)
(setf (get common_msgs_gl::GetBoolArray :response) common_msgs_gl::GetBoolArrayResponse)

(defmethod common_msgs_gl::GetBoolArrayRequest
  (:response () (instance common_msgs_gl::GetBoolArrayResponse :init)))

(setf (get common_msgs_gl::GetBoolArrayRequest :md5sum-) "403a16d9294b908e45c67a6f3c3a5b27")
(setf (get common_msgs_gl::GetBoolArrayRequest :datatype-) "common_msgs_gl/GetBoolArrayRequest")
(setf (get common_msgs_gl::GetBoolArrayRequest :definition-)
      "---
bool[] data

")

(setf (get common_msgs_gl::GetBoolArrayResponse :md5sum-) "403a16d9294b908e45c67a6f3c3a5b27")
(setf (get common_msgs_gl::GetBoolArrayResponse :datatype-) "common_msgs_gl/GetBoolArrayResponse")
(setf (get common_msgs_gl::GetBoolArrayResponse :definition-)
      "---
bool[] data

")



(provide :common_msgs_gl/GetBoolArray "403a16d9294b908e45c67a6f3c3a5b27")


