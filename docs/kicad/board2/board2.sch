EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A2 23386 16535
encoding utf-8
Sheet 1 1
Title "BOARD2 - on Rhapsody"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 5450 3900 3    50   Input ~ 0
CTX
Text GLabel 5450 2950 3    50   Input ~ 0
CANH
Text GLabel 5350 2950 3    50   Input ~ 0
CANL
Text GLabel 5650 3900 3    50   Input ~ 0
CANL
Text GLabel 5550 3900 3    50   Input ~ 0
CANH
Text GLabel 5350 3900 3    50   Input ~ 0
CRX
$Comp
L power:GND #PWR016
U 1 1 68C8AF7F
P 5250 3900
F 0 "#PWR016" H 5250 3650 50  0001 C CNN
F 1 "GND" V 5250 3700 50  0000 C CNN
F 2 "" H 5250 3900 50  0001 C CNN
F 3 "" H 5250 3900 50  0001 C CNN
	1    5250 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR015
U 1 1 68C85564
P 5150 3900
F 0 "#PWR015" H 5150 3750 50  0001 C CNN
F 1 "+3V3" V 5150 4100 50  0000 C CNN
F 2 "" H 5150 3900 50  0001 C CNN
F 3 "" H 5150 3900 50  0001 C CNN
	1    5150 3900
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J10
U 1 1 68C7D765
P 5350 3700
F 0 "J10" V 5500 3850 50  0000 L CNN
F 1 "SN65HVD230" V 5500 3300 50  0000 L CNN
F 2 "0_my_footprints:CANBUS_Module1" H 5350 3700 50  0001 C CNN
F 3 "~" H 5350 3700 50  0001 C CNN
	1    5350 3700
	0    -1   -1   0   
$EndComp
Text GLabel 7550 3950 3    63   Input ~ 0
83A_IN
Wire Wire Line
	10100 8650 10350 8650
Wire Wire Line
	10100 8750 10350 8750
