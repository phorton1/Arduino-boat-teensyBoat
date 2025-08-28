//-------------------------------------------
// teensyBoat.cpp
//-------------------------------------------
// teensy4.0 NMEA2000 program

#include <myDebug.h>
#include <NMEA2000_Teensyx.h>
#include <N2kMessages.h>

#define dbg_sensor			0
#define dbg_in_msgs			0


// Program Options

#define BROADCAST_NMEA200_INFO	0
#define BROADCAST_INTERVAL		300


#define ALIVE_LED		13
#define ALIVE_OFF_TIME	980
#define ALIVE_ON_TIME	20


tNMEA2000_Teensyx nmea2000;
	// (tCANDevice _bus=NMEA2000_TEENSYX_CAN_BUS, tPins _txPin=NMEA2000_TEENSYX_TX_PIN, tPins _rxPin=NMEA2000_TEENSYX_RX_PIN);


//----------------------------------------------
// PGNs known by this program
//----------------------------------------------

#define PGN_REQUEST					59904L
#define PGN_ADDRESS_CLAIM			60928L
#define PGN_PGN_LIST				126464L
#define PGN_HEARTBEAT				126993L
#define PGN_PRODUCT_INFO			126996L
#define PGN_DEVICE_CONFIG			126998L


#define PGN_HEADING					127250L
#define PGN_SPEED					128259L
#define PGN_DEPTH					128267L
#define PGN_POSITION				129025L
#define PGN_TEMPERATURE    			130316L
#define PGN_ENGINE_RAPID			127488L
#define PGN_ENGINE_DYNAMIC			127489L
#define PGN_FLUID_LEVEL				127505L


const unsigned long TransmitMessages[] = {

	// these system PGNs may not be necessary here,
	// but it is more conformal to include them.
#if 1
	PGN_REQUEST,
	PGN_ADDRESS_CLAIM,
	PGN_PGN_LIST,
	PGN_HEARTBEAT,
	PGN_PRODUCT_INFO,
	PGN_DEVICE_CONFIG,
#endif

	PGN_HEADING,
	PGN_SPEED,
	PGN_DEPTH,
	PGN_POSITION,
	PGN_TEMPERATURE,
	PGN_ENGINE_RAPID,
	PGN_ENGINE_DYNAMIC,
	PGN_FLUID_LEVEL,
	0
};


//-----------------------------------
// Program Configuration
//-----------------------------------

uint32_t sensor_interval 	= 0;			// no message sent until i<cr> or iNNN
	// a lone 'i' sends the sensors
	// iNNN sets an auto send interval

// any of the following commands also SEND the instrument

static double heading 		= 180;			// set by hNNN or hr for random (0..359)  	default = random
static double speed 		= 0;			// set by sNN  or sr for random (0..20)		default = 0
static double depth 		= 17;			// set by dNNN or dr for random (10-100)	default = random
static double latitude 		= 9.323584;		// fixed at this time
static double longitude 	= -82.237200;	// fixed at this time
static double temperatureF 	= 80;			// set by tNN or tr for random (0..110)		default = random
static double rpms			= 1500;

bool show_bus = 0;
bool show_sends = 0;

static bool random_heading 	= true;
static bool random_speed 	= false;
static bool random_depth 	= true;
static bool random_temp 	= true;
static bool random_rpms		= true;


//-----------------------------------------------
// implementation
//-----------------------------------------------

static String usageMessage()
{
	String rslt = "teensyBoat NMEA2000 Sensor Usage:\r\n";
	rslt += "   ? = Show this help\r\n";
	rslt += "   h,hr,hNNN = send Heading\r\n";
	rslt += "   s,sr,sNN = send Speed\r\n";
	rslt += "   d,dr,dNN = send Depth\r\n";
	rslt += "   t,tr,tNNN = send Temperature\r\n";
	rslt += "   r,rr,rNNN = send engine RPMs\r\n";
	rslt += "   i,iNNN = set sensor_interval cur=";
	rslt += String(sensor_interval);
	rslt += "\r\n";
	rslt += "   b = toggle show bus messages cur=";
	rslt += String(show_bus);
	rslt += "\r\n";
	rslt += "   m = show send messages cur=";
	rslt += String(show_sends);
	rslt += "\r\n";

	rslt += "   x! = reboot\n\n";
	return rslt;
}



