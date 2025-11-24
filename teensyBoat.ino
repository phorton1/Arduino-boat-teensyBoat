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
#include <instST.h>
#include <inst0183.h>


// Teensy Pins Used
//
// 23 - CRX from CANBUS module
// 22 - CTX to CANBUS module
// 0  - RX1 Seatalk1
// 1  = TX1 Seatalk1
// 7  - RX2 Seatalk2
// 8  - TX2 Seatalk2
// 15 - RX3 NMEA0183A
// 14 - TX3 NMEA0183A
// 16 - RX4 NMEA0183B
// 17 - TX4 NMEA0183B
//
// 4  - SPEED_PULSE out for testing ST50 lOG instrument
// 5  - WIND_PULSE out for testing ST50 WIND instrument
//
// When I thought it would have a Touchscreen:
//
// 3  - T_CS (I think this was supposed to be 5)
// 9  - LCD_DC
// 10 - LCD_CS
// 11 - MISO	(breadboard SPEAD/WIND pulse
// 12 - MOSI
// 13 - SCLK	(breadboard ALIVE_LED)

#define ALIVE_LED		9
#define ALIVE_OFF_TIME	980
#define ALIVE_ON_TIME	20


#define PIN_SPEED_PULSE	 4
	// set this to zero to turn the feature off
#if PIN_SPEED_PULSE
	static bool speed_pulses_on = 1;
	static float last_pulse_speed = -1;
	static bool pulse_state = false;
	static unsigned long last_pulse_toggle = 0;
	static uint32_t pulse_interval_ms = 0;

	void initSpeedPulse()
	{
		pinMode(PIN_SPEED_PULSE,OUTPUT);
		digitalWrite(PIN_SPEED_PULSE,0);
		last_pulse_speed = -1;
		pulse_state = false;
		last_pulse_toggle = 0;
		pulse_interval_ms = 0;
	}
#endif



