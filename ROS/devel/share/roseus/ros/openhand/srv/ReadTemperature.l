;; Auto-generated. Do not edit!


(when (boundp 'openhand::ReadTemperature)
  (if (not (find-package "OPENHAND"))
    (make-package "OPENHAND"))
  (shadow 'ReadTemperature (find-package "OPENHAND")))
(unless (find-package "OPENHAND::READTEMPERATURE")
  (make-package "OPENHAND::READTEMPERATURE"))
(unless (find-package "OPENHAND::READTEMPERATUREREQUEST")
  (make-package "OPENHAND::READTEMPERATUREREQUEST"))
(unless (find-package "OPENHAND::READTEMPERATURERESPONSE")
  (make-package "OPENHAND::READTEMPERATURERESPONSE"))

(in-package "ROS")





(defclass openhand::ReadTemperatureRequest
  :super ros::object
  :slots ())

(defmethod openhand::ReadTemperatureRequest
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

(defclass openhand::ReadTemperatureResponse
  :super ros::object
  :slots (_temp ))

(defmethod openhand::ReadTemperatureResponse
  (:init
   (&key
    ((:temp __temp) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _temp __temp)
   self)
  (:temp
   (&optional __temp)
   (if __temp (setq _temp __temp)) _temp)
  (:serialization-length
   ()
   (+
    ;; float32[] _temp
    (* 4    (length _temp)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _temp
     (write-long (length _temp) s)
     (dotimes (i (length _temp))
       (sys::poke (elt _temp i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _temp
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _temp (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _temp i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass openhand::ReadTemperature
  :super ros::object
  :slots ())

(setf (get openhand::ReadTemperature :md5sum-) "52444e69c3eaa80dd939a5bad6dbe319")
(setf (get openhand::ReadTemperature :datatype-) "openhand/ReadTemperature")
(setf (get openhand::ReadTemperature :request) openhand::ReadTemperatureRequest)
(setf (get openhand::ReadTemperature :response) openhand::ReadTemperatureResponse)

(defmethod openhand::ReadTemperatureRequest
  (:response () (instance openhand::ReadTemperatureResponse :init)))

(setf (get openhand::ReadTemperatureRequest :md5sum-) "52444e69c3eaa80dd939a5bad6dbe319")
(setf (get openhand::ReadTemperatureRequest :datatype-) "openhand/ReadTemperatureRequest")
(setf (get openhand::ReadTemperatureRequest :definition-)
      "---
float32[] temp

")

(setf (get openhand::ReadTemperatureResponse :md5sum-) "52444e69c3eaa80dd939a5bad6dbe319")
(setf (get openhand::ReadTemperatureResponse :datatype-) "openhand/ReadTemperatureResponse")
(setf (get openhand::ReadTemperatureResponse :definition-)
      "---
float32[] temp

")



(provide :openhand/ReadTemperature "52444e69c3eaa80dd939a5bad6dbe319")


