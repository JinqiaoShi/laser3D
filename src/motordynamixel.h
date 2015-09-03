
#ifndef MOTORDYNAMIXEL_H_
#define MOTORDYNAMIXEL_H_

#include "ex106p.h"			//To get the specific values of the motor.

/**
 * Class to encapsulate the Dynamixel EX-106+ motor. It makes easy the usage
 * of this motor encapsulating its protocol and giving easier functions to
 * the user.
 * 
 * The errors need to be checked in the program which uses this class, maybe using threads, 
 * and being careful with the functions because all the functions communicate  
 * with the motor and if threads are used some syncronization problems can occur.
 * 
 * This class need the header file EX106p.h to work. In it is included all the
 * EX106p directions and some other parameters which make the usage of this
 * class easier.
 * 
 * NOTE: 
 * 	- In moving functions if the goal position is higher than the maximum
 * or lower than 0 the motor will ignore the function.
 * 	- In speed setting functions if the speed if higher than the maximum speed
 * the motor will move at maximum speed and if the speed value given is lower than
 * 0, the value of the speed will be 0 (as fast as it can with the supplied voltage)
 */

class MotorDynamixel 
{
public:
	/**
	 * Not used
	 */
	MotorDynamixel();
	 
	/**
	 * Not used
	 */
	virtual ~MotorDynamixel();
	
	/**
	 * Initializes the motor. Since the constructor does nothing, IT IS NECESSARY to
	 * call this function to start the motor and USB2Dynamixel device.
	 * @param id sets the deviceID parameter of the motor.
	 * @param commDevice sets the device used in the communication, /dev/ttyUSB0 by default.
	 * @param baudrate sets the speed in the communication, 1Mbps by default.
	 * @return 0 if initializing was OK.
	 * @return 1 if there was any error.
	 */
	int initMotor(int id, int commDevice=DEFAULT_COMMUNICATION_DEVICE, int baudrate=DEFAULT_BAUDNUM);

	/**
     * Method to get the position.
     * @see getPosDeg()
     * @return The position in values from 0 (MINPOS, clockwise) to 
     * 4095 (MAXPOS, counterclockwise).
     */
	int getPos();
	
	/**
       * Method to get the position in degrees.
       * @see getPos()
       * @return The position in values from 0º (clockwise) to 250º 
       * (counterclockwise).
       */
	float getPosDeg(); 
	
	/**
       * Method to get the speed set to the motor. It is important to remark
       * here that this speed is the one the user wants to move the motor, it isn't
       * the real speed of the motor because if this is bigger than 627
       * the measure is not reliable at all. Please see the manufacturer
       * documentation about this point.
       * 
       * Even more, testing it was discovered that if the parameter P_PRESENT_SPEED_L
       * is being read and the motor is moving clockwise, the measure is speed+1023. 
       * The manufacturer says nothing about this.
       * 
       * @return 0 means the maximum speed the motor can reach with the supplied voltage.
       * @return 1 - 1023 the speed set to the motor.
       */
	int getSpeed();
	
	/**
	 * Method to read whether the motor is moving.
	 * @return 0 means the motor is stopped.
	 * @return 1 means the motor is moving.
	 */
	int getMovement();											
	
	/** 
	 * Method to move the motor to a desired position. The motor will move
	 * with the speed set before.
	 * @param goalPos is the position the user wants to make the motor reach,
	 * This value must be an integer between 0 (clockwise) and 4095 (counterclockwise).
	 * @see moveToPosSpeed()
	 */
	void moveToPos(int goalPos);
	
	/** 
	 * Method to move the motor to a desired position. The motor will move
	 * with the speed set before.
	 * @param goalPos is the position the user wants to make the motor reach,
	 * This value must be a float between 0º (clockwise) and 250º(counterclockwise).
	 * @see moveToPosSpeed()
	 */
	void moveToPos(float goalPos);
	
