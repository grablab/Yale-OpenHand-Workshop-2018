;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::PointArray3D)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'PointArray3D (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::POINTARRAY3D")
  (make-package "COMMON_MSGS_GL::POINTARRAY3D"))

(in-package "ROS")
;;//! \htmlinclude PointArray3D.msg.html


(defclass common_msgs_gl::PointArray3D
  :super ros::object
  :slots (_x _y _z ))

(defmethod common_msgs_gl::PointArray3D
  (:init
   (&key
    ((:x __x) (make-array 0 :initial-element 0 :element-type :integer))
    ((:y __y) (make-array 0 :initial-element 0 :element-type :integer))
    ((:z __z) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _x __x)
   (setq _y __y)
   (setq _z __z)
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:serialization-length
   ()
   (+
    ;; int32[] _x
    (* 4    (length _x)) 4
    ;; int32[] _y
    (* 4    (length _y)) 4
    ;; int32[] _z
    (* 4    (length _z)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _x
     (write-long (length _x) s)
     (dotimes (i (length _x))
       (write-long (elt _x i) s)
       )
     ;; int32[] _y
     (write-long (length _y) s)
     (dotimes (i (length _y))
       (write-long (elt _y i) s)
       )
     ;; int32[] _z
     (write-long (length _z) s)
     (dotimes (i (length _z))
       (write-long (elt _z i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _x (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _x i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _y (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _y i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _z
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _z (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _z i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get common_msgs_gl::PointArray3D :md5sum-) "f40e33e8ca27d94205ca1e55520fcad2")
(setf (get common_msgs_gl::PointArray3D :datatype-) "common_msgs_gl/PointArray3D")
(setf (get common_msgs_gl::PointArray3D :definition-)
      "int32[] x
int32[] y
int32[] z

")



(provide :common_msgs_gl/PointArray3D "f40e33e8ca27d94205ca1e55520fcad2")


