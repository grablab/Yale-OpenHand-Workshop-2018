
(cl:in-package :asdf)

(defsystem "gripper_nodes-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CommandTrajectory" :depends-on ("_package_CommandTrajectory"))
    (:file "_package_CommandTrajectory" :depends-on ("_package"))
  ))