EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A2 23386 16535
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
Text GLabel 4950 4550 3    50   Input ~ 0
CTX
Text GLabel 5100 3300 3    50   Input ~ 0
CANH
Text GLabel 5000 3300 3    50   Input ~ 0
CANL
Text GLabel 5250 4550 3    50   Input ~ 0
CANL
Text GLabel 5150 4550 3    50   Input ~ 0
CANH
Text GLabel 5050 4550 3    50   Input ~ 0
CRX
$Comp
L power:GND #PWR016
U 1 1 68C8AF7F
P 4850 4550
F 0 "#PWR016" H 4850 4300 50  0001 C CNN
F 1 "GND" V 4850 4350 50  0000 C CNN
F 2 "" H 4850 4550 50  0001 C CNN
F 3 "" H 4850 4550 50  0001 C CNN
	1    4850 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR015
U 1 1 68C85564
P 4750 4550
F 0 "#PWR015" H 4750 4400 50  0001 C CNN
F 1 "+3V3" V 4750 4750 50  0000 C CNN
F 2 "" H 4750 4550 50  0001 C CNN
F 3 "" H 4750 4550 50  0001 C CNN
	1    4750 4550
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J12
U 1 1 68C7D765
P 4950 4350
F 0 "J12" V 5100 4500 50  0000 L CNN
F 1 "SN65HVD230" V 5100 3950 50  0000 L CNN
F 2 "0_my_footprints:CANBUS_Module1" H 4950 4350 50  0001 C CNN
F 3 "~" H 4950 4350 50  0001 C CNN
	1    4950 4350
	0    -1   -1   0   
$EndComp
Text GLabel 6950 2600 3    63   Input ~ 0
83A_IN
Wire Wire Line
	15800 2950 16050 2950
Wire Wire Line
	15800 3050 16050 3050
Text Notes 15450 3100 0    63   ~ 0
12V\nData\nGND\n
Text Notes 15050 3100 0    63   ~ 0
red\nyellow\nblack
Wire Wire Line
	14450 2850 14450 2300
Wire Wire Line
	14700 2850 14450 2850
