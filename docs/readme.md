# teensyBoat.ino

TODO: I probably want to add a virtual AIS instrument, particularly
to the degree that I can already parse NMEA0183 and NMEA2000 AIS
messages, and for completeness, want to consider "BUS" messages to
be any messages that are not to "known" instruments (known and
sent NMEA2000 PGNS, NMEA0183 or Seatalk sentences).


A does-it-all NMEA2000, NMEA0183, Seatalk box.

- Protocol Monitor for Boat
- Protocol Simulator for Desktop testing
- Also sends ST50 pulses to test Log and Wind instruments

**teensyBoat.ino** electrically attaches to the various protocols
using modules or onboard circutry:

- NMEA2000 uses SN65HVD230 CANBUS Transceiver Module
- NMEA0183 uses two MAX3232 Serial Modules (at this time)
- Seatalk uses onboard opto-isolator circut to connect to Seatalk Junction Box
- Pulse Output is used in addition to Seatalk connector to ST50 device

teensyBoat.ino makes use of the **Arduino-libraries-Boat** library

- The **boatSimulator** implements a virtual boat, with things like
  COG, SOG, latitude and longitude, wind speed and direction, and so on,
  independent of the instruments it might or might not have.
- The boatSimulator also has a rudimentary set of Routes and
  Waypoints and a generic virtual **autoPilot** that can set, and
  adjust, the course to a given waypoint, notices when waypoints have
  been arrived at, and can implement routing by advancing to the next
  Waypoint in a Route when a waypouint arrival has been detected.
- The **instSimulator** adds a layer on top of the boatSimulatur that
  allows for the configuration of various virtual instruments on the virtual
  boat, where each instrument may make use of one or more of the three
  protocols to transmit messages over the NMEA2000, NMEA0183, or Seatalk
  channels.
- Protocol **monitoring** is generally implemented in the instSimulator,
  which *knows* whether to output monitored packets as specifically
  colored USB Serial Text, or binary encoded packets over the USB Serial
  port to be displayed by console.pm, or understood by the teensyBoat.pm
  program.


The initial version of teensyBoat.ino is implemented with a teensy4.0
and does no logging.  A later version may use a teen teensy 4.1 and its
SD card for logging

Is connected with console.pm or the teensyBoat.pm Perl application
via the USB Serial (COMX) port.


## Serial Command Protocol Basics

Although initially implemented with a rudimentary serial UI that
allowed testing using with just the console.pm program, with the
implementation of the **teensyBoat.pm** WX Perl windows application,
a more sophisticated serial text command protocol has been implemented
which *might* not lend itself to use with a simple console application.

However, despite the complexity, it should be feasable to test and
even utilize teensyBoat.ino with only the console.pm application.

The **Serial Command Protocol** will consist of left/right value
pairs, with crlf (\r\n) line terminators:

	LEFT_IDENTIFIER = RIGHT_VALUE\r\n

### Program Control

- **B=N** Sets (bitwise) binary interface
- **DT=YYYY-MM-DD HH:MM:SS**	sets the RTC to the given date time (UTC)

Binary just uses 1 for everything that is implemented


### Boat Control

These commands allow for positioning of the virtual boat, setting
the depth of water and true wind speed and direction, and so on

- **I** - monadic command to re-initialize the simulator
- **RUN** - monadic command to start the boat simulator
- **STOP** - monadic command to stop the boat simulator

The instrument simulator runs when the boat simulator is running.

Note that the boat is initially set on the 0th waypoint in the 0th route,
and the target waypoint is set to the 1st waypoint in the 0th route.
Upon re-initislization, the boat is set on the 0th waypoint in the current
route and the target waypoint is set to the 1st waypoint in that route.
Upon initialization the COG is set to point to the 1st waypoint, and the
SOG, RPM, autopilot, and routing are all set to zero (turned off).
The wind is set to a fixed (90 true 10 knots) set of values.

- **ROUTE=name** sets the current route to the (known) name
  and re-initializes the simulator.
- **J=N** moves the boat to the nth waypoint in the current
  route, stops the boat and turns off the autopilot and routing
- **WP=n** sets the target waypoint to the given waypoint,
  adjusts the heading to point to the waypoint, does not affect
  state of SOG, autopilot or routing

The following set more of the boat state variables

- **S=n** (important) sets the boat's SOG to n knots, and
  is required for the simulator to start the boat moving.
- **H=n** sets the boats heading to N true degrees.  Note that
  if the autopilot is running, this will be reset to point at
  the target waypoint on the next timeslice.
- **D=n** sets the depth of water to N feet
- **WA=n** sets the true wind direction to N degrees
- **WS=n** sets the true wind speed to N knots
- **RPM=n** sets the engine RPMs to N; note this is overriden
  by any calls to setSOG, which sets the RPMS to 1800 if SOG>0,
  or 0 if the boat is not moving.