static void onNMEA2000Message(const tN2kMsg &msg)
{
	if (show_bus)
	{
		#define MAX_DBG_BUF	512
		static int bus_num = 0;
		static char bus_buf[MAX_DBG_BUF+1];
		sprintf(bus_buf,"BUS(%d) : pri:%d PGN:%lu src:%d dst:%d len:%d  data:",
			bus_num++,
			msg.Priority,
			msg.PGN,
			msg.Source,
			msg.Destination,
			msg.DataLen);
		int buf_len = strlen(bus_buf);
		for (int i=0; i<msg.DataLen && buf_len<MAX_DBG_BUF+3; i++)
		{
			sprintf(&bus_buf[buf_len],"%02x ",msg.Data[i]);
			buf_len += 3;
		}
		Serial.println(bus_buf);
		
		// display(dbg_in_msgs,"onNMEA2000 message(%d) priority(%d) source(%d) dest(%d) len(%d)",
		// 	msg.PGN,
		// 	msg.Priority,
		// 	msg.Source,
		// 	msg.Destination,
		// 	msg.DataLen);
	}

	// also timestamp (ms since start [max 49days]) of the NMEA2000 message
	// unsigned long MsgTime;

	if (msg.PGN == PGN_REQUEST)
	{
		unsigned long requested_pgn;
		if (ParseN2kPGN59904(msg, requested_pgn))
			warning(dbg_in_msgs,"    PGN_REQUEST(%d)",requested_pgn);
	}
}


//------------------------
// setup
//------------------------


// #include <soc/rtc_wdt.h>

void setup()
{
	#if ALIVE_LED
		pinMode(ALIVE_LED,OUTPUT);
		digitalWrite(ALIVE_LED,1);
	#endif

	// STILL getting spurious reboots from wdt
	// rtc_wdt_disable();

	Serial.begin(921600);
	delay(2000);
	display(dbg_sensor,"NMEA_Sensor.ino setup() started",0);
	Serial.println("WTF");
	Serial.print(usageMessage().c_str());

	#if 0
		nmea2000.SetN2kCANMsgBufSize(150);
		nmea2000.SetN2kCANSendFrameBufSize(150);
		nmea2000.SetN2kCANReceiveFrameBufSize(150);
	#endif

	#if 1

		nmea2000.SetProductInformation(
			"prh_model_115",            // Manufacturer's Model serial code
			110,                        // Manufacturer's uint8_t product code
			"teensy NMEA Sensor",       // Manufacturer's Model ID
			"prh_sw_115.0",             // Manufacturer's Software version code
			"prh_mv_115.0",             // Manufacturer's uint8_t Model version
			1,                          // LoadEquivalency uint8_t 3=150ma; Default=1. x * 50 mA
			2101,                       // N2kVersion Default=2101
			1,                          // CertificationLevel Default=1
			0                           // iDev (int) index of the device on \ref Devices
			);
		nmea2000.SetConfigurationInformation(
			"prhSystems",           	// ManufacturerInformation
			"teensyInstall1",       	// InstallationDescription1
			"teensyInstall2"       		// InstallationDescription2
			);

		// for device class see: https://web.archive.org/web/20190531120557/https://www.nmea.org/Assets/20120726%20nmea%202000%20class%20&%20function%20codes%20v%202.00.pdf
		// 	archived at NMEA_Monitor/docs/20120726 nmea 2000 class & function codes v 2.00-1.pdf.
		// for the registration/company id, I guess 2046 arbitrarily chose because its NOT in
		//	https://web.archive.org/web/20190531120557/https://www.nmea.org/Assets/20120726%20nmea%202000%20class%20&%20function%20codes%20v%202.00.pdf
		// 	archived at NMEA_Monitor/docs/20121020 nmea 2000 registration list.pdf

		nmea2000.SetDeviceInformation(
			#if INSTRUMENT_TYPE==1
				1250111, // uint32_t my arbitrary unique (serial) number
				170,     // uint8_t  Function(60,170)=Integrated Navigation
				60, 	 // uint16_t Class=Navigation.
			#else
				1250110, // uint32_t my arbitrary unique (serial) number
				130,     // uint8_t  Function(75,130)=Temperature
				75, 	 // uint16_t Class(75)=Sensor Communication Interface
			#endif
			2046     // uint16_t Registration/Company) ID
					 // 2046 does not exist
			);
	#endif

	// set its initial bus address to 22

	nmea2000.SetMode(tNMEA2000::N2km_ListenAndNode,	22);
		// N2km_NodeOnly
		// N2km_ListenAndNode
		// N2km_ListenAndSend
		// N2km_ListenOnly
		// N2km_SendOnly

	#if 0	// SHOW_BUS_MESSAGES
		nmea2000.SetForwardStream(&Serial);
		nmea2000.SetForwardType(tNMEA2000::fwdt_Text);
			// Show in clear text.
		nmea2000.SetForwardOwnMessages(false);
	#else
		nmea2000.EnableForward(false); // Disable all msg forwarding to USB (=Serial)
	#endif


	#if 1
		// I could not get this to eliminate need for DEBUG_RXANY
		// compiile flag in the Monitor
		//
		// I now believe that I should only send the messages
		// the sensor transmits here ...

		nmea2000.ExtendTransmitMessages(TransmitMessages);
			// nmea2000.ExtendReceiveMessages(AllMessages);
	#endif

	#if	1
		nmea2000.SetMsgHandler(onNMEA2000Message);
	#endif

	if (!nmea2000.Open())
		my_error("nmea2000.Open() failed",0);

	display(dbg_sensor,"NMEA_Sensor.ino setup() finished",0);

	#if ALIVE_LED
		digitalWrite(ALIVE_LED,0);
	#endif
}



