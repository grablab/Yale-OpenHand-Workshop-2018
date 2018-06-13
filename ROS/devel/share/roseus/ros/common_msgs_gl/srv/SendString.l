;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::SendString)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'SendString (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::SENDSTRING")
  (make-package "COMMON_MSGS_GL::SENDSTRING"))
(unless (find-package "COMMON_MSGS_GL::SENDSTRINGREQUEST")
  (make-package "COMMON_MSGS_GL::SENDSTRINGREQUEST"))
(unless (find-package "COMMON_MSGS_GL::SENDSTRINGRESPONSE")
  (make-package "COMMON_MSGS_GL::SENDSTRINGRESPONSE"))

(in-package "ROS")





(defclass common_msgs_gl::SendStringRequest
  :super ros::object
  :slots (_data ))

(defmethod common_msgs_gl::SendStringRequest
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

(defclass common_msgs_gl::SendStringResponse
  :super ros::object
  :slots ())

(defmethod common_msgs_gl::SendStringResponse
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

(defclass common_msgs_gl::SendString
  :super ros::object
  :slots ())

(setf (get common_msgs_gl::SendString :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get common_msgs_gl::SendString :datatype-) "common_msgs_gl/SendString")
(setf (get common_msgs_gl::SendString :request) common_msgs_gl::SendStringRequest)
(setf (get common_msgs_gl::SendString :response) common_msgs_gl::SendStringResponse)

(defmethod common_msgs_gl::SendStringRequest
  (:response () (instance common_msgs_gl::SendStringResponse :init)))

(setf (get common_msgs_gl::SendStringRequest :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get common_msgs_gl::SendStringRequest :datatype-) "common_msgs_gl/SendStringRequest")
(setf (get common_msgs_gl::SendStringRequest :definition-)
      "string data
---


")

(setf (get common_msgs_gl::SendStringResponse :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get common_msgs_gl::SendStringResponse :datatype-) "common_msgs_gl/SendStringResponse")
(setf (get common_msgs_gl::SendStringResponse :definition-)
      "string data
---


")



(provide :common_msgs_gl/SendString "992ce8a1687cec8c8bd883ec73ca41d1")