Text Notes 16700 3200 0    63   ~ 0
unused alarm return\nunused alarm\n12V (except it's not)\nseatalk TX\nseatalk RX (except it's not)\nGND (excpt it's not)
Text Notes 16300 2500 0    50   ~ 0
Seatalk Alarm Cable from E80\n(red not connected)
$Comp
L power:GND #PWR024
U 1 1 68BD4022
P 14450 3850
F 0 "#PWR024" H 14450 3600 50  0001 C CNN
F 1 "GND" H 14455 3677 50  0000 C CNN
F 2 "" H 14450 3850 50  0001 C CNN
F 3 "" H 14450 3850 50  0001 C CNN
	1    14450 3850
	1    0    0    -1  
$EndComp
Text Notes 11750 1900 0    50   ~ 0
TRANSMIT\nTXD is normally high, and the other side is pulled up to 3.3v thru 220 ohms,\nso no current flows through opto2_diode, and thus, the yellow (bus) is NOT \npulled down to ground.   When we transmit data, TXD goes low, lights the diode\nand the yellow (bus) is pulled down to ground through opto2.\n
Text Notes 11750 1400 0    50   ~ 0
RECEIVE\nThe yellow (bus) is pulled up to 12V (idle) thru 4.7K ohms.  All devices pull the bus up. \nIf the bus is high (idle), no current flows through opto1_diode, and so RXD is pulled\nup to 3.3V through the 4.7K ohm resistor.   When another device pulls the bus low,\nthe diode lights up and RXD is pulled to ground through opto1.
Wire Wire Line
	14150 2950 14700 2950
Connection ~ 14150 2950
Wire Wire Line
	14150 3450 14150 2950
Wire Wire Line
	13400 3450 14150 3450
Wire Wire Line
	12300 3650 12800 3650
Wire Wire Line
	14450 3650 14450 3850
Connection ~ 14450 3650
Wire Wire Line
	13400 3650 14450 3650
Wire Wire Line
	14450 3150 14450 3650
Connection ~ 14450 3150
Wire Wire Line
	12650 3150 14450 3150
Wire Wire Line
	12650 2950 12650 3150
Wire Wire Line
	13550 2750 13550 2300
Wire Wire Line
	13850 2950 14150 2950
Wire Wire Line
	12300 3450 12300 3350
Wire Wire Line
	12400 3450 12300 3450
Wire Wire Line
	12800 3450 12700 3450
$Comp
L Device:R R3
U 1 1 68211A3C
P 13700 2950
F 0 "R3" H 13770 2996 50  0001 L CNN
F 1 "4.7K" V 13700 2950 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 13630 2950 50  0001 C CNN
F 3 "~" H 13700 2950 50  0001 C CNN
	1    13700 2950
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR023
U 1 1 68244B74
P 12300 3350
F 0 "#PWR023" H 12300 3200 50  0001 C CNN
F 1 "+3V3" H 12315 3523 50  0000 C CNN
F 2 "" H 12300 3350 50  0001 C CNN
F 3 "" H 12300 3350 50  0001 C CNN
	1    12300 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 68236F3F
P 12550 3450
F 0 "R5" H 12620 3496 50  0001 L CNN
F 1 "220" V 12550 3450 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 12480 3450 50  0001 C CNN
F 3 "~" H 12550 3450 50  0001 C CNN
	1    12550 3450
	0    1    1    0   
$EndComp
Text GLabel 12300 3650 0    63   Input ~ 0
TX1
$Comp
L Isolator:TLP291 U2
U 1 1 68235388
P 13100 3550
F 0 "U2" H 13100 3875 50  0001 C CNN
F 1 "TLP521-2" H 13100 3783 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 12900 3350 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 13100 3550 50  0001 L CNN
	1    13100 3550
	1    0    0    -1  
$EndComp
$Comp
L Isolator:TLP291 U1
U 1 1 6822E37B
P 13100 2850
F 0 "U1" H 13100 3175 50  0001 C CNN
F 1 "TLP521-1" H 13100 3083 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 12900 2650 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 13100 2850 50  0001 L CNN
	1    13100 2850
	-1   0    0    -1  
$EndComp
Connection ~ 12650 2750
Wire Wire Line
	12300 2750 12650 2750
Text GLabel 12300 2750 0    63   Input ~ 0
RX1
Wire Wire Line
	12650 2750 12650 2600
Wire Wire Line
	12800 2750 12650 2750
$Comp
L Device:R R1
U 1 1 6822159F
P 12650 2450
F 0 "R1" H 12720 2496 50  0001 L CNN
F 1 "4.7K" V 12650 2450 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 12580 2450 50  0001 C CNN
F 3 "~" H 12650 2450 50  0001 C CNN
	1    12650 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	12800 2950 12650 2950
Wire Wire Line
	13400 2750 13550 2750
Wire Wire Line
	13550 2950 13400 2950
$Comp
L power:+12V #PWR013
U 1 1 6820AAC2
P 13550 2300
F 0 "#PWR013" H 13550 2150 50  0001 C CNN
F 1 "+12V" H 13565 2473 50  0000 C CNN
F 2 "" H 13550 2300 50  0001 C CNN
F 3 "" H 13550 2300 50  0001 C CNN
	1    13550 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	14450 3050 14450 3150
Wire Wire Line
	14700 3050 14450 3050
$Comp
L power:+3V3 #PWR012
U 1 1 681EA407
P 12650 2300
F 0 "#PWR012" H 12650 2150 50  0001 C CNN
F 1 "+3V3" H 12665 2473 50  0000 C CNN
F 2 "" H 12650 2300 50  0001 C CNN
F 3 "" H 12650 2300 50  0001 C CNN
	1    12650 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR014
U 1 1 681E9B5C
P 14450 2300
F 0 "#PWR014" H 14450 2150 50  0001 C CNN
F 1 "+12V" H 14465 2473 50  0000 C CNN
F 2 "" H 14450 2300 50  0001 C CNN
F 3 "" H 14450 2300 50  0001 C CNN
	1    14450 2300
	1    0    0    -1  
$EndComp
Text Notes 16200 3200 0    63   ~ 0
brown\nwhite\nred\nyellow\nblack\nshield
$Comp
L Device:CP C1
U 1 1 68D022FD
P 3200 3950
F 0 "C1" H 3318 3996 50  0001 L CNN
F 1 "100uf" H 2850 3950 50  0000 L CNN
F 2 "0_my_footprints2:CP_my100uf" H 3238 3800 50  0001 C CNN
F 3 "~" H 3200 3950 50  0001 C CNN
	1    3200 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 68DEB69F
P 5000 3100
F 0 "J2" V 5150 3200 50  0000 L CNN
F 1 "NMEA2000" V 5150 2750 50  0000 L CNN
F 2 "0_my_footprints:myPheonix4x3.81_right" H 5000 3100 50  0001 C CNN
F 3 "~" H 5000 3100 50  0001 C CNN
	1    5000 3100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 68DFEA73
P 5200 3300
F 0 "#PWR04" H 5200 3050 50  0001 C CNN
F 1 "GND" V 5200 3100 50  0000 C CNN
F 2 "" H 5200 3300 50  0001 C CNN
F 3 "" H 5200 3300 50  0001 C CNN
	1    5200 3300
	1    0    0    -1  
$EndComp
Text Notes 15450 5350 0    63   ~ 0
12V\nData\nGND\n
Text Notes 15050 5350 0    63   ~ 0
red\nyellow\nblack
Wire Wire Line
	14450 5100 14450 4550
Wire Wire Line
	14700 5100 14450 5100
$Comp
L power:GND #PWR036
U 1 1 69145A55
P 14450 6100
F 0 "#PWR036" H 14450 5850 50  0001 C CNN
F 1 "GND" H 14455 5927 50  0000 C CNN
F 2 "" H 14450 6100 50  0001 C CNN
F 3 "" H 14450 6100 50  0001 C CNN
	1    14450 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	14150 5200 14700 5200
Connection ~ 14150 5200
Wire Wire Line
	14150 5700 14150 5200
Wire Wire Line
	13400 5700 14150 5700
Wire Wire Line
	12300 5900 12800 5900
Wire Wire Line
	14450 5900 14450 6100
Connection ~ 14450 5900
Wire Wire Line
	13400 5900 14450 5900
Wire Wire Line
	14450 5400 14450 5900
Connection ~ 14450 5400
Wire Wire Line
	12650 5400 14450 5400
Wire Wire Line
	12650 5200 12650 5400
Wire Wire Line
	13550 5000 13550 4550
Wire Wire Line
	13850 5200 14150 5200
Wire Wire Line
	12300 5700 12300 5600
Wire Wire Line
	12400 5700 12300 5700
Wire Wire Line
	12800 5700 12700 5700
$Comp
L Device:R R8
U 1 1 69145A6C
P 13700 5200
F 0 "R8" H 13770 5246 50  0001 L CNN
F 1 "4.7K" V 13700 5200 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 13630 5200 50  0001 C CNN
F 3 "~" H 13700 5200 50  0001 C CNN
	1    13700 5200
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR035
U 1 1 69145A72
P 12300 5600
F 0 "#PWR035" H 12300 5450 50  0001 C CNN
F 1 "+3V3" H 12315 5773 50  0000 C CNN
F 2 "" H 12300 5600 50  0001 C CNN
F 3 "" H 12300 5600 50  0001 C CNN
	1    12300 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 69145A78
P 12550 5700
F 0 "R10" H 12620 5746 50  0001 L CNN
F 1 "220" V 12550 5700 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 12480 5700 50  0001 C CNN
F 3 "~" H 12550 5700 50  0001 C CNN
	1    12550 5700
	0    1    1    0   
$EndComp
Text GLabel 12300 5900 0    63   Input ~ 0
TX2
$Comp
L Isolator:TLP291 U5
U 1 1 69145A7F
P 13100 5800
F 0 "U5" H 13100 6125 50  0001 C CNN
F 1 "TLP521-2" H 13100 6033 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 12900 5600 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 13100 5800 50  0001 L CNN
	1    13100 5800
	1    0    0    -1  
$EndComp
$Comp
L Isolator:TLP291 U4
U 1 1 69145A85
P 13100 5100
F 0 "U4" H 13100 5425 50  0001 C CNN
F 1 "TLP521-1" H 13100 5333 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 12900 4900 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 13100 5100 50  0001 L CNN
	1    13100 5100
	-1   0    0    -1  
$EndComp
Connection ~ 12650 5000
Wire Wire Line
	12300 5000 12650 5000
Text GLabel 12300 5000 0    63   Input ~ 0
RX2
Wire Wire Line
	12650 5000 12650 4850
Wire Wire Line
	12800 5000 12650 5000
$Comp
L Device:R R7
U 1 1 69145A90
P 12650 4700
F 0 "R7" H 12720 4746 50  0001 L CNN
F 1 "4.7K" V 12650 4700 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 12580 4700 50  0001 C CNN
F 3 "~" H 12650 4700 50  0001 C CNN
	1    12650 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	12800 5200 12650 5200
Wire Wire Line
	13400 5000 13550 5000
Wire Wire Line
	13550 5200 13400 5200
$Comp
L power:+12V #PWR032
U 1 1 69145A99
P 13550 4550
F 0 "#PWR032" H 13550 4400 50  0001 C CNN
F 1 "+12V" H 13565 4723 50  0000 C CNN
F 2 "" H 13550 4550 50  0001 C CNN
F 3 "" H 13550 4550 50  0001 C CNN
	1    13550 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	14450 5300 14450 5400
Wire Wire Line
	14700 5300 14450 5300
$Comp
L power:+3V3 #PWR031
U 1 1 69145AA1
P 12650 4550
F 0 "#PWR031" H 12650 4400 50  0001 C CNN
F 1 "+3V3" H 12665 4723 50  0000 C CNN
F 2 "" H 12650 4550 50  0001 C CNN
F 3 "" H 12650 4550 50  0001 C CNN
	1    12650 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR033
U 1 1 69145AA7
P 14450 4550
F 0 "#PWR033" H 14450 4400 50  0001 C CNN
F 1 "+12V" H 14465 4723 50  0000 C CNN
F 2 "" H 14450 4550 50  0001 C CNN
F 3 "" H 14450 4550 50  0001 C CNN
	1    14450 4550
	1    0    0    -1  
$EndComp
Text GLabel 14800 3450 2    50   Input ~ 0
ST1
Wire Wire Line
	14800 3450 14150 3450
Connection ~ 14150 3450
Text GLabel 14800 5700 2    50   Input ~ 0
ST2
Wire Wire Line
	14800 5700 14150 5700
Connection ~ 14150 5700
$Comp
L power:GND #PWR02
U 1 1 61C56583
P 2500 3100
F 0 "#PWR02" H 2500 2850 50  0001 C CNN
F 1 "GND" V 2500 2900 50  0000 C CNN
F 2 "" H 2500 3100 50  0001 C CNN
F 3 "" H 2500 3100 50  0001 C CNN
	1    2500 3100
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR01
U 1 1 61DE37E9
P 2500 3000
F 0 "#PWR01" H 2500 2850 50  0001 C CNN
F 1 "+12V" V 2500 3200 50  0000 C CNN
F 2 "" H 2500 3000 50  0001 C CNN
F 3 "" H 2500 3000 50  0001 C CNN
	1    2500 3000
	0    1    1    0   
$EndComp
Connection ~ 1300 3800
Wire Wire Line
	1300 3800 1400 3800
Wire Wire Line
	1850 3800 2000 3800
Wire Wire Line
	1300 3800 1300 3700
Wire Wire Line
	1300 3700 1700 3700
Wire Wire Line
	1700 3900 1850 3800
Wire Wire Line
	1200 3800 1300 3800
$Comp
L Switch:SW_SPDT SW1
U 1 1 61BE9A56
P 1500 3800
F 0 "SW1" H 1500 4085 50  0000 C CNN
F 1 "POWER" H 1500 3994 50  0000 C CNN
F 2 "0_my_footprints:mySwitchToggleSPDT" H 1500 3800 50  0001 C CNN
F 3 "~" H 1500 3800 50  0001 C CNN
	1    1500 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 63C47095
P 2300 3000
F 0 "J1" H 2950 2950 50  0000 C CNN
F 1 "INST_POWER" H 2600 2950 50  0000 C CNN
F 2 "0_my_footprints:myPheonix2x3.81_right" H 2300 3000 50  0001 C CNN
F 3 "~" H 2300 3000 50  0001 C CNN
	1    2300 3000
	-1   0    0    -1  
$EndComp
$Comp
L power:+12V #PWR08
U 1 1 6931F360
P 1200 3800
F 0 "#PWR08" H 1200 3650 50  0001 C CNN
F 1 "+12V" V 1200 4000 50  0000 C CNN
F 2 "" H 1200 3800 50  0001 C CNN
F 3 "" H 1200 3800 50  0001 C CNN
	1    1200 3800
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 61D92C26
P 3350 3800
F 0 "#PWR09" H 3350 3650 50  0001 C CNN
F 1 "+5V" V 3350 4000 50  0000 C CNN
F 2 "" H 3350 3800 50  0001 C CNN
F 3 "" H 3350 3800 50  0001 C CNN
	1    3350 3800
	0    1    -1   0   
$EndComp
$Comp
L cnc3018_Library:BUCK01 M1
U 1 1 61B26C43
P 2400 3950
F 0 "M1" H 2550 3950 50  0000 C CNN
F 1 "BUCK01" H 2300 3950 50  0000 C CNN
F 2 "0_my_footprints:myMini360BuckConverter" H 2350 4250 50  0001 C CNN
F 3 "" H 2350 4250 50  0001 C CNN
	1    2400 3950
	1    0    0    1   
$EndComp
$Comp
L Diode:1N4001 D2
U 1 1 69362762
P 2900 3800
F 0 "D2" H 3100 3600 50  0000 L CNN
F 1 "1N5819" H 2750 3600 50  0000 L CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 2900 3625 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2900 3800 50  0001 C CNN
	1    2900 3800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 693ABDD2
P 2750 4200
F 0 "#PWR011" H 2750 3950 50  0001 C CNN
F 1 "GND" H 2755 4027 50  0000 C CNN
F 2 "" H 2750 4200 50  0001 C CNN
F 3 "" H 2750 4200 50  0001 C CNN
	1    2750 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 693B1C91
P 2000 4200
F 0 "#PWR010" H 2000 3950 50  0001 C CNN
F 1 "GND" H 2005 4027 50  0000 C CNN
F 2 "" H 2000 4200 50  0001 C CNN
F 3 "" H 2000 4200 50  0001 C CNN
	1    2000 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4100 2750 4200
Wire Wire Line
	2000 4100 2000 4200
Wire Wire Line
	3050 3800 3200 3800
Connection ~ 3200 3800
Wire Wire Line
	3200 3800 3350 3800
Wire Wire Line
	3200 4100 2750 4100
Connection ~ 2750 4100
$Comp
L power:+12V #PWR03
U 1 1 694CBA8F
P 4900 3300
F 0 "#PWR03" H 4900 3150 50  0001 C CNN
F 1 "+12V" V 4900 3500 50  0000 C CNN
F 2 "" H 4900 3300 50  0001 C CNN
F 3 "" H 4900 3300 50  0001 C CNN
	1    4900 3300
	-1   0    0    1   
$EndComp
Text GLabel 6800 4550 3    63   Input ~ 0
RX4
$Comp
L power:+3V3 #PWR018
U 1 1 69544CCB
P 7300 4550
F 0 "#PWR018" H 7300 4400 50  0001 C CNN
F 1 "+3V3" V 7300 4750 50  0000 C CNN
F 2 "" H 7300 4550 50  0001 C CNN
F 3 "" H 7300 4550 50  0001 C CNN
	1    7300 4550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 6953CC62
P 7200 4550
F 0 "#PWR017" H 7200 4300 50  0001 C CNN
F 1 "GND" V 7200 4350 50  0000 C CNN
F 2 "" H 7200 4550 50  0001 C CNN
F 3 "" H 7200 4550 50  0001 C CNN
	1    7200 4550
	1    0    0    -1  
$EndComp
Text GLabel 6900 4550 3    63   Input ~ 0
RX3
Text GLabel 7100 4550 3    63   Input ~ 0
TX3
Text GLabel 7000 4550 3    63   Input ~ 0
TX4
$Comp
L Connector_Generic:Conn_01x10 J14
U 1 1 694EB22B
P 7200 4350
F 0 "J14" V 7750 4600 50  0000 C CNN
F 1 "MAX3232" V 7750 4200 50  0000 C CNN
F 2 "0_my_footprints:MAX3232_Module" H 7200 4350 50  0001 C CNN
F 3 "~" H 7200 4350 50  0001 C CNN
	1    7200 4350
	0    -1   -1   0   
$EndComp
Text Notes 6350 1350 0    50   ~ 0
Directions are extern device centric:\n    83x_IN connects to the Input of the connected device.\n    83x_OUT connects to the Output of the connected device.\n
Text GLabel 7700 2600 3    63   Input ~ 0
83B_IN
Text Notes 7750 4250 1    63   ~ 0
R2OUT\nR1OUT\nT2IN\nT1IN\nGND\n3V\nR2IN\nR1IN\nT2OUT\nT1OUT
Text Notes 7850 2200 1    63   ~ 0
GREEN+GREY\nYELLOW\nBLUE
Text Notes 7750 1700 0    50   ~ 0
GX2410
Text Notes 7100 2200 1    63   ~ 0
GREEN+BROWN\nWHITE\nYELLOW
Text Notes 7000 1700 0    50   ~ 0
E80
$Comp
L power:GND #PWR06
U 1 1 697936EC
P 7600 2600
F 0 "#PWR06" H 7600 2350 50  0001 C CNN
F 1 "GND" V 7600 2400 50  0000 C CNN
F 2 "" H 7600 2600 50  0001 C CNN
F 3 "" H 7600 2600 50  0001 C CNN
	1    7600 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6979FE97
P 6850 2600
F 0 "#PWR05" H 6850 2350 50  0001 C CNN
F 1 "GND" V 6850 2400 50  0000 C CNN
F 2 "" H 6850 2600 50  0001 C CNN
F 3 "" H 6850 2600 50  0001 C CNN
	1    6850 2600
	1    0    0    -1  
$EndComp
Text GLabel 8550 6050 1    50   Input ~ 0
POT_CS2
Text GLabel 8650 6050 1    50   Input ~ 0
POT_CS1
Text GLabel 9150 8150 3    50   Input ~ 0
POT_MISO
Text GLabel 8050 8150 3    63   Input ~ 0
TX1
Text GLabel 7950 8150 3    63   Input ~ 0
RX1
$Comp
L power:GND #PWR028
U 1 1 681F5B40
P 7950 6050
F 0 "#PWR028" H 7950 5800 50  0001 C CNN
F 1 "GND" V 7950 5850 50  0000 C CNN
F 2 "" H 7950 6050 50  0001 C CNN
F 3 "" H 7950 6050 50  0001 C CNN
	1    7950 6050
	-1   0    0    1   
$EndComp
$Comp
L power:+3V3 #PWR029
U 1 1 681F6BDE
P 8050 6050
F 0 "#PWR029" H 8050 5900 50  0001 C CNN
F 1 "+3V3" V 8050 6250 50  0000 C CNN
F 2 "" H 8050 6050 50  0001 C CNN
F 3 "" H 8050 6050 50  0001 C CNN
	1    8050 6050
	1    0    0    -1  
$EndComp
Text GLabel 8950 6050 1    63   Input ~ 0
RX3
Text GLabel 9050 6050 1    63   Input ~ 0
TX3
$Comp
L 0_my_teensy:myTeensy4.0 U3
U 1 1 681E4C83
P 8400 7050
F 0 "U3" H 9228 7053 60  0001 L CNN
F 1 "myTeensy4.0" H 8250 6950 60  0000 L CNN
F 2 "0_my_teensy:teensy40" V 9300 7100 60  0001 C CNN
F 3 "" V 9300 7100 60  0000 C CNN
	1    8400 7050
	1    0    0    -1  
$EndComp
Text GLabel 8750 8150 3    63   Input ~ 0
TX2
Text GLabel 8650 8150 3    63   Input ~ 0
RX2
Text GLabel 8750 6050 1    63   Input ~ 0
TX4
Text GLabel 8850 6050 1    63   Input ~ 0
RX4
Text GLabel 9050 8150 3    50   Input ~ 0
WIND_PULSE
$Comp
L power:+5V #PWR027
U 1 1 68C5F036
P 7850 6050
F 0 "#PWR027" H 7850 5900 50  0001 C CNN
F 1 "+5V" V 7850 6150 50  0000 L CNN
F 2 "" H 7850 6050 50  0001 C CNN
F 3 "" H 7850 6050 50  0001 C CNN
	1    7850 6050
	1    0    0    -1  
$EndComp
Text GLabel 8250 6050 1    50   Input ~ 0
CRX
Text GLabel 8150 6050 1    50   Input ~ 0
CTX
Text GLabel 7700 4550 3    63   Input ~ 0
83A_IN
Text GLabel 7600 4550 3    63   Input ~ 0
83B_IN
Text GLabel 7500 4550 3    63   Input ~ 0
83A_OUT
Text GLabel 7400 4550 3    63   Input ~ 0
83B_OUT
$Comp
L power:GND #PWR037
U 1 1 69A1A92C
P 7850 8150
F 0 "#PWR037" H 7850 7900 50  0001 C CNN
F 1 "GND" V 7850 7950 50  0000 C CNN
F 2 "" H 7850 8150 50  0001 C CNN
F 3 "" H 7850 8150 50  0001 C CNN
	1    7850 8150
	1    0    0    -1  
$EndComp
Text GLabel 8250 8150 3    50   Input ~ 0
ACTIVE
Text GLabel 8450 6050 1    63   Input ~ 0
TX5
Text GLabel 8350 6050 1    63   Input ~ 0
RX5
Text Notes 1300 6250 0    50   ~ 0
The board has holes and pads to wire an additional Serial Port (RX5) for future \nexpansion, i.e. an ESP32 for LAN access
Text GLabel 2550 6500 2    63   Input ~ 0
RX5
Text GLabel 2550 6600 2    63   Input ~ 0
TX5
$Comp
L power:GND #PWR030
U 1 1 69AAA64C
P 2550 6400
F 0 "#PWR030" H 2550 6150 50  0001 C CNN
F 1 "GND" V 2550 6200 50  0000 C CNN
F 2 "" H 2550 6400 50  0001 C CNN
F 3 "" H 2550 6400 50  0001 C CNN
	1    2550 6400
	0    -1   -1   0   
$EndComp
Text GLabel 9150 6050 1    50   Input ~ 0
POT_SCLK
Text GLabel 8850 8150 3    50   Input ~ 0
ALIVE_LED
$Comp
L Connector_Generic:Conn_01x08 J8
U 1 1 69AE5894
P 6000 7850
F 0 "J8" V 6150 8050 50  0000 L CNN
F 1 "TEST_RIG" V 6150 7450 50  0000 L CNN
F 2 "0_my_footprints:myJSTx08" H 6000 7850 50  0001 C CNN
F 3 "~" H 6000 7850 50  0001 C CNN
	1    6000 7850
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR039
U 1 1 69B016D2
P 6400 7650
F 0 "#PWR039" H 6400 7400 50  0001 C CNN
F 1 "GND" V 6400 7450 50  0000 C CNN
F 2 "" H 6400 7650 50  0001 C CNN
F 3 "" H 6400 7650 50  0001 C CNN
	1    6400 7650
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR040
U 1 1 69B0D841
P 6300 7650
F 0 "#PWR040" H 6300 7500 50  0001 C CNN
F 1 "+5V" V 6300 7750 50  0000 L CNN
F 2 "" H 6300 7650 50  0001 C CNN
F 3 "" H 6300 7650 50  0001 C CNN
	1    6300 7650
	-1   0    0    -1  
$EndComp
Text GLabel 8150 8150 3    50   Input ~ 0
SPEED_PULSE
Text GLabel 6100 7650 1    50   Input ~ 0
WIND_PULSE
Text GLabel 6200 7650 1    50   Input ~ 0
SPEED_PULSE
Text GLabel 5900 7650 1    50   Input ~ 0
POT_SCLK
Text GLabel 6000 7650 1    50   Input ~ 0
POT_MISO
Text GLabel 5700 7650 1    50   Input ~ 0
POT_CS2
Text GLabel 5800 7650 1    50   Input ~ 0
POT_CS1
Text Notes 1600 8300 0    50   ~ 0
The JST8 TEST_RIG connector is a general purpose connector.\nAlthough initially designed for testing ST50 instruments, since\nit brings out full SPI signals, it should be general enough to run\nan SPI TFT display if desired.\n\nIt also brings out the I2C signals, should the need arise. \n\nAs initially designed It provides pulses  to spoof the ST50 Speed/Log \nand Wind instruments, and allows for the addition of digital potentiometers\n(inc/dec, SPI, or I2C) for resistance based spoofing (Log Temperature, Wind \nDirection, etc).  The instrument itself is powered and connected  to one of the \ntwo ST ports on this PCB.\n 
$Comp
L Device:LED D4
U 1 1 69BBC2B7
P 6000 6150
F 0 "D4" H 5993 6367 50  0000 C CNN
F 1 "ALIVE_LED" H 5993 6276 50  0000 C CNN
F 2 "0_my_footprints2:led_small_red" H 6000 6150 50  0001 C CNN
F 3 "~" H 6000 6150 50  0001 C CNN
	1    6000 6150
	1    0    0    -1  
$EndComp
Text GLabel 6150 6150 2    50   Input ~ 0
ALIVE_LED
$Comp
L Device:R R9
U 1 1 69BC4C2F
P 5700 6150
F 0 "R9" H 5770 6196 50  0001 L CNN
F 1 "220" V 5700 6150 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 5630 6150 50  0001 C CNN
F 3 "~" H 5700 6150 50  0001 C CNN
	1    5700 6150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR034
U 1 1 69BD7043
P 5550 6150
F 0 "#PWR034" H 5550 5900 50  0001 C CNN
F 1 "GND" V 5550 5950 50  0000 C CNN
F 2 "" H 5550 6150 50  0001 C CNN
F 3 "" H 5550 6150 50  0001 C CNN
	1    5550 6150
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J13
U 1 1 69BF4FBB
P 6000 4350
F 0 "J13" V 6150 3900 50  0000 C CNN
F 1 "CAN_TERMINATOR" V 6150 4300 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 6000 4350 50  0001 C CNN
F 3 "~" H 6000 4350 50  0001 C CNN
	1    6000 4350
	0    1    -1   0   
$EndComp
Text GLabel 5900 4850 3    50   Input ~ 0
CANH
Text GLabel 6000 4850 3    50   Input ~ 0
CANL
$Comp
L Device:R R2
U 1 1 69C09B31
P 6000 4700
F 0 "R2" H 6070 4746 50  0001 L CNN
F 1 "120" V 6000 4700 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 5930 4700 50  0001 C CNN
F 3 "~" H 6000 4700 50  0001 C CNN
	1    6000 4700
	-1   0    0    1   
$EndComp
Wire Wire Line
	5900 4850 5900 4550
$Comp
L Connector_Generic:Conn_01x02 J10
U 1 1 69C27C1B
P 2100 5300
F 0 "J10" V 2350 5250 50  0000 C CNN
F 1 "12V_TEST" V 2250 5250 50  0000 C CNN
F 2 "0_my_footprints2:pinSocket1x2" H 2100 5300 50  0001 C CNN
F 3 "~" H 2100 5300 50  0001 C CNN
	1    2100 5300
	0    -1   1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J11
U 1 1 69C3DC2B
P 2700 5300
F 0 "J11" V 2950 5250 50  0000 C CNN
F 1 "5V_TEST" V 2850 5250 50  0000 C CNN
F 2 "0_my_footprints2:pinSocket1x2" H 2700 5300 50  0001 C CNN
F 3 "~" H 2700 5300 50  0001 C CNN
	1    2700 5300
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 69C4194B
P 2700 5100
F 0 "#PWR021" H 2700 4950 50  0001 C CNN
F 1 "+5V" V 2700 5300 50  0000 C CNN
F 2 "" H 2700 5100 50  0001 C CNN
F 3 "" H 2700 5100 50  0001 C CNN
	1    2700 5100
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 69C48BFA
P 2200 5100
F 0 "#PWR020" H 2200 4850 50  0001 C CNN
F 1 "GND" V 2200 4900 50  0000 C CNN
F 2 "" H 2200 5100 50  0001 C CNN
F 3 "" H 2200 5100 50  0001 C CNN
	1    2200 5100
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR019
U 1 1 69C48C00
P 2100 5100
F 0 "#PWR019" H 2100 4950 50  0001 C CNN
F 1 "+12V" V 2100 5300 50  0000 C CNN
F 2 "" H 2100 5100 50  0001 C CNN
F 3 "" H 2100 5100 50  0001 C CNN
	1    2100 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 69C577D4
P 2800 5100
F 0 "#PWR022" H 2800 4850 50  0001 C CNN
F 1 "GND" V 2800 4900 50  0000 C CNN
F 2 "" H 2800 5100 50  0001 C CNN
F 3 "" H 2800 5100 50  0001 C CNN
	1    2800 5100
	-1   0    0    1   
$EndComp
Text Notes 9350 1200 0    50   ~ 0
In passive mode, the blue AIS out+ from the GX2410 \nis connected to the white NMEA In + on the E80.
Wire Wire Line
	10800 3300 10800 3200
$Comp
L Connector_Generic:Conn_01x02 J15
U 1 1 69926AA3
P 10600 3400
F 0 "J15" H 10900 3400 50  0000 C CNN
F 1 "GPS_IN" H 10900 3300 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 10600 3400 50  0001 C CNN
F 3 "~" H 10600 3400 50  0001 C CNN
	1    10600 3400
	-1   0    0    1   
$EndComp
Text Notes 9350 1450 0    50   ~ 0
In passive mode, the Seatalk busses are connected\ntogether.  In active mode they are not. 
Text GLabel 10800 4750 3    63   Input ~ 0
ST2
Text GLabel 10700 4750 3    63   Input ~ 0
ST1
Text Notes 9350 2450 0    50   ~ 0
In passive mode, the GPS In+ to the GX2410 is\nconnected to the NMEA out + from the E80.\nthrough a jumper.  The jumper is normally in\nplace, forcing the GX2410 to accept the ST GPS\ncoordinates.  To use the GX2410 as the GPS Source\nin passive mode, the jumper must be removed.\nIn active mode, with bidirectional NMEA0183\nforwarding, the E80_filter, the program determines\nwhat message the GX2410 sees and the jumper\ncan remain, or be removed, depending on software\nsettings.\n
Text GLabel 10800 3200 1    63   Input ~ 0
83A_OUT
Text GLabel 10700 4000 1    63   Input ~ 0
83B_IN
Text GLabel 10400 4000 1    63   Input ~ 0
83A_IN
Text GLabel 10300 4000 1    63   Input ~ 0
83B_OUT
Text GLabel 7800 2600 3    63   Input ~ 0
83B_OUT
Text GLabel 7050 2600 3    63   Input ~ 0
83A_OUT
Text Notes 2250 2300 0    50   ~ 0
Features:\n- NMEA2000 port with optional terminating resistor\n- two NMEA0183 ports\n- two Seatalk ST ports\n- passive binding of 0183 and ST ports when turned off\n- active monitoring/manipulation/forward of 0183 and ST ports when turned on\n- TEST_RIG connector to allow for variety of external PCBs for testing instruments\n- Connector for RX5 for future expansion to possible ESP32 LAN interface\n- 5V and 12V test points for calibrating the Buck Converter\n\nExisting teensyBoat.ino firmware\n- provides sophisticated monitoring of all protocols\n- provides a physical boat simulator that drives\n- simulated instruments that can be assigned to any protocol\n- can be run as command line app with serial monitor (i.e. Putty or Arduino IDE)\n\nWorks with teensyBoat.pm wxPerl user interface that provides\n- a serial monitor / console\n- a windowed user interface to easily control aspects of the teensyBoat.ino program
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 69181E1C
P 6950 2400
F 0 "J4" V 7050 2250 50  0000 L CNN
F 1 "83A" V 7050 2400 50  0000 L CNN
F 2 "0_my_footprints:myPheonix3x3.81_right" H 6950 2400 50  0001 C CNN
F 3 "~" H 6950 2400 50  0001 C CNN
	1    6950 2400
	0    1    -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 69202C90
P 7700 2400
F 0 "J5" V 7800 2250 50  0000 L CNN
F 1 "83B" V 7800 2400 50  0000 L CNN
F 2 "0_my_footprints:myPheonix3x3.81_right" H 7700 2400 50  0001 C CNN
F 3 "~" H 7700 2400 50  0001 C CNN
	1    7700 2400
	0    1    -1   0   
$EndComp
Text GLabel 5900 3300 3    50   Input ~ 0
CANH
Text GLabel 5800 3300 3    50   Input ~ 0
CANL
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 6925D224
P 5800 3100
F 0 "J3" V 5950 3200 50  0000 L CNN
F 1 "NMEA2000" V 5950 2750 50  0000 L CNN
F 2 "0_my_footprints:myPheonix4x3.81_right" H 5800 3100 50  0001 C CNN
F 3 "~" H 5800 3100 50  0001 C CNN
	1    5800 3100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6925D22A
P 6000 3300
F 0 "#PWR0101" H 6000 3050 50  0001 C CNN
F 1 "GND" V 6000 3100 50  0000 C CNN
F 2 "" H 6000 3300 50  0001 C CNN
F 3 "" H 6000 3300 50  0001 C CNN
	1    6000 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0102
U 1 1 6925D230
P 5700 3300
F 0 "#PWR0102" H 5700 3150 50  0001 C CNN
F 1 "+12V" V 5700 3500 50  0000 C CNN
F 2 "" H 5700 3300 50  0001 C CNN
F 3 "" H 5700 3300 50  0001 C CNN
	1    5700 3300
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 69145A4D
P 14900 5200
F 0 "J7" H 14600 5500 50  0000 L CNN
F 1 "Seatalk2" H 14750 5500 50  0000 L CNN
F 2 "0_my_footprints:myJSTx03" H 14900 5200 50  0001 C CNN
F 3 "~" H 14900 5200 50  0001 C CNN
	1    14900 5200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J6
U 1 1 68C4B86A
P 14900 2950
F 0 "J6" H 14600 3250 50  0000 L CNN
F 1 "Seatalk1" H 14750 3250 50  0000 L CNN
F 2 "0_my_footprints:myJSTx03" H 14900 2950 50  0001 C CNN
F 3 "~" H 14900 2950 50  0001 C CNN
	1    14900 2950
	1    0    0    -1  
$EndComp
$Comp
L 0_my_symbols:myMAX3333 U6
U 1 1 6920FDA4
P 10550 4350
F 0 "U6" H 11078 4371 50  0000 L CNN
F 1 "myMAX3333" H 11078 4280 50  0000 L CNN
F 2 "0_my_footprints:myDip20" H 10300 4350 50  0001 C CNN
F 3 "" H 10300 4350 50  0001 C CNN
	1    10550 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 69218A3E
P 10500 4750
F 0 "#PWR025" H 10500 4500 50  0001 C CNN
F 1 "GND" V 10500 4550 50  0000 C CNN
F 2 "" H 10500 4750 50  0001 C CNN
F 3 "" H 10500 4750 50  0001 C CNN
	1    10500 4750
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR07
U 1 1 69218A44
P 10500 4000
F 0 "#PWR07" H 10500 3850 50  0001 C CNN
F 1 "+12V" V 10500 4200 50  0000 C CNN
F 2 "" H 10500 4000 50  0001 C CNN
F 3 "" H 10500 4000 50  0001 C CNN
	1    10500 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 6922A5AA
P 10600 4750
F 0 "#PWR026" H 10600 4500 50  0001 C CNN
F 1 "GND" V 10600 4550 50  0000 C CNN
F 2 "" H 10600 4750 50  0001 C CNN
F 3 "" H 10600 4750 50  0001 C CNN
	1    10600 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 3400 10800 4000
Text GLabel 11000 4750 3    50   Input ~ 0
ACTIVE
Text GLabel 10100 4000 1    50   Input ~ 0
ACTIVE
Text GLabel 11000 4000 1    50   Input ~ 0
ACTIVE
Text GLabel 9350 4400 0    50   Input ~ 0
ACTIVE
$Comp
L Device:R R4
U 1 1 692B3DA4
P 9500 4400
F 0 "R4" H 9570 4446 50  0001 L CNN
F 1 "10K" V 9500 4400 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 9430 4400 50  0001 C CNN
F 3 "~" H 9500 4400 50  0001 C CNN
	1    9500 4400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR038
U 1 1 692B6802
P 9650 4500
F 0 "#PWR038" H 9650 4250 50  0001 C CNN
F 1 "GND" V 9650 4300 50  0000 C CNN
F 2 "" H 9650 4500 50  0001 C CNN
F 3 "" H 9650 4500 50  0001 C CNN
	1    9650 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 4400 9650 4500
$EndSCHEMATC
