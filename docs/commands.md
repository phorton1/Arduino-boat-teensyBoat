# teensyBoat.ino - Commands

**[Home](readme.md)** --
**[Electronics](electronics.md)** --
**[3DP](3dp.md)** --
**Commands**

repos: **[phorton1](https://github.com/phorton1)** --
**teensyBoat Firmware** --
**[teensyBoat App](https://github.com/phorton1/base-apps-teensyBoat/blob/master/docs/readme.md)** --
**[Boat Library](https://github.com/phorton1/Arduino-libraries-Boat/blob/master/docs/readme.md)** --
**[tbESP32 WiFi](https://github.com/phorton1/Arduino-boat-tbESP32/blob/master/docs/readme.md)** --
**[teensyWind Tester](https://github.com/phorton1/Arduino-boat-teensyWind/blob/master/docs/readme.md)** --
**[teensyGPS](https://github.com/phorton1/Arduino-boat-teensyGPS/blob/master/docs/readme.md)**

The teensyBoat firmware accepts a single set of **text commands** on its USB
serial port (which can also be tunnelled over WiFi by a companion **tbESP32**,
or forwarded via the **teensyBoat.pm** wxPerl application's HTTP API).
Commands are case-insensitive and take the form `VERB` or `KEY=VALUE`,
terminated by a newline.

This page lists the **complete set of commands accepted by the firmware**.
The bulk of the commands come from the Boat library and operate on the virtual
boat simulator and virtual instruments; the same commands are accepted by any
sketch built on the library (teensyBoat.ino, teensyGPS.ino, teensyWind.ino).
A small set of additional commands (`REBOOT`, `?`, `help`) is implemented by
this firmware directly.

For the C++ semantics of each command, see the
[Boat Library Commands](https://github.com/phorton1/Arduino-libraries-Boat/blob/master/docs/commands.md)
reference, which is the authoritative source for command behavior.


## Port Mask Bits

Several commands take a **port mask** -- a bitfield naming a combination of the
five output protocol ports.  These bits appear unchanged everywhere a port mask
is used.

| Bit    | Port          | Notes                                |
|--------|---------------|--------------------------------------|
| 0x01   | ST1           | Seatalk1 port 1                      |
| 0x02   | ST2           | Seatalk1 port 2                      |
| 0x04   | 83A           | NMEA 0183 port A                     |
| 0x08   | 83B           | NMEA 0183 port B                     |
| 0x10   | 2000          | NMEA 2000 CAN bus                    |


## Boat Simulator -- State

| Command   | Value                            | Effect                                                       |
|-----------|----------------------------------|--------------------------------------------------------------|
| `I`       | -                                | Re-initialize the simulator (preserves running state)        |
| `RUN`     | -                                | Start the simulator's 1 Hz time loop                         |
| `STOP`    | -                                | Stop the simulator; state is preserved, instrument output halts |
| `S=N`     | knots                            | Water speed.  **Must be > 0 for the boat to move.**          |
| `H=N`     | degrees true                     | Heading.  Overridden by autopilot each tick if AP is on.     |
| `D=N`     | feet                             | Depth of water under keel                                    |
| `WT=N`    | Celsius, or `N.NF` for Fahrenheit | Water temperature.  Suffix `F` (or `f`) converts from F to C.|
| `WA=N`    | degrees true                     | True wind angle -- the direction the wind is coming FROM     |
| `WS=N`    | knots                            | True wind speed                                              |
| `CS=N`    | degrees true                     | Current set -- angle the water is going TO                   |
| `CD=N`    | knots                            | Current drift -- speed of the current                        |
| `RUD=N`   | -30.0 .. 30.0 degrees            | Rudder angle (direct, unsmoothed)                            |
| `RPM=N`   | integer                          | Engine RPM.  Overridden by SOG: forced to 1800 if SOG > 0, else 0. |
| `GEN=N`   | 0 or 1                           | Stop or start the genset                                     |
| `TRIP=N`  | NM                               | Trip odometer distance                                       |
| `TRIP_ON=N` | 0 or 1                         | Trip odometer on/off                                         |
| `DT=YYYY-MM-DD HH:MM:SS` | UTC                | Set the simulator's date/time (RTC)                          |


## Boat Simulator -- Routing and Autopilot

| Command       | Value                | Effect                                                       |
|---------------|----------------------|--------------------------------------------------------------|
| `ROUTE=name`  | route name           | Load named route; place boat at waypoint 0; turn off autopilot and routing |
| `J=N`         | waypoint index       | Teleport (Jump) the boat to waypoint N; turn off autopilot and routing |
| `WP=N`        | waypoint index       | Set the target waypoint to N; do not move the boat           |
| `AP=N`        | 0, 1, or 2           | Autopilot mode: 0 = OFF, 1 = AUTO, 2 = VANE (placeholder)    |
| `R=N`         | 0 or 1               | Routing off/on.  `R=1` also enables autopilot AUTO; stops at final waypoint. |
| `DH=N`        | degrees true         | Autopilot desired heading (used when AP is on but routing is off) |


## Boat Simulator -- Virtual AIS Targets

A set of persistent virtual "other boats" (vboats) that circle in and out of range
of the simulated boat and emit AIS.  There is **no on/off command**: the vboats run
whenever the AIS virtual instrument is enabled on any port (`I_AIS=M` -- even a
SeaTalk port, though SeaTalk carries no AIS).  NMEA 0183 emits `!AIVDM` messages 18
and 24; NMEA 2000 emits PGNs 129039 / 129809 / 129810.

| Command         | Value    | Effect                                                       |
|-----------------|----------|--------------------------------------------------------------|
| `AIS`           | -        | Dump the current vboat state to the serial output            |
| `AIS_N=N`       | 0 .. 8   | Number of virtual boats (default 5)                          |
| `AIS_RATE=N`    | seconds  | Average seconds between AIS bursts on the wire, >= 1 (default 3).  One vboat sends one message type per burst, so ~ `AIS_N * 3 * rate` seconds cycles through all of them. |
| `AIS_MIN_CPA=N` | NM       | Standoff distance normal vboats keep from the sboat (default 0.5).  Set it above the receiver's CPA alarm ring so normal traffic never trips it. |
| `AIS_RANGE=N`   | NM       | Outer range vboats appear within and recycle beyond (default 4; forced to at least `AIS_MIN_CPA + 1`, and `AIS_MIN_CPA` bumps it up if needed) |
| `COLLIDE=N`     | 0 or 1   | Put one vboat on a steady collision course toward the sboat to test the receiver's CPA alarm |


## Query

| Command           | Output                                                                |
|-------------------|-----------------------------------------------------------------------|
| `SIM`             | Multi-line snapshot: running/routing/ap, route/target, position, heading/speed, distance, xte |
| `ROUTES`          | List of all available routes with waypoint counts                     |
| `ROUTE_WPS=name`  | Every waypoint in the named route with index, name, lat, lon          |


## Virtual Instruments

### Per-instrument port assignment

| Command       | Value      | Effect                                  |
|---------------|------------|-----------------------------------------|
| `I_DEPTH=M`   | port mask  | Depth sounder output ports              |
| `I_LOG=M`     | port mask  | Speed/log instrument output ports       |
| `I_WIND=M`    | port mask  | Wind instrument output ports            |
| `I_COMPASS=M` | port mask  | Heading/compass output ports            |
| `I_GPS=M`     | port mask  | GPS output ports                        |
| `I_AIS=M`     | port mask  | AIS output ports                        |
| `I_AP=M`      | port mask  | Autopilot output ports                  |
| `I_ENG=M`     | port mask  | Engine monitor output ports             |
| `I_GEN=M`     | port mask  | Genset output ports                     |

### Per-port all-instruments

| Command     | Value   | Effect                                  |
|-------------|---------|-----------------------------------------|
| `I_ST1=N`   | 0 or 1  | Set/clear ST1 bit on every instrument   |
| `I_ST2=N`   | 0 or 1  | Set/clear ST2 bit on every instrument   |
| `I_83A=N`   | 0 or 1  | Set/clear 83A bit on every instrument   |
| `I_83B=N`   | 0 or 1  | Set/clear 83B bit on every instrument   |
| `I_2000=N`  | 0 or 1  | Set/clear 2000 bit on every instrument  |

### Forwarding

| Command         | Value      | Effect                                                |
|-----------------|------------|-------------------------------------------------------|
| `FWD=M`         | bitfield   | Forwarding mask (bits below)                          |
| `E80_FILTER=N`  | 0 or 1     | When on, suppress GSA/GLL/RMC from 83A -> 83B forwarding (these sentences crash the Standard Horizon GX2410's GPS) |

Forwarding bits:

| Bit    | Direction                  |
|--------|----------------------------|
| 0x01   | ST1 -> ST2                 |
| 0x02   | ST2 -> ST1                 |
| 0x04   | 83A -> 83B                 |
| 0x08   | 83B -> 83A                 |


## Monitoring

| Command     | Value     | Meaning                                                       |
|-------------|-----------|---------------------------------------------------------------|
| `M_SIM=N`   | 0..4      | Boat simulator calculation detail (1 is default)              |
| `M_ST1=N`   | 0/1/4+    | Seatalk1 port 1: >= 1 = all in/out, >= 4 = with debugging     |
| `M_ST2=N`   | 0/1/4+    | Seatalk1 port 2 (same scale)                                  |
| `M_83A=N`   | bitfield  | NMEA 0183 port A (bits below)                                 |
| `M_83B=N`   | bitfield  | NMEA 0183 port B (same bits)                                  |
| `M_2000=N`  | bitfield  | NMEA 2000 (bits below)                                        |

NMEA 0183 monitoring bits:

| Bit    | Meaning                  |
|--------|--------------------------|
| 0x01   | all sentences in/out     |
| 0x02   | AIS sentences in only    |

NMEA 2000 monitoring bits:

| Bit       | Meaning                                              |
|-----------|------------------------------------------------------|
| 0x0001    | Sensors out, known messages in                       |
| 0x0002    | GPS/AIS specifically                                 |
| 0x0004    | Known proprietary in                                 |
| 0x0008    | Unknown (not sensors, not proprietary, not bus) in   |
| 0x0010    | Known BUS in                                         |
| 0x0020    | Known BUS out                                        |
| 0x1000    | Include self-sent messages, not just received        |
| 0x8000    | Show raw "instrument" messages                       |


## EEPROM and State

| Command   | Effect                                                          |
|-----------|-----------------------------------------------------------------|
| `LOAD`    | Load saved instrument configuration from EEPROM                 |
| `SAVE`    | Save current instrument configuration to EEPROM                 |
| `CLEAR`   | Reset all instruments, monitoring, forwarding, GP8 function, M_SIM |
| `STATE`   | Emit the current state as a binary `BINARY_TYPE_PROG` packet    |


## GP8 Connector and ST50 Testing

### GP8 mode

| Command          | Value                                | Effect                                            |
|------------------|--------------------------------------|---------------------------------------------------|
| `GP8_MODE=X`     | `0`/`off`, `1`/`speed`, `2`/`wind`, `3`/`esp32` | Set the GP8 connector function          |

### ST50 testing setters

| Command         | Value      | Effect                                                                |
|-----------------|------------|-----------------------------------------------------------------------|
| `LAMP=N`        | 0..3       | Send Seatalk1 lamp-intensity message to all ST ports                  |
| `RAW_MODE=N`    | 0 or 1     | 0 = calculated; 1 = use raw setters below                             |
| `HZ=N`          | hertz      | Raw pulse frequency for `GP8_MODE=speed`                              |
| `PWMA=N`        | 0..255     | Raw duty cycle for PWMA (ST50 Wind green)                             |
| `PWMB=N`        | 0..255     | Raw duty cycle for PWMB (ST50 Wind blue)                              |
| `WIND_CIRCLE=N` | 0, 1, 2    | Wind sweep: 0 = off, 1 = 2 deg per 250 ms calibration, 2 = 15 deg per 15 s measurement |


## NMEA 2000 Device Queries

| Command   | Effect                                              |
|-----------|-----------------------------------------------------|
| `L`       | List known NMEA 2000 devices on the bus             |
| `Q`       | Broadcast a device-query message to the bus         |


## Binary Streaming

The firmware streams selected channels of state in a compact binary form to a
connected host application.  These commands manipulate the global binary-output
mask `g_BINARY`.

| Command       | Value     | Effect                                                          |
|---------------|-----------|-----------------------------------------------------------------|
| `B=N`         | bitfield  | Set `g_BINARY` directly                                         |
| `B_PROG=N`    | 0 or 1    | `BINARY_TYPE_PROG` (instrument config)                          |
| `B_SIM=N`     | 0 or 1    | `BINARY_TYPE_SIM` (simulator state at 1 Hz)                     |
| `B_BOAT=N`    | 0 or 1    | `BINARY_TYPE_BOAT` (reserved; unimplemented)                    |
| `B_AIS=N`     | 0 or 1    | `BINARY_TYPE_AIS` (aggregated virtual AIS targets)              |
| `B_ST=N`      | 0 or 1    | `BINARY_TYPE_ST1` + `BINARY_TYPE_ST2` (decoded Seatalk1)        |
| `B_0183=N`    | 0 or 1    | `BINARY_TYPE_0183A` + `BINARY_TYPE_0183B` (raw NMEA 0183)       |
| `B_2000=N`    | 0 or 1    | `BINARY_TYPE_2000` (decoded NMEA 2000 PGN data)                 |


## Firmware-Direct Commands

These commands are implemented directly in `teensyBoat.ino` rather than in the
Boat library.

| Command    | Effect                                                                 |
|------------|------------------------------------------------------------------------|
| `?`        | Show the condensed command help on the serial output                   |
| `help`     | Show the detailed command help on the serial output (includes hints)   |
| `REBOOT`   | Trigger a hard reset of the Teensy via the system reset register       |

---

**Next:** [Home](readme.md)
