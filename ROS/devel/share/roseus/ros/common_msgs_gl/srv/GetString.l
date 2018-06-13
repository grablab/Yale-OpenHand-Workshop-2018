;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::GetString)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'GetString (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::GETSTRING")
  (make-package "COMMON_MSGS_GL::GETSTRING"))
(unless (find-package "COMMON_MSGS_GL::GETSTRINGREQUEST")
  (make-package "COMMON_MSGS_GL::GETSTRINGREQUEST"))
(unless (find-package "COMMON_MSGS_GL::GETSTRINGRESPONSE")
  (make-package "COMMON_MSGS_GL::GETSTRINGRESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::GetStringRequest
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::GetStringRequest
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

(defclass common_msgs_gl::GetStringResponse
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::GetStringResponse
  (:init
   (&key
    ((:data __data) "")
    )
   (send-super :init)
   (setq _data (string __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass common_msgs_gl::GetString
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::GetString :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get common_msgs_gl::GetString :datatype-) "common_msgs_gl/GetString")
(setf (get common_msgs_gl::GetString :request) common_msgs_gl::GetStringRequest)
(setf (get common_msgs_gl::GetString :response) common_msgs_gl::GetStringResponse)

(defmethod common_msgs_gl::GetStringRequest
  (:response () (instance common_msgs_gl::GetStringResponse :init)))

(setf (get common_msgs_gl::GetStringRequest :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get common_msgs_gl::GetStringRequest :datatype-) "common_msgs_gl/GetStringRequest")
(setf (get common_msgs_gl::GetStringRequest :definition-)
      "---
string data

")

(setf (get common_msgs_gl::GetStringResponse :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get common_msgs_gl::GetStringResponse :datatype-) "common_msgs_gl/GetStringResponse")
(setf (get common_msgs_gl::GetStringResponse :definition-)
      "---
string data

")



(provide :common_msgs_gl/GetString "992ce8a1687cec8c8bd883ec73ca41d1")


