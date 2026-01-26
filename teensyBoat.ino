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
// 20 - TX5 tbESP32 / Neo6M
// 21 - RX5 tbESP32	/ Neo6M
//
// 2  - SPEED_PULSE out for testing ST50 LOG/WIND instrument
// 12 - UDP_ENABLE for tbESP32 scheme

//---------------------------------------------------------------
// EIGHT PIN CONNECTOR - tbESP32 Serial5 and UDP_ENABLE
//---------------------------------------------------------------
// The 8 pin connector was transiently designed and never tested
// to support a TFT display.
//
// It is now designed to interface the teensy to the tbESP32 myIOT
// device via Serial5 (RX5 and TX5) and UDP_ENABLE.
//
// SPEED_PULSE is turned off by default and must be defined
// for testing ST50 devices.
//
//		teensy
// conn	gpio	neo6m	tbESP32		ST50 testing 	display
// -------------------------------------------------------------------------
// 1	20 				TX5							LCD_DC
// 2	21		RX5		RX5  						T_CS
// 3	13											SCLK
// 4	12 				UDP_ENABLE 					MISO
// 5	11 	 										MOSI
// 6	2  							SPEED_PULSE		LCD_CS
// 7	5V		5V		5V			5V				5V
// 8	GND		GND		GND			GND				GND
//
// UDP_ENABLE is defined in the Boat library, where the pin is set
// to INPUT_PULLDOWN, and if an tbESP32 is hooked up, it pulls it high,
// enabling UDP transmissions.


#define ALIVE_LED		9
#define ALIVE_OFF_TIME	980
#define ALIVE_ON_TIME	20




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

	display(0,"AP=0,1,2       Starts and stops the Autopilot",0);
	display(d,"                   2 = VANE mode not implemented yet",0);
	display(d,"                   1 = AUTO mode = sets a heading to the target waypoint",0);
	display(d,"                   0 = OFF  also turns off Routing",0);
	display(0,"R=1/0          Starts and stops Routing",0);
	display(d,"                   1 sets autopilot to AUTO modeand monitors for waypoint arrivals",0);
	display(d,"                      and advances to the next waypoint upon completed arrival",0);
	display(d,"                   0 turns off Routing, but does not turn off autopilot",0);

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
	display(0,"RUD=n		  Set rudder from -30.0 to 30.0 degrees",0);

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
	display(d,"The simulated instruments are turned off and on to the various",0);
	display(d,"protocols/ports by a bitwise value",0);
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
	display(d,"All simulated instruments can be turned on or off for a given port/protocol",0);
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
	display(0,"              from 83A to 83B because they KILL the GX2410's GPS!",0);

	display(0,"",0);
	display(d,"NMEA2000 specific",0);
	display(d,"",0);

	display(0,"L 	monadic command to Show NMEA2000 Device List",0);
	display(0,"Q    monadic command to  Query NMEA2000 Devices",0);

	display(0,"",0);
	display(d,"GP8 General Purpose Connector Mode",0);
	display(0,"GP8_MODE = X  0..3, or OFF, PULSE, ESP32, NEO6M",0);


	display(0,"",0);
	display(d,"ST50 Specific & Testing",0);
	display(d,"",0);
	display(0,"LAMP =0..3           Sends lamp messages to all ST ports",0);
#if PIN_SPEED_PULSE
	display(0,"PULSE      = 0/1/2  	0=off; 1=use PULSE_MS value; 2=use WATER_SPEED to generate pulse_ms value",0);
	display(0,"PULSE_HZ   = N       set ms for PULSE_MODE(1)",0);
