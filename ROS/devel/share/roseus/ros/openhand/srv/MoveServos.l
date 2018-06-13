;; Auto-generated. Do not edit!


(when (boundp 'openhand::MoveServos)
  (if (not (find-package "OPENHAND"))
    (make-package "OPENHAND"))
  (shadow 'MoveServos (find-package "OPENHAND")))
(unless (find-package "OPENHAND::MOVESERVOS")
  (make-package "OPENHAND::MOVESERVOS"))
(unless (find-package "OPENHAND::MOVESERVOSREQUEST")
  (make-package "OPENHAND::MOVESERVOSREQUEST"))
(unless (find-package "OPENHAND::MOVESERVOSRESPONSE")
  (make-package "OPENHAND::MOVESERVOSRESPONSE"))

(in-package "ROS")





(defclass openhand::MoveServosRequest
  :super ros::object
  :slots (_pos ))

(defmethod openhand::MoveServosRequest
  (:init
   (&key
    ((:pos __pos) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _pos __pos)
   self)
  (:pos
   (&optional __pos)
   (if __pos (setq _pos __pos)) _pos)
  (:serialization-length
   ()
   (+
    ;; float32[] _pos
    (* 4    (length _pos)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _pos
     (write-long (length _pos) s)
     (dotimes (i (length _pos))
       (sys::poke (elt _pos i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _pos
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pos (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pos i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass openhand::MoveServosResponse
  :super ros::object
  :slots (_err ))

(defmethod openhand::MoveServosResponse
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

(defclass openhand::MoveServos
  :super ros::object
  :slots ())

(setf (get openhand::MoveServos :md5sum-) "183031e0becb89936a926d61b84a7478")
(setf (get openhand::MoveServos :datatype-) "openhand/MoveServos")
(setf (get openhand::MoveServos :request) openhand::MoveServosRequest)
(setf (get openhand::MoveServos :response) openhand::MoveServosResponse)

(defmethod openhand::MoveServosRequest
  (:response () (instance openhand::MoveServosResponse :init)))

(setf (get openhand::MoveServosRequest :md5sum-) "183031e0becb89936a926d61b84a7478")
(setf (get openhand::MoveServosRequest :datatype-) "openhand/MoveServosRequest")
(setf (get openhand::MoveServosRequest :definition-)
      "float32[] pos
---
int32 err

")

(setf (get openhand::MoveServosResponse :md5sum-) "183031e0becb89936a926d61b84a7478")
(setf (get openhand::MoveServosResponse :datatype-) "openhand/MoveServosResponse")
(setf (get openhand::MoveServosResponse :definition-)
      "float32[] pos
---
int32 err

")



(provide :openhand/MoveServos "183031e0becb89936a926d61b84a7478")


