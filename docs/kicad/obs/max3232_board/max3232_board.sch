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
Text Notes 9300 2750 0    55   ~ 0
PASSIVE CONFIGURATION\n(VHF->E80, monitor VHF)
Text GLabel 9900 3550 2    55   Input ~ 0
E80_IN
Text GLabel 9900 3450 2    55   Input ~ 0
E80-
Text GLabel 9750 3450 0    55   Input ~ 0
VHF_AIS-
Text GLabel 9750 3550 0    55   Input ~ 0
VHF_AIS+
Text GLabel 9750 3050 0    55   Input ~ 0
VHF_AIS+
Text GLabel 9900 3050 2    50   Input ~ 0
RS232_IN1
Text GLabel 9750 2950 0    55   Input ~ 0
VHF-
$Comp
L power:GND #PWR010
U 1 1 68B681D3
P 9900 2950
F 0 "#PWR010" H 9900 2700 50  0001 C CNN
F 1 "GND" V 9900 2750 50  0000 C CNN
F 2 "" H 9900 2950 50  0001 C CNN
F 3 "" H 9900 2950 50  0001 C CNN
	1    9900 2950
	0    -1   -1   0   
$EndComp
Text Notes 7400 2750 0    55   ~ 0
PASS_THRU CONFIGURATION\n(VHF<->teensy, E80<->teensy)
Text GLabel 7900 2950 0    55   Input ~ 0
VHF-
Text GLabel 7900 3050 0    55   Input ~ 0
VHF_AIS+
Text GLabel 8050 3550 2    50   Input ~ 0
RS232_IN2
$Comp
L power:GND #PWR08
U 1 1 68B6ECEB
P 8050 3450
F 0 "#PWR08" H 8050 3200 50  0001 C CNN
F 1 "GND" V 8050 3250 50  0000 C CNN
F 2 "" H 8050 3450 50  0001 C CNN
F 3 "" H 8050 3450 50  0001 C CNN
	1    8050 3450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 68B70D9C
P 8050 2950
F 0 "#PWR09" H 8050 2700 50  0001 C CNN
F 1 "GND" V 8050 2750 50  0000 C CNN
F 2 "" H 8050 2950 50  0001 C CNN
F 3 "" H 8050 2950 50  0001 C CNN
	1    8050 2950
	0    -1   -1   0   
$EndComp
Text GLabel 8050 3050 2    50   Input ~ 0
RS232_IN1
Text GLabel 7900 3150 0    55   Input ~ 0
VHF_GPS_IN+
Text GLabel 8050 3150 2    50   Input ~ 0
RS232_OUT1
Text GLabel 7900 3450 0    55   Input ~ 0
E80-
Text GLabel 7900 3550 0    55   Input ~ 0
E80_OUT
Text GLabel 7900 3650 0    55   Input ~ 0
E80_IN
Text GLabel 8050 3650 2    50   Input ~ 0
RS232_OUT2
Wire Wire Line
	5850 4100 5850 4200
Wire Wire Line
	5800 3550 5800 3650
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 68BABEFB
P 6050 4100
F 0 "J5" H 5650 4250 50  0000 L CNN
F 1 "JMP2B" H 5800 4250 50  0000 L CNN
F 2 "0_my_footprints:myPinHeader_1x02" H 6050 4100 50  0001 C CNN
F 3 "~" H 6050 4100 50  0001 C CNN
	1    6050 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 68BABEF5
P 6000 3550
F 0 "J4" H 5600 3700 50  0000 L CNN
F 1 "JMP1B" H 5750 3700 50  0000 L CNN
F 2 "0_my_footprints:myPinHeader_1x02" H 6000 3550 50  0001 C CNN
F 3 "~" H 6000 3550 50  0001 C CNN
	1    6000 3550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 68BAAB8C
P 6150 4100
F 0 "J3" H 5750 4250 50  0000 L CNN
F 1 "JMP2A" H 5900 4250 50  0000 L CNN
F 2 "0_my_footprints:myPinHeader_1x02" H 6150 4100 50  0001 C CNN
F 3 "~" H 6150 4100 50  0001 C CNN
	1    6150 4100
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 68BA59D6
P 6100 3550
F 0 "J2" H 5700 3700 50  0000 L CNN
F 1 "JMP1A" H 5850 3700 50  0000 L CNN
F 2 "0_my_footprints:myPinHeader_1x02" H 6100 3550 50  0001 C CNN
F 3 "~" H 6100 3550 50  0001 C CNN
	1    6100 3550
	-1   0    0    -1  
