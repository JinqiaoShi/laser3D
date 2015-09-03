
(cl:in-package :asdf)

(defsystem "laser3D-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "srv_laser_scan" :depends-on ("_package_srv_laser_scan"))
    (:file "_package_srv_laser_scan" :depends-on ("_package"))
  ))