#endif


	// Binary data controls for communication with teensyBoat.pm.  I used explicitly turn on
	//
	//		BINARY_TYPE_SIM } BINARY_TYPE_ST1 | BINARY_TYPE_ST2
	//
	// in setup(), but would also just invariantly would send BINARY_TYPE_PROG,
	// either in in reponse to the STATE command, or whenever the console UI
	// changed the program state.
	//
	// Now, assuming a single instance of the teensyBoat.pm app at a time,
	// I turn them on based on, and send the STATE command, solely based
	// on the opening and closing of the relevant windows in the pm program
	// in order to minimize spurious serial traffic.  As such, the command API
	// takes 0/1 and adds or removes bits and  B_ST and B_9183 sets both ports
	// bits
	

	display(0,"",0);
	display(d,"Binary interface to teensyBoat.pm",0);
	display(d,"",0);
	display(0,"B_PROG=0/1           Turns on binary data for the Prog window",0);
	display(0,"B_SIM=0/1            Turns on binary data for the boatSim window",0);
	display(0,"B_BOAT=0/1           Turns on binary data for unimplmented boatActual window",0);
	display(0,"B_ST=0/1             Turns on binary data for the Seatalk window",0);
	display(0,"B_0183=0/1           Turns on binary data for unimplemented nmea0183 window",0);
	display(0,"B_2000=0/1           Turns on binary data for unimplemented nmea2000 window",0);
	
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
	
	// initialize instrumetns

	inst_sim.init();

	// hardwire the boat simulator to start running for initial testing
	
	#if 1
		#if 0
			boat_sim.setStartWPNum(1);
			boat_sim.setTargetWPNum(2);
		#endif

		// I could lessen the binary traffic by turning these
		// on in the window ctors, and turning them off in
		// onClose() methods.
		
		// g_BINARY = BINARY_TYPE_BOAT | BINARY_TYPE_ST1 | BINARY_TYPE_ST2;

		// boat_sim.setRouting(true);
		// boat_sim.setSOG(1);
		boat_sim.start();
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
		boat_sim.setDateTime(year,month,day,hour,minute,second);
	}

	else if (lval.equals("i"))
		boat_sim.init();
	else if (lval.equals("run"))
		boat_sim.start();
	else if (lval.equals("stop"))
		boat_sim.stop();
	else if (lval.equals("route"))
		boat_sim.setRoute(rval.c_str());
	else if (lval.equals("j"))
		boat_sim.setStartWPNum(rval.toInt());
	else if (lval.equals("wp"))
		boat_sim.setTargetWPNum(rval.toInt());

	else if (lval.equals("ap"))
		boat_sim.setAutopilot(rval.toInt());
	else if (lval.equals("r"))
		boat_sim.setRouting(rval.toInt());

	else if (lval.equals("trip"))
		boat_sim.setTripDistance(rval.toFloat());
	else if (lval.equals("trip_on"))
		boat_sim.setTripOn(rval.toInt());

	else if (lval.equals("d"))
		boat_sim.setDepth(rval.toFloat());
	else if (lval.equals("h"))
		boat_sim.setHeading(rval.toFloat());
	else if (lval.equals("s"))
		boat_sim.setWaterSpeed(rval.toFloat());
	else if (lval.equals("cs"))
		boat_sim.setCurrentSet(rval.toFloat());
	else if (lval.equals("cd"))
		boat_sim.setCurrentDrift(rval.toFloat());
	else if (lval.equals("rud"))
		boat_sim.setRudder(rval.toFloat());

	else if (lval.equals("wa"))
		boat_sim.setWindAngle(rval.toFloat());
	else if (lval.equals("ws"))
		boat_sim.setWindSpeed(rval.toFloat());

	else if (lval.equals("dh"))
		boat_sim.setDesiredHeading(rval.toFloat());


	else if (lval.equals("rpm"))
		boat_sim.setRPM(rval.toInt());
	else if (lval.equals("gen"))
		boat_sim.setGenset(rval.toInt());

	// simulated instruments

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
			inst_sim.setPorts(inum,value);
		else
			inst_sim.setAll(inum-100,value);
	}

	// General Purpose 8 Pin Connector Mode

	else if (lval.equals("gp8_mode"))
	{
		int value = 0;
		if (rval.length() == 1 && rval[0] >= '0' && rval[0] <= '3')
			value = rval.toInt();
		else if (rval.equals("off"))
			value = 0;
		else if (rval.equals("pulse"))
			value = 1;
		else if (rval.equals("esp32"))
			value = 2;
		else if (rval.equals("neo6m"))
			value = 3;
		else
		{
			my_error("invalid GP8_MODE(%s)",rval.c_str());
			return;
		}
		inst_sim.setGP8Function(value);
	}


	// ST50 specific

	else if (lval.equals("lamp"))
	{
		setLampIntensity(rval.toInt());
	}
