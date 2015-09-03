#include "ros/ros.h"
#include "laser3D/srv_laser.h"
#include "laser3D/srv_hokuyo.h"
#include <cstdlib>
#include <sensor_msgs/LaserScan.h>

#include <sstream>
#include <stdio.h>
#include <cmath>
#include <vector>

using namespace std;


void topicHokuyo(const sensor_msgs::LaserScan::ConstPtr& scan_hokuyo) 
{
	
	ROS_INFO("TOPIC NUEVO: %d", scan_hokuyo->ranges.size());
   //scan.ranges = scan_hokuyo->ranges;
	//ranges.push_back(scan_hokuyo->ranges);
   
}






 int main(int argc, char **argv)
 {
   ros::init(argc, argv, "sus_hokuyo");
	ros::NodeHandle m;
	ros::Subscriber sus_hokuyo = m.subscribe("topic_hokuyo", 1, topicHokuyo); 

	ros::spin();
 }
