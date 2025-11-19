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
Text GLabel 4050 3850 3    50   Input ~ 0
CTX
Text GLabel 4150 2900 3    50   Input ~ 0
CANH
Text GLabel 4050 2900 3    50   Input ~ 0
CANL
Text GLabel 4350 3850 3    50   Input ~ 0
CANL
Text GLabel 4250 3850 3    50   Input ~ 0
CANH
Text GLabel 4150 3850 3    50   Input ~ 0
CRX
$Comp
L power:GND #PWR016
U 1 1 68C8AF7F
P 3950 3850
F 0 "#PWR016" H 3950 3600 50  0001 C CNN
F 1 "GND" V 3950 3650 50  0000 C CNN
F 2 "" H 3950 3850 50  0001 C CNN
F 3 "" H 3950 3850 50  0001 C CNN
	1    3950 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR015
U 1 1 68C85564
P 3850 3850
F 0 "#PWR015" H 3850 3700 50  0001 C CNN
F 1 "+3V3" V 3850 4050 50  0000 C CNN
F 2 "" H 3850 3850 50  0001 C CNN
F 3 "" H 3850 3850 50  0001 C CNN
	1    3850 3850
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J10
U 1 1 68C7D765
P 4050 3650
F 0 "J10" V 4200 3800 50  0000 L CNN
F 1 "SN65HVD230" V 4200 3250 50  0000 L CNN
F 2 "0_my_footprints:CANBUS_Module1" H 4050 3650 50  0001 C CNN
F 3 "~" H 4050 3650 50  0001 C CNN
	1    4050 3650
	0    -1   -1   0   
$EndComp
Text GLabel 6250 3900 3    63   Input ~ 0
83A_IN
Wire Wire Line
	8800 8600 9050 8600
Wire Wire Line
	8800 8700 9050 8700
