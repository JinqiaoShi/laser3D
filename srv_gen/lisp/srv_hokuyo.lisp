; Auto-generated. Do not edit!


(cl:in-package laser3D-srv)


;//! \htmlinclude srv_hokuyo-request.msg.html

(cl:defclass <srv_hokuyo-request> (roslisp-msg-protocol:ros-message)
  ((option
    :reader option
    :initarg :option
    :type cl:integer
    :initform 0)
   (anguloMax
    :reader anguloMax
    :initarg :anguloMax
    :type cl:fixnum
    :initform 0)
   (anguloMin
    :reader anguloMin
    :initarg :anguloMin
    :type cl:fixnum
    :initform 0))
)

(cl:defclass srv_hokuyo-request (<srv_hokuyo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <srv_hokuyo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'srv_hokuyo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser3D-srv:<srv_hokuyo-request> is deprecated: use laser3D-srv:srv_hokuyo-request instead.")))

(cl:ensure-generic-function 'option-val :lambda-list '(m))
(cl:defmethod option-val ((m <srv_hokuyo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:option-val is deprecated.  Use laser3D-srv:option instead.")
  (option m))

(cl:ensure-generic-function 'anguloMax-val :lambda-list '(m))
(cl:defmethod anguloMax-val ((m <srv_hokuyo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:anguloMax-val is deprecated.  Use laser3D-srv:anguloMax instead.")
  (anguloMax m))

(cl:ensure-generic-function 'anguloMin-val :lambda-list '(m))
(cl:defmethod anguloMin-val ((m <srv_hokuyo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:anguloMin-val is deprecated.  Use laser3D-srv:anguloMin instead.")
  (anguloMin m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <srv_hokuyo-request>) ostream)
  "Serializes a message object of type '<srv_hokuyo-request>"
  (cl:let* ((signed (cl:slot-value msg 'option)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'anguloMax)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'anguloMax)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'anguloMin)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'anguloMin)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <srv_hokuyo-request>) istream)
  "Deserializes a message object of type '<srv_hokuyo-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'option) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'anguloMax)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'anguloMax)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'anguloMin)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'anguloMin)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<srv_hokuyo-request>)))
  "Returns string type for a service object of type '<srv_hokuyo-request>"
  "laser3D/srv_hokuyoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'srv_hokuyo-request)))
  "Returns string type for a service object of type 'srv_hokuyo-request"
  "laser3D/srv_hokuyoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<srv_hokuyo-request>)))
  "Returns md5sum for a message object of type '<srv_hokuyo-request>"
  "48336f725d274fc7ff2ad04d604a6602")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'srv_hokuyo-request)))
  "Returns md5sum for a message object of type 'srv_hokuyo-request"
  "48336f725d274fc7ff2ad04d604a6602")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<srv_hokuyo-request>)))
  "Returns full string definition for message of type '<srv_hokuyo-request>"
  (cl:format cl:nil "int64 option~%uint16 anguloMax~%uint16 anguloMin~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'srv_hokuyo-request)))
  "Returns full string definition for message of type 'srv_hokuyo-request"
  (cl:format cl:nil "int64 option~%uint16 anguloMax~%uint16 anguloMin~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <srv_hokuyo-request>))
  (cl:+ 0
     8
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <srv_hokuyo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'srv_hokuyo-request
    (cl:cons ':option (option msg))
    (cl:cons ':anguloMax (anguloMax msg))
    (cl:cons ':anguloMin (anguloMin msg))
))
;//! \htmlinclude srv_hokuyo-response.msg.html

(cl:defclass <srv_hokuyo-response> (roslisp-msg-protocol:ros-message)
  ((feedback
    :reader feedback
    :initarg :feedback
    :type cl:string
    :initform ""))
)

(cl:defclass srv_hokuyo-response (<srv_hokuyo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <srv_hokuyo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'srv_hokuyo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser3D-srv:<srv_hokuyo-response> is deprecated: use laser3D-srv:srv_hokuyo-response instead.")))

(cl:ensure-generic-function 'feedback-val :lambda-list '(m))
(cl:defmethod feedback-val ((m <srv_hokuyo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser3D-srv:feedback-val is deprecated.  Use laser3D-srv:feedback instead.")
  (feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <srv_hokuyo-response>) ostream)
  "Serializes a message object of type '<srv_hokuyo-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'feedback))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'feedback))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <srv_hokuyo-response>) istream)
  "Deserializes a message object of type '<srv_hokuyo-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'feedback) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'feedback) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<srv_hokuyo-response>)))
  "Returns string type for a service object of type '<srv_hokuyo-response>"
  "laser3D/srv_hokuyoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'srv_hokuyo-response)))
  "Returns string type for a service object of type 'srv_hokuyo-response"
  "laser3D/srv_hokuyoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<srv_hokuyo-response>)))
  "Returns md5sum for a message object of type '<srv_hokuyo-response>"
  "48336f725d274fc7ff2ad04d604a6602")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'srv_hokuyo-response)))
  "Returns md5sum for a message object of type 'srv_hokuyo-response"
  "48336f725d274fc7ff2ad04d604a6602")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<srv_hokuyo-response>)))
  "Returns full string definition for message of type '<srv_hokuyo-response>"
  (cl:format cl:nil "string feedback~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'srv_hokuyo-response)))
  "Returns full string definition for message of type 'srv_hokuyo-response"
  (cl:format cl:nil "string feedback~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <srv_hokuyo-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'feedback))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <srv_hokuyo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'srv_hokuyo-response
    (cl:cons ':feedback (feedback msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'srv_hokuyo)))
  'srv_hokuyo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'srv_hokuyo)))
  'srv_hokuyo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'srv_hokuyo)))
  "Returns string type for a service object of type '<srv_hokuyo>"
  "laser3D/srv_hokuyo")