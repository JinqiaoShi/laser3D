; Auto-generated. Do not edit!


(cl:in-package laser3D-srv)


;//! \htmlinclude srv_dynamixel-request.msg.html

(cl:defclass <srv_dynamixel-request> (roslisp-msg-protocol:ros-message)
  ((position_i
    :reader position_i
    :initarg :position_i
    :type cl:float
    :initform 0.0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:fixnum
    :initform 0))
)

(cl:defclass srv_dynamixel-request (<srv_dynamixel-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <srv_dynamixel-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'srv_dynamixel-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser3D-srv:<srv_dynamixel-request> is deprecated: use laser3D-srv:srv_dynamixel-request instead.")))

(cl:ensure-generic-function 'position_i-val :lambda-list '(m))
(cl:defmethod position_i-val ((m <srv_dynamixel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:position_i-val is deprecated.  Use laser3D-srv:position_i instead.")
  (position_i m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <srv_dynamixel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:speed-val is deprecated.  Use laser3D-srv:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <srv_dynamixel-request>) ostream)
  "Serializes a message object of type '<srv_dynamixel-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'position_i))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <srv_dynamixel-request>) istream)
  "Deserializes a message object of type '<srv_dynamixel-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position_i) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<srv_dynamixel-request>)))
  "Returns string type for a service object of type '<srv_dynamixel-request>"
  "laser3D/srv_dynamixelRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'srv_dynamixel-request)))
  "Returns string type for a service object of type 'srv_dynamixel-request"
  "laser3D/srv_dynamixelRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<srv_dynamixel-request>)))
  "Returns md5sum for a message object of type '<srv_dynamixel-request>"
  "69076158aca1b0bc98d7a49fe2858405")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'srv_dynamixel-request)))
  "Returns md5sum for a message object of type 'srv_dynamixel-request"
  "69076158aca1b0bc98d7a49fe2858405")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<srv_dynamixel-request>)))
  "Returns full string definition for message of type '<srv_dynamixel-request>"
  (cl:format cl:nil "float32 position_i~%uint16 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'srv_dynamixel-request)))
  "Returns full string definition for message of type 'srv_dynamixel-request"
  (cl:format cl:nil "float32 position_i~%uint16 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <srv_dynamixel-request>))
  (cl:+ 0
     4
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <srv_dynamixel-request>))
  "Converts a ROS message object to a list"
  (cl:list 'srv_dynamixel-request
    (cl:cons ':position_i (position_i msg))
    (cl:cons ':speed (speed msg))
))
;//! \htmlinclude srv_dynamixel-response.msg.html

(cl:defclass <srv_dynamixel-response> (roslisp-msg-protocol:ros-message)
  ((position_o
    :reader position_o
    :initarg :position_o
    :type cl:float
    :initform 0.0)
   (work
    :reader work
    :initarg :work
    :type cl:fixnum
    :initform 0)
   (comm
    :reader comm
    :initarg :comm
    :type cl:fixnum
    :initform 0))
)

(cl:defclass srv_dynamixel-response (<srv_dynamixel-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <srv_dynamixel-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'srv_dynamixel-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser3D-srv:<srv_dynamixel-response> is deprecated: use laser3D-srv:srv_dynamixel-response instead.")))

(cl:ensure-generic-function 'position_o-val :lambda-list '(m))
(cl:defmethod position_o-val ((m <srv_dynamixel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:position_o-val is deprecated.  Use laser3D-srv:position_o instead.")
  (position_o m))

(cl:ensure-generic-function 'work-val :lambda-list '(m))
(cl:defmethod work-val ((m <srv_dynamixel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:work-val is deprecated.  Use laser3D-srv:work instead.")
  (work m))

(cl:ensure-generic-function 'comm-val :lambda-list '(m))
(cl:defmethod comm-val ((m <srv_dynamixel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:comm-val is deprecated.  Use laser3D-srv:comm instead.")
  (comm m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <srv_dynamixel-response>) ostream)
  "Serializes a message object of type '<srv_dynamixel-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'position_o))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'work)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'work)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'comm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'comm)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <srv_dynamixel-response>) istream)
  "Deserializes a message object of type '<srv_dynamixel-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position_o) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'work)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'work)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'comm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'comm)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<srv_dynamixel-response>)))
  "Returns string type for a service object of type '<srv_dynamixel-response>"
  "laser3D/srv_dynamixelResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'srv_dynamixel-response)))
  "Returns string type for a service object of type 'srv_dynamixel-response"
  "laser3D/srv_dynamixelResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<srv_dynamixel-response>)))
  "Returns md5sum for a message object of type '<srv_dynamixel-response>"
  "69076158aca1b0bc98d7a49fe2858405")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'srv_dynamixel-response)))
  "Returns md5sum for a message object of type 'srv_dynamixel-response"
  "69076158aca1b0bc98d7a49fe2858405")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<srv_dynamixel-response>)))
  "Returns full string definition for message of type '<srv_dynamixel-response>"
  (cl:format cl:nil "float32 position_o~%uint16 work~%uint16 comm~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'srv_dynamixel-response)))
  "Returns full string definition for message of type 'srv_dynamixel-response"
  (cl:format cl:nil "float32 position_o~%uint16 work~%uint16 comm~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <srv_dynamixel-response>))
  (cl:+ 0
     4
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <srv_dynamixel-response>))
  "Converts a ROS message object to a list"
  (cl:list 'srv_dynamixel-response
    (cl:cons ':position_o (position_o msg))
    (cl:cons ':work (work msg))
    (cl:cons ':comm (comm msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'srv_dynamixel)))
  'srv_dynamixel-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'srv_dynamixel)))
  'srv_dynamixel-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'srv_dynamixel)))
  "Returns string type for a service object of type '<srv_dynamixel>"
  "laser3D/srv_dynamixel")