Text Notes 8450 8750 0    63   ~ 0
12V\nData\nGND\n
Text Notes 9700 8850 0    63   ~ 0
unused alarm return\nunused alarm\n12V (except it's not)\nseatalk TX\nseatalk RX (except it's not)\nGND (excpt it's not)
Text Notes 9300 8150 0    50   ~ 0
Seatalk Alarm Cable from E80\n(red not connected)
$Comp
L power:GND #PWR024
U 1 1 68BD4022
P 10350 3800
F 0 "#PWR024" H 10350 3550 50  0001 C CNN
F 1 "GND" H 10355 3627 50  0000 C CNN
F 2 "" H 10350 3800 50  0001 C CNN
F 3 "" H 10350 3800 50  0001 C CNN
	1    10350 3800
	1    0    0    -1  
$EndComp
Text Notes 8450 1950 0    50   ~ 0
TRANSMIT\nTXD is normally high, and the other side is pulled up to 3.3v thru 220 ohms,\nso no current flows through opto2_diode, and thus, the yellow (bus) is NOT \npulled down to ground.   When we transmit data, TXD goes low, lights the diode\nand the yellow (bus) is pulled down to ground through opto2.\n
Text Notes 8450 1450 0    50   ~ 0
RECEIVE\nThe yellow (bus) is pulled up to 12V (idle) thru 4.7K ohms.  All devices pull the bus up. \nIf the bus is high (idle), no current flows through opto1_diode, and so RXD is pulled\nup to 3.3V through the 4.7K ohm resistor.   When another device pulls the bus low,\nthe diode lights up and RXD is pulled to ground through opto1.
Wire Wire Line
	9000 3700 9500 3700
Wire Wire Line
	9350 3200 10350 3200
Wire Wire Line
	9350 3000 9350 3200
Wire Wire Line
	10250 2800 10250 2350
Wire Wire Line
	9000 3500 9000 3400
Wire Wire Line
	9100 3500 9000 3500
Wire Wire Line
	9500 3500 9400 3500
$Comp
L Device:R R3
U 1 1 68211A3C
P 10400 3000
F 0 "R3" H 10470 3046 50  0001 L CNN
F 1 "4.7K" V 10400 3000 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 10330 3000 50  0001 C CNN
F 3 "~" H 10400 3000 50  0001 C CNN
	1    10400 3000
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR023
U 1 1 68244B74
P 9000 3400
F 0 "#PWR023" H 9000 3250 50  0001 C CNN
F 1 "+3V3" H 9015 3573 50  0000 C CNN
F 2 "" H 9000 3400 50  0001 C CNN
F 3 "" H 9000 3400 50  0001 C CNN
	1    9000 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 68236F3F
P 9250 3500
F 0 "R5" H 9320 3546 50  0001 L CNN
F 1 "220" V 9250 3500 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 9180 3500 50  0001 C CNN
F 3 "~" H 9250 3500 50  0001 C CNN
	1    9250 3500
	0    1    1    0   
$EndComp
Text GLabel 9000 3700 0    63   Input ~ 0
TX1
$Comp
L Isolator:TLP291 U2
U 1 1 68235388
P 9800 3600
F 0 "U2" H 9800 3925 50  0001 C CNN
F 1 "TLP521" H 9800 3833 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 9600 3400 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 9800 3600 50  0001 L CNN
	1    9800 3600
	1    0    0    -1  
$EndComp
$Comp
L Isolator:TLP291 U1
U 1 1 6822E37B
P 9800 2900
F 0 "U1" H 9800 3225 50  0001 C CNN
F 1 "TLP521" H 9800 3133 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 9600 2700 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 9800 2900 50  0001 L CNN
	1    9800 2900
	-1   0    0    -1  
$EndComp
Connection ~ 9350 2800
Wire Wire Line
	9000 2800 9350 2800
Text GLabel 9000 2800 0    63   Input ~ 0
RX1
Wire Wire Line
	9350 2800 9350 2650
Wire Wire Line
	9500 2800 9350 2800
$Comp
L Device:R R1
U 1 1 6822159F
P 9350 2500
F 0 "R1" H 9420 2546 50  0001 L CNN
F 1 "4.7K" V 9350 2500 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 9280 2500 50  0001 C CNN
F 3 "~" H 9350 2500 50  0001 C CNN
	1    9350 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 3000 9350 3000
Wire Wire Line
	10100 2800 10250 2800
Wire Wire Line
	10250 3000 10100 3000
$Comp
L power:+12V #PWR013
U 1 1 6820AAC2
P 10250 2350
F 0 "#PWR013" H 10250 2200 50  0001 C CNN
F 1 "+12V" H 10265 2523 50  0000 C CNN
F 2 "" H 10250 2350 50  0001 C CNN
F 3 "" H 10250 2350 50  0001 C CNN
	1    10250 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR012
U 1 1 681EA407
P 9350 2350
F 0 "#PWR012" H 9350 2200 50  0001 C CNN
F 1 "+3V3" H 9365 2523 50  0000 C CNN
F 2 "" H 9350 2350 50  0001 C CNN
F 3 "" H 9350 2350 50  0001 C CNN
	1    9350 2350
	1    0    0    -1  
$EndComp
Text Notes 9200 8850 0    63   ~ 0
brown\nwhite\nred\nyellow\nblack\nshield
$Comp
L Device:CP C1
U 1 1 68D022FD
P 2850 3900
F 0 "C1" H 2968 3946 50  0001 L CNN
F 1 "100uf" H 2500 3900 50  0000 L CNN
F 2 "0_my_footprints2:CP_my100uf" H 2888 3750 50  0001 C CNN
F 3 "~" H 2850 3900 50  0001 C CNN
	1    2850 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 68DEB69F
P 4050 2700
F 0 "J2" V 4200 2800 50  0000 L CNN
F 1 "NMEA2000" V 4200 2350 50  0000 L CNN
F 2 "0_my_footprints:myPheonix4x3.81_right" H 4050 2700 50  0001 C CNN
F 3 "~" H 4050 2700 50  0001 C CNN
	1    4050 2700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 68DFEA73
P 4250 2900
F 0 "#PWR04" H 4250 2650 50  0001 C CNN
F 1 "GND" V 4250 2700 50  0000 C CNN
F 2 "" H 4250 2900 50  0001 C CNN
F 3 "" H 4250 2900 50  0001 C CNN
	1    4250 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 69145A55
P 10350 6000
F 0 "#PWR036" H 10350 5750 50  0001 C CNN
F 1 "GND" H 10355 5827 50  0000 C CNN
F 2 "" H 10350 6000 50  0001 C CNN
F 3 "" H 10350 6000 50  0001 C CNN
	1    10350 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 5850 9500 5850
Wire Wire Line
	9350 5150 9350 5350
Wire Wire Line
	10250 4950 10250 4500
Wire Wire Line
	9000 5650 9000 5550
Wire Wire Line
	9100 5650 9000 5650
Wire Wire Line
	9500 5650 9400 5650
$Comp
L Device:R R8
U 1 1 69145A6C
P 10400 5150
F 0 "R8" H 10470 5196 50  0001 L CNN
F 1 "4.7K" V 10400 5150 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 10330 5150 50  0001 C CNN
F 3 "~" H 10400 5150 50  0001 C CNN
	1    10400 5150
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR035
U 1 1 69145A72
P 9000 5550
F 0 "#PWR035" H 9000 5400 50  0001 C CNN
F 1 "+3V3" H 9015 5723 50  0000 C CNN
F 2 "" H 9000 5550 50  0001 C CNN
F 3 "" H 9000 5550 50  0001 C CNN
	1    9000 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 69145A78
P 9250 5650
F 0 "R10" H 9320 5696 50  0001 L CNN
F 1 "220" V 9250 5650 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 9180 5650 50  0001 C CNN
F 3 "~" H 9250 5650 50  0001 C CNN
	1    9250 5650
	0    1    1    0   
$EndComp
Text GLabel 9000 5850 0    63   Input ~ 0
TX2
$Comp
L Isolator:TLP291 U5
U 1 1 69145A7F
P 9800 5750
F 0 "U5" H 9800 6075 50  0001 C CNN
F 1 "TLP521" H 9800 5983 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 9600 5550 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 9800 5750 50  0001 L CNN
	1    9800 5750
	1    0    0    -1  
$EndComp
$Comp
L Isolator:TLP291 U4
U 1 1 69145A85
P 9800 5050
F 0 "U4" H 9800 5375 50  0001 C CNN
F 1 "TLP521" H 9800 5283 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 9600 4850 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 9800 5050 50  0001 L CNN
	1    9800 5050
	-1   0    0    -1  
$EndComp
Connection ~ 9350 4950
Wire Wire Line
	9000 4950 9350 4950
Text GLabel 9000 4950 0    63   Input ~ 0
RX2
Wire Wire Line
	9350 4950 9350 4800
Wire Wire Line
	9500 4950 9350 4950
$Comp
L Device:R R7
U 1 1 69145A90
P 9350 4650
F 0 "R7" H 9420 4696 50  0001 L CNN
F 1 "4.7K" V 9350 4650 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 9280 4650 50  0001 C CNN
F 3 "~" H 9350 4650 50  0001 C CNN
	1    9350 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 5150 9350 5150
Wire Wire Line
	10100 4950 10250 4950
Wire Wire Line
	10250 5150 10100 5150
$Comp
L power:+12V #PWR032
U 1 1 69145A99
P 10250 4500
F 0 "#PWR032" H 10250 4350 50  0001 C CNN
F 1 "+12V" H 10265 4673 50  0000 C CNN
F 2 "" H 10250 4500 50  0001 C CNN
F 3 "" H 10250 4500 50  0001 C CNN
	1    10250 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR031
U 1 1 69145AA1
P 9350 4500
F 0 "#PWR031" H 9350 4350 50  0001 C CNN
F 1 "+3V3" H 9365 4673 50  0000 C CNN
F 2 "" H 9350 4500 50  0001 C CNN
F 3 "" H 9350 4500 50  0001 C CNN
	1    9350 4500
	1    0    0    -1  
$EndComp
Text GLabel 10750 3000 2    50   Input ~ 0
ST1
Text GLabel 10750 5150 2    50   Input ~ 0
ST2
$Comp
L power:GND #PWR02
U 1 1 61C56583
P 2150 3050
F 0 "#PWR02" H 2150 2800 50  0001 C CNN
F 1 "GND" V 2150 2850 50  0000 C CNN
F 2 "" H 2150 3050 50  0001 C CNN
F 3 "" H 2150 3050 50  0001 C CNN
	1    2150 3050
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR01
U 1 1 61DE37E9
P 2150 2950
F 0 "#PWR01" H 2150 2800 50  0001 C CNN
F 1 "+12V" V 2150 3150 50  0000 C CNN
F 2 "" H 2150 2950 50  0001 C CNN
F 3 "" H 2150 2950 50  0001 C CNN
	1    2150 2950
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 63C47095
P 1950 2950
F 0 "J1" H 2600 2900 50  0000 C CNN
F 1 "INST_POWER" H 2250 2900 50  0000 C CNN
F 2 "0_my_footprints:myPheonix2x3.81_right" H 1950 2950 50  0001 C CNN
F 3 "~" H 1950 2950 50  0001 C CNN
	1    1950 2950
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 61D92C26
P 3000 3750
F 0 "#PWR09" H 3000 3600 50  0001 C CNN
F 1 "+5V" V 3000 3950 50  0000 C CNN
F 2 "" H 3000 3750 50  0001 C CNN
F 3 "" H 3000 3750 50  0001 C CNN
	1    3000 3750
	0    1    -1   0   
$EndComp
$Comp
L cnc3018_Library:BUCK01 M1
U 1 1 61B26C43
P 2050 3900
F 0 "M1" H 2200 3900 50  0000 C CNN
F 1 "BUCK01" H 1950 3900 50  0000 C CNN
F 2 "0_my_footprints:myMini360BuckConverter" H 2000 4200 50  0001 C CNN
F 3 "" H 2000 4200 50  0001 C CNN
	1    2050 3900
	1    0    0    1   
$EndComp
$Comp
L Diode:1N4001 D2
U 1 1 69362762
P 2550 3750
F 0 "D2" H 2750 3550 50  0000 L CNN
F 1 "1N5819" H 2400 3550 50  0000 L CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 2550 3575 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2550 3750 50  0001 C CNN
	1    2550 3750
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 693ABDD2
P 2400 4150
F 0 "#PWR011" H 2400 3900 50  0001 C CNN
F 1 "GND" H 2405 3977 50  0000 C CNN
F 2 "" H 2400 4150 50  0001 C CNN
F 3 "" H 2400 4150 50  0001 C CNN
	1    2400 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 693B1C91
P 1650 4150
F 0 "#PWR010" H 1650 3900 50  0001 C CNN
F 1 "GND" H 1655 3977 50  0000 C CNN
F 2 "" H 1650 4150 50  0001 C CNN
F 3 "" H 1650 4150 50  0001 C CNN
	1    1650 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4050 2400 4150
Wire Wire Line
	1650 4050 1650 4150
Wire Wire Line
	2700 3750 2850 3750
Connection ~ 2850 3750
Wire Wire Line
	2850 3750 3000 3750
Wire Wire Line
	2850 4050 2400 4050
Connection ~ 2400 4050
$Comp
L power:+12V #PWR03
U 1 1 694CBA8F
P 3950 2900
F 0 "#PWR03" H 3950 2750 50  0001 C CNN
F 1 "+12V" V 3950 3100 50  0000 C CNN
F 2 "" H 3950 2900 50  0001 C CNN
F 3 "" H 3950 2900 50  0001 C CNN
	1    3950 2900
	-1   0    0    1   
$EndComp
Text GLabel 6250 5550 3    63   Input ~ 0
RX4
$Comp
L power:+3V3 #PWR018
U 1 1 69544CCB
P 6750 5550
F 0 "#PWR018" H 6750 5400 50  0001 C CNN
F 1 "+3V3" V 6750 5750 50  0000 C CNN
F 2 "" H 6750 5550 50  0001 C CNN
F 3 "" H 6750 5550 50  0001 C CNN
	1    6750 5550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 6953CC62
P 6650 5550
F 0 "#PWR017" H 6650 5300 50  0001 C CNN
F 1 "GND" V 6650 5350 50  0000 C CNN
F 2 "" H 6650 5550 50  0001 C CNN
F 3 "" H 6650 5550 50  0001 C CNN
	1    6650 5550
	1    0    0    -1  
$EndComp
Text GLabel 6350 5550 3    63   Input ~ 0
RX3
Text GLabel 6550 5550 3    63   Input ~ 0
TX3
Text GLabel 6450 5550 3    63   Input ~ 0
TX4
$Comp
L Connector_Generic:Conn_01x10 J14
U 1 1 694EB22B
P 6650 5350
F 0 "J14" V 7200 5600 50  0000 C CNN
F 1 "MAX3232" V 7200 5200 50  0000 C CNN
F 2 "0_my_footprints:MAX3232_Module" H 6650 5350 50  0001 C CNN
F 3 "~" H 6650 5350 50  0001 C CNN
	1    6650 5350
	0    -1   -1   0   
$EndComp
Text Notes 5700 1800 0    50   ~ 0
Directions are extern device centric:\n    83x_IN connects to the Input of the connected device.\n    83x_OUT connects to the Output of the connected device.\n
Text Notes 7200 5250 1    63   ~ 0
R2OUT\nR1OUT\nT2IN\nT1IN\nGND\n3V\nR2IN\nR1IN\nT2OUT\nT1OUT
Text Notes 7150 2800 1    63   ~ 0
GREEN+GREY\nYELLOW\nBLUE
Text Notes 7050 2300 0    50   ~ 0
GX2410
Text Notes 6400 2800 1    63   ~ 0
GREEN+BROWN\nWHITE\nYELLOW
Text Notes 6300 2300 0    50   ~ 0
E80
$Comp
L power:GND #PWR06
U 1 1 697936EC
P 6900 3900
F 0 "#PWR06" H 6900 3650 50  0001 C CNN
F 1 "GND" V 6900 3700 50  0000 C CNN
F 2 "" H 6900 3900 50  0001 C CNN
F 3 "" H 6900 3900 50  0001 C CNN
	1    6900 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6979FE97
P 6150 3900
F 0 "#PWR05" H 6150 3650 50  0001 C CNN
F 1 "GND" V 6150 3700 50  0000 C CNN
F 2 "" H 6150 3900 50  0001 C CNN
F 3 "" H 6150 3900 50  0001 C CNN
	1    6150 3900
	1    0    0    -1  
$EndComp
Text GLabel 4700 5200 1    50   Input ~ 0
POT_CS2
Text GLabel 4800 5200 1    50   Input ~ 0
POT_CS1
Text GLabel 5300 7300 3    50   Input ~ 0
POT_MISO
Text GLabel 4200 7300 3    63   Input ~ 0
TX1
Text GLabel 4100 7300 3    63   Input ~ 0
RX1
$Comp
L power:GND #PWR028
U 1 1 681F5B40
P 4100 5200
F 0 "#PWR028" H 4100 4950 50  0001 C CNN
F 1 "GND" V 4100 5000 50  0000 C CNN
F 2 "" H 4100 5200 50  0001 C CNN
F 3 "" H 4100 5200 50  0001 C CNN
	1    4100 5200
	-1   0    0    1   
$EndComp
$Comp
L power:+3V3 #PWR029
U 1 1 681F6BDE
P 4200 5200
F 0 "#PWR029" H 4200 5050 50  0001 C CNN
F 1 "+3V3" V 4200 5400 50  0000 C CNN
F 2 "" H 4200 5200 50  0001 C CNN
F 3 "" H 4200 5200 50  0001 C CNN
	1    4200 5200
	1    0    0    -1  
$EndComp
Text GLabel 5100 5200 1    63   Input ~ 0
RX3
Text GLabel 5200 5200 1    63   Input ~ 0
TX3
$Comp
L 0_my_teensy:myTeensy4.0 U3
U 1 1 681E4C83
P 4550 6200
F 0 "U3" H 5378 6203 60  0001 L CNN
F 1 "myTeensy4.0" H 4400 6100 60  0000 L CNN
F 2 "0_my_teensy:teensy40" V 5450 6250 60  0001 C CNN
F 3 "" V 5450 6250 60  0000 C CNN
	1    4550 6200
	1    0    0    -1  
$EndComp
Text GLabel 4900 7300 3    63   Input ~ 0
TX2
Text GLabel 4800 7300 3    63   Input ~ 0
RX2
Text GLabel 4900 5200 1    63   Input ~ 0
TX4
Text GLabel 5000 5200 1    63   Input ~ 0
RX4
Text GLabel 5200 7300 3    50   Input ~ 0
WIND_PULSE
$Comp
L power:+5V #PWR027
U 1 1 68C5F036
P 4000 5200
F 0 "#PWR027" H 4000 5050 50  0001 C CNN
F 1 "+5V" V 4000 5300 50  0000 L CNN
F 2 "" H 4000 5200 50  0001 C CNN
F 3 "" H 4000 5200 50  0001 C CNN
	1    4000 5200
	1    0    0    -1  
$EndComp
Text GLabel 4400 5200 1    50   Input ~ 0
CRX
Text GLabel 4300 5200 1    50   Input ~ 0
CTX
Text GLabel 7150 5550 3    63   Input ~ 0
83A_IN
Text GLabel 7050 5550 3    63   Input ~ 0
83B_IN
Text GLabel 6950 5550 3    63   Input ~ 0
83A_OUT
Text GLabel 6850 5550 3    63   Input ~ 0
83B_OUT
$Comp
L power:GND #PWR037
U 1 1 69A1A92C
P 4000 7300
F 0 "#PWR037" H 4000 7050 50  0001 C CNN
F 1 "GND" V 4000 7100 50  0000 C CNN
F 2 "" H 4000 7300 50  0001 C CNN
F 3 "" H 4000 7300 50  0001 C CNN
	1    4000 7300
	1    0    0    -1  
$EndComp
Text GLabel 4600 5200 1    63   Input ~ 0
TX5
Text GLabel 4500 5200 1    63   Input ~ 0
RX5
Text Notes 900  7300 0    50   ~ 0
The board has holes and pads to wire an additional Serial Port (RX5)\n for future expansion, i.e. an ESP32 for LAN access
Text GLabel 2100 7600 2    63   Input ~ 0
RX5
Text GLabel 2100 7700 2    63   Input ~ 0
TX5
$Comp
L power:GND #PWR030
U 1 1 69AAA64C
P 2100 7500
F 0 "#PWR030" H 2100 7250 50  0001 C CNN
F 1 "GND" V 2100 7300 50  0000 C CNN
F 2 "" H 2100 7500 50  0001 C CNN
F 3 "" H 2100 7500 50  0001 C CNN
	1    2100 7500
	0    -1   -1   0   
$EndComp
Text GLabel 5300 5200 1    50   Input ~ 0
POT_SCLK
Text GLabel 5000 7300 3    50   Input ~ 0
ALIVE_LED
$Comp
L Connector_Generic:Conn_01x08 J6
U 1 1 69AE5894
P 4750 9000
F 0 "J6" V 4900 9200 50  0000 L CNN
F 1 "TEST_RIG" V 4900 8600 50  0000 L CNN
F 2 "0_my_footprints:myJSTx08" H 4750 9000 50  0001 C CNN
F 3 "~" H 4750 9000 50  0001 C CNN
	1    4750 9000
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR039
U 1 1 69B016D2
P 5150 8800
F 0 "#PWR039" H 5150 8550 50  0001 C CNN
F 1 "GND" V 5150 8600 50  0000 C CNN
F 2 "" H 5150 8800 50  0001 C CNN
F 3 "" H 5150 8800 50  0001 C CNN
	1    5150 8800
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR040
U 1 1 69B0D841
P 5050 8800
F 0 "#PWR040" H 5050 8650 50  0001 C CNN
F 1 "+5V" V 5050 8900 50  0000 L CNN
F 2 "" H 5050 8800 50  0001 C CNN
F 3 "" H 5050 8800 50  0001 C CNN
	1    5050 8800
	-1   0    0    -1  
$EndComp
Text GLabel 4300 7300 3    50   Input ~ 0
SPEED_PULSE
Text GLabel 4850 8800 1    50   Input ~ 0
WIND_PULSE
Text GLabel 4950 8800 1    50   Input ~ 0
SPEED_PULSE
Text GLabel 4650 8800 1    50   Input ~ 0
POT_SCLK
Text GLabel 4750 8800 1    50   Input ~ 0
POT_MISO
Text GLabel 4450 8800 1    50   Input ~ 0
POT_CS2
Text GLabel 4550 8800 1    50   Input ~ 0
POT_CS1
Text Notes 900  9150 0    50   ~ 0
The JST8 TEST_RIG connector is a general purpose connector.\nAlthough initially designed for testing ST50 instruments, since\nit brings out full SPI signals, it should be general enough to run\nan SPI TFT display if desired.\n\nIt also brings out the I2C signals, should the need arise. \n\nAs initially designed It provides pulses  to spoof the ST50 Speed/Log \nand Wind instruments, and allows for the addition of digital potentiometers\n(inc/dec, SPI, or I2C) for resistance based spoofing (Log Temperature, Wind \nDirection, etc).  The instrument itself is powered and connected  to one of the \ntwo ST ports on this PCB.\n 
$Comp
L Device:LED D4
U 1 1 69BBC2B7
P 2350 6550
F 0 "D4" H 2343 6767 50  0000 C CNN
F 1 "ALIVE_LED" H 2343 6676 50  0000 C CNN
F 2 "0_my_footprints2:led_small_red" H 2350 6550 50  0001 C CNN
F 3 "~" H 2350 6550 50  0001 C CNN
	1    2350 6550
	1    0    0    -1  
$EndComp
Text GLabel 2500 6550 2    50   Input ~ 0
ALIVE_LED
$Comp
L Device:R R9
U 1 1 69BC4C2F
P 2050 6550
F 0 "R9" H 2120 6596 50  0001 L CNN
F 1 "220" V 2050 6550 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 1980 6550 50  0001 C CNN
F 3 "~" H 2050 6550 50  0001 C CNN
	1    2050 6550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR034
U 1 1 69BD7043
P 1900 6550
F 0 "#PWR034" H 1900 6300 50  0001 C CNN
F 1 "GND" V 1900 6350 50  0000 C CNN
F 2 "" H 1900 6550 50  0001 C CNN
F 3 "" H 1900 6550 50  0001 C CNN
	1    1900 6550
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J11
U 1 1 69BF4FBB
P 5100 3650
F 0 "J11" V 5250 3200 50  0000 C CNN
F 1 "CAN_TERMINATOR" V 5250 3600 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 5100 3650 50  0001 C CNN
F 3 "~" H 5100 3650 50  0001 C CNN
	1    5100 3650
	0    1    -1   0   
$EndComp
Text GLabel 5000 4150 3    50   Input ~ 0
CANH
Text GLabel 5100 4150 3    50   Input ~ 0
CANL
$Comp
L Device:R R2
U 1 1 69C09B31
P 5100 4000
F 0 "R2" H 5170 4046 50  0001 L CNN
F 1 "120" V 5100 4000 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 5030 4000 50  0001 C CNN
F 3 "~" H 5100 4000 50  0001 C CNN
	1    5100 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 4150 5000 3850
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 69C27C1B
P 1750 5250
F 0 "J8" V 2000 5200 50  0000 C CNN
F 1 "12V_TEST" V 1900 5200 50  0000 C CNN
F 2 "0_my_footprints2:pinSocket1x2" H 1750 5250 50  0001 C CNN
F 3 "~" H 1750 5250 50  0001 C CNN
	1    1750 5250
	0    -1   1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 69C3DC2B
P 2350 5250
F 0 "J9" V 2600 5200 50  0000 C CNN
F 1 "5V_TEST" V 2500 5200 50  0000 C CNN
F 2 "0_my_footprints2:pinSocket1x2" H 2350 5250 50  0001 C CNN
F 3 "~" H 2350 5250 50  0001 C CNN
	1    2350 5250
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 69C4194B
P 2350 5050
F 0 "#PWR021" H 2350 4900 50  0001 C CNN
F 1 "+5V" V 2350 5250 50  0000 C CNN
F 2 "" H 2350 5050 50  0001 C CNN
F 3 "" H 2350 5050 50  0001 C CNN
	1    2350 5050
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 69C48BFA
P 1850 5050
F 0 "#PWR020" H 1850 4800 50  0001 C CNN
F 1 "GND" V 1850 4850 50  0000 C CNN
F 2 "" H 1850 5050 50  0001 C CNN
F 3 "" H 1850 5050 50  0001 C CNN
	1    1850 5050
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR019
U 1 1 69C48C00
P 1750 5050
F 0 "#PWR019" H 1750 4900 50  0001 C CNN
F 1 "+12V" V 1750 5250 50  0000 C CNN
F 2 "" H 1750 5050 50  0001 C CNN
F 3 "" H 1750 5050 50  0001 C CNN
	1    1750 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 69C577D4
P 2450 5050
F 0 "#PWR022" H 2450 4800 50  0001 C CNN
F 1 "GND" V 2450 4850 50  0000 C CNN
F 2 "" H 2450 5050 50  0001 C CNN
F 3 "" H 2450 5050 50  0001 C CNN
	1    2450 5050
	-1   0    0    1   
$EndComp
Text Notes 5700 1050 0    50   ~ 0
In passive mode, the blue AIS out+ from the GX2410 \nis connected to the white NMEA In + on the E80, and\nthe yellow GPS In+ to the GX2410 is connected to the \nyellow NMEA out+ from the E80 via jumpers.
Text Notes 8450 900  0    50   ~ 0
In passive mode, the Seatalk busses are connected\ntogether.  In active mode they are not. 
Text Notes 5700 1400 0    50   ~ 0
In active mode, the jumpers are removed and the teensy\ngets in between the NMEA ports, allowing software control\nof forwarding between the two ports.
Text GLabel 6350 3900 3    63   Input ~ 0
83A_OUT
Text Notes 1000 2200 0    50   ~ 0
Features:\n- NMEA2000 port with optional terminating resistor\n- two NMEA0183 ports\n- two Seatalk ST ports\n- passive binding of 0183 and ST ports when turned off\n- active monitoring/manipulation/forward of 0183 and ST ports when turned on\n- TEST_RIG connector to allow for variety of external PCBs for testing instruments\n- Connector for RX5 for future expansion to possible ESP32 LAN interface\n- 5V and 12V test points for calibrating the Buck Converter\n\nExisting teensyBoat.ino firmware\n- provides sophisticated monitoring of all protocols\n- provides a physical boat simulator that drives\n- simulated instruments that can be assigned to any protocol\n- can be run as command line app with serial monitor (i.e. Putty or Arduino IDE)\n\nWorks with teensyBoat.pm wxPerl user interface that provides\n- a serial monitor / console\n- a windowed user interface to easily control aspects of the teensyBoat.ino program
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 69181E1C
P 6250 3000
F 0 "J4" V 6350 2850 50  0000 L CNN
F 1 "83A" V 6350 3000 50  0000 L CNN
F 2 "0_my_footprints:myPheonix3x3.81_right" H 6250 3000 50  0001 C CNN
F 3 "~" H 6250 3000 50  0001 C CNN
	1    6250 3000
	0    1    -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 69202C90
P 7000 3000
F 0 "J5" V 7100 2850 50  0000 L CNN
F 1 "83B" V 7100 3000 50  0000 L CNN
F 2 "0_my_footprints:myPheonix3x3.81_right" H 7000 3000 50  0001 C CNN
F 3 "~" H 7000 3000 50  0001 C CNN
	1    7000 3000
	0    1    -1   0   
$EndComp
Text GLabel 4950 2900 3    50   Input ~ 0
CANH
Text GLabel 4850 2900 3    50   Input ~ 0
CANL
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 6925D224
P 4850 2700
F 0 "J3" V 5000 2800 50  0000 L CNN
F 1 "NMEA2000" V 5000 2350 50  0000 L CNN
F 2 "0_my_footprints:myPheonix4x3.81_right" H 4850 2700 50  0001 C CNN
F 3 "~" H 4850 2700 50  0001 C CNN
	1    4850 2700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6925D22A
P 5050 2900
F 0 "#PWR0101" H 5050 2650 50  0001 C CNN
F 1 "GND" V 5050 2700 50  0000 C CNN
F 2 "" H 5050 2900 50  0001 C CNN
F 3 "" H 5050 2900 50  0001 C CNN
	1    5050 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0102
U 1 1 6925D230
P 4750 2900
F 0 "#PWR0102" H 4750 2750 50  0001 C CNN
F 1 "+12V" V 4750 3100 50  0000 C CNN
F 2 "" H 4750 2900 50  0001 C CNN
F 3 "" H 4750 2900 50  0001 C CNN
	1    4750 2900
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 691DDC2F
P 1350 3750
F 0 "J7" H 1650 3750 50  0000 C CNN
F 1 "BUCK_PWR" H 1650 3650 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 1350 3750 50  0001 C CNN
F 3 "~" H 1350 3750 50  0001 C CNN
	1    1350 3750
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR0103
U 1 1 691E044F
P 1550 3550
F 0 "#PWR0103" H 1550 3400 50  0001 C CNN
F 1 "+12V" H 1550 3750 50  0000 C CNN
F 2 "" H 1550 3550 50  0001 C CNN
F 3 "" H 1550 3550 50  0001 C CNN
	1    1550 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3550 1550 3650
Wire Wire Line
	1550 3750 1650 3750
$Comp
L Connector_Generic:Conn_01x03 J21
U 1 1 691B72AF
P 8600 7050
F 0 "J21" V 8700 7000 50  0000 L CNN
F 1 "ST1" H 8680 7001 50  0001 L CNN
F 2 "0_my_footprints:myPheonix3x3.81_right" H 8600 7050 50  0001 C CNN
F 3 "~" H 8600 7050 50  0001 C CNN
	1    8600 7050
	0    1    -1   0   
$EndComp
$Comp
L power:+12V #PWR0104
U 1 1 691B842B
P 8500 7250
F 0 "#PWR0104" H 8500 7100 50  0001 C CNN
F 1 "+12V" V 8500 7350 50  0000 L CNN
F 2 "" H 8500 7250 50  0001 C CNN
F 3 "" H 8500 7250 50  0001 C CNN
	1    8500 7250
	-1   0    0    1   
$EndComp
Text GLabel 8600 7250 3    50   Input ~ 0
ST1
$Comp
L power:GND #PWR0105
U 1 1 691BA5E9
P 8700 7250
F 0 "#PWR0105" H 8700 7000 50  0001 C CNN
F 1 "GND" V 8700 7050 50  0000 C CNN
F 2 "" H 8700 7250 50  0001 C CNN
F 3 "" H 8700 7250 50  0001 C CNN
	1    8700 7250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J22
U 1 1 691BB74B
P 8950 7050
F 0 "J22" V 9050 7000 50  0000 L CNN
F 1 "ST1" H 9030 7001 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 8950 7050 50  0001 C CNN
F 3 "~" H 8950 7050 50  0001 C CNN
	1    8950 7050
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0106
U 1 1 691BB751
P 8850 7250
F 0 "#PWR0106" H 8850 7100 50  0001 C CNN
F 1 "+12V" V 8850 7350 50  0000 L CNN
F 2 "" H 8850 7250 50  0001 C CNN
F 3 "" H 8850 7250 50  0001 C CNN
	1    8850 7250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 691BB758
P 9050 7250
F 0 "#PWR0107" H 9050 7000 50  0001 C CNN
F 1 "GND" V 9050 7050 50  0000 C CNN
F 2 "" H 9050 7250 50  0001 C CNN
F 3 "" H 9050 7250 50  0001 C CNN
	1    9050 7250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J23
U 1 1 691BC18D
P 9300 7050
F 0 "J23" V 9400 7000 50  0000 L CNN
F 1 "ST1" H 9380 7001 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 9300 7050 50  0001 C CNN
F 3 "~" H 9300 7050 50  0001 C CNN
	1    9300 7050
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0108
U 1 1 691BC193
P 9200 7250
F 0 "#PWR0108" H 9200 7100 50  0001 C CNN
F 1 "+12V" V 9200 7350 50  0000 L CNN
F 2 "" H 9200 7250 50  0001 C CNN
F 3 "" H 9200 7250 50  0001 C CNN
	1    9200 7250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 691BC19A
P 9400 7250
F 0 "#PWR0109" H 9400 7000 50  0001 C CNN
F 1 "GND" V 9400 7050 50  0000 C CNN
F 2 "" H 9400 7250 50  0001 C CNN
F 3 "" H 9400 7250 50  0001 C CNN
	1    9400 7250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J24
U 1 1 691BC287
P 9650 7050
F 0 "J24" V 9750 7000 50  0000 L CNN
F 1 "ST1" H 9730 7001 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 9650 7050 50  0001 C CNN
F 3 "~" H 9650 7050 50  0001 C CNN
	1    9650 7050
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR07
U 1 1 691BC28D
P 9550 7250
F 0 "#PWR07" H 9550 7100 50  0001 C CNN
F 1 "+12V" V 9550 7350 50  0000 L CNN
F 2 "" H 9550 7250 50  0001 C CNN
F 3 "" H 9550 7250 50  0001 C CNN
	1    9550 7250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 691BC294
P 9750 7250
F 0 "#PWR08" H 9750 7000 50  0001 C CNN
F 1 "GND" V 9750 7050 50  0000 C CNN
F 2 "" H 9750 7250 50  0001 C CNN
F 3 "" H 9750 7250 50  0001 C CNN
	1    9750 7250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J25
U 1 1 691BC5E9
P 10000 7050
F 0 "J25" V 10100 7000 50  0000 L CNN
F 1 "ST1" H 10080 7001 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 10000 7050 50  0001 C CNN
F 3 "~" H 10000 7050 50  0001 C CNN
	1    10000 7050
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0110
U 1 1 691BC5EF
P 9900 7250
F 0 "#PWR0110" H 9900 7100 50  0001 C CNN
F 1 "+12V" V 9900 7350 50  0000 L CNN
F 2 "" H 9900 7250 50  0001 C CNN
F 3 "" H 9900 7250 50  0001 C CNN
	1    9900 7250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 691BC5F6
P 10100 7250
F 0 "#PWR0111" H 10100 7000 50  0001 C CNN
F 1 "GND" V 10100 7050 50  0000 C CNN
F 2 "" H 10100 7250 50  0001 C CNN
F 3 "" H 10100 7250 50  0001 C CNN
	1    10100 7250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J26
U 1 1 691BCBC3
P 10350 7050
F 0 "J26" V 10450 7000 50  0000 L CNN
F 1 "ST1" H 10430 7001 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 10350 7050 50  0001 C CNN
F 3 "~" H 10350 7050 50  0001 C CNN
	1    10350 7050
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0112
U 1 1 691BCBC9
P 10250 7250
F 0 "#PWR0112" H 10250 7100 50  0001 C CNN
F 1 "+12V" V 10250 7350 50  0000 L CNN
F 2 "" H 10250 7250 50  0001 C CNN
F 3 "" H 10250 7250 50  0001 C CNN
	1    10250 7250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 691BCBD0
P 10450 7250
F 0 "#PWR0113" H 10450 7000 50  0001 C CNN
F 1 "GND" V 10450 7050 50  0000 C CNN
F 2 "" H 10450 7250 50  0001 C CNN
F 3 "" H 10450 7250 50  0001 C CNN
	1    10450 7250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J27
U 1 1 691BD105
P 10700 7050
F 0 "J27" V 10800 7000 50  0000 L CNN
F 1 "ST1" H 10780 7001 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 10700 7050 50  0001 C CNN
F 3 "~" H 10700 7050 50  0001 C CNN
	1    10700 7050
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0114
U 1 1 691BD10B
P 10600 7250
F 0 "#PWR0114" H 10600 7100 50  0001 C CNN
F 1 "+12V" V 10600 7350 50  0000 L CNN
F 2 "" H 10600 7250 50  0001 C CNN
F 3 "" H 10600 7250 50  0001 C CNN
	1    10600 7250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR014
U 1 1 691BD112
P 10800 7250
F 0 "#PWR014" H 10800 7000 50  0001 C CNN
F 1 "GND" V 10800 7050 50  0000 C CNN
F 2 "" H 10800 7250 50  0001 C CNN
F 3 "" H 10800 7250 50  0001 C CNN
	1    10800 7250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J28
U 1 1 691BD93F
P 11150 7050
F 0 "J28" V 11250 7000 50  0000 L CNN
F 1 "ST2" H 11230 7001 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 11150 7050 50  0001 C CNN
F 3 "~" H 11150 7050 50  0001 C CNN
	1    11150 7050
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0115
U 1 1 691BD945
P 11050 7250
F 0 "#PWR0115" H 11050 7100 50  0001 C CNN
F 1 "+12V" V 11050 7350 50  0000 L CNN
F 2 "" H 11050 7250 50  0001 C CNN
F 3 "" H 11050 7250 50  0001 C CNN
	1    11050 7250
	-1   0    0    1   
$EndComp
Text GLabel 11150 7250 3    50   Input ~ 0
ST2
$Comp
L power:GND #PWR0116
U 1 1 691BD94C
P 11250 7250
F 0 "#PWR0116" H 11250 7000 50  0001 C CNN
F 1 "GND" V 11250 7050 50  0000 C CNN
F 2 "" H 11250 7250 50  0001 C CNN
F 3 "" H 11250 7250 50  0001 C CNN
	1    11250 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 3200 10350 3700
Wire Wire Line
	10100 3700 10350 3700
Connection ~ 10350 3700
Wire Wire Line
	10350 3700 10350 3800
Wire Wire Line
	10550 3000 10650 3000
Wire Wire Line
	10650 3000 10650 3500
Wire Wire Line
	10650 3500 10100 3500
Connection ~ 10650 3000
Wire Wire Line
	10650 3000 10750 3000
Wire Wire Line
	9350 5350 10350 5350
Wire Wire Line
	10350 5350 10350 5850
Wire Wire Line
	10100 5850 10350 5850
Connection ~ 10350 5850
Wire Wire Line
	10350 5850 10350 6000
Wire Wire Line
	10550 5150 10650 5150
Wire Wire Line
	10100 5650 10650 5650
Wire Wire Line
	10650 5650 10650 5150
Connection ~ 10650 5150
Wire Wire Line
	10650 5150 10750 5150
$Comp
L Connector_Generic:Conn_01x02 J15
U 1 1 692A6692
P 7600 3300
F 0 "J15" H 7750 3300 50  0000 C CNN
F 1 "AIS" H 7750 3200 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 7600 3300 50  0001 C CNN
F 3 "~" H 7600 3300 50  0001 C CNN
	1    7600 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J16
U 1 1 692F85B5
P 7600 3700
F 0 "J16" H 7750 3600 50  0000 C CNN
F 1 "GPS" H 7750 3700 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 7600 3700 50  0001 C CNN
F 3 "~" H 7600 3700 50  0001 C CNN
	1    7600 3700
	1    0    0    1   
$EndComp
Text GLabel 7100 3900 3    63   Input ~ 0
83B_OUT
Text GLabel 7000 3900 3    63   Input ~ 0
83B_IN
Wire Wire Line
	6150 3200 6150 3900
Wire Wire Line
	6250 3200 6250 3400
Wire Wire Line
	6350 3200 6350 3700
Wire Wire Line
	6900 3200 6900 3900
Wire Wire Line
	7000 3200 7000 3600
Wire Wire Line
	7100 3200 7100 3300
Wire Wire Line
	7400 3300 7100 3300
Connection ~ 7100 3300
Wire Wire Line
	7100 3300 7100 3900
Wire Wire Line
	7400 3400 6250 3400
Connection ~ 6250 3400
Wire Wire Line
	6250 3400 6250 3900
Wire Wire Line
	7400 3600 7000 3600
Connection ~ 7000 3600
Wire Wire Line
	7000 3600 7000 3900
Wire Wire Line
	7400 3700 6350 3700
Connection ~ 6350 3700
Wire Wire Line
	6350 3700 6350 3900
Text GLabel 8950 7250 3    50   Input ~ 0
ST1
Text GLabel 9300 7250 3    50   Input ~ 0
ST1
Text GLabel 9650 7250 3    50   Input ~ 0
ST1
Text GLabel 10000 7250 3    50   Input ~ 0
ST1
Text GLabel 10350 7250 3    50   Input ~ 0
ST1
Text GLabel 10700 7250 3    50   Input ~ 0
ST1
$Comp
L Connector_Generic:Conn_01x02 J17
U 1 1 69648F76
P 9750 6450
F 0 "J17" H 10000 6450 50  0000 C CNN
F 1 "ST_CONNECTED" H 10100 6350 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 9750 6450 50  0001 C CNN
F 3 "~" H 9750 6450 50  0001 C CNN
	1    9750 6450
	1    0    0    -1  
$EndComp
Text GLabel 9550 6550 0    50   Input ~ 0
ST1
Text GLabel 9550 6450 0    50   Input ~ 0
ST2
$EndSCHEMATC
