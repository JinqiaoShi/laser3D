#include <iostream>
#include <stdio.h>	

#include <cmath>
#include "motordynamixel.h"
#include <sstream>
//#include <tinyxml.h>
#include "ros/ros.h"
#include "laser3D/srv_dynamixel.h"
//#include "laser3D/motor.h"
//#include "laser3D/srv_dynamixel_move.h"
//#include "laser3D/srv_dynamixel_position.h"
//#include "laser3D/srv_dynamixel_errors.h"
//#include "std_msgs/Float32.h"

using namespace std;


MotorDynamixel motor; //Global variable??


 //Service to move motor
 bool serverMove(laser3D::srv_dynamixel::Request  &req, laser3D::srv_dynamixel::Response &res)
 {

   //ROS_INFO("Posicion selec: %f, Velocidad selec: %d", (float)req.position_i, (unsigned int)req.speed);
   motor.moveToPosSpeed((float)req.position_i , (int)req.speed);
   return true;
 }

 //Service to recive the position
 bool serverPosition(laser3D::srv_dynamixel::Request &req, laser3D::srv_dynamixel::Response &res)
 {
   res.position_o=motor.getPosDeg();
	//ROS_INFO("Posicion: %f", res.position_o);
   return true;
 }
 

 //service to recive the motor errors 
 bool serverErrors(laser3D::srv_dynamixel::Request &req, laser3D::srv_dynamixel::Response &res)
 {

//	ROS_INFO("Work errors: %u", motor.printWorkError());
	res.work=motor.printWorkError(); 
//	ROS_INFO("Comm errors: %u", motor.printCommError());  //%u????
	res.comm=motor.printCommError();
	return true;
 }


 
 int main(int argc, char **argv)
 {

   ros::init(argc, argv, "nodo_dynamixel");
   ros::NodeHandle n;
	ros::NodeHandle nh("~");
   ros::ServiceServer service_move = n.advertiseService("srv_move", serverMove);
   ros::ServiceServer service_position = n.advertiseService("srv_position", serverPosition);
   ros::ServiceServer service_errors = n.advertiseService("srv_errors", serverErrors);
	
   //Initializing the device with ID 1.	
    int port,motorid;
	nh.getParam("portUSB", port);	
    nh.getParam("MOTORID", motorid);
    if(motor.initMotor(motorid))
   //if(motor.initMotor(atoi (port.c_str())))
	//if(motor.initMotor(port)) 
   {
	cout<<"Failed to open USB2Dynamixel!"<<endl;
	return 0;
   }
   else
   {
	cout<<"succeed to open USB2Dynamixel!"<<endl;
    cerr << "pos" << motor.getPos()<<endl;
   } 

/*	std_msgs::Float32 position;	

	while (ros::ok())
	{

		if(motor.getMovement())
		{
		position.data=motor.getPosDeg();
		pub_dynamixel.publish(position);
		}

		ros::spinOnce();

	}
*/

   ros::spin();
   return 0;
 }