static void showHelp(bool detailed)
{
	int d = detailed ? 0 : 1;

	display(0,"teensyBoat Help",0);
	proc_entry();
	display(0,"?              show condensed help",0);
	display(0,"help           show detailed help",0);
	display(0,"B=N            set binary mode",0);
	display(0,"LOAD           get instrument setup from EEPROM",0);
	display(0,"SAVE           save instrument setup to EEPROM",0);
	display(0,"STATE          send binary 'state' message",0);

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

	display(0,"AP=1/0         Starts and stops the Autopilot",0);
	display(d,"                   1 sets a heading to the target waypoint",0);
	display(d,"                   0 also turns off Routing",0);
	display(0,"R=1/0          Starts and stops Routing",0);
	display(d,"                   1 turns on the autopilot, monitors for waypoint arrivals",0);
	display(d,"                      and advances to the next waypoint upon completed arrival",0);
	display(d,"                   0 turns off Routineg, but does not turn off autopilot",0);

	display(0,"TRIP=N         Set the Trip Distance",0);
	display(0,"TRIP_ON=1/0    Turn the Trip Odometer on/off",0);

	display(0,"D=n            Sets the depth of water to N feet",0);
	display(0,"H=n            Sets the boats Heading to N true degrees",0);
	display(d,"                   if the autopilot is running, this will be overriden",0);
	display(d,"                   in the next timeslice",0);
	display(0,"S=n            Sets the boat's Speed Through the Water to N knots, and may be required",0);
	display(d,"                   for the virtual boat to start moving",0);
	display(0,"CS=n           Sets the Current Set (angle) to N degrees True",0);
	display(0,"CD=n           Sets the Current Drift (speed) to N knots Absolute",0);

	display(0,"WA=n           Sets the true wind angle to N degrees",0);
	display(0,"WS=n           Sets the true wind speed to N knots",0);

	display(0,"DH=n           Sets the AP desired heading to N true degrees",0);
	display(d,"                   if routing, this will be overriden",0);
	display(d,"                   in the next timeslice",0);

	display(0,"RPM=n          Sets the engine RPMs to N",0);
	display(d,"                   this is overriden by any calls to setSOG, which sets",0);
	display(d,"                   RPMS to 1800 if SOG>0, or 0 if the boat is not moving.",0);
	display(0,"GEN=0/1        Starts and stops the Genset",0);

	display(d,"DT=YYYY-MM-DD HH:MM:SS	sets the RTC to the given date time (UTC)",0);

	display(0,"",0);
	display(0,"Virtual Instruments",0);
	display(0,"    LOAD = load the current instrument configuration to EEPROM",0);
	display(0,"    SAVE = save the current instrument configuration to EEPROM",0);
	display(0,"    STATE = return the state of the instrments via binary",0);

	display(d,"",0);
	display(d,"The instruments are turned off and on to the various protocols/ports",0);
	display(d,"by a bitwise value",0);
	display(0,"    0 = off",0);
	display(0,"    0x01 = Seatalk1",0);
	display(0,"    0x02 = Seatalk2",0);
	display(0,"    0x04 = NMEA0183A",0);
	display(0,"    0x08 = NMEA0183B",0);
	display(0,"    0x10 = NMEA2000",0);
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
	display(0,"I_ST1      = 1/0",0);
	display(0,"I_ST2      = 1/0",0);
	display(0,"I_83A      = 1/0",0);
	display(0,"I_83B      = 1/0",0);
	display(0,"I_2000     = 1/0",0);

	display(0,"",0);
	display(d,"Monitoring",0);
	display(d,"",0);

	display(0,"M_SIM  = n    simulator debugging level, default=1",0);
	// display(0,"M_OUT  = 1/0  monitor outbound instrument messages",0);
	display(0,"M_ST1  = N    monitor Seatalk messags",0);
	display(0,"M_ST2  = N    monitor Seatalk messags",0);
	display(0,"              >= 1 = all in/out",0);
	display(0,"              >= 4 = with debugging",0);
	display(0,"M_83A  = N    monitor NMEA0183 messages",0);
	display(0,"M_83B  = N    monitor NMEA0183 messages",0);
	display(0,"              0x01 = all in/out",0);
	display(0,"              0x02 = ais in only",0);
	display(0,"M_2000 = N    monitor known NMEA2000 sensor messages",0);
	display(0,"              0x01	= sensors out, known messages in",0);
	display(0,"              0x02 = GPS/AIS specifically",0);
	display(0,"              0x04 = known proprietary in",0);
	display(0,"              0x08 = unknown (not busi.e. proprietary) in",0);
	display(0,"              0x10 = BUS in",0);
	display(0,"              0x20 = BUS out",0);

	display(0,"",0);
	display(d,"Forwarding",0);
	display(d,"",0);
	display(0,"FWD  = N      0=none",0);
	display(0,"              0x01 = Port ST1 to ST2",0);
	display(0,"              0x02 = Port ST2 to ST1",0);
	display(0,"              0x20 = Port 83A to 83B",0);
	display(0,"              0x20 = Port 83B to 83A",0);
	display(0,"E80_FILTER=N  turning this on stops GSA,GLL,and RMC from being forwarded",0);
	display(0,"               from 83A to 83B because they KILL the GX2410's GPS!",0);

	display(0,"",0);
	display(d,"NMEA2000 specific",0);
	display(d,"",0);

	display(0,"L 	monadic command to Show NMEA2000 Device List",0);
	display(0,"Q    monadic command to  Query NMEA2000 Devices",0);


	display(0,"",0);
	display(d,"ST50 Specific & Testing",0);
	display(d,"",0);
	display(0,"LAMP =0..3           Sends lamp messages to all ST ports",0);
#if PIN_SPEED_PULSE
	display(0,"SPEED_PULSE = 0/1  	Turns the SPEED pulse generator on and off",0);
#endif
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

	// ST50 instrument test initialization

	#if PIN_SPEED_PULSE
		initSpeedPulse();
	#endif

	
	// initialize instrumetns

	instruments.init();

	// hardwire the boat simulator to start running for initial testing
	
	#if 1
		#if 0
			boat.setStartWPNum(1);
			boat.setTargetWPNum(2);
		#endif

		// I could lessen the binary traffic by turning these
		// on in the window ctors, and turning them off in
		// onClose() methods.
		
		g_BINARY = BINARY_TYPE_BOAT | BINARY_TYPE_ST1 | BINARY_TYPE_ST2;

		// boat.setRouting(true);
		// boat.setSOG(1);
		boat.start();
	#endif
	
	proc_leave();
	display(0,"teensyBoat.ino  setup() finished",0);
	display(0,"type ?<enter> for help",0);
}


//--------------------------------------------------
// handleCommand()
//--------------------------------------------------

uint16_t hexOrUint(const String &str)
	// // base 0 auto-detects "0x" prefix
{
	return strtol(str.c_str(), nullptr, 0);
}


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

	else if (lval.equals("ap"))
		boat.setAutopilot(rval.toInt());
	else if (lval.equals("r"))
		boat.setRouting(rval.toInt());

	else if (lval.equals("trip"))
		boat.setTripDistance(rval.toFloat());
	else if (lval.equals("trip_on"))
		boat.setTripOn(rval.toInt());

	else if (lval.equals("d"))
		boat.setDepth(rval.toFloat());
	else if (lval.equals("h"))
		boat.setHeading(rval.toFloat());
	else if (lval.equals("s"))
		boat.setWaterSpeed(rval.toFloat());
	else if (lval.equals("cs"))
		boat.setCurrentSet(rval.toFloat());
	else if (lval.equals("cd"))
		boat.setCurrentDrift(rval.toFloat());

	else if (lval.equals("wa"))
		boat.setWindAngle(rval.toFloat());
	else if (lval.equals("ws"))
		boat.setWindSpeed(rval.toFloat());

	else if (lval.equals("dh"))
		boat.setDesiredHeading(rval.toFloat());


	else if (lval.equals("rpm"))
		boat.setRPM(rval.toInt());
	else if (lval.equals("gen"))
		boat.setGenset(rval.toInt());

	// instruments

	else if (lval.startsWith("i_"))
	{
		String inst = lval.substring(2);
		uint16_t value = hexOrUint(rval);

		display(0,"inst=%s value=0x%02x",inst.c_str(),value);

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
			inst.equals("st1")		? 100 :
			inst.equals("st2")		? 101 :
			inst.equals("83a")		? 102 :
			inst.equals("83b")		? 103 :
			inst.equals("2000")		? 104 : -1;
		if (inum == -1)
			my_error("invalid instrument(%s)",inst.c_str());
		else if (inum<100)
			instruments.setPorts(inum,value);
		else
			instruments.setAll(inum-100,value);
	}

	// ST50 specific

	else if (lval.equals("lamp"))
	{
		setLampIntensity(rval.toInt());
	}
