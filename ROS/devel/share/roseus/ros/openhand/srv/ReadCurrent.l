;; Auto-generated. Do not edit!


(when (boundp 'openhand::ReadCurrent)
  (if (not (find-package "OPENHAND"))
    (make-package "OPENHAND"))
  (shadow 'ReadCurrent (find-package "OPENHAND")))
(unless (find-package "OPENHAND::READCURRENT")
  (make-package "OPENHAND::READCURRENT"))
(unless (find-package "OPENHAND::READCURRENTREQUEST")
  (make-package "OPENHAND::READCURRENTREQUEST"))
(unless (find-package "OPENHAND::READCURRENTRESPONSE")
  (make-package "OPENHAND::READCURRENTRESPONSE"))

(in-package "ROS")





(defclass openhand::ReadCurrentRequest
  :super ros::object
  :slots ())

(defmethod openhand::ReadCurrentRequest
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

(defclass openhand::ReadCurrentResponse
  :super ros::object
  :slots (_curr ))

(defmethod openhand::ReadCurrentResponse
  (:init
   (&key
    ((:curr __curr) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _curr __curr)
   self)
  (:curr
   (&optional __curr)
   (if __curr (setq _curr __curr)) _curr)
  (:serialization-length
   ()
   (+
    ;; float32[] _curr
    (* 4    (length _curr)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _curr
     (write-long (length _curr) s)
     (dotimes (i (length _curr))
       (sys::poke (elt _curr i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _curr
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _curr (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _curr i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass openhand::ReadCurrent
  :super ros::object
  :slots ())

(setf (get openhand::ReadCurrent :md5sum-) "640c8d4d28b8ccb823cd749d0957df5a")
(setf (get openhand::ReadCurrent :datatype-) "openhand/ReadCurrent")
(setf (get openhand::ReadCurrent :request) openhand::ReadCurrentRequest)
(setf (get openhand::ReadCurrent :response) openhand::ReadCurrentResponse)

(defmethod openhand::ReadCurrentRequest
  (:response () (instance openhand::ReadCurrentResponse :init)))

(setf (get openhand::ReadCurrentRequest :md5sum-) "640c8d4d28b8ccb823cd749d0957df5a")
(setf (get openhand::ReadCurrentRequest :datatype-) "openhand/ReadCurrentRequest")
(setf (get openhand::ReadCurrentRequest :definition-)
      "---
float32[] curr

")

(setf (get openhand::ReadCurrentResponse :md5sum-) "640c8d4d28b8ccb823cd749d0957df5a")
(setf (get openhand::ReadCurrentResponse :datatype-) "openhand/ReadCurrentResponse")
(setf (get openhand::ReadCurrentResponse :definition-)
      "---
float32[] curr

")



(provide :openhand/ReadCurrent "640c8d4d28b8ccb823cd749d0957df5a")