	/**
	 * Method to move the motor to a desired position with a specific speed.
	 * This method changes the moving speed to the motor. Maybe it is necessary
	 * to restore the speed if the user wants.
	 * @param goalPos is the position the user wants to make the motor reach,
	 * This value must be a float between 0 (clockwise) and 4095 (counterclockwise).
	 * @param goalSpeed is the speed which the user wants to move the motor. 
	 * The values must be between 1 and 1023. 0 means the maximum speed
	 * the motor can reach with the supplied voltage.
	 * @see moveToPos()
	 * @see setSpeed()
	 */
	void moveToPosSpeed(int goalPos, int goalSpeed); 
	
	/**
	 * Method to move the motor to a desired position with a specific speed.
	 * This method changes the moving speed to the motor. Maybe it is necessary
	 * to restore the speed if the user wants.
	 * @param goalPos is the position the user wants to make the motor reach,
	 * This value must be a float between 0º (clockwise) and 250º(counterclockwise).
	 * @param goalSpeed is the speed which the user wants to move the motor. 
	 * The values must be between 1 and 1023. 0 means the maximum speed
	 * the motor can reach with the supplied voltage.
	 * @see moveToPos()
	 * @see setSpeed()
	 */
	void moveToPosSpeed(float goalPos, int goalSpeed);
	
	/**
	 * Method to move the motor only an increment.
	 * @param increment must be an integer value from 0 to 4095.
	 */
	void moveIncrement(int increment);		

	/**
	 *  Method to move the motor only an increment in degrees.
	 * @param increment must be a float value from 0º to 250º
	 */
	void moveIncrement(float increment);
	
	/**
	 * Method to set the moving speed of the motor.
	 * @param goalSpeed must be a value between 1 and 1023. If 0 is introduced
	 * the motor will move at the maximum speed the supplied voltage allows.
	 * @see setSpeedIncrement()
	 */
	void setSpeed(int goalSpeed);
	
	/**
	 * Method to change the speed an increment. It increases (or decreases if
	 * the parameter is negative) the current speed of the motor.
	 * @param increment is the amount of the change. It must be an integer.
	 * @see setSpeed().
	 */
	void setSpeedIncrement (int increment);							//Check this method.

	/* OTHER FUNCTIONS TO ADD
	
	 * getWorkError()
	 * getCommError()
		
	 * moveAsWheel(direction,speed) It could be useful to do it as well.
	 * */

	
	/**
	 * Method to check errors in the communication. It will check the status
	 * packet returned by the motor.
	 * @return COMM_RXSUCCESS communication was OK.
	 * @return COMM_TXFAIL failed transmit instruction packet.
	 * @return COMM_TXERROR incorrect instruction packet.
	 * @return COMM_RXFAIL failed get status packet from device.
	 * @return COMM_RXWAITING now recieving status packet.
	 * @return COMM_RXTIMEOUT there is no status packet.
	 * @return COMM_RXCORRUPT uncorrect status packet.
	 * @return other unknown communication error.
	 */
	int printCommError();
	
	/**
	 * Method to check working errors in the motor. The possible errors
	 * could be:
	 * 1- ERRBIT_VOLTAGE: Input voltage error.
	 * 2- ERRBIT_ANGLE: Angle limit error.
	 * 4- ERRBIT_OVERHEAT: Overheat error.
	 * 8- ERRBIT_RANGE: Out of range error.
	 * 16- ERRBIT_CHECKSUM: Checksum error.
	 * 32- ERRBIT_OVERLOAD: Overload error.
	 * 64- ERRBIT_INSTRUCTION: Instruction code error.
	 * 
	 * @return 0 if everything was OK.
	 * @return integer from 1 to 127, the sum of all the errors.
	 */
	int printWorkError();
	
private:
	/**
	 * Identifies the motor. This parameter distinguise it from other 
	 * equivalent motors using this class at the same time.
	 */
	int deviceID;
};

#endif /* MOTORDYNAMIXEL_H_ */
