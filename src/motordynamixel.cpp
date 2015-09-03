#include "motordynamixel.h"	//Header of the class.
#include "dynamixel.h"		//Necessary to use the specific functions.

MotorDynamixel::MotorDynamixel()
{

}
	
MotorDynamixel::~MotorDynamixel()
{
		
}

int MotorDynamixel::initMotor(int id, int commDevice, int baudrate)
{
	deviceID=id;

	// Open USB2Dynamixel.
	if (dxl_initialize(commDevice, baudrate)) //Succed to open USB2Dynamixel
		return 0;
	else 									  //Failed to open USB2Dynamixel
		return 1;
}

int MotorDynamixel::getPos()
{
	return dxl_read_word(deviceID , P_PRESENT_POSITION_L);
}

float MotorDynamixel::getPosDeg()
{
	return POS2DEG*dxl_read_word(deviceID , P_PRESENT_POSITION_L);
}

int MotorDynamixel::getSpeed()
{
	return dxl_read_word(deviceID , P_MOVING_SPEED_L);
}

int MotorDynamixel::getMovement()
{
	return dxl_read_byte(deviceID, P_MOVING);
}

void MotorDynamixel::moveToPos(int goalPos)
{
	dxl_write_word(deviceID, P_GOAL_POSITION_L, goalPos);
}

void MotorDynamixel::moveToPos(float goalPos)
{
	dxl_write_word(deviceID, P_GOAL_POSITION_L, (int)goalPos/POS2DEG);
}

void MotorDynamixel::moveToPosSpeed(int goalPos, int goalSpeed)
{
	setSpeed(goalSpeed);
	moveToPos(goalPos);
}

void MotorDynamixel::moveToPosSpeed(float goalPos, int goalSpeed)
{
	setSpeed(goalSpeed);
	moveToPos(goalPos);
}

void MotorDynamixel::moveIncrement(int increment)
{
	moveToPos(getPos()+increment);
}

void MotorDynamixel::moveIncrement(float increment)
{
	float newpos=getPos()*POS2DEG+increment;
	moveToPos(newpos);	
}

void MotorDynamixel::setSpeed(int goalSpeed)
{
	//Possible errors.
	if (goalSpeed>MAXSPEED)
		goalSpeed=MAXSPEED;
	if(goalSpeed<0)
		goalSpeed=0; //As fast as it can.
		
	dxl_write_word(deviceID, P_MOVING_SPEED_L, goalSpeed);
}

void  MotorDynamixel::setSpeedIncrement (int increment)
{
	int aux=getSpeed()+increment;
	
	if(aux>MAXSPEED)	aux=MAXSPEED;
	if(aux<0)		aux=0;
	setSpeed(aux);
	
}

int MotorDynamixel::printCommError()
{
	return dxl_get_result();
}

int MotorDynamixel::printWorkError()
{
	int error=0;
	if(dxl_get_rxpacket_error(ERRBIT_VOLTAGE) == 1)
		error+=1;
	if(dxl_get_rxpacket_error(ERRBIT_ANGLE) == 1)
		error+=2;
	if(dxl_get_rxpacket_error(ERRBIT_OVERHEAT) == 1)
		error+=4;
	if(dxl_get_rxpacket_error(ERRBIT_RANGE) == 1)
		error+=8;
	if(dxl_get_rxpacket_error(ERRBIT_CHECKSUM) == 1)
		error+=16;
	if(dxl_get_rxpacket_error(ERRBIT_OVERLOAD) == 1)
		error+=32;
	if(dxl_get_rxpacket_error(ERRBIT_INSTRUCTION) == 1)
		error+=64;
		
	return error;
}

