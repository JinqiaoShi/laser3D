/* Dynamixel EX-106+ parameters */


#ifndef EX106P_H_
#define EX106P_H_

/* *
 * Control table address 
 * */
// Settings of Motor Dynamixel EX-106+ (EEPROM Area)		
										// Description									Accesss		Initial Value
#define P_MODEL_NUMBER_L			0	// Lowest byte of model number.					R			106 (0x6A)
#define P_MODEL_NUMBER_H			1	// Highest byte of model number.				R			0 (0x00)
#define P_VERSION_FIRMWARE			2	// Information on the version of firmware		R			-
#define P_MOTOR_ID					3	// ID of Dynamixel								RW			1 (0x01)
#define P_BAUD_RATE					4	// Baud Rate of Dynamixel						RW			34 (0x22)
#define P_RETURN_DELAY_TIME			5	// Return delay time							RW			250 (0xFA)
#define P_CW_ANGLE_LIMIT_L			6	// Lowest byte of clockwise Angle Limit			RW			0 (0x00)
#define P_CW_ANGLE_LIMIT_H			7	// Highest byte of clockwise Angle Limit		RW			0 (0x00)
#define P_CCW_ANGLE_LIMIT_L			8	// Lowest byte of counterclockwise Angle Limit	RW			0 (0x00)
#define P_CCW_ANGLE_LIMIT_H			9	// Highest byte of counterclockwise Angle Limit	RW			0 (0x00)
#define P_HIGHEST_LIMIT_TEMPERATURE	11	// Internal Limit Temperature					RW			80 (0x50)
#define P_LOWEST_LIMIT_VOLTAGE		12	// Lowest Limit Voltage							RW			60 (0x3C)
#define P_HIGHEST_LIMIT_VOLTAGE		13	// Highest Limit Voltage						RW			240 (0xF0)
#define P_MAX_TORQUE_L				14	// Lowest byte of Max. Torque					RW			255 (0xFF)
#define P_MAX_TORQUE_H				15	// Highest byte of Max. Torque					RW			3 (0x03)
#define P_STATUS_RETURN_LEVEL		16	// Status Return Level							RW			2 (0x02)
#define P_ALARM_LED					17	// LED for Alarm								RW			36 (0x24)
#define P_ALARM_SHUTDOWN			18	// Shutdown for Alarm							RW			36 (0x24)
// Runtime values of Motor Dynamixel EX-106+ (RAM Area)
#define P_TORQUE_ENABLE				24	// Torque On/Off								RW			0 (0x00)
#define P_LED						25	// LED On/Off									RW			0 (0x00)
#define P_CW_COMPLIANCE_MARGIN		26	// CW Compliance margin							RW			0 (0x00)
#define P_CCW_COMPLIANCE_MARGIN		27	// CCW Compliance margin						RW			0 (0x00)
#define P_CW_COMPLIANCE_SLOPE		28	// CW Compliance slope							RW			32 (0x20)
#define P_CCW_COMPLIANCE_SLOPE		29	// CCW Compliance slope							RW			32 (0x20)
#define P_GOAL_POSITION_L			30	// Lowest byte of Goal Position					RW			-
#define P_GOAL_POSITION_H			31	// Highest byte of Goal Position				RW			-
#define P_MOVING_SPEED_L			32	// Lowest byte of Moving Speed					RW			-
#define P_MOVING_SPEED_H			33	// Highest byte of Moving Speed					RW			-
#define P_TORQUE_LIMIT_L			34	// Lowest byte of Torque LImit					RW			ADD14
#define P_TORQUE_LIMIT_H			35	// Highest byte of Torque LImit					RW			ADD15
#define P_PRESENT_POSITION_L		36	// Lowest byte of Current Position				R			-
#define P_PRESENT_POSITION_H		37	// Highest byte of Current Position				R			-
#define P_PRESENT_SPEED_L			38	// Lowest byte of Current Speed					R			-
#define P_PRESENT_SPEED_H			39	// Highest byte of Current Speed				R			-
#define P_PRESENT_LOAD_L			40	// Lowest byte of Current Load					R			-
#define P_PRESENT_LOAD_H			41	// Highest byte of Current Load					R			-
#define P_PRESENT_VOLTAGE			42	// Current Voltage								R			-
#define P_PRESENT_TEMPERATURE		43	// Current Temperature							R			-
#define P_REGISTERED_INSTRUCTION	44	// Means if Instruction is registered			RW			0 (0x00)
#define P_MOVING					46	// Means if there is any movement				R			0 (0x00)
#define P_LOCK						47	// Locking EEPROM								RW			0 (0x00)
#define P_PUNCH_L					48	// Lowest byte of Punch							RW			32 (0x20)
#define P_PUNCH_H					49	// Highest byte of Punch						RW			0 (0x00)
#define P_SPEED_CURRENT_L			56	// Lowest byte of Consuming Current				R			-
#define P_SPEED_CURRENT_H			57	// Highest byte of Consuming Current			R			-

//Some other values useful when using Dynamixel EX-106+
#define MAXPOS						1024//4095
#define MINPOS						0
#define	MAXSPEED					1023//1023
#define DEFAULT_COMMUNICATION_DEVICE	0	// 0 -> /dev/ttyUSB0
#define DEFAULT_BAUDNUM 			1		// 1Mbps

#define POS2DEG						0.29296875//0.35//0.061050061

#endif /* EX106P_H_ */
