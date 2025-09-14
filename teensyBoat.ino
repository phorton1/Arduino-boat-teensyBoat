//-------------------------------------------
// teensyBoat.ino
//-------------------------------------------

#include <myDebug.h>
#include <instSimulator.h>
#include <boatSimulator.h>
#include <instST.h>
#include <inst0183.h>
#include <inst2000.h>
#include <boatBinary.h>


// Teensy Pins Used
//
// 23 - CRX from CANBUS module
// 22 - CTX to CANBUS module
// 7  - RX2
// 8  - TX2
// 15 - RX3 breadboard Seatalk / initial_board NMEA0813
// 14 - TX3 breadboard Seatalk / initial_board NMEA0813
// 16 - RX4 breadboard NMEA0183 / initial_board Seatalk
// 17 - TX4 breadboard NMEA0183 / initial_board Seatalk
//
// 4  - SPEED_PULSE out for testing ST50 lOG instrument
// 5  - WIND_PULSE out for testing ST50 WIND instrument
//
// When I thought it would have a Touchscreen:
//
// 3  - T_CS (I think this was supposed to be 5)
// 9  - LCD_DC
// 10 - LCD_CS
// 11 - MISO
// 12 - MOSI
// 13 - SCLK	(breadboard ALIVE_LED)
//
// 2 - ALIVE_LED (initial_board)

#if BREADBOARD
	#define ALIVE_LED		13
#else
	#define ALIVE_LED		2
#endif
#define ALIVE_OFF_TIME	980
#define ALIVE_ON_TIME	20


// Output a slow square waves, and monitor the inputs, on the two
// NMEA Serial ports. Used to test the MAX3232 board.

#define TEST_RS232   	0
#define TEST_IN1		7
#define TEST_OUT1		8
#define TEST_IN2		15
#define TEST_OUT2		14



static void showHelp(bool detailed)
{
	int d = detailed ? 0 : 1;

	display(0,"teensyBoat Help",0);
	proc_entry();
	display(0,"?              show condensed help",0);
	display(0,"help           show detailed help",0);
	display(0,"B=N            set binary mode",0);

	display(0,"",0);
	display(d,"Virtual Boat",0);
	display(d,"",0);
	display(0,"I              Monadic command to re-initialize the simulator",0);
	display(0,"RUN        	  Turns the boat simulator on",0);
	display(0,"STOP        	  Turns the boat simulator off",0);
	display(d,"               The instrument simulator runs when the boat simulator is running",0);
	display(0,"ROUTE=name     Sets the current route to the (known) name",0);
	display(d,"                   Re-initializes the simulator",0);
	display(0,"J=n            Moves the boat to the Nth waypoint in the current route",0);
	display(d,"                   Stops the boat and turns off autopilot and routing",0);
	display(0,"WP=n           Sets the target waypoint to the Nth waypoint",0);
	display(d,"                   Sets the heading to point to the waypoint, does not affect",0);
	display(d,"                   SOG, autopilot or routing",0);
	display(0,"S=n            IMPORTANT: Sets the boat's SOG to N knots, and is required",0);
	display(d,"                   for the virtual boat to start moving",0);
	display(0,"H=n            Sets the boats heading to N true degrees",0);
	display(d,"                   if the autopilot is running, this will be overriden",0);
	display(d,"                   in the next timeslice",0);
	display(0,"D=n            Sets the depth of water to N feet",0);
	display(0,"WA=n           Sets the true wind angle to N degrees",0);
	display(0,"WS=n           Sets the true wind speed to N knots",0);
	display(0,"RPM=n          Sets the engine RPMs to N",0);
	display(d,"                   this is overriden by any calls to setSOG, which sets",0);
	display(d,"                   RPMS to 1800 if SOG>0, or 0 if the boat is not moving.",0);
	display(0,"GEN=0/1        Starts and stops the Genset",0);
	display(0,"AP=1/0         Starts and stops the Autopilot",0);
	display(d,"                   1 sets a heading to the target waypoint",0);
	display(d,"                   0 also turns off Routing",0);
	display(0,"R=1/0          Starts and stops Routing",0);
	display(d,"                   1 turns on the autopilot, monitors for waypoint arrivals",0);
	display(d,"                      and advances to the next waypoint upon completed arrival",0);
	display(d,"                   0 turns off Routineg, but does not turn off autopilot",0);
	display(d,"DT=YYYY-MM-DD HH:MM:SS	sets the RTC to the given date time (UTC)",0);

	display(0,"",0);
	display(0,"Virtual Instruments",0);
	display(d,"",0);
	display(d,"The instruments are turned off and on to the various protocols/ports",0);
	display(d,"by a bitwise value",0);
	display(0,"    0 = off",0);
	display(0,"    1 = Seatalk",0);
	display(0,"    2 = NMEA0183",0);
	display(0,"    4 = NMEA2000",0);
	display(0,"",0);
	display(0,"I_DEPTH    = bitwise",0);
	display(0,"I_LOG      = bitwise",0);
	display(0,"I_WIND     = bitwise",0);
	display(0,"I_COMPASS  = bitwise",0);
	display(0,"I_GPS      = bitwise",0);
	display(0,"I_AIS      = bitwise",0);
	display(0,"I_AP       = bitwise",0);
	display(0,"I_ENG      = bitwise",0);
	display(0,"I_GEN      = bitwise",0);
	display(d,"",0);
	display(d,"All instruments can be turned on or off for a given port/protocol",0);
	display(d,"",0);
	display(0,"I_ST       = 1/0",0);
	display(0,"I_0183     = 1/0",0);
	display(0,"I_2000     = 1/0",0);

	display(0,"",0);
	display(d,"Monitoring",0);
	display(d,"",0);

	display(0,"M_SIM  = n    simulator debugging level, default=1",0);
	display(0,"M_OUT  = 1/0  monitor outbound instrument messages",0);
	display(0,"M_ST   = 1/0  monitor all incoming Seatalk messags",0);
	display(0,"M_0183 = 1/0  monitor all incoming NMEA0183 messages",0);
	display(0,"M_AIS  = 1/0  monitor incoming NMEA0183 AIS messages",0);
	display(0,"M_2000 = 1/0  monitor known NMEA2000 sensor messages",0);
	display(0,"M_GPS  = 1/0  separatly monitor known NMEA2000 GPS messages",0);
	display(0,"M_PROP = 1/0  monitor known NMEA2000 proprietary messages",0);
	display(0,"M_BUS  = 1/0  monitor any other unhandled bus messages",0);

	proc_leave();
}