$EndComp
Text Notes 3200 4400 0    55   ~ 0
In the pass-thru configuration (bottom jumpers)\nthe E80- is connected to ground, and the E80_in\nis connected to RS232_OUT2, so that the MAX3232 \ncan talk to both the VHF and E80 as simple single \nended devices in both directions.
Text Notes 3300 3750 0    55   ~ 0
In the passive configuration, (top jumpers)\nthe  VHF_AIS- (grey) and VHF_AIS+ (blue) \nare connected to the E80- and E80_IN as the\nE80 appears to require the differential pair
Text GLabel 6350 4100 2    55   Input ~ 0
VHF_AIS+
Text GLabel 6300 3550 2    55   Input ~ 0
VHF_AIS-
Text Notes 4400 3200 0    55   ~ 0
doesn't hurt if passive
Text Notes 5350 2900 2    55   ~ 0
these dont need to change\n\nand this doesn't hurt anything if passive
Text GLabel 6350 4200 2    50   Input ~ 0
RS232_OUT2
Text GLabel 5850 4100 0    55   Input ~ 0
E80_IN
Text GLabel 6100 3150 2    55   Input ~ 0
E80_OUT
Text GLabel 5800 3550 0    55   Input ~ 0
E80-
Text GLabel 5950 2850 0    50   Input ~ 0
RS232_OUT1
Text GLabel 6100 2850 2    55   Input ~ 0
VHF_GPS_IN+
Text GLabel 5950 2750 0    50   Input ~ 0
RS232_IN1
$Comp
L power:GND #PWR04
U 1 1 68B7E700
P 6300 3650
F 0 "#PWR04" H 6300 3400 50  0001 C CNN
F 1 "GND" V 6300 3450 50  0000 C CNN
F 2 "" H 6300 3650 50  0001 C CNN
F 3 "" H 6300 3650 50  0001 C CNN
	1    6300 3650
	0    -1   -1   0   
$EndComp
Text GLabel 5950 3150 0    50   Input ~ 0
RS232_IN2
Text GLabel 6100 2750 2    55   Input ~ 0
VHF_AIS+
Text Notes 5550 2450 0    55   ~ 0
SWITCHABLE CONFIGURATION
Text GLabel 4600 1600 2    50   Input ~ 0
MPU_OUT2
Text GLabel 4600 1500 2    50   Input ~ 0
MPU_IN2
Text GLabel 4600 1400 2    50   Input ~ 0
MPU_IN1
Text GLabel 4600 1300 2    50   Input ~ 0
MPU_OUT1
$Comp
L power:GND #PWR02
U 1 1 68B9C178
P 4600 1200
F 0 "#PWR02" H 4600 950 50  0001 C CNN
F 1 "GND" V 4600 1000 50  0000 C CNN
F 2 "" H 4600 1200 50  0001 C CNN
F 3 "" H 4600 1200 50  0001 C CNN
	1    4600 1200
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR01
U 1 1 68B9AE81
P 4600 1100
F 0 "#PWR01" H 4600 950 50  0001 C CNN
F 1 "+3.3V" V 4600 1350 50  0000 C CNN
F 2 "" H 4600 1100 50  0001 C CNN
F 3 "" H 4600 1100 50  0001 C CNN
	1    4600 1100
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J1
U 1 1 68B97627
P 4400 1400
F 0 "J1" H 4480 1392 50  0000 L CNN
F 1 "Conn_01x06" H 4480 1301 50  0000 L CNN
F 2 "0_my_footprints:myJSTx06" H 4400 1400 50  0001 C CNN
F 3 "~" H 4400 1400 50  0001 C CNN
	1    4400 1400
	-1   0    0    1   
