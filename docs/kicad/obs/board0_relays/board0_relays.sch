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
Text GLabel 9000 2150 3    63   Input ~ 0
83A_IN
Wire Wire Line
	18550 4050 18800 4050
Wire Wire Line
	18550 4150 18800 4150
Text Notes 18200 4200 0    63   ~ 0
12V\nData\nGND\n
Text Notes 17800 4200 0    63   ~ 0
red\nyellow\nblack
Wire Wire Line
	17200 3950 17200 3400
Wire Wire Line
	17450 3950 17200 3950
Text Notes 19450 4300 0    63   ~ 0
unused alarm return\nunused alarm\n12V (except it's not)\nseatalk TX\nseatalk RX (except it's not)\nGND (excpt it's not)
Text Notes 19050 3600 0    50   ~ 0
Seatalk Alarm Cable from E80\n(red not connected)
$Comp
L power:GND #PWR024
U 1 1 68BD4022
P 17200 4950
F 0 "#PWR024" H 17200 4700 50  0001 C CNN
F 1 "GND" H 17205 4777 50  0000 C CNN
F 2 "" H 17200 4950 50  0001 C CNN
F 3 "" H 17200 4950 50  0001 C CNN
	1    17200 4950
	1    0    0    -1  
$EndComp
Text Notes 14500 3000 0    50   ~ 0
TRANSMIT\nTXD is normally high, and the other side is pulled up to 3.3v thru 220 ohms,\nso no current flows through opto2_diode, and thus, the yellow (bus) is NOT \npulled down to ground.   When we transmit data, TXD goes low, lights the diode\nand the yellow (bus) is pulled down to ground through opto2.\n
Text Notes 14500 2500 0    50   ~ 0
RECEIVE\nThe yellow (bus) is pulled up to 12V (idle) thru 4.7K ohms.  All devices pull the bus up. \nIf the bus is high (idle), no current flows through opto1_diode, and so RXD is pulled\nup to 3.3V through the 4.7K ohm resistor.   When another device pulls the bus low,\nthe diode lights up and RXD is pulled to ground through opto1.
Wire Wire Line
	16900 4050 17450 4050
Connection ~ 16900 4050
Wire Wire Line
	16900 4550 16900 4050
Wire Wire Line
	16150 4550 16900 4550
Wire Wire Line
	15050 4750 15550 4750
Wire Wire Line
	17200 4750 17200 4950
Connection ~ 17200 4750
Wire Wire Line
	16150 4750 17200 4750
Wire Wire Line
	17200 4250 17200 4750
Connection ~ 17200 4250
Wire Wire Line
	15400 4250 17200 4250
Wire Wire Line
	15400 4050 15400 4250
Wire Wire Line
	16300 3850 16300 3400
Wire Wire Line
	16600 4050 16900 4050
Wire Wire Line
	15050 4550 15050 4450
Wire Wire Line
	15150 4550 15050 4550
Wire Wire Line
	15550 4550 15450 4550
$Comp
L Device:R R3
U 1 1 68211A3C
P 16450 4050
F 0 "R3" H 16520 4096 50  0001 L CNN
F 1 "4.7K" V 16450 4050 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 16380 4050 50  0001 C CNN
F 3 "~" H 16450 4050 50  0001 C CNN
	1    16450 4050
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR023
U 1 1 68244B74
P 15050 4450
F 0 "#PWR023" H 15050 4300 50  0001 C CNN
F 1 "+3V3" H 15065 4623 50  0000 C CNN
F 2 "" H 15050 4450 50  0001 C CNN
F 3 "" H 15050 4450 50  0001 C CNN
	1    15050 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 68236F3F
P 15300 4550
F 0 "R5" H 15370 4596 50  0001 L CNN
F 1 "220" V 15300 4550 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 15230 4550 50  0001 C CNN
F 3 "~" H 15300 4550 50  0001 C CNN
	1    15300 4550
	0    1    1    0   
$EndComp
Text GLabel 15050 4750 0    63   Input ~ 0
TX1
$Comp
L Isolator:TLP291 U2
U 1 1 68235388
P 15850 4650
F 0 "U2" H 15850 4975 50  0001 C CNN
F 1 "TLP521-2" H 15850 4883 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 15650 4450 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 15850 4650 50  0001 L CNN
	1    15850 4650
	1    0    0    -1  
$EndComp
$Comp
L Isolator:TLP291 U1
U 1 1 6822E37B
P 15850 3950
F 0 "U1" H 15850 4275 50  0001 C CNN
F 1 "TLP521-1" H 15850 4183 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 15650 3750 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 15850 3950 50  0001 L CNN
	1    15850 3950
	-1   0    0    -1  
$EndComp
Connection ~ 15400 3850
Wire Wire Line
	15050 3850 15400 3850
Text GLabel 15050 3850 0    63   Input ~ 0
RX1
Wire Wire Line
	15400 3850 15400 3700
Wire Wire Line
	15550 3850 15400 3850
$Comp
L Device:R R1
U 1 1 6822159F
P 15400 3550
F 0 "R1" H 15470 3596 50  0001 L CNN
F 1 "4.7K" V 15400 3550 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 15330 3550 50  0001 C CNN
F 3 "~" H 15400 3550 50  0001 C CNN
	1    15400 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	15550 4050 15400 4050
Wire Wire Line
	16150 3850 16300 3850
Wire Wire Line
	16300 4050 16150 4050
$Comp
L power:+12V #PWR013
U 1 1 6820AAC2
P 16300 3400
F 0 "#PWR013" H 16300 3250 50  0001 C CNN
F 1 "+12V" H 16315 3573 50  0000 C CNN
F 2 "" H 16300 3400 50  0001 C CNN
F 3 "" H 16300 3400 50  0001 C CNN
	1    16300 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	17200 4150 17200 4250
Wire Wire Line
	17450 4150 17200 4150
$Comp
L power:+3V3 #PWR012
U 1 1 681EA407
P 15400 3400
F 0 "#PWR012" H 15400 3250 50  0001 C CNN
F 1 "+3V3" H 15415 3573 50  0000 C CNN
F 2 "" H 15400 3400 50  0001 C CNN
F 3 "" H 15400 3400 50  0001 C CNN
	1    15400 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR014
U 1 1 681E9B5C
P 17200 3400
F 0 "#PWR014" H 17200 3250 50  0001 C CNN
F 1 "+12V" H 17215 3573 50  0000 C CNN
F 2 "" H 17200 3400 50  0001 C CNN
F 3 "" H 17200 3400 50  0001 C CNN
	1    17200 3400
	1    0    0    -1  
$EndComp
Text Notes 18950 4300 0    63   ~ 0
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
Text Notes 18200 6450 0    63   ~ 0
12V\nData\nGND\n
Text Notes 17800 6450 0    63   ~ 0
red\nyellow\nblack
Wire Wire Line
	17200 6200 17200 5650
Wire Wire Line
	17450 6200 17200 6200
$Comp
L power:GND #PWR036
U 1 1 69145A55
P 17200 7200
F 0 "#PWR036" H 17200 6950 50  0001 C CNN
F 1 "GND" H 17205 7027 50  0000 C CNN
F 2 "" H 17200 7200 50  0001 C CNN
F 3 "" H 17200 7200 50  0001 C CNN
	1    17200 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	16900 6300 17450 6300
Connection ~ 16900 6300
Wire Wire Line
	16900 6800 16900 6300
Wire Wire Line
	16150 6800 16900 6800
Wire Wire Line
	15050 7000 15550 7000
Wire Wire Line
	17200 7000 17200 7200
Connection ~ 17200 7000
Wire Wire Line
	16150 7000 17200 7000
Wire Wire Line
	17200 6500 17200 7000
Connection ~ 17200 6500
Wire Wire Line
	15400 6500 17200 6500
Wire Wire Line
	15400 6300 15400 6500
Wire Wire Line
	16300 6100 16300 5650
Wire Wire Line
	16600 6300 16900 6300
Wire Wire Line
	15050 6800 15050 6700
Wire Wire Line
	15150 6800 15050 6800
Wire Wire Line
	15550 6800 15450 6800
$Comp
L Device:R R8
U 1 1 69145A6C
P 16450 6300
F 0 "R8" H 16520 6346 50  0001 L CNN
F 1 "4.7K" V 16450 6300 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 16380 6300 50  0001 C CNN
F 3 "~" H 16450 6300 50  0001 C CNN
	1    16450 6300
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR035
U 1 1 69145A72
P 15050 6700
F 0 "#PWR035" H 15050 6550 50  0001 C CNN
F 1 "+3V3" H 15065 6873 50  0000 C CNN
F 2 "" H 15050 6700 50  0001 C CNN
F 3 "" H 15050 6700 50  0001 C CNN
	1    15050 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 69145A78
P 15300 6800
F 0 "R10" H 15370 6846 50  0001 L CNN
F 1 "220" V 15300 6800 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 15230 6800 50  0001 C CNN
F 3 "~" H 15300 6800 50  0001 C CNN
	1    15300 6800
	0    1    1    0   
$EndComp
Text GLabel 15050 7000 0    63   Input ~ 0
TX2
$Comp
L Isolator:TLP291 U5
U 1 1 69145A7F
P 15850 6900
F 0 "U5" H 15850 7225 50  0001 C CNN
F 1 "TLP521-2" H 15850 7133 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 15650 6700 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 15850 6900 50  0001 L CNN
	1    15850 6900
	1    0    0    -1  
$EndComp
$Comp
L Isolator:TLP291 U4
U 1 1 69145A85
P 15850 6200
F 0 "U4" H 15850 6525 50  0001 C CNN
F 1 "TLP521-1" H 15850 6433 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 15650 6000 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 15850 6200 50  0001 L CNN
	1    15850 6200
	-1   0    0    -1  
$EndComp
Connection ~ 15400 6100
Wire Wire Line
	15050 6100 15400 6100
Text GLabel 15050 6100 0    63   Input ~ 0
RX2
Wire Wire Line
	15400 6100 15400 5950
Wire Wire Line
	15550 6100 15400 6100
$Comp
L Device:R R7
U 1 1 69145A90
P 15400 5800
F 0 "R7" H 15470 5846 50  0001 L CNN
F 1 "4.7K" V 15400 5800 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 15330 5800 50  0001 C CNN
F 3 "~" H 15400 5800 50  0001 C CNN
	1    15400 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	15550 6300 15400 6300
Wire Wire Line
	16150 6100 16300 6100
Wire Wire Line
	16300 6300 16150 6300
$Comp
L power:+12V #PWR032
U 1 1 69145A99
P 16300 5650
F 0 "#PWR032" H 16300 5500 50  0001 C CNN
F 1 "+12V" H 16315 5823 50  0000 C CNN
F 2 "" H 16300 5650 50  0001 C CNN
F 3 "" H 16300 5650 50  0001 C CNN
	1    16300 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	17200 6400 17200 6500
Wire Wire Line
	17450 6400 17200 6400
$Comp
L power:+3V3 #PWR031
U 1 1 69145AA1
P 15400 5650
F 0 "#PWR031" H 15400 5500 50  0001 C CNN
F 1 "+3V3" H 15415 5823 50  0000 C CNN
F 2 "" H 15400 5650 50  0001 C CNN
F 3 "" H 15400 5650 50  0001 C CNN
	1    15400 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR033
U 1 1 69145AA7
P 17200 5650
F 0 "#PWR033" H 17200 5500 50  0001 C CNN
F 1 "+12V" H 17215 5823 50  0000 C CNN
F 2 "" H 17200 5650 50  0001 C CNN
F 3 "" H 17200 5650 50  0001 C CNN
	1    17200 5650
	1    0    0    -1  
$EndComp
Text GLabel 17550 4550 2    50   Input ~ 0
ST1
Wire Wire Line
	17550 4550 16900 4550
Connection ~ 16900 4550
Text GLabel 17550 6800 2    50   Input ~ 0
ST2
Wire Wire Line
	17550 6800 16900 6800
Connection ~ 16900 6800
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
Text GLabel 8950 4550 0    50   Input ~ 0
ACTIVE
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
L Device:R R6
U 1 1 61C579E3
P 9500 4850
F 0 "R6" V 9400 4800 50  0000 L CNN
F 1 "10K" V 9500 4850 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 9430 4850 50  0001 C CNN
F 3 "~" H 9500 4850 50  0001 C CNN
	1    9500 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 61C605D5
P 9800 5100
F 0 "#PWR026" H 9800 4850 50  0001 C CNN
F 1 "GND" H 9805 4927 50  0000 C CNN
F 2 "" H 9800 5100 50  0001 C CNN
F 3 "" H 9800 5100 50  0001 C CNN
	1    9800 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 61C62C8B
P 9250 4550
F 0 "R4" V 9150 4500 50  0000 L CNN
F 1 "220" V 9250 4550 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 9180 4550 50  0001 C CNN
F 3 "~" H 9250 4550 50  0001 C CNN
	1    9250 4550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9800 4750 9800 5000
Wire Wire Line
	9500 5000 9800 5000
Connection ~ 9800 5000
Wire Wire Line
	9800 5000 9800 5100
Wire Wire Line
	9500 4550 9500 4700
Wire Wire Line
	9500 4550 9400 4550
Connection ~ 9500 4550
$Comp
L Transistor_FET:IRLZ44N Q1
U 1 1 61C50415
P 9700 4550
F 0 "Q1" H 9904 4596 50  0000 L CNN
F 1 "IRLZ44N" H 9904 4505 50  0000 L CNN
F 2 "0_my_footprints:myTO-220-3" H 9950 4475 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irlz44n.pdf" H 9700 4550 50  0001 L CNN
	1    9700 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 4550 9100 4550
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
F 1 "ST_PWR" H 2600 2950 50  0000 C CNN
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
Text Notes 8400 900  0    50   ~ 0
Directions are extern device centric:\n    83x_IN connects to the Input of the connected device.\n    83x_OUT connects to the Output of the connected device.\n
Text GLabel 9750 2150 3    63   Input ~ 0
83B_IN
Text Notes 7750 4250 1    63   ~ 0
R2OUT\nR1OUT\nT2IN\nT1IN\nGND\n3V\nR2IN\nR1IN\nT2OUT\nT1OUT
Text GLabel 9800 4250 1    63   Input ~ 0
RELAY-
Wire Wire Line
	9800 4250 9800 4350
Text Notes 9900 1750 1    63   ~ 0
GREEN+GREY\nYELLOW\nBLUE
Text Notes 9800 1250 0    50   ~ 0
GX2410
Text Notes 9150 1750 1    63   ~ 0
GREEN+BROWN\nWHITE\nYELLOW
Text Notes 9050 1250 0    50   ~ 0
E80
$Comp
L power:GND #PWR06
U 1 1 697936EC
P 9650 2150
F 0 "#PWR06" H 9650 1900 50  0001 C CNN
F 1 "GND" V 9650 1950 50  0000 C CNN
F 2 "" H 9650 2150 50  0001 C CNN
F 3 "" H 9650 2150 50  0001 C CNN
	1    9650 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6979FE97
P 8900 2150
F 0 "#PWR05" H 8900 1900 50  0001 C CNN
F 1 "GND" V 8900 1950 50  0000 C CNN
F 2 "" H 8900 2150 50  0001 C CNN
F 3 "" H 8900 2150 50  0001 C CNN
	1    8900 2150
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
P 5800 8500
F 0 "J8" V 5950 8700 50  0000 L CNN
F 1 "TEST_RIG" V 5950 8100 50  0000 L CNN
F 2 "0_my_footprints:myJSTx08" H 5800 8500 50  0001 C CNN
F 3 "~" H 5800 8500 50  0001 C CNN
	1    5800 8500
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR039
U 1 1 69B016D2
P 6200 8300
F 0 "#PWR039" H 6200 8050 50  0001 C CNN
F 1 "GND" V 6200 8100 50  0000 C CNN
F 2 "" H 6200 8300 50  0001 C CNN
F 3 "" H 6200 8300 50  0001 C CNN
	1    6200 8300
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR040
U 1 1 69B0D841
P 6100 8300
F 0 "#PWR040" H 6100 8150 50  0001 C CNN
F 1 "+5V" V 6100 8400 50  0000 L CNN
F 2 "" H 6100 8300 50  0001 C CNN
F 3 "" H 6100 8300 50  0001 C CNN
	1    6100 8300
	-1   0    0    -1  
$EndComp
Text GLabel 8150 8150 3    50   Input ~ 0
SPEED_PULSE
Text GLabel 5900 8300 1    50   Input ~ 0
WIND_PULSE
Text GLabel 6000 8300 1    50   Input ~ 0
SPEED_PULSE
Text GLabel 5700 8300 1    50   Input ~ 0
POT_SCLK
Text GLabel 5800 8300 1    50   Input ~ 0
POT_MISO
Text GLabel 5500 8300 1    50   Input ~ 0
POT_CS2
Text GLabel 5600 8300 1    50   Input ~ 0
POT_CS1
Text Notes 1800 8800 0    50   ~ 0
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
L Connector_Generic:Conn_01x02 J10
U 1 1 69C27C1B
P 2100 5300
F 0 "J10" V 2350 5250 50  0000 C CNN
F 1 "ST_12V" V 2250 5250 50  0000 C CNN
F 2 "0_my_footprints:myPhoenix2x3.81_vertical" H 2100 5300 50  0001 C CNN
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
Text Notes 11400 1700 0    50   ~ 0
In passive mode, the blue AIS out+ from the GX2410 \nis connected to the white NMEA In + on the E80.
Wire Wire Line
	11900 5800 11900 5900
Wire Wire Line
	11900 5600 11900 5700
$Comp
L Connector_Generic:Conn_01x02 J15
U 1 1 69926AA3
P 11700 5700
F 0 "J15" H 12000 5700 50  0000 C CNN
F 1 "GPS_IN" H 12000 5600 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 11700 5700 50  0001 C CNN
F 3 "~" H 11700 5700 50  0001 C CNN
	1    11700 5700
	-1   0    0    -1  
$EndComp
Text Notes 11300 7150 0    50   ~ 0
In passive mode, the Seatalk busses are connected\ntogether.  In active mode they are not. 
Text GLabel 12000 7700 1    63   Input ~ 0
ST2
Text GLabel 11900 8300 3    63   Input ~ 0
ST1
Text GLabel 12400 8300 3    63   Input ~ 0
RELAY-
Wire Wire Line
	12800 8300 12400 8300
Wire Wire Line
	12800 8150 12800 8300
Connection ~ 12400 7700
Wire Wire Line
	12800 7700 12800 7850
Wire Wire Line
	12400 7700 12800 7700
$Comp
L 0_my_symbols:myRelay K3
U 1 1 6972B686
P 12200 8000
F 0 "K3" H 12900 7950 50  0000 R CNN
F 1 "ST_RELAY" H 13000 8050 50  0000 R CNN
F 2 "0_my_footprints2:myRelay2" H 12650 7950 50  0001 L CNN
F 3 "" H 12200 8000 50  0001 C CNN
	1    12200 8000
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR038
U 1 1 6972B680
P 12400 7700
F 0 "#PWR038" H 12400 7550 50  0001 C CNN
F 1 "+5V" H 12415 7873 50  0000 C CNN
F 2 "" H 12400 7700 50  0001 C CNN
F 3 "" H 12400 7700 50  0001 C CNN
	1    12400 7700
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4001 D5
U 1 1 6972B67A
P 12800 8000
F 0 "D5" V 12750 8150 50  0000 L CNN
F 1 "1N4001" V 12850 8150 50  0000 L CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 12800 7825 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 12800 8000 50  0001 C CNN
	1    12800 8000
	0    1    1    0   
$EndComp
Text Notes 11300 4450 0    50   ~ 0
In passive mode, the GPS In+ to the GX2410 is\nconnected to the NMEA out + from the E80.\nthrough a jumper.  The jumper is normally in\nplace, forcing the GX2410 to accept the ST GPS\ncoordinates.  To use the GX2410 as the GPS Source\nin passive mode, the jumper must be removed.\nIn active mode, with bidirectional NMEA0183\nforwarding, the E80_filter, the program determines\nwhat message the GX2410 sees and the jumper\ncan remain, or be removed, depending on software\nsettings.\n
Text GLabel 11900 5900 3    63   Input ~ 0
83A_OUT
Text GLabel 12000 5000 1    63   Input ~ 0
83B_IN
Text GLabel 12400 5600 3    63   Input ~ 0
RELAY-
Wire Wire Line
	12800 5600 12400 5600
Wire Wire Line
	12800 5450 12800 5600
Connection ~ 12400 5000
Wire Wire Line
	12800 5000 12800 5150
Wire Wire Line
	12400 5000 12800 5000
$Comp
L 0_my_symbols:myRelay K2
U 1 1 696D95C7
P 12200 5300
F 0 "K2" H 13050 5250 50  0000 R CNN
F 1 "GPS_IN_RELAY" H 13250 5350 50  0000 R CNN
F 2 "0_my_footprints2:myRelay2" H 12650 5250 50  0001 L CNN
F 3 "" H 12200 5300 50  0001 C CNN
	1    12200 5300
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR025
U 1 1 696D95C1
P 12400 5000
F 0 "#PWR025" H 12400 4850 50  0001 C CNN
F 1 "+5V" H 12415 5173 50  0000 C CNN
F 2 "" H 12400 5000 50  0001 C CNN
F 3 "" H 12400 5000 50  0001 C CNN
	1    12400 5000
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4001 D3
U 1 1 696D95BB
P 12800 5300
F 0 "D3" V 12750 5450 50  0000 L CNN
F 1 "1N4001" V 12850 5450 50  0000 L CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 12800 5125 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 12800 5300 50  0001 C CNN
	1    12800 5300
	0    1    1    0   
$EndComp
Text GLabel 11850 2800 3    63   Input ~ 0
83A_IN
Text GLabel 11950 2200 1    63   Input ~ 0
83B_OUT
Text GLabel 12350 2800 3    63   Input ~ 0
RELAY-
Wire Wire Line
	12750 2800 12350 2800
Wire Wire Line
	12750 2650 12750 2800
Connection ~ 12350 2200
Wire Wire Line
	12750 2200 12750 2350
Wire Wire Line
	12350 2200 12750 2200
$Comp
L 0_my_symbols:myRelay K1
U 1 1 695EEB31
P 12150 2500
F 0 "K1" H 13000 2450 50  0000 R CNN
F 1 "AIS_OUT_RELAY" H 13200 2550 50  0000 R CNN
F 2 "0_my_footprints2:myRelay2" H 12600 2450 50  0001 L CNN
F 3 "" H 12150 2500 50  0001 C CNN
	1    12150 2500
	-1   0    0    1   
$EndComp
Text GLabel 9850 2150 3    63   Input ~ 0
83B_OUT
$Comp
L power:+5V #PWR07
U 1 1 62375244
P 12350 2200
F 0 "#PWR07" H 12350 2050 50  0001 C CNN
F 1 "+5V" H 12365 2373 50  0000 C CNN
F 2 "" H 12350 2200 50  0001 C CNN
F 3 "" H 12350 2200 50  0001 C CNN
	1    12350 2200
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4001 D1
U 1 1 61BD214F
P 12750 2500
F 0 "D1" V 12700 2650 50  0000 L CNN
F 1 "1N4001" V 12800 2650 50  0000 L CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 12750 2325 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 12750 2500 50  0001 C CNN
	1    12750 2500
	0    1    1    0   
$EndComp
Text GLabel 9100 2150 3    63   Input ~ 0
83A_OUT
Text Notes 2250 2300 0    50   ~ 0
Features:\n- NMEA2000 port with optional terminating resistor\n- two NMEA0183 ports\n- two Seatalk ST ports\n- passive binding of 0183 and ST ports when turned off\n- active monitoring/manipulation/forward of 0183 and ST ports when turned on\n- TEST_RIG connector to allow for variety of external PCBs for testing instruments\n- Connector for RX5 for future expansion to possible ESP32 LAN interface\n- 5V and 12V test points for calibrating the Buck Converter\n\nExisting teensyBoat.ino firmware\n- provides sophisticated monitoring of all protocols\n- provides a physical boat simulator that drives\n- simulated instruments that can be assigned to any protocol\n- can be run as command line app with serial monitor (i.e. Putty or Arduino IDE)\n\nWorks with teensyBoat.pm wxPerl user interface that provides\n- a serial monitor / console\n- a windowed user interface to easily control aspects of the teensyBoat.ino program
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 69181E1C
P 9000 1950
F 0 "J4" V 9100 1800 50  0000 L CNN
F 1 "83A" V 9100 1950 50  0000 L CNN
F 2 "0_my_footprints:myPheonix3x3.81_right" H 9000 1950 50  0001 C CNN
F 3 "~" H 9000 1950 50  0001 C CNN
	1    9000 1950
	0    1    -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 69202C90
P 9750 1950
F 0 "J5" V 9850 1800 50  0000 L CNN
F 1 "83B" V 9850 1950 50  0000 L CNN
F 2 "0_my_footprints:myPheonix3x3.81_right" H 9750 1950 50  0001 C CNN
F 3 "~" H 9750 1950 50  0001 C CNN
	1    9750 1950
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
P 17650 6300
F 0 "J7" H 17350 6600 50  0000 L CNN
F 1 "Seatalk2" H 17500 6600 50  0000 L CNN
F 2 "0_my_footprints:myJSTx03" H 17650 6300 50  0001 C CNN
F 3 "~" H 17650 6300 50  0001 C CNN
	1    17650 6300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J6
U 1 1 68C4B86A
P 17650 4050
F 0 "J6" H 17350 4350 50  0000 L CNN
F 1 "Seatalk1" H 17500 4350 50  0000 L CNN
F 2 "0_my_footprints:myJSTx03" H 17650 4050 50  0001 C CNN
F 3 "~" H 17650 4050 50  0001 C CNN
	1    17650 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4850 5900 4550
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
$EndSCHEMATC
