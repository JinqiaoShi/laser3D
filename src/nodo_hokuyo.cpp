#include <iostream>
#include <stdio.h>	
#include "UrgCtrl.h"
#include "RangeSensorParameter.h"
#include <cstdlib>
#include <cstdio>
#include <sensor_msgs/LaserScan.h>
#include "ros/ros.h"
#include "laser3D/srv_hokuyo.h"
#include <sstream>
//#include <tinyxml.h>
using namespace std;
using namespace qrk;


 //const char device[];// = "/dev/ttyACM0";
 UrgCtrl urg;
 bool state=0;
 RangeSensorParameter parameters;

 bool serverHokuyoOnOff(laser3D::srv_hokuyo::Request &req, laser3D::srv_hokuyo::Response &res)
 {

	switch (req.option)
	{
	   case 1:

            state=1;
			//ROS_INFO("ENCENDIDO");
			//urg.setLaserOutput(true);		  	
			break;
		
	   case 0:

			state=0;
			//ROS_INFO("APAGADO");
			//urg.setLaserOutput(false);		  
			break;  
		
		default:
			break;
	}

	return true;
 }

 bool serverHokuyoParametros(laser3D::srv_hokuyo::Request &req, laser3D::srv_hokuyo::Response &res)
	{
		parameters = urg.parameter();
		//cout<<parameters.area_max<<endl;
		//cout<<parameters.area_min<<endl;			

		parameters.area_max=req.anguloMax;
		parameters.area_min=req.anguloMin;
		urg.setParameter(parameters);
		urg.loadParameter();

		//parameters = urg.parameter();
		//cout<<parameters.area_max<<endl;
		//cout<<parameters.area_min<<endl;			
		return true;
	}



 int main(int argc, char **argv)
 {

   //Init ROS
   ros::init(argc, argv, "nodo_hokuyo");
   ros::NodeHandle n;
	ros::NodeHandle nh("~");
   ros::ServiceServer ser_hokuyo = n.advertiseService("srv_hokuyo", serverHokuyoOnOff);
   ros::ServiceServer ser_parametros = n.advertiseService("srv_parameter", serverHokuyoParametros);	
   ros::Publisher pup_hokuyo = n.advertise<sensor_msgs::LaserScan>("topic_hokuyo", 1);
     
	
	//string port;
	//nh.getParam("portACM", port); //Puerto /dev/ttyACM0 convertido a traves de udev a /dev/laser
	const char port[] = "/dev/ttyACM0";	
    if (! urg.connect(port))
	//if (! urg.connect(port.c_str())) 
	{    
    ROS_ERROR("UrgCtrl::connect: %s\n", urg.what());
    exit(1);
    }


	  //Lectura parametros laser
/*   parameters = urg.parameter();
	  printf("model: %s\n", parameters.model.c_str());
	  printf("distance_min: %ld\n", parameters.distance_min);
	  printf("distance_max: %ld\n", parameters.distance_max);
	  printf("area_total: %d\n", parameters.area_total);
	  printf("area_min: %d\n", parameters.area_min);
	  printf("area_max: %d\n", parameters.area_max);
	  printf("area_front: %d\n", parameters.area_front);
	  printf("scan_rpm: %d\n", parameters.scan_rpm);
*/

   //Variables
   sensor_msgs::LaserScan scan;
   vector<long> data;
   long timestamp = 0;
	

   //Bucle
   while (ros::ok())
   {

      if (state==1)
		{
			int m = urg.capture(data, &timestamp);
			scan.ranges.resize((float)(m)); //Modificate size ranges	
			
			//Se guarda en scan.ranges las capturas 
			for (int i = 0; i < m; ++i) 
			{
				scan.ranges[i] = (float)data[i];
			}

 			pup_hokuyo.publish(scan);
		}

     ros::spinOnce();	  
   }
	ros::spin();
 }

