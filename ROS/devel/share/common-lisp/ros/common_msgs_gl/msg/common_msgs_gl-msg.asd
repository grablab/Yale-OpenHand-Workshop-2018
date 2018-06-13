
(cl:in-package :asdf)

(defsystem "common_msgs_gl-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PointArray" :depends-on ("_package_PointArray"))
    (:file "_package_PointArray" :depends-on ("_package"))
    (:file "PointArray3D" :depends-on ("_package_PointArray3D"))
    (:file "_package_PointArray3D" :depends-on ("_package"))
  ))