- **GEN=0/1** starts and stops the genset.

The following turn things on or off

- **AP=n**, 1 starts the autopilot to the target waypoint;
  0 turns it off.  Note that turning the autopilot off also
  turns off Routing.
- **R=1**, 1 turns on Routing, which starts monitoring for
  waypoint arrivals and advancing to the next waypoint upon
  such an arrival. 1 also turns the autopilot on.
  0 turns off Routing but does not turn off the autopilot.

Note that with Routing turned on, if the final waypoint in
the route is arrived at, the autopilot and routing will be
turned off and the boat will be stopped (the SOG will be
set to zero).



### Virtual Instrument Setup

Each of the virtual instruments can be turned off, or set to output
one or more of the three protocols.  The protocols are specified bitwise,
using decimal numbers, where:

- 0 = off
- 1 = Seatalk
- 2 = NMEA0183 output
- 4 = NMEA2000

Later there will be a second NMEA0183 port.


So, for instance

	INST_DEPTH = 6

means to setup the virtual Depth instrument to output on NMEA2000 and
the NMEA0183 output channel.  The instruments are as follows:

- I_DEPTH
- I_LOG
- I_WIND
- I_COMPASS
- I_GPS
- I_AIS 
- I_AP
- I_ENG
- I_GEN

There is also a verb to turn all instruments on or off for a given port

- I_ST
- I_0183
- I_2000


### Monadic commands

- L = nmea2000 devices
- Q = query nmea2000 devices
- ? = show commands
- help = show detailed help

### Initial Monitor Command and Implementation

Utilize the existing text monitoring capabilities, with the addition
of separate colors per protocol and class of messages.

- M_SIM          = n   monitor the boatSimulator (default=1)
- M_OUT          = n   monitor outbound instrument messages
- M_ST           = n   monitor all incoming Seatalk messags
- M_0183         = n   monitor all incoming NMEA0183 messages
- M_AIS          = n   monitor incoming NMEA0183 AIS messages
- M_2000 		 = n   monitor known NMEA2000 sensor messages
- M_GPS     	 = n   separatly monitor known NMEA2000 GPS messages
- M_PROP     	 = n   monitor known NMEA2000 proprietary messages
- M_BUS     	 = n   monitor any other unhandled bus messages









## Monitoring Ideas

Generally speaking, the command protocol allows for the laptop application
to tell this program (and the Boat library) to suppress, or to send, various
state and monitor output in either a text or binary format.

- 0 means "don't send the information"
- 1 means "send the information as colored text"
- 2 means "send the information in compact binary format"

Since the text format could be quite verbose, the output can be granularized
to only see certain things.  In the binary format these *could* be combined
into fewer messages to lessen the traffic over the com port.

Protocol monitoring is probably the trickiest part of the whole system.

### State Monitoring

The following commands monitor the state of the virtual boat

- BOAT_STATE = the main virtual boat parameters
  - true COG and SOG
  - depth of the water
  - true wind direction and speed
  - apparent wind direction and speed
  - current latitude and longitude,
- ENGINE_STATE = virtual boat parameters that are currently
  dependent on whther there is an SOG, and are essentially
  fixed or randomized at this time
  - RPM
  - Oil Pressure
  - Oil Temperature
  - Coolant Temperature
  - Alternator Voltage
  - Fuel Rate
  - Fuel Level
- GENSET_STATE = although I have yet to get the genset to display on the E80,
  there is a similar fixed/randomized set of genset values available
  - RPM
  - Oil Pressure
  - Coolant Temperature
  - Voltage
  - Frequency
- NAV_STATE
  - Route Name
  - Number of Waypoints
  - Previous Waypoint
  - Target Waypoint
  - Autopilot (on/off)
  - Routing (on/off)
  - Heading to Waypoint
  - Distance to Waypoint
  - Arrival


### Output Monitoring

One wants to monitor the actual bytes that are being OUTPUT for each
virtual instrument and protocol to verify that this program is doing
what one expects.

This seems fairly easy to implement, though the usefulness of it will
depend on the level of detail of the implementation.


## PROTOCOL MONITORING

Once again, protocol monitoring is probably the trickiest part of the whole system.

For protocol messages that are received into this program, whether on
the dekstop or in the real boat, the notion of monitoring is significantly
complicated.

- **known instrument messages** - it seams reasonable to assume that
  any messages sent (in any protocol) by a virtual instrument in this
  program should be *monitorable* and *filterable* by the instrument
  types and protocols.
- **similar instrument messages** - then there are a set of protocol
  messages that may not be currently sent by this program, but which
  logically would belong to one of the virtual instruments. For example
  we don't currently send the Satellites in View GNSS messages, but
  they would logically be associated with the GPS instrument.