Text Notes 9750 8800 0    63   ~ 0
12V\nData\nGND\n
Text Notes 11000 8900 0    63   ~ 0
unused alarm return\nunused alarm\n12V (except it's not)\nseatalk TX\nseatalk RX (except it's not)\nGND (excpt it's not)
Text Notes 10600 8200 0    50   ~ 0
Seatalk Alarm Cable from E80\n(red not connected)
$Comp
L power:GND #PWR024
U 1 1 68BD4022
P 11650 3850
F 0 "#PWR024" H 11650 3600 50  0001 C CNN
F 1 "GND" H 11655 3677 50  0000 C CNN
F 2 "" H 11650 3850 50  0001 C CNN
F 3 "" H 11650 3850 50  0001 C CNN
	1    11650 3850
	1    0    0    -1  
$EndComp
Text Notes 9750 2000 0    50   ~ 0
TRANSMIT\nTXD is normally high, and the other side is pulled up to 3.3v thru 220 ohms,\nso no current flows through opto2_diode, and thus, the yellow (bus) is NOT \npulled down to ground.   When we transmit data, TXD goes low, lights the diode\nand the yellow (bus) is pulled down to ground through opto2.\n
Text Notes 9750 1500 0    50   ~ 0
RECEIVE\nThe yellow (bus) is pulled up to 12V (idle) thru 4.7K ohms.  All devices pull the bus up. \nIf the bus is high (idle), no current flows through opto1_diode, and so RXD is pulled\nup to 3.3V through the 4.7K ohm resistor.   When another device pulls the bus low,\nthe diode lights up and RXD is pulled to ground through opto1.
Wire Wire Line
	10300 3750 10800 3750
Wire Wire Line
	10650 3250 11650 3250
Wire Wire Line
	10650 3050 10650 3250
Wire Wire Line
	11550 2850 11550 2400
Wire Wire Line
	10300 3550 10300 3450
Wire Wire Line
	10400 3550 10300 3550
Wire Wire Line
	10800 3550 10700 3550
$Comp
L Device:R R3
U 1 1 68211A3C
P 11700 3050
F 0 "R3" H 11770 3096 50  0001 L CNN
F 1 "4.7K" V 11700 3050 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 11630 3050 50  0001 C CNN
F 3 "~" H 11700 3050 50  0001 C CNN
	1    11700 3050
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR023
U 1 1 68244B74
P 10300 3450
F 0 "#PWR023" H 10300 3300 50  0001 C CNN
F 1 "+3V3" H 10315 3623 50  0000 C CNN
F 2 "" H 10300 3450 50  0001 C CNN
F 3 "" H 10300 3450 50  0001 C CNN
	1    10300 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 68236F3F
P 10550 3550
F 0 "R5" H 10620 3596 50  0001 L CNN
F 1 "220" V 10550 3550 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 10480 3550 50  0001 C CNN
F 3 "~" H 10550 3550 50  0001 C CNN
	1    10550 3550
	0    1    1    0   
$EndComp
Text GLabel 10300 3750 0    63   Input ~ 0
TX1
$Comp
L Isolator:TLP291 U2
U 1 1 68235388
P 11100 3650
F 0 "U2" H 11100 3975 50  0001 C CNN
F 1 "TLP521" H 11100 3883 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 10900 3450 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 11100 3650 50  0001 L CNN
	1    11100 3650
	1    0    0    -1  
$EndComp
$Comp
L Isolator:TLP291 U1
U 1 1 6822E37B
P 11100 2950
F 0 "U1" H 11100 3275 50  0001 C CNN
F 1 "TLP521" H 11100 3183 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 10900 2750 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 11100 2950 50  0001 L CNN
	1    11100 2950
	-1   0    0    -1  
$EndComp
Connection ~ 10650 2850
Wire Wire Line
	10300 2850 10650 2850
Text GLabel 10300 2850 0    63   Input ~ 0
RX1
Wire Wire Line
	10650 2850 10650 2700
Wire Wire Line
	10800 2850 10650 2850
Wire Wire Line
	10800 3050 10650 3050
Wire Wire Line
	11400 2850 11550 2850
Wire Wire Line
	11550 3050 11400 3050
$Comp
L power:+12V #PWR013
U 1 1 6820AAC2
P 11550 2400
F 0 "#PWR013" H 11550 2250 50  0001 C CNN
F 1 "+12V" H 11565 2573 50  0000 C CNN
F 2 "" H 11550 2400 50  0001 C CNN
F 3 "" H 11550 2400 50  0001 C CNN
	1    11550 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR012
U 1 1 681EA407
P 10650 2400
F 0 "#PWR012" H 10650 2250 50  0001 C CNN
F 1 "+3V3" H 10665 2573 50  0000 C CNN
F 2 "" H 10650 2400 50  0001 C CNN
F 3 "" H 10650 2400 50  0001 C CNN
	1    10650 2400
	1    0    0    -1  
$EndComp
Text Notes 10500 8900 0    63   ~ 0
brown\nwhite\nred\nyellow\nblack\nshield
$Comp
L Device:CP C1
U 1 1 68D022FD
P 4150 3950
F 0 "C1" H 4268 3996 50  0001 L CNN
F 1 "100uf" H 3800 3950 50  0000 L CNN
F 2 "0_my_footprints2:CP_my100uf" H 4188 3800 50  0001 C CNN
F 3 "~" H 4150 3950 50  0001 C CNN
	1    4150 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 68DEB69F
P 5350 2750
F 0 "J2" V 5500 2850 50  0000 L CNN
F 1 "NMEA2000" V 5500 2400 50  0000 L CNN
F 2 "0_my_footprints:myPheonix4x3.81_right" H 5350 2750 50  0001 C CNN
F 3 "~" H 5350 2750 50  0001 C CNN
	1    5350 2750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 68DFEA73
P 5550 2950
F 0 "#PWR04" H 5550 2700 50  0001 C CNN
F 1 "GND" V 5550 2750 50  0000 C CNN
F 2 "" H 5550 2950 50  0001 C CNN
F 3 "" H 5550 2950 50  0001 C CNN
	1    5550 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 69145A55
P 11650 6050
F 0 "#PWR036" H 11650 5800 50  0001 C CNN
F 1 "GND" H 11655 5877 50  0000 C CNN
F 2 "" H 11650 6050 50  0001 C CNN
F 3 "" H 11650 6050 50  0001 C CNN
	1    11650 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 5900 10800 5900
Wire Wire Line
	10650 5200 10650 5400
Wire Wire Line
	11550 5000 11550 4550
Wire Wire Line
	10300 5700 10300 5600
Wire Wire Line
	10400 5700 10300 5700
Wire Wire Line
	10800 5700 10700 5700
$Comp
L Device:R R8
U 1 1 69145A6C
P 11700 5200
F 0 "R8" H 11770 5246 50  0001 L CNN
F 1 "4.7K" V 11700 5200 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 11630 5200 50  0001 C CNN
F 3 "~" H 11700 5200 50  0001 C CNN
	1    11700 5200
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR035
U 1 1 69145A72
P 10300 5600
F 0 "#PWR035" H 10300 5450 50  0001 C CNN
F 1 "+3V3" H 10315 5773 50  0000 C CNN
F 2 "" H 10300 5600 50  0001 C CNN
F 3 "" H 10300 5600 50  0001 C CNN
	1    10300 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 69145A78
P 10550 5700
F 0 "R10" H 10620 5746 50  0001 L CNN
F 1 "220" V 10550 5700 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 10480 5700 50  0001 C CNN
F 3 "~" H 10550 5700 50  0001 C CNN
	1    10550 5700
	0    1    1    0   
$EndComp
Text GLabel 10300 5900 0    63   Input ~ 0
TX2
$Comp
L Isolator:TLP291 U5
U 1 1 69145A7F
P 11100 5800
F 0 "U5" H 11100 6125 50  0001 C CNN
F 1 "TLP521" H 11100 6033 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 10900 5600 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 11100 5800 50  0001 L CNN
	1    11100 5800
	1    0    0    -1  
$EndComp
$Comp
L Isolator:TLP291 U4
U 1 1 69145A85
P 11100 5100
F 0 "U4" H 11100 5425 50  0001 C CNN
F 1 "TLP521" H 11100 5333 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 10900 4900 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 11100 5100 50  0001 L CNN
	1    11100 5100
	-1   0    0    -1  
$EndComp
Connection ~ 10650 5000
Wire Wire Line
	10300 5000 10650 5000
Text GLabel 10300 5000 0    63   Input ~ 0
RX2
Wire Wire Line
	10650 5000 10650 4850
Wire Wire Line
	10800 5000 10650 5000
Wire Wire Line
	10800 5200 10650 5200
Wire Wire Line
	11400 5000 11550 5000
Wire Wire Line
	11550 5200 11400 5200
$Comp
L power:+12V #PWR032
U 1 1 69145A99
P 11550 4550
F 0 "#PWR032" H 11550 4400 50  0001 C CNN
F 1 "+12V" H 11565 4723 50  0000 C CNN
F 2 "" H 11550 4550 50  0001 C CNN
F 3 "" H 11550 4550 50  0001 C CNN
	1    11550 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR031
U 1 1 69145AA1
P 10650 4550
F 0 "#PWR031" H 10650 4400 50  0001 C CNN
F 1 "+3V3" H 10665 4723 50  0000 C CNN
F 2 "" H 10650 4550 50  0001 C CNN
F 3 "" H 10650 4550 50  0001 C CNN
	1    10650 4550
	1    0    0    -1  
$EndComp
Text GLabel 12050 3050 2    50   Input ~ 0
ST1
Text GLabel 12050 5200 2    50   Input ~ 0
ST2
$Comp
L power:GND #PWR02
U 1 1 61C56583
P 3450 3100
F 0 "#PWR02" H 3450 2850 50  0001 C CNN
F 1 "GND" V 3450 2900 50  0000 C CNN
F 2 "" H 3450 3100 50  0001 C CNN
F 3 "" H 3450 3100 50  0001 C CNN
	1    3450 3100
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR01
U 1 1 61DE37E9
P 3450 3000
F 0 "#PWR01" H 3450 2850 50  0001 C CNN
F 1 "+12V" V 3450 3200 50  0000 C CNN
F 2 "" H 3450 3000 50  0001 C CNN
F 3 "" H 3450 3000 50  0001 C CNN
	1    3450 3000
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 63C47095
P 3250 3000
F 0 "J1" H 3900 2950 50  0000 C CNN
F 1 "INST_POWER" H 3550 2950 50  0000 C CNN
F 2 "0_my_footprints:myPheonix2x3.81_right" H 3250 3000 50  0001 C CNN
F 3 "~" H 3250 3000 50  0001 C CNN
	1    3250 3000
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 61D92C26
P 4300 3800
F 0 "#PWR09" H 4300 3650 50  0001 C CNN
F 1 "+5V" V 4300 4000 50  0000 C CNN
F 2 "" H 4300 3800 50  0001 C CNN
F 3 "" H 4300 3800 50  0001 C CNN
	1    4300 3800
	0    1    -1   0   
$EndComp
$Comp
L cnc3018_Library:BUCK01 M1
U 1 1 61B26C43
P 3350 3950
F 0 "M1" H 3500 3950 50  0000 C CNN
F 1 "BUCK01" H 3250 3950 50  0000 C CNN
F 2 "0_my_footprints:myMini360BuckConverter" H 3300 4250 50  0001 C CNN
F 3 "" H 3300 4250 50  0001 C CNN
	1    3350 3950
	1    0    0    1   
$EndComp
$Comp
L Diode:1N4001 D2
U 1 1 69362762
P 3850 3800
F 0 "D2" H 4050 3600 50  0000 L CNN
F 1 "1N5819" H 3700 3600 50  0000 L CNN
F 2 "0_my_footprints:myDiodeSchotsky" H 3850 3625 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 3850 3800 50  0001 C CNN
	1    3850 3800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 693ABDD2
P 3700 4200
F 0 "#PWR011" H 3700 3950 50  0001 C CNN
F 1 "GND" H 3705 4027 50  0000 C CNN
F 2 "" H 3700 4200 50  0001 C CNN
F 3 "" H 3700 4200 50  0001 C CNN
	1    3700 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 693B1C91
P 2950 4200
F 0 "#PWR010" H 2950 3950 50  0001 C CNN
F 1 "GND" H 2955 4027 50  0000 C CNN
F 2 "" H 2950 4200 50  0001 C CNN
F 3 "" H 2950 4200 50  0001 C CNN
	1    2950 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4100 3700 4200
Wire Wire Line
	2950 4100 2950 4200
Wire Wire Line
	4000 3800 4150 3800
Connection ~ 4150 3800
Wire Wire Line
	4150 3800 4300 3800
Wire Wire Line
	4150 4100 3700 4100
Connection ~ 3700 4100
$Comp
L power:+12V #PWR03
U 1 1 694CBA8F
P 5250 2950
F 0 "#PWR03" H 5250 2800 50  0001 C CNN
F 1 "+12V" V 5250 3150 50  0000 C CNN
F 2 "" H 5250 2950 50  0001 C CNN
F 3 "" H 5250 2950 50  0001 C CNN
	1    5250 2950
	-1   0    0    1   
$EndComp
Text GLabel 7550 5600 3    63   Input ~ 0
RX4
$Comp
L power:+3V3 #PWR018
U 1 1 69544CCB
P 8050 5600
F 0 "#PWR018" H 8050 5450 50  0001 C CNN
F 1 "+3V3" V 8050 5800 50  0000 C CNN
F 2 "" H 8050 5600 50  0001 C CNN
F 3 "" H 8050 5600 50  0001 C CNN
	1    8050 5600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 6953CC62
P 7950 5600
F 0 "#PWR017" H 7950 5350 50  0001 C CNN
F 1 "GND" V 7950 5400 50  0000 C CNN
F 2 "" H 7950 5600 50  0001 C CNN
F 3 "" H 7950 5600 50  0001 C CNN
	1    7950 5600
	1    0    0    -1  
$EndComp
Text GLabel 7650 5600 3    63   Input ~ 0
RX3
Text GLabel 7850 5600 3    63   Input ~ 0
TX3
Text GLabel 7750 5600 3    63   Input ~ 0
TX4
$Comp
L Connector_Generic:Conn_01x10 J14
U 1 1 694EB22B
P 7950 5400
F 0 "J14" V 8500 5650 50  0000 C CNN
F 1 "MAX3232" V 8500 5250 50  0000 C CNN
F 2 "0_my_footprints:MAX3232_Module" H 7950 5400 50  0001 C CNN
F 3 "~" H 7950 5400 50  0001 C CNN
	1    7950 5400
	0    -1   -1   0   
$EndComp
Text Notes 7000 1850 0    50   ~ 0
Directions are extern device centric:\n    83x_IN connects to the Input of the connected device.\n    83x_OUT connects to the Output of the connected device.\n
Text Notes 8500 5300 1    63   ~ 0
R2OUT\nR1OUT\nT2IN\nT1IN\nGND\n3V\nR2IN\nR1IN\nT2OUT\nT1OUT
Text Notes 8450 2850 1    63   ~ 0
GREEN+GREY\nYELLOW\nBLUE
Text Notes 8350 2350 0    50   ~ 0
GX2410
Text Notes 7700 2850 1    63   ~ 0
GREEN+BROWN\nWHITE\nYELLOW
Text Notes 7600 2350 0    50   ~ 0
E80
$Comp
L power:GND #PWR06
U 1 1 697936EC
P 8200 3950
F 0 "#PWR06" H 8200 3700 50  0001 C CNN
F 1 "GND" V 8200 3750 50  0000 C CNN
F 2 "" H 8200 3950 50  0001 C CNN
F 3 "" H 8200 3950 50  0001 C CNN
	1    8200 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6979FE97
P 7450 3950
F 0 "#PWR05" H 7450 3700 50  0001 C CNN
F 1 "GND" V 7450 3750 50  0000 C CNN
F 2 "" H 7450 3950 50  0001 C CNN
F 3 "" H 7450 3950 50  0001 C CNN
	1    7450 3950
	1    0    0    -1  
$EndComp
Text GLabel 8450 5600 3    63   Input ~ 0
83A_IN
Text GLabel 8350 5600 3    63   Input ~ 0
83B_IN
Text GLabel 8250 5600 3    63   Input ~ 0
83A_OUT
Text GLabel 8150 5600 3    63   Input ~ 0
83B_OUT
$Comp
L Device:LED D4
U 1 1 69BBC2B7
P 8100 6850
F 0 "D4" H 8093 7067 50  0000 C CNN
F 1 "ALIVE_LED" H 8093 6976 50  0000 C CNN
F 2 "0_my_footprints2:led_small_red" H 8100 6850 50  0001 C CNN
F 3 "~" H 8100 6850 50  0001 C CNN
	1    8100 6850
	1    0    0    -1  
$EndComp
Text GLabel 8250 6850 2    50   Input ~ 0
ALIVE_LED
$Comp
L Device:R R9
U 1 1 69BC4C2F
P 7800 6850
F 0 "R9" H 7870 6896 50  0001 L CNN
F 1 "220" V 7800 6850 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 7730 6850 50  0001 C CNN
F 3 "~" H 7800 6850 50  0001 C CNN
	1    7800 6850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR034
U 1 1 69BD7043
P 7650 6850
F 0 "#PWR034" H 7650 6600 50  0001 C CNN
F 1 "GND" V 7650 6650 50  0000 C CNN
F 2 "" H 7650 6850 50  0001 C CNN
F 3 "" H 7650 6850 50  0001 C CNN
	1    7650 6850
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J11
U 1 1 69BF4FBB
P 6400 3700
F 0 "J11" V 6550 3250 50  0000 C CNN
F 1 "CAN_TERMINATOR" V 6550 3650 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 6400 3700 50  0001 C CNN
F 3 "~" H 6400 3700 50  0001 C CNN
	1    6400 3700
	0    1    -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 69C09B31
P 6400 4050
F 0 "R2" H 6470 4096 50  0001 L CNN
F 1 "120" V 6400 4050 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 6330 4050 50  0001 C CNN
F 3 "~" H 6400 4050 50  0001 C CNN
	1    6400 4050
	-1   0    0    1   
$EndComp
Wire Wire Line
	6300 4200 6300 3900
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 69C27C1B
P 3050 5300
F 0 "J8" V 3300 5250 50  0000 C CNN
F 1 "12V_TEST" V 3200 5250 50  0000 C CNN
F 2 "0_my_footprints2:pinSocket1x2" H 3050 5300 50  0001 C CNN
F 3 "~" H 3050 5300 50  0001 C CNN
	1    3050 5300
	0    -1   1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 69C3DC2B
P 3650 5300
F 0 "J9" V 3900 5250 50  0000 C CNN
F 1 "5V_TEST" V 3800 5250 50  0000 C CNN
F 2 "0_my_footprints2:pinSocket1x2" H 3650 5300 50  0001 C CNN
F 3 "~" H 3650 5300 50  0001 C CNN
	1    3650 5300
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 69C4194B
P 3650 5100
F 0 "#PWR021" H 3650 4950 50  0001 C CNN
F 1 "+5V" V 3650 5300 50  0000 C CNN
F 2 "" H 3650 5100 50  0001 C CNN
F 3 "" H 3650 5100 50  0001 C CNN
	1    3650 5100
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 69C48BFA
P 3150 5100
F 0 "#PWR020" H 3150 4850 50  0001 C CNN
F 1 "GND" V 3150 4900 50  0000 C CNN
F 2 "" H 3150 5100 50  0001 C CNN
F 3 "" H 3150 5100 50  0001 C CNN
	1    3150 5100
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR019
U 1 1 69C48C00
P 3050 5100
F 0 "#PWR019" H 3050 4950 50  0001 C CNN
F 1 "+12V" V 3050 5300 50  0000 C CNN
F 2 "" H 3050 5100 50  0001 C CNN
F 3 "" H 3050 5100 50  0001 C CNN
	1    3050 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 69C577D4
P 3750 5100
F 0 "#PWR022" H 3750 4850 50  0001 C CNN
F 1 "GND" V 3750 4900 50  0000 C CNN
F 2 "" H 3750 5100 50  0001 C CNN
F 3 "" H 3750 5100 50  0001 C CNN
	1    3750 5100
	-1   0    0    1   
$EndComp
Text Notes 7000 1100 0    50   ~ 0
In passive mode, the blue AIS out+ from the GX2410 \nis connected to the white NMEA In + on the E80, and\nthe yellow GPS In+ to the GX2410 is connected to the \nyellow NMEA out+ from the E80 via jumpers.
Text Notes 9750 950  0    50   ~ 0
In passive mode, the Seatalk busses are connected\ntogether.  In active mode they are not. 
Text Notes 7000 1450 0    50   ~ 0
In active mode, the jumpers are removed and the teensy\ngets in between the NMEA ports, allowing software control\nof forwarding between the two ports.
Text GLabel 7650 3950 3    63   Input ~ 0
83A_OUT
Text Notes 700  2350 0    50   ~ 0
Features:\n- NMEA2000 port with optional terminating resistor\n- two NMEA0183 ports\n- two Seatalk ST ports\n- passive binding of 0183 and ST ports when turned off\n- active monitoring/manipulation/forward of 0183 and ST ports when turned on\n- 5V and 12V test points for calibrating the Buck Converter\n\nExisting teensyBoat.ino firmware\n- provides sophisticated monitoring of all protocols\n- provides a physical boat simulator that drives\n- simulated instruments that can be assigned to any protocol\n- can be run as command line app with serial monitor (i.e. Putty or Arduino IDE)\n\nWorks with teensyBoat.pm wxPerl user interface that provides\n- a serial monitor / console\n- a windowed user interface to easily control aspects of the teensyBoat.ino program
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 69181E1C
P 7550 3050
F 0 "J4" V 7650 2900 50  0000 L CNN
F 1 "83A" V 7650 3050 50  0000 L CNN
F 2 "0_my_footprints:myPheonix3x3.81_right" H 7550 3050 50  0001 C CNN
F 3 "~" H 7550 3050 50  0001 C CNN
	1    7550 3050
	0    1    -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 69202C90
P 8300 3050
F 0 "J5" V 8400 2900 50  0000 L CNN
F 1 "83B" V 8400 3050 50  0000 L CNN
F 2 "0_my_footprints:myPheonix3x3.81_right" H 8300 3050 50  0001 C CNN
F 3 "~" H 8300 3050 50  0001 C CNN
	1    8300 3050
	0    1    -1   0   
$EndComp
Text GLabel 6250 2950 3    50   Input ~ 0
CANH
Text GLabel 6150 2950 3    50   Input ~ 0
CANL
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 6925D224
P 6150 2750
F 0 "J3" V 6300 2850 50  0000 L CNN
F 1 "NMEA2000" V 6300 2400 50  0000 L CNN
F 2 "0_my_footprints:myPheonix4x3.81_right" H 6150 2750 50  0001 C CNN
F 3 "~" H 6150 2750 50  0001 C CNN
	1    6150 2750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6925D22A
P 6350 2950
F 0 "#PWR0101" H 6350 2700 50  0001 C CNN
F 1 "GND" V 6350 2750 50  0000 C CNN
F 2 "" H 6350 2950 50  0001 C CNN
F 3 "" H 6350 2950 50  0001 C CNN
	1    6350 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0102
U 1 1 6925D230
P 6050 2950
F 0 "#PWR0102" H 6050 2800 50  0001 C CNN
F 1 "+12V" V 6050 3150 50  0000 C CNN
F 2 "" H 6050 2950 50  0001 C CNN
F 3 "" H 6050 2950 50  0001 C CNN
	1    6050 2950
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 691DDC2F
P 2650 3800
F 0 "J7" H 2950 3800 50  0000 C CNN
F 1 "BUCK_PWR" H 2950 3700 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 2650 3800 50  0001 C CNN
F 3 "~" H 2650 3800 50  0001 C CNN
	1    2650 3800
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR0103
U 1 1 691E044F
P 2850 3600
F 0 "#PWR0103" H 2850 3450 50  0001 C CNN
F 1 "+12V" H 2850 3800 50  0000 C CNN
F 2 "" H 2850 3600 50  0001 C CNN
F 3 "" H 2850 3600 50  0001 C CNN
	1    2850 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3600 2850 3700
Wire Wire Line
	2850 3800 2950 3800
$Comp
L Connector_Generic:Conn_01x03 J21
U 1 1 691B72AF
P 9900 7100
F 0 "J21" V 10000 7050 50  0000 L CNN
F 1 "ST1" H 9980 7051 50  0001 L CNN
F 2 "0_my_footprints:myPheonix3x3.81_right" H 9900 7100 50  0001 C CNN
F 3 "~" H 9900 7100 50  0001 C CNN
	1    9900 7100
	0    1    -1   0   
$EndComp
$Comp
L power:+12V #PWR0104
U 1 1 691B842B
P 9800 7300
F 0 "#PWR0104" H 9800 7150 50  0001 C CNN
F 1 "+12V" V 9800 7400 50  0000 L CNN
F 2 "" H 9800 7300 50  0001 C CNN
F 3 "" H 9800 7300 50  0001 C CNN
	1    9800 7300
	-1   0    0    1   
$EndComp
Text GLabel 9900 7300 3    50   Input ~ 0
ST1
$Comp
L power:GND #PWR0105
U 1 1 691BA5E9
P 10000 7300
F 0 "#PWR0105" H 10000 7050 50  0001 C CNN
F 1 "GND" V 10000 7100 50  0000 C CNN
F 2 "" H 10000 7300 50  0001 C CNN
F 3 "" H 10000 7300 50  0001 C CNN
	1    10000 7300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J22
U 1 1 691BB74B
P 10250 7100
F 0 "J22" V 10350 7050 50  0000 L CNN
F 1 "ST1" H 10330 7051 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 10250 7100 50  0001 C CNN
F 3 "~" H 10250 7100 50  0001 C CNN
	1    10250 7100
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0106
U 1 1 691BB751
P 10150 7300
F 0 "#PWR0106" H 10150 7150 50  0001 C CNN
F 1 "+12V" V 10150 7400 50  0000 L CNN
F 2 "" H 10150 7300 50  0001 C CNN
F 3 "" H 10150 7300 50  0001 C CNN
	1    10150 7300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 691BB758
P 10350 7300
F 0 "#PWR0107" H 10350 7050 50  0001 C CNN
F 1 "GND" V 10350 7100 50  0000 C CNN
F 2 "" H 10350 7300 50  0001 C CNN
F 3 "" H 10350 7300 50  0001 C CNN
	1    10350 7300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J23
U 1 1 691BC18D
P 10600 7100
F 0 "J23" V 10700 7050 50  0000 L CNN
F 1 "ST1" H 10680 7051 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 10600 7100 50  0001 C CNN
F 3 "~" H 10600 7100 50  0001 C CNN
	1    10600 7100
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0108
U 1 1 691BC193
P 10500 7300
F 0 "#PWR0108" H 10500 7150 50  0001 C CNN
F 1 "+12V" V 10500 7400 50  0000 L CNN
F 2 "" H 10500 7300 50  0001 C CNN
F 3 "" H 10500 7300 50  0001 C CNN
	1    10500 7300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 691BC19A
P 10700 7300
F 0 "#PWR0109" H 10700 7050 50  0001 C CNN
F 1 "GND" V 10700 7100 50  0000 C CNN
F 2 "" H 10700 7300 50  0001 C CNN
F 3 "" H 10700 7300 50  0001 C CNN
	1    10700 7300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J24
U 1 1 691BC287
P 10950 7100
F 0 "J24" V 11050 7050 50  0000 L CNN
F 1 "ST1" H 11030 7051 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 10950 7100 50  0001 C CNN
F 3 "~" H 10950 7100 50  0001 C CNN
	1    10950 7100
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR07
U 1 1 691BC28D
P 10850 7300
F 0 "#PWR07" H 10850 7150 50  0001 C CNN
F 1 "+12V" V 10850 7400 50  0000 L CNN
F 2 "" H 10850 7300 50  0001 C CNN
F 3 "" H 10850 7300 50  0001 C CNN
	1    10850 7300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 691BC294
P 11050 7300
F 0 "#PWR08" H 11050 7050 50  0001 C CNN
F 1 "GND" V 11050 7100 50  0000 C CNN
F 2 "" H 11050 7300 50  0001 C CNN
F 3 "" H 11050 7300 50  0001 C CNN
	1    11050 7300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J25
U 1 1 691BC5E9
P 11300 7100
F 0 "J25" V 11400 7050 50  0000 L CNN
F 1 "ST1" H 11380 7051 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 11300 7100 50  0001 C CNN
F 3 "~" H 11300 7100 50  0001 C CNN
	1    11300 7100
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0110
U 1 1 691BC5EF
P 11200 7300
F 0 "#PWR0110" H 11200 7150 50  0001 C CNN
F 1 "+12V" V 11200 7400 50  0000 L CNN
F 2 "" H 11200 7300 50  0001 C CNN
F 3 "" H 11200 7300 50  0001 C CNN
	1    11200 7300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 691BC5F6
P 11400 7300
F 0 "#PWR0111" H 11400 7050 50  0001 C CNN
F 1 "GND" V 11400 7100 50  0000 C CNN
F 2 "" H 11400 7300 50  0001 C CNN
F 3 "" H 11400 7300 50  0001 C CNN
	1    11400 7300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J26
U 1 1 691BCBC3
P 11650 7100
F 0 "J26" V 11750 7050 50  0000 L CNN
F 1 "ST1" H 11730 7051 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 11650 7100 50  0001 C CNN
F 3 "~" H 11650 7100 50  0001 C CNN
	1    11650 7100
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0112
U 1 1 691BCBC9
P 11550 7300
F 0 "#PWR0112" H 11550 7150 50  0001 C CNN
F 1 "+12V" V 11550 7400 50  0000 L CNN
F 2 "" H 11550 7300 50  0001 C CNN
F 3 "" H 11550 7300 50  0001 C CNN
	1    11550 7300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 691BCBD0
P 11750 7300
F 0 "#PWR0113" H 11750 7050 50  0001 C CNN
F 1 "GND" V 11750 7100 50  0000 C CNN
F 2 "" H 11750 7300 50  0001 C CNN
F 3 "" H 11750 7300 50  0001 C CNN
	1    11750 7300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J27
U 1 1 691BD105
P 12000 7100
F 0 "J27" V 12100 7050 50  0000 L CNN
F 1 "ST1" H 12080 7051 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 12000 7100 50  0001 C CNN
F 3 "~" H 12000 7100 50  0001 C CNN
	1    12000 7100
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0114
U 1 1 691BD10B
P 11900 7300
F 0 "#PWR0114" H 11900 7150 50  0001 C CNN
F 1 "+12V" V 11900 7400 50  0000 L CNN
F 2 "" H 11900 7300 50  0001 C CNN
F 3 "" H 11900 7300 50  0001 C CNN
	1    11900 7300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR014
U 1 1 691BD112
P 12100 7300
F 0 "#PWR014" H 12100 7050 50  0001 C CNN
F 1 "GND" V 12100 7100 50  0000 C CNN
F 2 "" H 12100 7300 50  0001 C CNN
F 3 "" H 12100 7300 50  0001 C CNN
	1    12100 7300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J28
U 1 1 691BD93F
P 12450 7100
F 0 "J28" V 12550 7050 50  0000 L CNN
F 1 "ST2" H 12530 7051 50  0001 L CNN
F 2 "0_my_footprints:myJSTx03" H 12450 7100 50  0001 C CNN
F 3 "~" H 12450 7100 50  0001 C CNN
	1    12450 7100
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0115
U 1 1 691BD945
P 12350 7300
F 0 "#PWR0115" H 12350 7150 50  0001 C CNN
F 1 "+12V" V 12350 7400 50  0000 L CNN
F 2 "" H 12350 7300 50  0001 C CNN
F 3 "" H 12350 7300 50  0001 C CNN
	1    12350 7300
	-1   0    0    1   
$EndComp
Text GLabel 12450 7300 3    50   Input ~ 0
ST2
$Comp
L power:GND #PWR0116
U 1 1 691BD94C
P 12550 7300
F 0 "#PWR0116" H 12550 7050 50  0001 C CNN
F 1 "GND" V 12550 7100 50  0000 C CNN
F 2 "" H 12550 7300 50  0001 C CNN
F 3 "" H 12550 7300 50  0001 C CNN
	1    12550 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	11650 3250 11650 3750
Wire Wire Line
	11400 3750 11650 3750
Connection ~ 11650 3750
Wire Wire Line
	11650 3750 11650 3850
Wire Wire Line
	11850 3050 11950 3050
Wire Wire Line
	11950 3050 11950 3550
Wire Wire Line
	11950 3550 11400 3550
Connection ~ 11950 3050
Wire Wire Line
	11950 3050 12050 3050
Wire Wire Line
	10650 5400 11650 5400
Wire Wire Line
	11650 5400 11650 5900
Wire Wire Line
	11400 5900 11650 5900
Connection ~ 11650 5900
Wire Wire Line
	11650 5900 11650 6050
Wire Wire Line
	11850 5200 11950 5200
Wire Wire Line
	11400 5700 11950 5700
Wire Wire Line
	11950 5700 11950 5200
Connection ~ 11950 5200
Wire Wire Line
	11950 5200 12050 5200
$Comp
L Connector_Generic:Conn_01x02 J15
U 1 1 692A6692
P 8900 3350
F 0 "J15" H 9050 3350 50  0000 C CNN
F 1 "AIS" H 9050 3250 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 8900 3350 50  0001 C CNN
F 3 "~" H 8900 3350 50  0001 C CNN
	1    8900 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J16
U 1 1 692F85B5
P 8900 3750
F 0 "J16" H 9050 3650 50  0000 C CNN
F 1 "GPS" H 9050 3750 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 8900 3750 50  0001 C CNN
F 3 "~" H 8900 3750 50  0001 C CNN
	1    8900 3750
	1    0    0    1   
$EndComp
Text GLabel 8400 3950 3    63   Input ~ 0
83B_OUT
Text GLabel 8300 3950 3    63   Input ~ 0
83B_IN
Wire Wire Line
	7450 3250 7450 3950
Wire Wire Line
	7550 3250 7550 3450
Wire Wire Line
	7650 3250 7650 3750
Wire Wire Line
	8200 3250 8200 3950
Wire Wire Line
	8300 3250 8300 3650
Wire Wire Line
	8400 3250 8400 3350
Wire Wire Line
	8700 3350 8400 3350
Connection ~ 8400 3350
Wire Wire Line
	8400 3350 8400 3950
Wire Wire Line
	8700 3450 7550 3450
Connection ~ 7550 3450
Wire Wire Line
	7550 3450 7550 3950
Wire Wire Line
	8700 3650 8300 3650
Connection ~ 8300 3650
Wire Wire Line
	8300 3650 8300 3950
Wire Wire Line
	8700 3750 7650 3750
Connection ~ 7650 3750
Wire Wire Line
	7650 3750 7650 3950
Text GLabel 10250 7300 3    50   Input ~ 0
ST1
Text GLabel 10600 7300 3    50   Input ~ 0
ST1
Text GLabel 10950 7300 3    50   Input ~ 0
ST1
Text GLabel 11300 7300 3    50   Input ~ 0
ST1
Text GLabel 11650 7300 3    50   Input ~ 0
ST1
Text GLabel 12000 7300 3    50   Input ~ 0
ST1
$Comp
L Connector_Generic:Conn_01x02 J17
U 1 1 69648F76
P 11050 6500
F 0 "J17" H 11300 6500 50  0000 C CNN
F 1 "ST_CONNECTED" H 11400 6400 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 11050 6500 50  0001 C CNN
F 3 "~" H 11050 6500 50  0001 C CNN
	1    11050 6500
	1    0    0    -1  
$EndComp
Text GLabel 10850 6600 0    50   Input ~ 0
ST1
Text GLabel 10850 6500 0    50   Input ~ 0
ST2
$Comp
L Device:R R1
U 1 1 6822159F
P 10650 2550
F 0 "R1" H 10720 2596 50  0001 L CNN
F 1 "10K" V 10650 2550 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 10580 2550 50  0001 C CNN
F 3 "~" H 10650 2550 50  0001 C CNN
	1    10650 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 69145A90
P 10650 4700
F 0 "R7" H 10720 4746 50  0001 L CNN
F 1 "10k" V 10650 4700 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 10580 4700 50  0001 C CNN
F 3 "~" H 10650 4700 50  0001 C CNN
	1    10650 4700
	1    0    0    -1  
$EndComp
$Comp
L 0_my_teensy:myTeensy4.0 U3
U 1 1 681E4C83
P 5850 7000
F 0 "U3" H 6678 7003 60  0001 L CNN
F 1 "myTeensy4.0" H 5700 6900 60  0000 L CNN
F 2 "0_my_teensy:teensy40" V 6750 7050 60  0001 C CNN
F 3 "" V 6750 7050 60  0000 C CNN
	1    5850 7000
	1    0    0    -1  
$EndComp
Text GLabel 5700 6000 1    50   Input ~ 0
CRX
Text GLabel 5600 6000 1    50   Input ~ 0
CTX
Text GLabel 6400 4200 3    50   Input ~ 0
CANL
Text GLabel 6300 4200 3    50   Input ~ 0
CANH
Text GLabel 5600 8100 3    50   Input ~ 0
SPEED_PULSE-LCD_CS
Text GLabel 6300 8100 3    50   Input ~ 0
ALIVE_LED
Text GLabel 6600 6000 1    50   Input ~ 0
SCLK-GP
Text GLabel 5800 6000 1    63   Input ~ 0
RX5-T_CS
Text GLabel 5900 6000 1    63   Input ~ 0
TX5-LCD_DC
$Comp
L power:GND #PWR037
U 1 1 69A1A92C
P 5300 8100
F 0 "#PWR037" H 5300 7850 50  0001 C CNN
F 1 "GND" V 5300 7900 50  0000 C CNN
F 2 "" H 5300 8100 50  0001 C CNN
F 3 "" H 5300 8100 50  0001 C CNN
	1    5300 8100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR027
U 1 1 68C5F036
P 5300 6000
F 0 "#PWR027" H 5300 5850 50  0001 C CNN
F 1 "+5V" V 5300 6100 50  0000 L CNN
F 2 "" H 5300 6000 50  0001 C CNN
F 3 "" H 5300 6000 50  0001 C CNN
	1    5300 6000
	1    0    0    -1  
$EndComp
Text GLabel 6500 8100 3    50   Input ~ 0
MOSI-GP
Text GLabel 6300 6000 1    63   Input ~ 0
RX4
Text GLabel 6200 6000 1    63   Input ~ 0
TX4
Text GLabel 6100 8100 3    63   Input ~ 0
RX2
Text GLabel 6200 8100 3    63   Input ~ 0
TX2
Text GLabel 6500 6000 1    63   Input ~ 0
TX3
Text GLabel 6400 6000 1    63   Input ~ 0
RX3
$Comp
L power:+3V3 #PWR029
U 1 1 681F6BDE
P 5500 6000
F 0 "#PWR029" H 5500 5850 50  0001 C CNN
F 1 "+3V3" V 5500 6200 50  0000 C CNN
F 2 "" H 5500 6000 50  0001 C CNN
F 3 "" H 5500 6000 50  0001 C CNN
	1    5500 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 681F5B40
P 5400 6000
F 0 "#PWR028" H 5400 5750 50  0001 C CNN
F 1 "GND" V 5400 5800 50  0000 C CNN
F 2 "" H 5400 6000 50  0001 C CNN
F 3 "" H 5400 6000 50  0001 C CNN
	1    5400 6000
	-1   0    0    1   
$EndComp
Text GLabel 5400 8100 3    63   Input ~ 0
RX1
Text GLabel 5500 8100 3    63   Input ~ 0
TX1
Text GLabel 6600 8100 3    50   Input ~ 0
MISO-UDP_ENABLE
Text Notes 1350 7300 0    50   ~ 0
The JST8 TEST_RIG connector is a general purpose connector.\n\nIt was initially designed It provides pulses to spoof the ST50 Speed/Log \nand Wind instruments, and to allow for the addition of inc/dec or SPI\ndigital potentiometers for resistance based spoofing  of Log Temperature \nand Wind  Direction.  In this case the instrument itself is powered and connected  \nto one of the two ST ports on this PCB.  Henceforth ST50 testing is relegated\nto the original breadboard or an as-yet undesigned dedicated device.\n\nThe connector was then expanded to support an SPI TFT display which was never\nimplemented or tested, hence the LCD_DC,LCD_CS, and T_CS alternate labels.\n \nFinally it has morphed into being a connector to an external ESP32 myIOT device\nto monitor the teensyBoat over WiFi.  In this configuration it provides power to\nthe ESP32 via 5V and GND and communicates via RX5, TX5, and UDP_ENABLE. 
Text GLabel 2050 9200 1    50   Input ~ 0
TX5-LCD_DC
Text GLabel 2150 9200 1    50   Input ~ 0
RX5-T_CS
Text GLabel 2350 9200 1    50   Input ~ 0
MISO-UDP_ENABLE
Text GLabel 2250 9200 1    50   Input ~ 0
SCLK-GP
Text GLabel 2550 9200 1    50   Input ~ 0
SPEED_PULSE-LCD_CS
Text GLabel 2450 9200 1    50   Input ~ 0
MOSI-GP
$Comp
L power:+5V #PWR040
U 1 1 69B0D841
P 2650 9200
F 0 "#PWR040" H 2650 9050 50  0001 C CNN
F 1 "+5V" V 2650 9300 50  0000 L CNN
F 2 "" H 2650 9200 50  0001 C CNN
F 3 "" H 2650 9200 50  0001 C CNN
	1    2650 9200
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR039
U 1 1 69B016D2
P 2750 9200
F 0 "#PWR039" H 2750 8950 50  0001 C CNN
F 1 "GND" V 2750 9000 50  0000 C CNN
F 2 "" H 2750 9200 50  0001 C CNN
F 3 "" H 2750 9200 50  0001 C CNN
	1    2750 9200
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J6
U 1 1 69AE5894
P 2350 9400
F 0 "J6" V 2500 9600 50  0000 L CNN
F 1 "TEST_RIG" V 2500 9000 50  0000 L CNN
F 2 "0_my_footprints:myJSTx08" H 2350 9400 50  0001 C CNN
F 3 "~" H 2350 9400 50  0001 C CNN
	1    2350 9400
	0    -1   1    0   
$EndComp
Text Notes 1350 7950 0    50   ~ 0
The PCB design has been updated to reflect this description, bringing Serial5 out to \nthe connector using pads that had been prepared "just in case" in the old design.\nThe original built PCB brought SCL and SDA out instead and those pads are now\nunused and covered by the patch wires.  \n\nThe breadboard previously used gpio4 for "UDP_ENABLE" whereby the ESP32 tells \nthe teensy that it is present.  That function has been moved to gpio12, MISO, in this\ndesign and in the code.
Text Notes 650  650  0    50   ~ 10
This is BOARD2 - the one installed on Rhapsody
Text Notes 800  900  0    50   ~ 0
It has no electrical or semantic changes from board1.\nboard1 is being kept to do development in the apartment and\nallowing me to get rid of the breadboard version
Text Notes 4950 4650 0    50   ~ 0
note that CRX/CTX labels\non the module have the\nopposite sense of the pins\non the teensy, hence crossed
$EndSCHEMATC
