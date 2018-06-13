;; Auto-generated. Do not edit!


(when (boundp 'common_msgs_gl::PointArray)
  (if (not (find-package "COMMON_MSGS_GL"))
    (make-package "COMMON_MSGS_GL"))
  (shadow 'PointArray (find-package "COMMON_MSGS_GL")))
(unless (find-package "COMMON_MSGS_GL::POINTARRAY")
  (make-package "COMMON_MSGS_GL::POINTARRAY"))

(in-package "ROS")
;;//! \htmlinclude PointArray.msg.html


(defclass common_msgs_gl::PointArray
  :super ros::object
  :slots (_x _y ))

(defmethod common_msgs_gl::PointArray
  (:init
   (&key
    ((:x __x) (make-array 0 :initial-element 0 :element-type :integer))
    ((:y __y) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _x __x)
   (setq _y __y)
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; int32[] _x
    (* 4    (length _x)) 4
    ;; int32[] _y
    (* 4    (length _y)) 4
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
   ;;
   self)
  )

(setf (get common_msgs_gl::PointArray :md5sum-) "2d02d5b87dd0a8706354704c31a3c30e")
(setf (get common_msgs_gl::PointArray :datatype-) "common_msgs_gl/PointArray")
(setf (get common_msgs_gl::PointArray :definition-)
      "int32[] x
int32[] y

")



(provide :common_msgs_gl/PointArray "2d02d5b87dd0a8706354704c31a3c30e")


