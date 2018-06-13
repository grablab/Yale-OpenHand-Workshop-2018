;; Auto-generated. Do not edit!


(when (boundp 'openhand::HoldServos)
  (if (not (find-package "OPENHAND"))
    (make-package "OPENHAND"))
  (shadow 'HoldServos (find-package "OPENHAND")))
(unless (find-package "OPENHAND::HOLDSERVOS")
  (make-package "OPENHAND::HOLDSERVOS"))
(unless (find-package "OPENHAND::HOLDSERVOSREQUEST")
  (make-package "OPENHAND::HOLDSERVOSREQUEST"))
(unless (find-package "OPENHAND::HOLDSERVOSRESPONSE")
  (make-package "OPENHAND::HOLDSERVOSRESPONSE"))

(in-package "ROS")





(defclass openhand::HoldServosRequest
  :super ros::object
  :slots (_offset_scale ))

(defmethod openhand::HoldServosRequest
  (:init
   (&key
    ((:offset_scale __offset_scale) 0)
    )
   (send-super :init)
   (setq _offset_scale (round __offset_scale))
   self)
  (:offset_scale
   (&optional __offset_scale)
   (if __offset_scale (setq _offset_scale __offset_scale)) _offset_scale)
  (:serialization-length
   ()
   (+
    ;; int32 _offset_scale
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _offset_scale
       (write-long _offset_scale s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _offset_scale
     (setq _offset_scale (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass openhand::HoldServosResponse
  :super ros::object
  :slots (_err ))

(defmethod openhand::HoldServosResponse
  (:init
   (&key
    ((:err __err) 0)
    )
   (send-super :init)
   (setq _err (round __err))
   self)
  (:err
   (&optional __err)
   (if __err (setq _err __err)) _err)
  (:serialization-length
   ()
   (+
    ;; int32 _err
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _err
       (write-long _err s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _err
     (setq _err (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass openhand::HoldServos
  :super ros::object
  :slots ())

(setf (get openhand::HoldServos :md5sum-) "9012ec588f6488638f420162efc2fcb2")
(setf (get openhand::HoldServos :datatype-) "openhand/HoldServos")
(setf (get openhand::HoldServos :request) openhand::HoldServosRequest)
(setf (get openhand::HoldServos :response) openhand::HoldServosResponse)

(defmethod openhand::HoldServosRequest
  (:response () (instance openhand::HoldServosResponse :init)))

(setf (get openhand::HoldServosRequest :md5sum-) "9012ec588f6488638f420162efc2fcb2")
(setf (get openhand::HoldServosRequest :datatype-) "openhand/HoldServosRequest")
(setf (get openhand::HoldServosRequest :definition-)
      "int32 offset_scale
---
int32 err

")

(setf (get openhand::HoldServosResponse :md5sum-) "9012ec588f6488638f420162efc2fcb2")
(setf (get openhand::HoldServosResponse :datatype-) "openhand/HoldServosResponse")
(setf (get openhand::HoldServosResponse :definition-)
      "int32 offset_scale
---
int32 err

")



(provide :openhand/HoldServos "9012ec588f6488638f420162efc2fcb2")