//------------------------
// setup
//------------------------

void setup()
{
	#if ALIVE_LED
		pinMode(ALIVE_LED,OUTPUT);
		digitalWrite(ALIVE_LED,1);
	#endif

	Serial.begin(921600);	// !!! 115200
	delay(2000);
	display(0,"teensyBoat.ino setup() started",0);
	proc_entry();

	#if TEST_RS232
		pinMode(TEST_OUT1,OUTPUT);
		pinMode(TEST_IN1,INPUT_PULLUP);
		pinMode(TEST_OUT2,OUTPUT);
		pinMode(TEST_IN2,INPUT_PULLUP);
		digitalWrite(TEST_OUT1,1);
		digitalWrite(TEST_OUT2,1);
	#else
		instruments.init();
	#endif

	#if 1
		// hardwire the boat simulator to start running for initial testing
		boat.setStartWPNum(1);
		boat.setTargetWPNum(2);
		boat.setSOG(90);
		boat.setRouting(true);
		instruments.setAll(PORT_SEATALK,1);
		// g_MON_ST = 1;
		boat.start();
	#endif
	
	display(0,"sizeof(float)=%d",sizeof(float));
	display(0,"sizeof(double)=%d",sizeof(double));
	
	proc_leave();
	display(0,"teensyBoat.ino  setup() finished",0);
	display(0,"type ?<enter> for help",0);
}


//--------------------------------------------------
// handleCommand()
//--------------------------------------------------