- **other known messages** - I have not yet implemented an AIS instrument
  but I have learned to parse some or all of the NMEA0183 and NMEA2000
  AIS messages. Most other "boat state" NMEA2000 and NMEA0183 messages
  could be parsed as well.
- **known proprietary messages** - For instance, there are opaque
  NMEA2000 messages that have known proprietary PGNs.
- **known bus messages** - particularly with NMEA2000 there
  is an entire nuther level of handshaking for identifying nodes
  on the network, keep-alive messages, and so on.  This also
  brings up the notion of the NMEA2000 "device list".
- **known undecoded messags** - there will be messages that are known
  to be decodable that I have not yet implemented decoders for.
- **completely uknown messages** - particularly with Seatalk there
  are messages that I don't have a clue about.

### Protocol State

In addition to merely monitoring all of these message types, there
is the notion of maintaining an "instrumentation state" that is
separate from the virtual boat, by each protocol. In other words,
each protocol develops, essentially, a virtual boat of its own,
with its own lat/lon, heading, cog, depth, and so on.

With NMEA2000 we already have a clear notion of a device list
that would be maintained by this program.

It seems onerous to maintain even more state in this program,
but each protocol essentially presents an entire "state of the
boat" and it would only be feasable to implement that in the
teensyBoat.pm application if all the protocols were constantly
monitored by that program, whereas the state could be kept on
the teensy without necessarily presenting the monitor output
to the application.

Unlike our virtual boat (at this time), however, the state of
the virtual boat presented by the protocols is significantly
more complex, and is not limited to scalar values.  For instance

- GNSS presents a list of satellites in view
- AIS presents a list of targets


### One potential solution

Dump the idea that we are going to specify binary output
on an instrument by instrument or message by message basis.
Allow the specification of text output to utilize the
applicaton console window to show protocols (still complicated),
but move to the notion that if the teensyBoat.pm application
is running, that, more or less, ALL information available is
sent to it in binary format, and let the teensyBoat.pm program
be responsible for maintaining the "protocol state".


## Pulse outputs

At this time the pulse outputs are not implemented.
However, they will probably be simple commands that
specify the milliseconds between pulses:

- PULSE_SPEED = nn
- PULSE_WIND = nn

And will likely be used with virtual Seatalk
LOG and WIND instruments.


## Summary at this time (Sep 10, 2025)

All I know is that I need to make some progress on this.

- I have a basic framework for the teensyBoat.pm application.
- I have implementations of Seatalk, NMEA0183 and NMEA2000 in
  various states of completeness.
- I was more or less satisfied with the monitoring capabilities
  of those ESP32 based applications when all I had were simple
  "monitor input" and "monitor output" commands, and, for NMEA2000
  "monitor instruments", "monitor bus", and "list devices"
  commands.


and

- BINARY=0/1 = lets this program know that teensyBoat.pm is running

In which case all known IN messages are decoded and sent to the app
with a limited set of decoded fields (PGNS can be very complicated
and have a lot of useless, to me, information).

This would include the NMEA2000 code sending the device list to
the app whenever it changes.


## Other Thoughs

It is not clear to what degree the separation of the Boat library
from this INO program is useful.  It *does* theoretically allow
for switching NMEA2000 implementations to the ESP32 or the old
CANBUS modules, but I am not seeing a good reason to ever use
an ESP32 in a direct bus configuration.

The only nice thing about the ESP32 is that it has wifi, but
practically speaking, the wifi is too slow for anything except
a state machine supporting queries (i.e. JSON), and I just hate
writing web apps with javascript and all of its complexities,
though it would be nominally interesting to be able to see
some of this stuff on the iPad or my phone, I don't see that
much practical use in it.

The more likely architecture is to still use a teensy for
the heavy lifting and just talk to an ESP32 over serial
so it can be dedicated to Wifi tasks.

Also, more pertinent to the teensyBoat.pm application
that this teensyBoat.ino program, but while I'm thinking
about it, the app *could* also do the UDP monitoring
currently implemented in /base/bat/raymarineE80/raynet.pm


## Moving Forward

Even though I hate to, I think I will solder up the initial_board
from this project to ease the testing of this program as I develop it.

I really would prefer to wait unitl I had

- the real NMEA2000 PCB connector
- the 3.81mm pheonix PCB connectors
- a working dual channel MAX3232 plug-in interface

I also don't like the current initial_board's connections
(or lack of them) to 12V to supply the seatalk when testing
ST50 instruments.


I would have to wait to make a "real" "boat" version of this PCB.
The alternative is to redesign/add to the current teensy breadboard
with wires to pheonix 3.81 connectors like before, making the desktop
situation complicated.