//--------------------------------------------
// sendSensor()
//--------------------------------------------

static void sendSensor(uint32_t PGN, unsigned char instance=0)
{
	static uint32_t counter;

	// note that these blocks each check the PGN
	// and then send that kind of PGN even though
	// the library does not have a polymorphic API

	tN2kMsg msg; 	// it's a class, not a structure!

	if (PGN == PGN_POSITION)
	{
		if (show_sends)
			display(dbg_sensor,"Send(%d) lat(%0.6f) lon(%0.6f)",++counter,latitude,longitude);
		SetN2kPGN129025(msg, latitude, longitude);
			// PGN_POSITION - lat lon in double degrees
	}
	else if (PGN == PGN_HEADING)
	{
		if (random_heading)
		{
			static double inc = 5;
			heading += inc;
			if (heading >= 255) inc = -5;
			if (heading <= 5) inc = 5;
		}
		if (show_sends)
			display(dbg_sensor,"Send(%d) heading: %0.3f",++counter,heading);
		SetN2kPGN127250(msg, 255, DegToRad(heading), 0.0 /*Deviation*/, 0.0 /*Variation*/, N2khr_true /* tN2kHeadingReference(0) */);
			// PGN_HEADING - heading is in radians
	}
	else if (PGN == PGN_SPEED)
	{
		if (random_speed)
		{
			static double inc = 0.2;
			speed += inc;
			if (speed >= 8) inc = -0.2;
			if (speed <= 2) inc = 0.2;
		}
		if (show_sends)
			display(dbg_sensor,"Send(%d) speed: %0.3f",++counter,speed);
		SetN2kPGN128259(msg, 255, KnotsToms(speed));
			// PGN_SPEED - speed is meters/sec
	}
	else if (PGN == PGN_DEPTH)
	{
		if (random_depth)
		{
			static double inc = 1;
			depth += inc;
			if (depth > 99) inc = -1;
			if (depth < 11)  inc = 1;
		}
		if (show_sends)
			display(dbg_sensor,"Send(%d) depth: %0.3f",++counter,depth);
		SetN2kPGN128267(msg, 255, depth, 2.0);
			// PGN_DEPTH - depth is in meters
			// with a 2.0 meter offset of keel
	}
	else if (PGN == PGN_TEMPERATURE)
	{
		// Note tht degrees are Kelvin

		if (random_temp)
		{
			static double dir = 1;
			temperatureF += dir;
			if (temperatureF > 109)
				dir = -1;
			else if (temperatureF < 1)
				dir = 1;
		}
		if (show_sends)
			display(dbg_sensor,"Send(%d) temperature: %0.3fF",++counter,temperatureF);
		tN2kTempSource temp_kind = N2kts_MainCabinTemperature;	// 4
			// tN2kTempSource temp_kind = N2kts_RefridgerationTemperature;	// 7

		SetN2kPGN130316(						// PGN_TEMPERATURE
			msg,
			255,								// unsigned char SID; 255 indicates "unused"
			93,									// unsigned char TempInstance "should be unique per device-PGN"
			temp_kind,
			FToKelvin(temperatureF),
			N2kDoubleNA							// double SetTemperature
		);
	}
	else if (PGN == PGN_ENGINE_RAPID)
	{
		if (random_rpms)
		{
			rpms += random(-100,100);
			if (rpms > 3000) rpms = 3000;
			if (rpms < 0) rpms = 0;
		}
		if (show_sends)
			display(dbg_sensor,"Send(%d) rpms: %d",++counter,((int) rpms) );
		SetN2kPGN127488(
			msg,
			0					// EngineInstance
,			rpms,				// EngineSpeed
			N2kDoubleNA,		// EngineBoostPressure
			N2kInt8NA);			// EngineTiltTrim
	}
	else if (PGN == PGN_ENGINE_DYNAMIC)
	{
		double oil_pressure = rpms == 0 ? 0 :
			50 + random(-30,30);
		double alt_voltage = rpms == 0 ? 0 :
			12.0 + (((float)random(-300,300)) / 100.0);
		double coolant_temp = rpms == 0 ? 0 :
			180 + random(-40,40);
		double fuel_rate = rpms == 0 ? 0 :
			1.5 + (((float) random(-100,100)) / 100.0);

		#define PSI_TO_PASCAL		6895.0
		#define GALLON_TO_LITRE		3.785

		if (show_sends)
			display(dbg_sensor,"Send(%d) temperature(%d) pressure(%d) voltage(%0.1f) rate(%0.1f)",
				++counter,
				((int) coolant_temp),
				((int) oil_pressure),
				alt_voltage,
				fuel_rate);

		static tN2kEngineDiscreteStatus1 status1;		// filled with zeros
		static tN2kEngineDiscreteStatus2 status2;		// filled with zeros

		SetN2kPGN127489(msg,
			0,									// EngineInstance
			oil_pressure * PSI_TO_PASCAL,		// EngineOilPress      in Pascal
			FToKelvin(coolant_temp),			// EngineOilTemp       in Kelvin
			FToKelvin(coolant_temp),			// EngineCoolantTemp   in Kelvin
			alt_voltage,						// AltenatorVoltage    in Voltage
			fuel_rate * GALLON_TO_LITRE,		// FuelRate            in litres/hour
			N2kDoubleNA,						// EngineHours         in seconds
			N2kDoubleNA,						// EngineCoolantPress  in Pascal
			N2kDoubleNA,						// EngineFuelPress     in Pascal
			0,									// EngineLoad          in %
			0,									// EngineTorque        in %
			status1,							// Status1             Engine Discrete Status 1
			status2);							// Status2             Engine Discrete Status 2
	}
	else if (PGN == PGN_FLUID_LEVEL)
	{
		double level = 50 + (float)random(-20,20);
		double capacity = 144 * GALLON_TO_LITRE;
		tN2kFluidType fluid_type = N2kft_Fuel;

		if (show_sends)
			display(dbg_sensor,"Send(%d) fuel_level(%d)=%d",
				++counter,instance,(int)level);

		SetN2kPGN127505(msg, instance, fluid_type, level, capacity);
	}
	
	// SIDS have the semantic meaning of tying a number of messages together to
	// 		one point in time.  If used, they should start at 0, and recyle after 252
	// 		253 and 254 are reserved.

	nmea2000.SendMsg(msg);

}	// sendSensor()