static void handleCommand(String lval, String rval, bool got_equals)
{
	display(0,"command: %s%s%s",
			lval.c_str(),
			got_equals?"=":"",
			rval.c_str());

	if (lval.equals('b'))
	{
		g_BINARY = rval.toInt();
	}
	else if (lval.equals("dt"))
	{
		// 0    5  8  11 14 17
		// 2025-09-14 12:00:00
		int year = rval.substring(0,4).toInt();
		int month = rval.substring(5,7).toInt();
		int day = rval.substring(8,10).toInt();
		int hour = rval.substring(11,14).toInt();
		int minute = rval.substring(14,16).toInt();
		int second = rval.substring(17,19).toInt();
		boat.setDateTime(year,month,day,hour,minute,second);
	}
	else if (lval.equals("i"))
		boat.init();
	else if (lval.equals("run"))
		boat.start();
	else if (lval.equals("stop"))
		boat.stop();
	else if (lval.equals("route"))
		boat.setRoute(rval.c_str());
	else if (lval.equals("j"))
		boat.setStartWPNum(rval.toInt());
	else if (lval.equals("wp"))
		boat.setTargetWPNum(rval.toInt());

	else if (lval.equals("s"))
		boat.setSOG(rval.toInt());
	else if (lval.equals("h"))
		boat.setCOG(rval.toInt());
	else if (lval.equals("d"))
		boat.setDepth(rval.toInt());
	else if (lval.equals("wa"))
		boat.setWindAngle(rval.toInt());
	else if (lval.equals("ws"))
		boat.setWindSpeed(rval.toInt());
	else if (lval.equals("rpm"))
		boat.setRPM(rval.toInt());
	else if (lval.equals("gen"))
		boat.setGenset(rval.toInt());

	else if (lval.equals("ap"))
		boat.setAutopilot(rval.toInt());
	else if (lval.equals("r"))
		boat.setRouting(rval.toInt());

	else if (lval.startsWith("i_"))
	{
		String inst = lval.substring(2);
		int inum =
			inst.equals("depth") 	? 0 :
			inst.equals("log") 		? 1 :
			inst.equals("wind") 	? 2 :
			inst.equals("compass") 	? 3 :
			inst.equals("gps")		? 4 :
			inst.equals("ais") 		? 5 :
			inst.equals("ap") 		? 6 :
			inst.equals("eng") 		? 7 :
			inst.equals("gen") 		? 8 :
			inst.equals("st")		? 100 :
			inst.equals("0183")		? 101 :
			inst.equals("2000")		? 102 : -1;
		if (inum == -1)
			my_error("invalid instrument(%s)",inst.c_str());
		else if (inum<100)
			instruments.setPorts(inum,rval.toInt());
		else
			instruments.setAll(inum-100,rval.toInt());
	}

	// monitor temporary implementation

	else if (lval.startsWith("m_"))
	{
		String what = lval.substring(2);
		int value = rval.toInt();
		display(0,0,"monitor %s=%d",what.c_str(),value);

		if (what.equals("sim"))			boat.g_MON_SIM = value;
		else if (what.equals("out"))	instruments.g_MON_OUT = value;
		else if (what.equals("st"))		g_MON_ST = value;
		else if (what.equals("0183"))	g_MON_0183 = value;
		else if (what.equals("ais"))	g_MON_AIS = value;
		else if (what.equals("2000"))	nmea2000.m_MON_SENSORS = value;
		else if (what.equals("gps"))	nmea2000.m_MON_GPS = value;
		else if (what.equals("prop"))	nmea2000.m_MON_PROP = value;
		else if (what.equals("bus"))	nmea2000.m_MON_BUS = value;
		else
			my_error("invalid monitor command(%s)=%d",what.c_str(),value);
	}

	// monadic commands

	else if (lval.equals("l"))
		nmea2000.listDevices();
	else if (lval.equals("q"))
		nmea2000.sendDeviceQuery();
	else if (lval.equals("?"))
		showHelp(0);
	else if (lval.equals("help"))
		showHelp(1);
	else
	{
		my_error("unknown command: %s%s%s",
			lval.c_str(),
			got_equals?"=":"",
			rval.c_str());
	}

}	// handleCommand()



//------------------------------------------------
// handleSerial()
//------------------------------------------------

static void handleSerial()
{
	// Serial UI

	if (Serial.available())
	{
		static String lval;
		static String rval;
		static bool got_equals;
		
		char c = Serial.read();

		if (c == 0x0a)
		{
			handleCommand(lval.toLowerCase(),rval.toLowerCase(),got_equals);
			lval = "";
			rval = "";
			got_equals = 0;
		}
		else if (c == '=')
		{
			got_equals = 1;
		}
		else if (c != 0x0d)
		{
			if (got_equals)
				rval += c;
			else
				lval += c;
		}
	}
}	// handleSerial()



//--------------------------------------------
// loop()
//--------------------------------------------

void loop()
{
	#if TEST_RS232

		static bool out_high = 1;
		static bool in_high1 = 0;
		static bool in_high2 = 0;
		static uint32_t last_toggle = 0;
		uint32_t toggle_now = millis();
		if (toggle_now - last_toggle >= 6000)
		{
			last_toggle = toggle_now;
			out_high = !out_high;
			display(0,"OUT(%d)",out_high);
			digitalWrite(TEST_OUT1,out_high);
			digitalWrite(TEST_OUT2,out_high);
		}
		bool high = digitalRead(TEST_IN1);
		if (in_high1 != high)
		{
			in_high1 = high;
			display(0," IN1(%d)",in_high1);
		}
		high = digitalRead(TEST_IN2);
		if (in_high2 != high)
		{
			in_high2 = high;
			display(0," IN2(%d)",in_high2);
		}
	#else
		instruments.run();
	#endif

	
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
	
	handleSerial();

}	// loop()


// end of teensyBoat.ino