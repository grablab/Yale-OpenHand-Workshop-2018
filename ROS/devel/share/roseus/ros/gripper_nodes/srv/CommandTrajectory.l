;; Auto-generated. Do not edit!


(when (boundp 'gripper_nodes::CommandTrajectory)
  (if (not (find-package "GRIPPER_NODES"))
    (make-package "GRIPPER_NODES"))
  (shadow 'CommandTrajectory (find-package "GRIPPER_NODES")))
(unless (find-package "GRIPPER_NODES::COMMANDTRAJECTORY")
  (make-package "GRIPPER_NODES::COMMANDTRAJECTORY"))
(unless (find-package "GRIPPER_NODES::COMMANDTRAJECTORYREQUEST")
  (make-package "GRIPPER_NODES::COMMANDTRAJECTORYREQUEST"))
(unless (find-package "GRIPPER_NODES::COMMANDTRAJECTORYRESPONSE")
  (make-package "GRIPPER_NODES::COMMANDTRAJECTORYRESPONSE"))

(in-package "ROS")





(defclass gripper_nodes::CommandTrajectoryRequest
  :super ros::object
  :slots (_pos _speed ))

(defmethod gripper_nodes::CommandTrajectoryRequest
  (:init
   (&key
    ((:pos __pos) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _pos __pos)
   (setq _speed (float __speed))
   self)
  (:pos
   (&optional __pos)
   (if __pos (setq _pos __pos)) _pos)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; float64[] _pos
    (* 8    (length _pos)) 4
    ;; float64 _speed
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _pos
     (write-long (length _pos) s)
     (dotimes (i (length _pos))
       (sys::poke (elt _pos i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _pos
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pos (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pos i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass gripper_nodes::CommandTrajectoryResponse
  :super ros::object
  :slots ())

(defmethod gripper_nodes::CommandTrajectoryResponse
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

(defclass gripper_nodes::CommandTrajectory
  :super ros::object
  :slots ())

(setf (get gripper_nodes::CommandTrajectory :md5sum-) "0b7d86359979bf7cfc9d521b2deb7302")
(setf (get gripper_nodes::CommandTrajectory :datatype-) "gripper_nodes/CommandTrajectory")
(setf (get gripper_nodes::CommandTrajectory :request) gripper_nodes::CommandTrajectoryRequest)
(setf (get gripper_nodes::CommandTrajectory :response) gripper_nodes::CommandTrajectoryResponse)

(defmethod gripper_nodes::CommandTrajectoryRequest
  (:response () (instance gripper_nodes::CommandTrajectoryResponse :init)))

(setf (get gripper_nodes::CommandTrajectoryRequest :md5sum-) "0b7d86359979bf7cfc9d521b2deb7302")
(setf (get gripper_nodes::CommandTrajectoryRequest :datatype-) "gripper_nodes/CommandTrajectoryRequest")
(setf (get gripper_nodes::CommandTrajectoryRequest :definition-)
      "float64[] pos
float64 speed
---

")

(setf (get gripper_nodes::CommandTrajectoryResponse :md5sum-) "0b7d86359979bf7cfc9d521b2deb7302")
(setf (get gripper_nodes::CommandTrajectoryResponse :datatype-) "gripper_nodes/CommandTrajectoryResponse")
(setf (get gripper_nodes::CommandTrajectoryResponse :definition-)
      "float64[] pos
float64 speed
---

")



(provide :gripper_nodes/CommandTrajectory "0b7d86359979bf7cfc9d521b2deb7302")


