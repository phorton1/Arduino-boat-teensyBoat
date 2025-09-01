EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1400 1500 0    50   Input ~ 0
RS232_OUT1
$Comp
L Connector_Generic:Conn_01x04 J?
U 1 1 68B5D101
P 1600 1600
F 0 "J?" H 1250 1900 50  0000 L CNN
F 1 "VHF_0183" H 1350 1900 50  0000 L CNN
F 2 "" H 1600 1600 50  0001 C CNN
F 3 "~" H 1600 1600 50  0001 C CNN
	1    1600 1600
	1    0    0    -1  
$EndComp
Text GLabel 1400 1600 0    50   Input ~ 0
RS232_IN1
Text GLabel 1400 1800 0    50   Input ~ 0
RS232_GND1
Text GLabel 1400 2700 0    50   Input ~ 0
RS232_OUT2
$Comp
L Connector_Generic:Conn_01x04 J?
U 1 1 68B5EB73
P 1600 2800
F 0 "J?" H 1250 3100 50  0000 L CNN
F 1 "VHF_0183" H 1350 3100 50  0000 L CNN
F 2 "" H 1600 2800 50  0001 C CNN
F 3 "~" H 1600 2800 50  0001 C CNN
	1    1600 2800
	1    0    0    -1  
$EndComp
Text GLabel 1400 2800 0    50   Input ~ 0
RS232_IN2
Text GLabel 1400 3000 0    50   Input ~ 0
RS232_GND2
Text Notes 2200 1100 0    55   ~ 0
PASS THRU\n(completely separate)
Text Notes 2200 3000 0    55   ~ 0
green common E80-
Text Notes 2200 1800 0    55   ~ 0
green common VHF GPS In-
Text Notes 2200 2700 0    55   ~ 0
white E80 In
Text Notes 2200 2800 0    55   ~ 0
yellow E80 Out
Text Notes 2200 1500 0    55   ~ 0
yellow VHF GPS In+
Text Notes 2200 1600 0    55   ~ 0
blue VHF AIS Out+
Text Notes 3700 2300 0    55   ~ 0
grey VHF AIS-
Text Notes 3700 1100 0    55   ~ 0
PASSIVE\n(AIS->E80 with no MPU)
Text Notes 4850 2300 0    55   ~ 0
green common E80-
Text Notes 3700 2150 0    55   ~ 0
blue VHF AIS Out+
Text Notes 4850 2150 0    55   ~ 0
white E80 In
Text Notes 3700 1800 0    55   ~ 0
green common VHF GPS In-
Text Notes 3700 1500 0    55   ~ 0
yellow VHF GPS In+
Text Notes 3700 1600 0    55   ~ 0
blue VHF AIS Out+
Text Notes 3700 2800 0    55   ~ 0
yellow E80 Out
Text Notes 3700 3000 0    55   ~ 0
green common E80- ??
Wire Wire Line
	4600 2100 4750 2100
Wire Wire Line
	4600 2250 4750 2250
Text Notes 1800 4150 0    55   ~ 0
In PASSIVE mode, VHF_0183 monitors the AIS messages from the VHF\nand can theoretically still spoof the VHF GPS.\n\nIt is not clear if we can monitor the E80 NMEA0183 at the same time,\nas this would mean we are connecting the grey VHS AIS- to the system\nGND.
Text Notes 6200 2300 0    55   ~ 0
grey VHF AIS-
Text Notes 6250 1100 0    55   ~ 0
DIRECT\n(no teensyBoat at all)
Text Notes 6200 2150 0    55   ~ 0
blue VHF AIS Out+
Text Notes 7850 2650 0    55   ~ 0
yellow E80 Out
Text Notes 7850 2850 0    55   ~ 0
brown E80 Out-
Wire Wire Line
	7550 2100 7700 2100
Wire Wire Line
	7550 2250 7700 2250
Text Notes 7850 2300 0    55   ~ 0
green common E80-
Text Notes 7850 2150 0    55   ~ 0
white E80 In
Wire Wire Line
	7550 2600 7700 2600
Text Notes 6200 2650 0    55   ~ 0
yellow VHF GPS In+
Text Notes 6200 2850 0    55   ~ 0
green common VHF GPS In-
Wire Wire Line
	7550 2800 7700 2800
Text Notes 3700 2700 0    55   ~ 0
NC
Text Notes 6200 3750 0    55   ~ 0
I have never tried this direct connection approach.\nIn this configuration, the E80 will receive AIS and\n*may* be able to send GPS to the VHF.
Text Notes 3750 5500 0    55   ~ 0
Note that the VHF-E80 interaction is complicated by\n(or simplified by) the fact that they will both be on \nthe NMEA2000 bus, although the E80 does not appear\nto get AIS information from NMEA2000, it DOES get\nGPS information, and *may* send it in a manner that\nwill spoof the VHF.
$EndSCHEMATC