$EndComp
Text GLabel 9100 1900 0    55   Input ~ 0
E80-
Text GLabel 9100 1250 0    55   Input ~ 0
VHF_AIS-
Text GLabel 9100 1150 0    55   Input ~ 0
RS232_IN1
Text GLabel 9100 1050 0    55   Input ~ 0
RS232_OUT1
Wire Wire Line
	6450 1400 6500 1400
Wire Wire Line
	6450 1350 6450 1400
Wire Wire Line
	6300 1350 6450 1350
Wire Wire Line
	6450 1550 6300 1550
Wire Wire Line
	6450 1500 6450 1550
Wire Wire Line
	6500 1500 6450 1500
Wire Wire Line
	6500 1600 6050 1600
$Comp
L Device:C_Small C4
U 1 1 68B46ED6
P 6300 1450
F 0 "C4" H 7000 1450 50  0000 C CNN
F 1 "100nf" H 6800 1450 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6300 1450 50  0001 C CNN
F 3 "~" H 6300 1450 50  0001 C CNN
	1    6300 1450
	-1   0    0    1   
$EndComp
Text GLabel 6500 1800 0    50   Input ~ 0
RS232_IN2
Text GLabel 6500 1700 0    50   Input ~ 0
RS232_OUT2
Text GLabel 7350 1800 2    50   Input ~ 0
MPU_OUT2
Text GLabel 7350 1700 2    50   Input ~ 0
MPU_IN2
Text GLabel 7350 1600 2    50   Input ~ 0
MPU_IN1
Text GLabel 7350 1500 2    50   Input ~ 0
MPU_OUT1
Text GLabel 7350 1400 2    50   Input ~ 0
RS232_IN1
Text GLabel 7350 1300 2    50   Input ~ 0
RS232_OUT1
Wire Wire Line
	5500 1300 5500 1600
Connection ~ 7600 1000
Wire Wire Line
	7600 1000 7900 1000
$Comp
L power:GND #PWR03
U 1 1 68B36433
P 5500 1600
F 0 "#PWR03" H 5500 1350 50  0001 C CNN
F 1 "GND" H 5500 1400 50  0000 C CNN
F 2 "" H 5500 1600 50  0001 C CNN
F 3 "" H 5500 1600 50  0001 C CNN
	1    5500 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR06
U 1 1 68B368C8
P 7900 1000
F 0 "#PWR06" H 7900 850 50  0001 C CNN
F 1 "+3.3V" H 7915 1173 50  0000 C CNN
F 2 "" H 7900 1000 50  0001 C CNN
F 3 "" H 7900 1000 50  0001 C CNN
	1    7900 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 68B34939
P 8000 1200
F 0 "#PWR07" H 8000 950 50  0001 C CNN
F 1 "GND" H 8000 1000 50  0000 C CNN
F 2 "" H 8000 1200 50  0001 C CNN
F 3 "" H 8000 1200 50  0001 C CNN
	1    8000 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 1300 5500 1300
Wire Wire Line
	7450 1100 7350 1100
Wire Wire Line
	7450 1000 7450 1100
Wire Wire Line
	7600 1000 7450 1000
Wire Wire Line
	7350 1200 7600 1200
$Comp
L Device:C_Small C5
U 1 1 68B33D97
P 7600 1100
F 0 "C5" H 7800 900 50  0000 C CNN
F 1 "100nf" H 7600 900 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7600 1100 50  0001 C CNN
F 3 "~" H 7600 1100 50  0001 C CNN
	1    7600 1100
	-1   0    0    1   
$EndComp
Wire Wire Line
	6500 1300 6300 1300
Wire Wire Line
	6500 1100 6300 1100
$Comp
L Device:C_Small C3
U 1 1 68B2CA70
P 6300 1200
F 0 "C3" H 7000 1250 50  0000 C CNN
F 1 "100nf" H 6800 1250 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6300 1200 50  0001 C CNN
F 3 "~" H 6300 1200 50  0001 C CNN
	1    6300 1200
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 68B239D7
P 6050 1400
F 0 "C2" H 6500 1350 50  0000 C CNN
F 1 "100nf" H 6300 1350 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6050 1400 50  0001 C CNN
F 3 "~" H 6050 1400 50  0001 C CNN
	1    6050 1400
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 68B20D4E
P 6050 1150
F 0 "C1" H 6500 1150 50  0000 C CNN
F 1 "100nf" H 6300 1150 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6050 1150 50  0001 C CNN
F 3 "~" H 6050 1150 50  0001 C CNN
	1    6050 1150
	-1   0    0    1   
