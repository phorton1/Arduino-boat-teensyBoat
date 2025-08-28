//-------------------------------------------
// teensyBoat.ino
//-------------------------------------------

#include <myDebug.h>
#include <instSimulator.h>
#include <NMEA2000_Teensyx.h>
#include <N2kMessages.h>


#define dbg_in_msgs		0


#define ALIVE_LED		13
#define ALIVE_OFF_TIME	980
#define ALIVE_ON_TIME	20

#define UPDATE_MILLIS	1000


tNMEA2000_Teensyx nmea2000;
	// (tCANDevice _bus=NMEA2000_TEENSYX_CAN_BUS, tPins _txPin=NMEA2000_TEENSYX_TX_PIN, tPins _rxPin=NMEA2000_TEENSYX_RX_PIN);
static bool show_bus;
static bool show_input;
static bool show_output;


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


static void usage()
{
	// display(0,"STATE: wp(%d) cog(%0.1f) sog(%0.1f) input(%d) output(%d) route(%s) going_to(%d) routing(%d)",
	// 	waypoint_num,cog,sog,show_input,show_output,route_name,going_to,routing);
	display(0,"teensyBoat USAGE",0);
	proc_entry();
	display(0,"? = show this help",0);
	display(0,"y = re-initialize simulator",0);
	display(0,"i = show received datagrams",0);
	display(0,"o = show sent datagrams",0);
	display(0,"x = start/stop simulator",0);
	display(0,"p[name] = pick route; turns off any current routing or goto",0);
	display(0,"hN, h+N, h-N = set/increment/decrement heading (cog)",0);
	display(0,"sN, s+N, s-N = set/increment/decrement speed (sog)",0);
	display(0,"jN, j+N, j-N = jump to waypoint; next waypoint, prev waypoint",0);
	display(0,"wN, w+N, w-N = set heading to waypoint; next waypoint, prev waypoint",0);
	display(0,"a = toggle 'autopilot' (0 turns off 'routing' too)",0);
	display(0,"r = toggle 'routing' (1 turns on 'autopilot' too)",0);
	display(0,"g = toggle genset on or off",0);
	proc_leave();
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

void setup()
{
	pinMode(ALIVE_LED,OUTPUT);
	digitalWrite(ALIVE_LED,1);

	Serial.begin(921600);	// !!! 115200
	delay(2000);
	display(0,"teensyBoat.ino setup() started",0);
	proc_entry();

	//---------------------------------
	// NMEA2000 initialization
	//---------------------------------

	#if 0
		nmea2000.SetN2kCANMsgBufSize(150);
		nmea2000.SetN2kCANSendFrameBufSize(150);
		nmea2000.SetN2kCANReceiveFrameBufSize(150);
	#endif

	#if 1

		nmea2000.SetProductInformation(
			"prh_model_115",            // Manufacturer's Model serial code
			110,                        // Manufacturer's uint8_t product code
			"teensyBoat",       		// Manufacturer's Model ID
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
			#if 0		 // what I've been using up until now
				1250110, // uint32_t my arbitrary unique (serial) number
				130,     // uint8_t  Function(75,130)=Temperature
				75, 	 // uint16_t Class(75)=Sensor Communication Interface
			#elif 0		 // what I probably should have been using
				1250111, // uint32_t my arbitrary unique (serial) number
				170,     // uint8_t  Function(60,170)=Integrated Navigation
				60, 	 // uint16_t Class=Navigation.
			#else		 // an attempt to become a genset (from co-pilot)
				1250112, // uint32_t my arbitrary unique (serial) number
				130,     // uint8_t  Function(30,130)=Generator
				30, 	 // uint16_t Class(30)=Electrical Generation
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

	display(0,"nmea2000.Open() succeeded",0);

	//---------------------------------
	// simulator initialization
	//---------------------------------

	digitalWrite(ALIVE_LED,0);
	delay(500);
	digitalWrite(ALIVE_LED,1);

	instruments.init(&nmea2000);

	delay(500);
	digitalWrite(ALIVE_LED,0);

	// hardwire the boat simulator to start running for initial testing

	boat.jumpToWaypoint(1);
	boat.setWaypointNum(2);
	boat.setSOG(90);
	boat.setRouting(true);
	boat.start();

	proc_leave();
	display(0,"teensyBoat.ino  setup() finished",0);
	usage();

}


//--------------------------------------------------
// handleCommand()
//--------------------------------------------------

static void handleCommand(int command, char *buf)
{
	int val = 1;
	int inc = 0;
	char *orig_buf = buf;
	if (*buf == '+')
	{
		inc = 1;
		buf++;
	}
	else if (*buf == '-')
	{
		inc = -1;
		buf++;
	}
	if (*buf >= '0' && *buf <= '9')
	{
		val = atoi(buf);
	}

	display(0,"command(%c) inc(%d) val(%d)",command,inc,val);
	if (command == 'h')
	{
		double cog = boat.getCOG();

		if (inc)
			cog += (inc * val);
		else
			cog = val;

		if (cog < 0)
			cog += 360;
		if (cog > 360)
			cog -= 360;

		display(0,"HEADING (COG) <= %0.1f",cog);
		boat.setCOG(cog);
	}
	else if (command == 's')
	{
		double sog = boat.getSOG();
		if (inc)
			sog += (inc * val);
		else
			sog = val;
		if (sog > 99)
			sog = 99;
		if (sog < 0)
			sog = 0;

		display(0,"SPEED (SOG) <= %0.1f",sog);
		boat.setSOG(sog);
	}
	else if (command == 'w')
	{
		int wp_num = boat.getWaypointNum();
		int num_wps = boat.getNumWaypoints();

		if (inc)
			wp_num += (inc * val);
		else
			wp_num = val;

		if (wp_num < 0)
			wp_num = 0;
		if (wp_num > num_wps - 1)
			wp_num = num_wps - 1;

		boat.setWaypointNum(wp_num);
	}
	else if (command == 'j')
	{
		int wp_num = boat.getWaypointNum();
		int num_wps = boat.getNumWaypoints();

		// we presume that the waypoint we are leaving is
		// the set waypoint-1

		wp_num--;
		if (wp_num<0) wp_num = 0;

		if (inc)
			wp_num += (inc * val);
		else
			wp_num = val;

		if (wp_num < 0)
			wp_num = 0;
		if (wp_num > num_wps - 1)
			wp_num = num_wps - 1;

		boat.jumpToWaypoint(wp_num);
	}
	else if (command == 'p')
	{
		boat.setRoute(orig_buf);
	}
}


//------------------------------------------------
// handleSerial()
//------------------------------------------------

static void handleSerial()
{
	// Serial UI

	if (Serial.available())
	{
		#define MAXCOMMAND	12

		static int in_command = 0;
		static int cmd_ptr = 0;
		static char command[MAXCOMMAND+1];

		int c = Serial.read();

		if (in_command)
		{
			if (c == 0x0a || cmd_ptr==MAXCOMMAND)
			{
				command[cmd_ptr++] = 0;
				handleCommand(in_command,command);
				in_command = 0;
				cmd_ptr = 0;
			}
			else if (c != 0x0d)
			{
				command[cmd_ptr++] = c;
			}
		}

		// program specific

		else if (c == '?')
		{
			usage();
		}
		else if (c == 'i')
		{
			show_input = (show_input + 1) % 3;
			display(0,"SHOW INPUT(%d)",show_input);
		}
		else if (c == 'o')
		{
			show_output = !show_output;
			display(0,"SHOW OUTPUT(%d)",show_output);
		}

		// simulator

		else if (c == 'x')
		{
			if (boat.running())
				boat.stop();
			else
				boat.start();
		}
		else if (c == 'y')
		{
			boat.init();
		}
		else if (c == 'a')
		{
			boat.setAutopilot(!boat.getAutopilot());
		}
		else if (c == 'r')
		{
			boat.setRouting(!boat.getRouting());
		}
		else if (c == 'g')
		{
			boat.setGenset(!boat.getGenset());
		}
		else if (c == 'h' || c == 's' || c == 'w' || c == 'j' || c == 'p')
		{
			in_command = c;
		}
	}
}	// handleSerial()



//--------------------------------------------
// loop()
//--------------------------------------------

void loop()
{
	uint32_t now = millis();
	static uint32_t last_update = 0;
	if (now - last_update >= UPDATE_MILLIS)
	{
		last_update = now;
		instruments.run();
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


// end of teensyBoat.ino