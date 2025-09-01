# teensyBoat

A does-it-all NMEA2000, NMEA0183, Seatalk box.

- Protocol Monitor for Boat
- Protocol Simulator for Desktop testing
- Also sends ST50 pulses to test Log and Wind instruments
- Has an LCD touch screen

teensyBoat attaches to the various protocols using modules
or onboard circutry:

- NMEA2000 uses SN65HVD230 CANBUS Transceiver Module
- NMEA0183 uses two MAX3232 Serial Modules (at this time)
- Seatalk uses onboard opto-isolator circut to connect to Seatalk Junction Box
- Pulse Output is used in addition to Seatalk connector to ST50 device


Initial version done with teensy4.0 and does no logging.

- may use a teensy 4.1 and its SD card for logging
- may use a serial interface to an ESP32 for web access
  and/or enhanced UI

To the degree that the serial protocol can also be implemented in Perl
on the laptop. it should be possible to bypass the ESP32 and connect
directly to the teensy with the laptop running a new service (HTTP Server)
to avoid entirely the usage of wifi on the for Instrument monitoring.

It is not clear that a single teensy can handle all of the traffic required
to both simulate, and monitor, the virtual boat and its instruments as well
as the real boat and its instruments, much less drive a touchscreen.


### Arduinco-libraries-Boat

teensyBoat makes use of the library to send and/or decode protocols.

- boatSimulator
- instSimulator
- ge_routes.cpp weakly linked

Currently relies on Serial interface for errors, warnings,
and supporting UI.



### Caveats and Notes

#### Does not solve E80 Route Management problem

In the end, what I really want to do is be able to do route, waypoint,
and track management on the E80 via my own interface.  However, no protocols
at this level can read/write E80 routes, waypoints, or tracks.

The next complicated level would be to try to use TCP/IP to communicate
directly with the E80, as is currently done by the Raymarine RNS software.
There are some hints on how to do that, including displaying the E80 radar
in Open CPN, on the web.

The worst idea is to replace the screen in the old desk E80, and while
doing so, see if I can get at it's CPU innards somehow, but that is probably
a hopelessly complicated and weird approach.  Even dealing with the
ARCHIVE.FSH files and CF cards at this time is nearly hopelessly complicated.


#### MAX3232 problem

I spent a lot of time making my own dual channel MAX3232 NMEA0183 interface module.

My board does not work, despite trying everything I could think of.
As far as I can tell, my "pass through" configuration is now an exact
match for the serial board, except that I am using another channel.

I have some jumpers to provide a "passive" scheme to send the
VHF AIS to the E80 while still monitoring it, which I tested on
a single serial board. The E80 apparently requires a full differential
pair from the VHF for the AIS to be received (the AIS lines don't have
enough *oomph* for the E80 as single ended using the green common VHF-)
in the basic "pass through" configuration.  However, the testing fails
in the "pass through" configuration/

Note that the Serial boards capacitor number do not match the
reference MAX3232 documentation!

	Their#	Ref #    from       to
	C1		C1       pin1(C1+)	pin3(C1-)
	C2		C3		 pin2(V+)   3.3v ***
	C3		C4		 pin6(V-)	gnd
	C4		C2		 pin5(C2-)	pin4(C2+)

(0) I get no output on the RS232 side and nothing is
    received.  The RS232 outputs are pegged at -6V no
    matter what happens on the MPU input side.

(1) I am using four 100nf (0.1uf) ceramic capacitors.
   The doc says that ceramic are ok, and I doubt the module
   is using polarized caps.

(2) I verified the charge pump is basically working as I see
    around +6V at the V+ pin and -6V or so at the V- pin.

(3) I have excruciatingly verified that the MPU is sending data
    to the MAX3232 and would show data if it was received.
    I can even connect the MPU output to the MAX3232 directly
    to 3.3V and the output still does not go high.

(4) I encoded a 6 second square wave as outputs from the MPU.
    Using the serial modules, I see the RS232 outputs swing
    from -5.9 to +6V with a simple volt meter.  On my board
   it never changes.

(5) *** I originally had the cap on Pin2(V+) to ground, and noticed
    that the serial module has it going to 3.3V.  So I modified my
    board to have it goto 3.3v as per the module

No effing joy.  I am out of ideas.  I've worked three days on this
and thought it would be simple.

Last Notes (HI levels first if value changes based on MPU).
Grumble, I hooked the MAX3232 MPU_OUT1 to 5V to see if that would
get it to work.  I believe I  burned out that MAX3232 as
the charge pump appears to not be working, and the chip gets pretty
hot, pretty quickly. So I replaced it with the old one.
I have no more spares.

						Mine				Module
	1-C1+			4.99 to 4.98		4.77 to 4.82
	2-V+			6.25 to 6.28		5.97 to 6.05
	3-C1-			2.50 to 2.65		1.86 to 1.87
	4-C2+								2.69
	5-C2-							    -3.05 to -2.85
	6-V-			-6.05 to -6.1		-5.44 to -5.75
	7-RS232_OUT2	-6.04 to -6.10		-5.26 to -5.60 (note note in use)
	8-RS232_IN2							0.07 nom (not not in use)


	16-VCC			3.24v
	15-GND
	14-RS232_OUT1	-6.04 to -6.10		5.16 to -5.24
	13-RS232_IN1
	12-MPU-OUT1
	11-MPU_IN1							1.68 nom; w/loop back:
	10-MPU_IN2							1.54 nom (note not in use)
	9-MPU_OUT2							3.24 nom (note not in use)