#if PIN_SPEED_PULSE
	else if (lval.equals("speed_pulse"))
	{
		int value = rval.toInt() ? 1 : 0;
		display(0,"SPEED_PULSES=%d",value);
		if (speed_pulses_on != value)
		{
			speed_pulses_on = value;
			initSpeedPulse();
		}
	}
#endif


	// monitor

	else if (lval.startsWith("m_"))
	{
		String what = lval.substring(2);
		int value = hexOrUint(rval);
		display(0,"monitor %s=0x%02x",what.c_str(),value);

		if (what.equals("sim"))			boat.g_MON_SIM = value;
			// 0..4 = details about boat simulator calculations

		else if (what.equals("st1"))	instruments.g_MON[PORT_ST1] = value;
		else if (what.equals("st2"))	instruments.g_MON[PORT_ST2] = value;
		else if (what.equals("83a"))	instruments.g_MON[PORT_83A] = value;
		else if (what.equals("83b"))	instruments.g_MON[PORT_83B] = value;
		else if (what.equals("2000"))	instruments.g_MON[PORT_2000] = value;
		else
			my_error("invalid monitor command(%s)=%d",what.c_str(),value);

		instruments.sendBinaryState();
	}

	// forwarding

	else if (lval.equals("fwd"))
	{
		int value = hexOrUint(rval);
		display(1,"fwd=%d",value);
		instruments.setFWD(value);
	}
	else if (lval.equals("e80_filter"))
	{
		setE80Filter(rval.toInt());
	}

	// monadic commands
	else if (lval.equals("load"))
		instruments.loadFromEEPROM();
	else if (lval.equals("save"))
		instruments.saveToEEPROM();
	else if (lval.equals("state"))
		instruments.sendBinaryState();

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
// pulses
//--------------------------------------------

#if PIN_SPEED_PULSE
	void doPulses()
	{
		if (!speed_pulses_on)
			return;
		
		uint32_t pulse_now = millis();

		float speed = boat.getWaterSpeed();
		if (last_pulse_speed != speed)
		{
			last_pulse_speed = speed;

			if (speed <= 0.0)
			{
				display(0,"turning SPEED pulses off",0);
				pulse_state = false;
				pulse_interval_ms = 0;
				pinMode(PIN_SPEED_PULSE, OUTPUT);
				digitalWrite(PIN_SPEED_PULSE,0);
			}
			else
			{

				#define STD_HZ_PER_KNOT  		5.6
				#define CALIBRATION_FACTOR 		1.0
				#define HZ_PER_KNOT				(STD_HZ_PER_KNOT / CALIBRATION_FACTOR)

				int pulseHz = round(speed * HZ_PER_KNOT);

				if (pulseHz >= 18)
				{
					// Use PWM for higher frequencies
					display(0,"using PWM speed(%0.2f) Hz(%d)", speed, pulseHz);
					pulse_interval_ms = 0;
					pinMode(PIN_SPEED_PULSE, OUTPUT);
					analogWriteFrequency(PIN_SPEED_PULSE, pulseHz);
					analogWrite(PIN_SPEED_PULSE, 128); // 50% duty
				}
				else
				{
					// Switch to manual toggling
					pinMode(PIN_SPEED_PULSE, OUTPUT);
					float pulseFreq = speed * HZ_PER_KNOT * 1.1;	// fudge factor
					pulse_interval_ms = (pulseFreq > 0.0) ? round(500.0 / pulseFreq) : 0;
					last_pulse_toggle = pulse_now; // reset timer
					display(0,"using MS timer speed(%0.2f) MS(%d)",speed,pulse_interval_ms);
				}
				
			} 	// speed > 0
		}	// speed changed

		// Manual toggling loop (only active if pulseHz < 18)
		if (pulse_interval_ms > 0 && pulse_now - last_pulse_toggle >= pulse_interval_ms)
		{
			last_pulse_toggle = pulse_now;
			pulse_state = !pulse_state;
			display(1,"MS pulse(%d)",pulse_state);
			digitalWrite(PIN_SPEED_PULSE, pulse_state ? HIGH : LOW);
		}
	}
#endif

//--------------------------------------------
// loop()
//--------------------------------------------

void loop()
{
	#if PIN_SPEED_PULSE
		doPulses();
	#endif

	
	instruments.run();
	
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