//-------------------------------------------
// teensyBoat.ino
//-------------------------------------------

#include <myDebug.h>
#include <instSimulator.h>
#include <boatSimulator.h>

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
// 3  - T_CS (I think this was supposed to be 5)
// 9  - LCD_DC
// 10 - LCD_CS
// 11 - MISO
// 12 - MOSI
// 13 - SCLK
//
// 2 - ALIVE_LED

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

	#if 0
		// hardwire the boat simulator to start running for initial testing
		boat.jumpToWaypoint(1);
		boat.setWaypointNum(2);
		boat.setSOG(90);
		boat.setRouting(true);
		boat.start();
	#endif
	
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
		/*
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
		*/
		
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