static void sendSensors()
{
	static int sensor_num = 0;

	#define MAX_SEND 	7

	if (!show_sends)
	{
		static int send_num = 0;
		if (send_num++ % (5 * MAX_SEND) == 0)
			display(0,"sent (%d) sensor messages",send_num);
	}
	
	switch (sensor_num)
	{
		// case 0:	sendSensor(PGN_HEADING);      break;
		// case 1:	sendSensor(PGN_SPEED);        break;
		case 1:	sendSensor(PGN_DEPTH);            break;
		case 2:	sendSensor(PGN_TEMPERATURE);      break;
		case 3:	sendSensor(PGN_ENGINE_RAPID);     break;
		case 4:	sendSensor(PGN_ENGINE_DYNAMIC);   break;
		case 5: sendSensor(PGN_FLUID_LEVEL,0);	  break;	// port fuel tank
		case 6: sendSensor(PGN_FLUID_LEVEL,1);	  break;	// stbd fuel tank
	}
	sensor_num++;
	if (sensor_num == MAX_SEND)
		sensor_num = 0;
}



//-----------------------------
// handleSerial()
//-----------------------------


static void handleCommand(uint32_t PGN,const char *name,char *linebuf,bool *random, double *value)
{
	if (linebuf[0] == 'r')
	{
		*random = true;
		warning(0,"Setting random %s",name);
	}
	else if (linebuf[0] != 0)
	{
		*random = false;
		*value = (double) atol(linebuf);
		warning(0,"Setting %s=%0.1f",name,*value);
	}
	sendSensor(PGN);
}



