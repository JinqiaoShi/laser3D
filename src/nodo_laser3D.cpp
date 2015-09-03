#include "ros/ros.h"
#include "laser3D/srv_laser.h"
#include "laser3D/srv_dynamixel.h"
#include "laser3D/srv_hokuyo.h"
#include <cstdlib>
#include <sensor_msgs/LaserScan.h>
#include <sensor_msgs/PointCloud2.h>
#include "std_msgs/Float32.h"
#include <std_msgs/String.h>
#include "pcl_ros/point_cloud.h"
#include <pcl/point_types.h>
#include <pcl/ros/conversions.h>
#include <unistd.h>
#include <sstream>
#include <stdio.h>
#include <cmath>
#include <vector>

//#define M_PI/180.0 M_PI/180.0
 
 using namespace std;
 
 sensor_msgs::LaserScan scan;
 vector<float> lut_cos_a;
 vector<float> lut_sin_a;

 vector<float> positions;
 vector<vector<float> > ranges;
 
 bool flag=0;

float setcolor(uint8_t a,uint8_t b,uint8_t c)
{

                uint32_t rgb = ((uint32_t)a << 16 | (uint32_t)b << 8 | (uint32_t)c);
                return *reinterpret_cast<float*>(&rgb);
}


 bool serverLaser3D(laser3D::srv_laser::Request &req, laser3D::srv_laser::Response &res)
 {

/*		cout<<"Inicial= "<<req.initialPosition<<endl;
		cout<<"Final= "<<req.finalPosition<<endl;
		cout<<"Measure= "<<req.measureSpeed<<endl;
		cout<<"Position= "<<req.positionSpeed<<endl;
*/

    ROS_INFO("HOKUYO Service Loading");
	ros::NodeHandle n;
    ros::ServiceClient client_move = n.serviceClient<laser3D::srv_dynamixel>("srv_move");//控制AX-12
   ros::ServiceClient client_position = n.serviceClient<laser3D::srv_dynamixel>("srv_position");//AX-12位置
   ros::ServiceClient client_errors = n.serviceClient<laser3D::srv_dynamixel>("srv_errors");//AX-12错误信息
   ros::ServiceClient client_estado = n.serviceClient<laser3D::srv_hokuyo>("srv_hokuyo");//HOKUYO状态
   ros::ServiceClient client_parameter = n.serviceClient<laser3D::srv_hokuyo>("srv_parameter");//HOKUYO参数


   laser3D::srv_dynamixel move;
   laser3D::srv_dynamixel pos;
   laser3D::srv_dynamixel errors;
    laser3D::srv_hokuyo estado;//状态
	laser3D::srv_hokuyo parameter;

	//Variables motor
	int positionSpeed;
	int measureSpeed;
	float initialPosition;
	float finalPosition;
	bool sentido_giro;


	//Conocer posicion del motor
    client_position.call(pos);//获取当前位置
	
    //起点和终点共用
	if(abs(pos.response.position_o-req.initialPosition)<=abs(pos.response.position_o-req.finalPosition))
	{
		initialPosition=req.initialPosition;
		finalPosition=req.finalPosition;	
	}
	else
	{
		initialPosition=req.finalPosition;
		finalPosition=req.initialPosition;
	}


	//Parametros de movimiento del motor
	//Por seguridad se comprueban las velocidades
	if(req.positionSpeed>=80) positionSpeed=80;
    //else if(req.positionSpeed<=10) positionSpeed=10;
	else positionSpeed=req.positionSpeed;

	if(req.measureSpeed>=80) measureSpeed=80;
    //else if(req.measureSpeed<=10) measureSpeed=10;
	else measureSpeed=req.measureSpeed;


    //hokuyo参数
	parameter.request.anguloMin=(req.anguloMin+45)/0.25;
	parameter.request.anguloMax=(req.anguloMax+45)/0.25;
	//client_parameter.call(parameter); //No se consigue que el laser tome menos datos  

		//Solo para test
/*		cout<<"Inicial= "<<initialPosition<<endl;
		cout<<"Final= "<<finalPosition<<endl;
		cout<<"Measure= "<<measureSpeed<<endl;
		cout<<"Position= "<<positionSpeed<<endl;
		cout<<"AnguloMin= "<<parameter.request.anguloMin<<endl;
		cout<<"AnguloMax= "<<parameter.request.anguloMax<<endl;
*/



	//Mover motor principio
    ROS_INFO("AX12 Start Moving");
	move.request.position_i=initialPosition;
	move.request.speed=positionSpeed;
	//Sentido de giro previsto
	client_position.call(pos);
    if(pos.response.position_o>move.request.position_i)		sentido_giro=0;
	else																		sentido_giro=1;
	//Mover
	client_move.call(move);

	do{
		client_position.call(pos);
		//ROS_INFO("Posicion: %f", pos.response.position_o);
   }
	while((sentido_giro==0) ? pos.response.position_o>initialPosition+1 : pos.response.position_o<initialPosition-1);



	//Encender laser
    ROS_INFO("Start Scan");
	estado.request.option=1;
    client_estado.call(estado); //HOKUYO状态值返回1

    //移动到最终位置
    ROS_INFO("Moving Into Final Position");
	move.request.position_i=finalPosition;
	move.request.speed=measureSpeed;
	//Sentido de giro previsto
	client_position.call(pos);
	if(pos.response.position_o>move.request.position_i)		sentido_giro=0;
	else																		sentido_giro=1;
	//Mover
	client_move.call(move);
	

  	do {

		if (flag)
		{
			//Se pide la posicion del motor
			client_position.call(pos);
            ROS_INFO("Posicion: %f", pos.response.position_o);
			positions.push_back(pos.response.position_o);
			//ranges.push_back(scan.ranges);
			
			flag=0;
		}
		
		ros::spinOnce();
	}
	while((sentido_giro==0) ? pos.response.position_o>finalPosition+1 : pos.response.position_o<finalPosition-1);
	//Se puede separar en dos if para mas rapidez

	//Apagar laser
    ROS_INFO("Stop Scan And Close Hokuyo");
	estado.request.option=0;
	client_estado.call(estado);



	//Transformar coordenadas
    ROS_INFO("Transformar coordenadas");
	int size_pos=positions.size();
	
	float cos_b;
	float sin_b;

	//sensor_msgs::PointCloud cloud;
    pcl::PointCloud<pcl::PointXYZRGB> cloud;
	int numScan=parameter.request.anguloMax-parameter.request.anguloMin;
	cloud.width    = numScan*size_pos;
	cloud.height   = 1;
	cloud.is_dense = false;
	cloud.points.resize (cloud.width * cloud.height);
	
	int point=0;
	for(int b=0; b<size_pos; ++b)
		{
            cos_b=cos(positions[b]*M_PI/180.0);
            sin_b=sin(positions[b]*M_PI/180.0);
			
			for(int a=parameter.request.anguloMin; a<parameter.request.anguloMax; ++a)
				{
				if(ranges[b][a]>req.rangoMin && ranges[b][a]<req.rangoMax)	//Filtro
					{
					cloud.points[point].x=ranges[b][a]*cos_b*lut_cos_a[a];
					cloud.points[point].y=ranges[b][a]*sin_b*lut_cos_a[a];
					cloud.points[point].z=ranges[b][a]*lut_sin_a[a];
                    if (abs(cloud.points[point].y) <1000) cloud.points[point].rgb=setcolor(255, 255, 0);
                    if (1000< abs(cloud.points[point].y) <5000) cloud.points[point].rgb=setcolor(255, 0, 0);
                    if (abs(cloud.points[point].y) >5000) cloud.points[point].rgb=setcolor(0, 255, 0);
					}
					++point;
				}
		}
	

    sensor_msgs::PointCloud2 cloud2;
    pcl::toROSMsg(cloud, cloud2);
	 

	//Publicar nube de puntos
    ROS_INFO("Publish Points");
    res.cloud=cloud2;

	//Limpiar vectores
	positions.clear();
	ranges.clear();
	

	return true;
 }

void topicHokuyo(const sensor_msgs::LaserScan::ConstPtr& scan_hokuyo) 
{
//	ROS_INFO("TOPIC NUEVO");
	ranges.push_back(scan_hokuyo->ranges);
   flag=1;
}



 int main(int argc, char **argv)
 {
   ros::init(argc, argv, "laser3D");
	ros::NodeHandle m;
    ros::Subscriber sus_hokuyo = m.subscribe("topic_hokuyo", 1, topicHokuyo);
	ros::ServiceServer service1 = m.advertiseService("srv_laser", serverLaser3D);
 
    float inicio=-45*M_PI/180.0;
    float final=225*M_PI/180.0;
    float incremento=0.25*M_PI/180.0;

	//Generacion de tabla LUT con los valores de senos y cosenos de los angulos del laser
	for(float a=inicio; a<=final; a+=incremento)
		{
			lut_cos_a.push_back(cos(a));
			lut_sin_a.push_back(sin(a));
		}


	ros::spin();
 }
