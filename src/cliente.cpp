#include "ros/ros.h"
#include "laser3D/srv_laser.h"
#include <cstdlib>
#include <sstream>
#include <iostream>
#include <string>
 
#include <sensor_msgs/PointCloud2.h>
#include <pcl/point_types.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/ros/conversions.h>
#include <pcl/io/pcd_io.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/io/io.h>
#include <tinyxml.h>

#include <unistd.h> 

 using namespace std;
ros::Publisher cluter;
 int main(int argc, char **argv)
 {
   ros::init(argc, argv, "cliente");

    pcl::PointCloud<pcl::PointXYZRGB> cloud;
	pcl::PCDWriter writer;

   ros::NodeHandle n;
	
   ros::ServiceClient client1 = n.serviceClient<laser3D::srv_laser>("srv_laser");
   cluter = n.advertise<sensor_msgs::PointCloud2> ("cylinder_output", 1);
   laser3D::srv_laser srv1;

/*
	//Parametros moviemiento motor
	int velocidadPosicion;
	int velocidadMedida;
	int posicionInicial;
	int posicionFinal;

	//Parametros laser
	int anguloMin;
	int anguloMax;

	//Lectura parametros
	nh.getParam("MotorVelPosi",    velocidadPosicion);	
	nh.getParam("MotorVelMedida",  velocidadMedida);	
	nh.getParam("MotorPosInicial", posicionInicial);	
	nh.getParam("MotorPosFinal",   posicionFinal);	
	nh.getParam("LaserAnguloMin",  anguloMin);	
	nh.getParam("LaserAnguloMax",  anguloMax);	

	srv1.request.positionSpeed=velocidadPosicion;
	srv1.request.measureSpeed=velocidadMedida;
	srv1.request.initialPosition=(float)posicionInicial;
	srv1.request.finalPosition=(float)posicionFinal;
	srv1.request.anguloMin=anguloMin;
	srv1.request.anguloMax=anguloMax;
*/
	
	//Parametros moviemiento motor
	string texto;
    TiXmlDocument doc( "/home/exbot/rosbuild_ws/sandbo/laser3D/bin/parameters.xml");
	if(doc.LoadFile())
	{
		
		TiXmlElement *pRoot, *pParm, *pElem;
      pRoot = doc.FirstChildElement( "parameters" );			
		pParm = pRoot->FirstChildElement("dynamixel");
		pParm = pParm->FirstChildElement("position");
		pElem = pParm->FirstChildElement("inicial");
		texto = pElem->GetText();
		srv1.request.initialPosition=atoi (texto.c_str());

		pElem = pParm->FirstChildElement("final");
		texto = pElem->GetText();
		srv1.request.finalPosition=atoi (texto.c_str());

		pParm = pRoot->FirstChildElement("dynamixel");
		pParm = pParm->FirstChildElement("speed");
		pElem = pParm->FirstChildElement("measuring");
		texto = pElem->GetText();
		srv1.request.measureSpeed=atoi (texto.c_str());

		pElem = pParm->FirstChildElement("positioning");
		texto = pElem->GetText();
		srv1.request.positionSpeed=atoi (texto.c_str());


		pParm = pRoot->FirstChildElement("laser");
		pParm = pParm->FirstChildElement("angulo");
		pElem = pParm->FirstChildElement("maximo");
		texto = pElem->GetText();
		srv1.request.anguloMax=atoi (texto.c_str());

		pElem = pParm->FirstChildElement("minimo");
		texto = pElem->GetText();
		srv1.request.anguloMin=atoi (texto.c_str());

		pParm = pRoot->FirstChildElement("laser");
		pParm = pParm->FirstChildElement("rango");
		pElem = pParm->FirstChildElement("maximo");
		texto = pElem->GetText();
		srv1.request.rangoMax=atoi (texto.c_str());

		pElem = pParm->FirstChildElement("minimo");
		texto = pElem->GetText();
		srv1.request.rangoMin=atoi (texto.c_str());

}


	//Solo utilizado para testear
		cout<<"Inicial= "<<srv1.request.initialPosition<<endl;
		cout<<"Final= "<<srv1.request.finalPosition<<endl;
		cout<<"Measure= "<<srv1.request.measureSpeed<<endl;
		cout<<"Position= "<<srv1.request.positionSpeed<<endl;
		cout<<"AnguloMin= "<<srv1.request.anguloMin<<endl;
		cout<<"AnguloMax= "<<srv1.request.anguloMax<<endl;
		cout<<"RangoMin= "<<srv1.request.rangoMin<<endl;
		cout<<"RangoMax= "<<srv1.request.rangoMax<<endl;
/*		client1.call(srv1);
		ros::spin();
*/


	client1.call(srv1);
    sensor_msgs::PointCloud2 cloud2;
	//pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>);
    cloud2=srv1.response.cloud;
    pcl::fromROSMsg(cloud2, cloud);

    //pcl::io::savePCDFile("cloud.pcd", cloud, false);
	
    //pcl::PointCloud<pcl::PointXYZ>::ConstPtr cloud3 (cloud);
    //pcl::visualization::CloudViewer viewer("Cloud Viewer");
    //viewer.showCloud(cloud);

    //while(!viewer.wasStopped());

    //writer.writeBinaryCompressed("/home/exbot/rosbuild_ws/sandbo/laser3D/bin/nube.pcd",cloud);
    writer.write("/home/exbot/rosbuild_ws/sandbo/laser3D/bin/nube.pcd",cloud);
    writer.write("/home/exbot/rosbuild_ws/sandbo/laser3D/bin/nube.txt",cloud);
//cluter.publish(cloud);

/*
	int pid;
	pid=fork();

	if (pid==0)
	{
        execl("home/exbot/my_pcl/cloudview/src", "cloud_viewer", "/home/exbot/rosbuild_ws/sandbo/laser3D/bin/nube.pcd/nube.pcd", NULL);
	}
*/



    //string name = "nube.pcd";
    //writer.write(name,cloud);
    //pcl::io::savePCDFileASCII ("nube.pcd", cloud);
    //ros::spin();
	return 0;


 }