static void handleSerial()
{
	#define MAXLINE 80
	static bool in_line;

	static uint8_t line_ptr;
	static char linebuf[MAXLINE+1];
	static uint8_t line_command;

	if (Serial.available())
	{
		uint8_t byte = Serial.read();
		if (in_line)
		{
			if (line_command == 'x')
			{
				if (byte == '!')
				{
					warning(0,"REBOOTING !!!",0);
					// prh - reboot teensy
					while (1) {}
				}
				else
				{

					line_command = 0;
					line_ptr = 0;
					in_line = 0;
					my_error("unexpected char after x==reboot",0);
					return;
				}
			}

			if (byte == 0x0A || line_ptr >= MAXLINE)
			{
				linebuf[line_ptr++] = 0;

				if (line_command == 'i')
				{
					if (linebuf[0] == 0)	// i by itself
					{
						sensor_interval = 0;
						sendSensors();
					}
					else
					{
						sensor_interval = atol(linebuf);
						warning(0,"Setting Sensor Interval=%d",sensor_interval);
					}
				}
				else if (line_command == 'h')
					handleCommand(PGN_HEADING,"heading",linebuf,&random_heading,&heading);
				else if (line_command == 's')
					handleCommand(PGN_SPEED,"speed",linebuf,&random_speed,&speed);
				else if (line_command == 'd')
					handleCommand(PGN_DEPTH,"depth",linebuf,&random_depth,&depth);
				else if (line_command == 't')
					handleCommand(PGN_TEMPERATURE,"temperature",linebuf,&random_temp,&temperatureF);
				else if (line_command == 'r')
					handleCommand(PGN_ENGINE_RAPID,"rpms",linebuf,&random_rpms,&rpms);

				line_command = 0;
				line_ptr = 0;
				in_line = 0;
			}
			else if (byte != 0x0D)
			{
				linebuf[line_ptr++] = (char) byte;
			}
		}
		else if (byte == '?')
			Serial.print(usageMessage().c_str());
		else if (
			byte == 'i' ||
			byte == 'h' ||
			byte == 's' ||
			byte == 'd' ||
			byte == 't' ||
			byte == 'r' ||
			byte == 'x' )
		{
			in_line = 1;
			line_ptr = 0;
			line_command = byte;
			if (byte == 'x')
				warning(0,"PRESS '!' to Confirm Reboot!!!",0);
		}
		else if (byte == 'p')
		{
			sendSensor(PGN_POSITION);
		}
		else if (byte == 'b')
		{
			show_bus = !show_bus;
			display(0,"SHOW_BUS <== %d",show_bus);
		}
		else if (byte == 'm')
		{
			show_sends = !show_sends;
			display(0,"SHOW_SEND_MESSAGES <== %d",show_sends);
		}
		else
		{
			warning(0,"unhandled serial character(%c) 0x%02x",byte>32?byte:' ',byte);
		}
	}
}




//--------------------------------------------
// loop()
//--------------------------------------------

void loop()
{
	uint32_t now = millis();

	#if BROADCAST_NMEA200_INFO

		// at this time I have not figured out the actisense reader, and how to
		// get the whole system to work so that when it asks for device configuration(s)
		// and stuff, we send it stuff.  However, this code explicitly sends some info
		// at boot, and I have seen the results get to the reader.

		#define NUM_INFOS	4
		static int info_sent = 0;
		static uint32_t broadcast_time;

		if (info_sent < NUM_INFOS && now - broadcast_time > BROADCAST_INTERVAL)
		{
			broadcast_time = now;
			nmea2000.ParseMessages(); // Keep parsing messages
			switch (info_sent)
			{
				case 0:
					nmea2000.SendProductInformation();
						// 255,	// unsigned char Destination,
						// 0,		// only device
						// false);	// bool UseTP);
					break;
				case 1:
					nmea2000.SendConfigurationInformation(255,0,false);
					break;
				case 2:
					nmea2000.SendTxPGNList(255,0,false);
					break;
				case 3:
					nmea2000.SendRxPGNList(255,0,false);	// empty right now for the sensor
					break;
			}

			info_sent++;
			nmea2000.ParseMessages(); // Keep parsing messages
			return;
		}

	#endif	// BROADCAST_NMEA200_INFO


	//------------------------------------
	// send repeating sensor data
	//-----------------------------------

	static uint32_t sensor_time;
	if (sensor_interval && now - sensor_time > sensor_interval)
	{
		sensor_time = now;
		sendSensors();
	}

	//----------------------------
	// general loop handling
	//----------------------------

	nmea2000.ParseMessages(); // Keep parsing messages

	handleSerial();
	

	#if ALIVE_LED
		static bool alive_on = 0;
		static uint32_t last_alive_time = 0;
		uint32_t alive_now = millis();
		uint32_t alive_delay = alive_on ? ALIVE_ON_TIME : ALIVE_OFF_TIME;
		if (alive_now - last_alive_time >= alive_delay)
		{
			alive_on = !alive_on;
			digitalWrite(ALIVE_LED,alive_on);
			last_alive_time = alive_now;
		}
	#endif
	
}	// loop()
