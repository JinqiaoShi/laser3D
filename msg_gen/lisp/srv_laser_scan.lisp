; Auto-generated. Do not edit!


(cl:in-package laser3D-msg)


;//! \htmlinclude srv_laser_scan.msg.html

(cl:defclass <srv_laser_scan> (roslisp-msg-protocol:ros-message)
  ((hokuyo_scan
    :reader hokuyo_scan
    :initarg :hokuyo_scan
    :type sensor_msgs-msg:LaserScan
    :initform (cl:make-instance 'sensor_msgs-msg:LaserScan)))
)

(cl:defclass srv_laser_scan (<srv_laser_scan>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <srv_laser_scan>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'srv_laser_scan)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser3D-msg:<srv_laser_scan> is deprecated: use laser3D-msg:srv_laser_scan instead.")))

(cl:ensure-generic-function 'hokuyo_scan-val :lambda-list '(m))
(cl:defmethod hokuyo_scan-val ((m <srv_laser_scan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-msg:hokuyo_scan-val is deprecated.  Use laser3D-msg:hokuyo_scan instead.")
  (hokuyo_scan m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <srv_laser_scan>) ostream)
  "Serializes a message object of type '<srv_laser_scan>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'hokuyo_scan) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <srv_laser_scan>) istream)
  "Deserializes a message object of type '<srv_laser_scan>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'hokuyo_scan) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<srv_laser_scan>)))
  "Returns string type for a message object of type '<srv_laser_scan>"
  "laser3D/srv_laser_scan")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'srv_laser_scan)))
  "Returns string type for a message object of type 'srv_laser_scan"
  "laser3D/srv_laser_scan")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<srv_laser_scan>)))
  "Returns md5sum for a message object of type '<srv_laser_scan>"
  "f643de06510a3a2cecb59ae491092270")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'srv_laser_scan)))
  "Returns md5sum for a message object of type 'srv_laser_scan"
  "f643de06510a3a2cecb59ae491092270")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<srv_laser_scan>)))
  "Returns full string definition for message of type '<srv_laser_scan>"
  (cl:format cl:nil "sensor_msgs/LaserScan hokuyo_scan~%~%================================================================================~%MSG: sensor_msgs/LaserScan~%# Single scan from a planar laser range-finder~%#~%# If you have another ranging device with different behavior (e.g. a sonar~%# array), please find or create a different message, since applications~%# will make fairly laser-specific assumptions about this data~%~%Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%                         ~%float32 angle_min        # start angle of the scan [rad]~%float32 angle_max        # end angle of the scan [rad]~%float32 angle_increment  # angular distance between measurements [rad]~%~%float32 time_increment   # time between measurements [seconds] - if your scanner~%                         # is moving, this will be used in interpolating position~%                         # of 3d points~%float32 scan_time        # time between scans [seconds]~%~%float32 range_min        # minimum range value [m]~%float32 range_max        # maximum range value [m]~%~%float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be discarded)~%float32[] intensities    # intensity data [device-specific units].  If your~%                         # device does not provide intensities, please leave~%                         # the array empty.~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'srv_laser_scan)))
  "Returns full string definition for message of type 'srv_laser_scan"
  (cl:format cl:nil "sensor_msgs/LaserScan hokuyo_scan~%~%================================================================================~%MSG: sensor_msgs/LaserScan~%# Single scan from a planar laser range-finder~%#~%# If you have another ranging device with different behavior (e.g. a sonar~%# array), please find or create a different message, since applications~%# will make fairly laser-specific assumptions about this data~%~%Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%                         ~%float32 angle_min        # start angle of the scan [rad]~%float32 angle_max        # end angle of the scan [rad]~%float32 angle_increment  # angular distance between measurements [rad]~%~%float32 time_increment   # time between measurements [seconds] - if your scanner~%                         # is moving, this will be used in interpolating position~%                         # of 3d points~%float32 scan_time        # time between scans [seconds]~%~%float32 range_min        # minimum range value [m]~%float32 range_max        # maximum range value [m]~%~%float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be discarded)~%float32[] intensities    # intensity data [device-specific units].  If your~%                         # device does not provide intensities, please leave~%                         # the array empty.~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <srv_laser_scan>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'hokuyo_scan))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <srv_laser_scan>))
  "Converts a ROS message object to a list"
  (cl:list 'srv_laser_scan
    (cl:cons ':hokuyo_scan (hokuyo_scan msg))
))
