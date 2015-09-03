; Auto-generated. Do not edit!


(cl:in-package laser3D-srv)


;//! \htmlinclude srv_laser-request.msg.html

(cl:defclass <srv_laser-request> (roslisp-msg-protocol:ros-message)
  ((positionSpeed
    :reader positionSpeed
    :initarg :positionSpeed
    :type cl:fixnum
    :initform 0)
   (measureSpeed
    :reader measureSpeed
    :initarg :measureSpeed
    :type cl:fixnum
    :initform 0)
   (initialPosition
    :reader initialPosition
    :initarg :initialPosition
    :type cl:float
    :initform 0.0)
   (finalPosition
    :reader finalPosition
    :initarg :finalPosition
    :type cl:float
    :initform 0.0)
   (anguloMin
    :reader anguloMin
    :initarg :anguloMin
    :type cl:integer
    :initform 0)
   (anguloMax
    :reader anguloMax
    :initarg :anguloMax
    :type cl:integer
    :initform 0)
   (rangoMin
    :reader rangoMin
    :initarg :rangoMin
    :type cl:integer
    :initform 0)
   (rangoMax
    :reader rangoMax
    :initarg :rangoMax
    :type cl:integer
    :initform 0))
)

(cl:defclass srv_laser-request (<srv_laser-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <srv_laser-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'srv_laser-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser3D-srv:<srv_laser-request> is deprecated: use laser3D-srv:srv_laser-request instead.")))

(cl:ensure-generic-function 'positionSpeed-val :lambda-list '(m))
(cl:defmethod positionSpeed-val ((m <srv_laser-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:positionSpeed-val is deprecated.  Use laser3D-srv:positionSpeed instead.")
  (positionSpeed m))

(cl:ensure-generic-function 'measureSpeed-val :lambda-list '(m))
(cl:defmethod measureSpeed-val ((m <srv_laser-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:measureSpeed-val is deprecated.  Use laser3D-srv:measureSpeed instead.")
  (measureSpeed m))

(cl:ensure-generic-function 'initialPosition-val :lambda-list '(m))
(cl:defmethod initialPosition-val ((m <srv_laser-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:initialPosition-val is deprecated.  Use laser3D-srv:initialPosition instead.")
  (initialPosition m))

(cl:ensure-generic-function 'finalPosition-val :lambda-list '(m))
(cl:defmethod finalPosition-val ((m <srv_laser-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:finalPosition-val is deprecated.  Use laser3D-srv:finalPosition instead.")
  (finalPosition m))

(cl:ensure-generic-function 'anguloMin-val :lambda-list '(m))
(cl:defmethod anguloMin-val ((m <srv_laser-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:anguloMin-val is deprecated.  Use laser3D-srv:anguloMin instead.")
  (anguloMin m))

(cl:ensure-generic-function 'anguloMax-val :lambda-list '(m))
(cl:defmethod anguloMax-val ((m <srv_laser-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:anguloMax-val is deprecated.  Use laser3D-srv:anguloMax instead.")
  (anguloMax m))

(cl:ensure-generic-function 'rangoMin-val :lambda-list '(m))
(cl:defmethod rangoMin-val ((m <srv_laser-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:rangoMin-val is deprecated.  Use laser3D-srv:rangoMin instead.")
  (rangoMin m))

(cl:ensure-generic-function 'rangoMax-val :lambda-list '(m))
(cl:defmethod rangoMax-val ((m <srv_laser-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:rangoMax-val is deprecated.  Use laser3D-srv:rangoMax instead.")
  (rangoMax m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <srv_laser-request>) ostream)
  "Serializes a message object of type '<srv_laser-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'positionSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'positionSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'measureSpeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'measureSpeed)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'initialPosition))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'finalPosition))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'anguloMin)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'anguloMax)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'rangoMin)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'rangoMax)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <srv_laser-request>) istream)
  "Deserializes a message object of type '<srv_laser-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'positionSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'positionSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'measureSpeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'measureSpeed)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'initialPosition) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'finalPosition) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'anguloMin) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'anguloMax) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rangoMin) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rangoMax) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<srv_laser-request>)))
  "Returns string type for a service object of type '<srv_laser-request>"
  "laser3D/srv_laserRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'srv_laser-request)))
  "Returns string type for a service object of type 'srv_laser-request"
  "laser3D/srv_laserRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<srv_laser-request>)))
  "Returns md5sum for a message object of type '<srv_laser-request>"
  "d5cf0661b99b7c01f73b9beb405351dc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'srv_laser-request)))
  "Returns md5sum for a message object of type 'srv_laser-request"
  "d5cf0661b99b7c01f73b9beb405351dc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<srv_laser-request>)))
  "Returns full string definition for message of type '<srv_laser-request>"
  (cl:format cl:nil "uint16 positionSpeed~%uint16 measureSpeed~%float32 initialPosition~%float32 finalPosition~%int64 anguloMin~%int64 anguloMax~%int64 rangoMin~%int64 rangoMax~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'srv_laser-request)))
  "Returns full string definition for message of type 'srv_laser-request"
  (cl:format cl:nil "uint16 positionSpeed~%uint16 measureSpeed~%float32 initialPosition~%float32 finalPosition~%int64 anguloMin~%int64 anguloMax~%int64 rangoMin~%int64 rangoMax~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <srv_laser-request>))
  (cl:+ 0
     2
     2
     4
     4
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <srv_laser-request>))
  "Converts a ROS message object to a list"
  (cl:list 'srv_laser-request
    (cl:cons ':positionSpeed (positionSpeed msg))
    (cl:cons ':measureSpeed (measureSpeed msg))
    (cl:cons ':initialPosition (initialPosition msg))
    (cl:cons ':finalPosition (finalPosition msg))
    (cl:cons ':anguloMin (anguloMin msg))
    (cl:cons ':anguloMax (anguloMax msg))
    (cl:cons ':rangoMin (rangoMin msg))
    (cl:cons ':rangoMax (rangoMax msg))
))
;//! \htmlinclude srv_laser-response.msg.html

(cl:defclass <srv_laser-response> (roslisp-msg-protocol:ros-message)
  ((cloud
    :reader cloud
    :initarg :cloud
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass srv_laser-response (<srv_laser-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <srv_laser-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'srv_laser-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser3D-srv:<srv_laser-response> is deprecated: use laser3D-srv:srv_laser-response instead.")))

(cl:ensure-generic-function 'cloud-val :lambda-list '(m))
(cl:defmethod cloud-val ((m <srv_laser-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:cloud-val is deprecated.  Use laser3D-srv:cloud instead.")
  (cloud m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <srv_laser-response>) ostream)
  "Serializes a message object of type '<srv_laser-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cloud) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <srv_laser-response>) istream)
  "Deserializes a message object of type '<srv_laser-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cloud) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<srv_laser-response>)))
  "Returns string type for a service object of type '<srv_laser-response>"
  "laser3D/srv_laserResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'srv_laser-response)))
  "Returns string type for a service object of type 'srv_laser-response"
  "laser3D/srv_laserResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<srv_laser-response>)))
  "Returns md5sum for a message object of type '<srv_laser-response>"
  "d5cf0661b99b7c01f73b9beb405351dc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'srv_laser-response)))
  "Returns md5sum for a message object of type 'srv_laser-response"
  "d5cf0661b99b7c01f73b9beb405351dc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<srv_laser-response>)))
  "Returns full string definition for message of type '<srv_laser-response>"
  (cl:format cl:nil "sensor_msgs/PointCloud2 cloud~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'srv_laser-response)))
  "Returns full string definition for message of type 'srv_laser-response"
  (cl:format cl:nil "sensor_msgs/PointCloud2 cloud~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <srv_laser-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cloud))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <srv_laser-response>))
  "Converts a ROS message object to a list"
  (cl:list 'srv_laser-response
    (cl:cons ':cloud (cloud msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'srv_laser)))
  'srv_laser-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'srv_laser)))
  'srv_laser-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'srv_laser)))
  "Returns string type for a service object of type '<srv_laser>"
  "laser3D/srv_laser")