$EndComp
$Comp
L 0_my_symbols:MAX3232 U1
U 1 1 68B1EBA3
P 6950 1450
F 0 "U1" V 6550 1400 50  0000 L CNN
F 1 "MAX3232" V 6450 1300 50  0000 L CNN
F 2 "Package_SO:SOIC-16_4.55x10.3mm_P1.27mm" H 6800 1500 50  0001 C CNN
F 3 "" H 6800 1500 50  0001 C CNN
	1    6950 1450
	0    1    1    0   
$EndComp
Text GLabel 9100 1800 0    55   Input ~ 0
E80_IN
Text Notes 9450 2000 0    63   ~ 0
white = NMEA Input + \ngreen = NMEA Input (common) -\nyellow = NMEA Output +
$Comp
L Connector_Generic:Conn_01x03 J8
U 1 1 68B4B6DA
P 9300 1900
F 0 "J8" H 9000 2200 50  0000 L CNN
F 1 "E80_0183" H 9150 2200 50  0000 L CNN
F 2 "0_my_footprints:myTerminalBlock_2.54x03" H 9300 1900 50  0001 C CNN
F 3 "~" H 9300 1900 50  0001 C CNN
	1    9300 1900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 68BBF137
P 9300 1150
F 0 "J7" H 9000 1500 50  0000 L CNN
F 1 "VHF_0183B" H 9150 1500 50  0000 L CNN
F 2 "0_my_footprints:myTerminalBlock_2.54x02" H 9300 1150 50  0001 C CNN
F 3 "~" H 9300 1150 50  0001 C CNN
	1    9300 1150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 68BBD504
P 9300 950
F 0 "J6" H 9000 1200 50  0000 L CNN
F 1 "VHF_0183A" H 9150 1200 50  0000 L CNN
F 2 "0_my_footprints:myTerminalBlock_2.54x02" H 9300 950 50  0001 C CNN
F 3 "~" H 9300 950 50  0001 C CNN
	1    9300 950 
	1    0    0    -1  
$EndComp
Text Notes 9450 1250 0    63   ~ 0
green = GPS Input - (common VHF-)\nyellow = GPS Input +\nblue = AIS Output +\ngrey = AIS Output -\n
Wire Wire Line
	6500 1200 6450 1200
Wire Wire Line
	6450 1200 6450 1050
Wire Wire Line
	6450 1050 6050 1050
Wire Wire Line
	6050 1250 6050 1300
Connection ~ 6050 1300
Wire Wire Line
	6050 1500 6050 1600
Wire Wire Line
	7600 1200 8000 1200
Connection ~ 7600 1200
Text GLabel 6150 2650 2    55   Input ~ 0
VHF-
$Comp
L power:GND #PWR0101
U 1 1 68B5BC1A
P 5900 2650
F 0 "#PWR0101" H 5900 2400 50  0001 C CNN
F 1 "GND" V 5900 2450 50  0000 C CNN
F 2 "" H 5900 2650 50  0001 C CNN
F 3 "" H 5900 2650 50  0001 C CNN
	1    5900 2650
	0    1    -1   0   
$EndComp
Text Notes 1100 1300 0    50   ~ 0
The MAX3232 pin names are ego-centric and \nconfusing.  The labels are more in-line with\nmy way of thinking of it as a set of MPU and\nRS232 io pins.
Text Notes 7750 300  0    50   ~ 0
Also, for some effing reason, kicad thinks\nthe net VHF- is of higher priority than GND,\nand fucks up the understandability of the PCB.
$Comp
L power:GND #PWR0103
U 1 1 68B7B464
P 9100 950
F 0 "#PWR0103" H 9100 700 50  0001 C CNN
F 1 "GND" V 9100 750 50  0000 C CNN
F 2 "" H 9100 950 50  0001 C CNN
F 3 "" H 9100 950 50  0001 C CNN
	1    9100 950 
	0    1    1    0   
$EndComp
Text GLabel 9100 2000 0    55   Input ~ 0
RS232_IN2
$EndSCHEMATC
