;; Auto-generated. Do not edit!


(when (boundp 'openhand::ReadLoad)
  (if (not (find-package "OPENHAND"))
    (make-package "OPENHAND"))
  (shadow 'ReadLoad (find-package "OPENHAND")))
(unless (find-package "OPENHAND::READLOAD")
  (make-package "OPENHAND::READLOAD"))
(unless (find-package "OPENHAND::READLOADREQUEST")
  (make-package "OPENHAND::READLOADREQUEST"))
(unless (find-package "OPENHAND::READLOADRESPONSE")
  (make-package "OPENHAND::READLOADRESPONSE"))

(in-package "ROS")





(defclass openhand::ReadLoadRequest
  :super ros::object
  :slots ())

(defmethod openhand::ReadLoadRequest
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

(defclass openhand::ReadLoadResponse
  :super ros::object
  :slots (_load ))

(defmethod openhand::ReadLoadResponse
  (:init
   (&key
    ((:load __load) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _load __load)
   self)
  (:load
   (&optional __load)
   (if __load (setq _load __load)) _load)
  (:serialization-length
   ()
   (+
    ;; float32[] _load
    (* 4    (length _load)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _load
     (write-long (length _load) s)
     (dotimes (i (length _load))
       (sys::poke (elt _load i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _load
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _load (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _load i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass openhand::ReadLoad
  :super ros::object
  :slots ())

(setf (get openhand::ReadLoad :md5sum-) "484bc5de2725aa512e1b0578d3e540c4")
(setf (get openhand::ReadLoad :datatype-) "openhand/ReadLoad")
(setf (get openhand::ReadLoad :request) openhand::ReadLoadRequest)
(setf (get openhand::ReadLoad :response) openhand::ReadLoadResponse)

(defmethod openhand::ReadLoadRequest
  (:response () (instance openhand::ReadLoadResponse :init)))

(setf (get openhand::ReadLoadRequest :md5sum-) "484bc5de2725aa512e1b0578d3e540c4")
(setf (get openhand::ReadLoadRequest :datatype-) "openhand/ReadLoadRequest")
(setf (get openhand::ReadLoadRequest :definition-)
      "---
float32[] load

")

(setf (get openhand::ReadLoadResponse :md5sum-) "484bc5de2725aa512e1b0578d3e540c4")
(setf (get openhand::ReadLoadResponse :datatype-) "openhand/ReadLoadResponse")
(setf (get openhand::ReadLoadResponse :definition-)
      "---
float32[] load

")



(provide :openhand/ReadLoad "484bc5de2725aa512e1b0578d3e540c4")


