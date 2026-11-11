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
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 6AF2BB96
P 1500 900
F 0 "J1" H 1580 942 50  0000 L CNN
F 1 "Conn_01x03" H 1580 851 50  0000 L CNN
F 2 "0_my_footprints:myPheonix3x3.81_right" H 1500 900 50  0001 C CNN
F 3 "~" H 1500 900 50  0001 C CNN
	1    1500 900 
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 6AF2CC95
P 1500 1350
F 0 "J2" H 1580 1392 50  0000 L CNN
F 1 "Conn_01x03" H 1580 1301 50  0000 L CNN
F 2 "0_my_footprints:myPheonix3x3.81_right" H 1500 1350 50  0001 C CNN
F 3 "~" H 1500 1350 50  0001 C CNN
	1    1500 1350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 6AF2D16E
P 1500 1800
F 0 "J3" H 1580 1842 50  0000 L CNN
F 1 "Conn_01x03" H 1580 1751 50  0000 L CNN
F 2 "0_my_footprints:myPheonix3x3.81_right" H 1500 1800 50  0001 C CNN
F 3 "~" H 1500 1800 50  0001 C CNN
	1    1500 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6AF2D1E1
P 1300 1700
F 0 "#PWR05" H 1300 1450 50  0001 C CNN
F 1 "GND" V 1300 1500 50  0000 C CNN
F 2 "" H 1300 1700 50  0001 C CNN
F 3 "" H 1300 1700 50  0001 C CNN
	1    1300 1700
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR06
U 1 1 6AF2D82C
P 1300 1800
F 0 "#PWR06" H 1300 1650 50  0001 C CNN
F 1 "+12V" V 1300 2050 50  0000 C CNN
F 2 "" H 1300 1800 50  0001 C CNN
F 3 "" H 1300 1800 50  0001 C CNN
	1    1300 1800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 6AF30EF3
P 1300 800
F 0 "#PWR01" H 1300 550 50  0001 C CNN
F 1 "GND" V 1300 600 50  0000 C CNN
F 2 "" H 1300 800 50  0001 C CNN
F 3 "" H 1300 800 50  0001 C CNN
	1    1300 800 
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR02
U 1 1 6AF30EF9
P 1300 900
F 0 "#PWR02" H 1300 750 50  0001 C CNN
F 1 "+12V" V 1300 1150 50  0000 C CNN
F 2 "" H 1300 900 50  0001 C CNN
F 3 "" H 1300 900 50  0001 C CNN
	1    1300 900 
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 6AF36732
P 1300 1250
F 0 "#PWR03" H 1300 1000 50  0001 C CNN
F 1 "GND" V 1300 1050 50  0000 C CNN
F 2 "" H 1300 1250 50  0001 C CNN
F 3 "" H 1300 1250 50  0001 C CNN
	1    1300 1250
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR04
U 1 1 6AF36738
P 1300 1350
F 0 "#PWR04" H 1300 1200 50  0001 C CNN
F 1 "+12V" V 1300 1600 50  0000 C CNN
F 2 "" H 1300 1350 50  0001 C CNN
F 3 "" H 1300 1350 50  0001 C CNN
	1    1300 1350
	0    -1   -1   0   
$EndComp
Text GLabel 1300 1000 0    50   Input ~ 0
DATA
Text GLabel 1300 1900 0    50   Input ~ 0
DATA
Text GLabel 1300 1450 0    50   Input ~ 0
DATA
$EndSCHEMATC