#if PIN_SPEED_PULSE
	else if (lval.equals("pulse"))
	{
		inst_sim.setSpeedPulseMode(rval.toInt());
	}
	else if (lval.equals("pulse_hz"))
	{
		inst_sim.setSpeedPulseHz(rval.toInt());
	}
#endif


	// monitor

	else if (lval.startsWith("m_"))
	{
		String what = lval.substring(2);
		int value = hexOrUint(rval);
		display(0,"monitor %s=0x%02x",what.c_str(),value);

		if (what.equals("sim"))			boat_sim.g_MON_SIM = value;
			// 0..4 = details about boat simulator calculations

		else if (what.equals("st1"))	inst_sim.g_MON[PORT_ST1] = value;
		else if (what.equals("st2"))	inst_sim.g_MON[PORT_ST2] = value;
		else if (what.equals("83a"))	inst_sim.g_MON[PORT_83A] = value;
		else if (what.equals("83b"))	inst_sim.g_MON[PORT_83B] = value;
		else if (what.equals("2000"))	inst_sim.g_MON[PORT_2000] = value;
		else
			my_error("invalid monitor command(%s)=%d",what.c_str(),value);

		inst_sim.sendBinaryState();
	}

	// forwarding

	else if (lval.equals("fwd"))
	{
		int value = hexOrUint(rval);
		display(1,"fwd=%d",value);
		inst_sim.setFWD(value);
	}
	else if (lval.equals("e80_filter"))
	{
		setE80Filter(rval.toInt());
	}

	// monadic commands
	else if (lval.equals("load"))
		inst_sim.loadFromEEPROM();
	else if (lval.equals("save"))
		inst_sim.saveToEEPROM();
	else if (lval.equals("state"))
		inst_sim.sendBinaryState();

	else if (lval.equals("l"))
		nmea2000.listDevices();
	else if (lval.equals("q"))
		nmea2000.sendDeviceQuery();
	else if (lval.equals("?"))
		showHelp(0);
	else if (lval.equals("help"))
		showHelp(1);


	// g_BINARY commands

	else if (lval.startsWith("b_"))
	{
		String what = lval.substring(2);
		bool value = rval.toInt();
		uint16_t mask = 0;

		if (what.equals("prog"))		mask = BINARY_TYPE_PROG;
		else if (what.equals("sim"))	mask = BINARY_TYPE_SIM;
		else if (what.equals("boat"))	mask = BINARY_TYPE_BOAT;
		else if (what.equals("st"))		mask = BINARY_TYPE_ST1 | BINARY_TYPE_ST2;
		else if (what.equals("0183"))	mask = BINARY_TYPE_0183A | BINARY_TYPE_0183B;
		else if (what.equals("2000"))	mask = BINARY_TYPE_2000;
		else
			my_error("invalid binary command(%s)=%s",lval.c_str(),rval.c_str());

		if (mask)
		{
			display(0,"g_BINARY %s=%s value(%d) mask(0x%04x)",lval.c_str(),rval.c_str(),value,mask);
			if (value)
				g_BINARY |= mask;
			else
				g_BINARY &= ~mask;
		}
	}

	// unknown commands

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

	#ifdef SERIAL_ESP32
		// If udp_enabled, we process the bytes, but
		// we read (clear) the SERIAL_ESP32 serial port
		// even if udp_enabled is not true.

		if ((inst_sim.getGP8Function() == GP8_FUNCTION_ESP32) && SERIAL_ESP32.available())
		{
			static String lval;
			static String rval;
			static bool got_equals;
			char c = SERIAL_ESP32.read();

			if (inst_sim.doTbEsp32())
			{
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
		}
	#endif

}	// handleSerial()




//--------------------------------------------
// loop()
//--------------------------------------------

void loop()
{
	inst_sim.run();
	
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