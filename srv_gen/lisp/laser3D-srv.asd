
(cl:in-package :asdf)

(defsystem "laser3D-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "srv_hokuyo" :depends-on ("_package_srv_hokuyo"))
    (:file "_package_srv_hokuyo" :depends-on ("_package"))
    (:file "srv_dynamixel" :depends-on ("_package_srv_dynamixel"))
    (:file "_package_srv_dynamixel" :depends-on ("_package"))
    (:file "srv_laser" :depends-on ("_package_srv_laser"))
    (:file "_package_srv_laser" :depends-on ("_package"))
  ))