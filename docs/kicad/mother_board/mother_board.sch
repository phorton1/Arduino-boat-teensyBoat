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
Text GLabel 3350 2700 1    50   Input ~ 0
CTX
Text GLabel 3450 2700 1    50   Input ~ 0
CRX
Text GLabel 6050 4550 0    50   Input ~ 0
CTX
Text GLabel 6050 5550 0    50   Input ~ 0
CANH
Text GLabel 6050 5450 0    50   Input ~ 0
CANL
Text GLabel 6050 4850 0    50   Input ~ 0
CANL
Text GLabel 6050 4750 0    50   Input ~ 0
CANH
Text GLabel 6050 4650 0    50   Input ~ 0
CRX
$Comp
L power:GND #PWR017
U 1 1 68C8AF7F
P 6050 4450
F 0 "#PWR017" H 6050 4200 50  0001 C CNN
F 1 "GND" V 6050 4250 50  0000 C CNN
F 2 "" H 6050 4450 50  0001 C CNN
F 3 "" H 6050 4450 50  0001 C CNN
	1    6050 4450
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR016
U 1 1 68C85564
P 6050 4350
F 0 "#PWR016" H 6050 4200 50  0001 C CNN
F 1 "+3V3" V 6050 4550 50  0000 C CNN
F 2 "" H 6050 4350 50  0001 C CNN
F 3 "" H 6050 4350 50  0001 C CNN
	1    6050 4350
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J6
U 1 1 68C7D765
P 6250 4550
F 0 "J6" H 5750 4950 50  0000 L CNN
F 1 "CAN_MODULE" H 5900 4950 50  0000 L CNN
F 2 "0_my_footprints:CANBUS_Module1" H 6250 4550 50  0001 C CNN
F 3 "~" H 6250 4550 50  0001 C CNN
	1    6250 4550
	1    0    0    -1  
$EndComp
Text GLabel 6050 3450 0    63   Input ~ 0
RX4
Text GLabel 6050 3550 0    63   Input ~ 0
TX4
Text GLabel 6050 2700 0    63   Input ~ 0
TX3
Text GLabel 6050 2600 0    63   Input ~ 0
RX3
$Comp
L power:GND #PWR015
U 1 1 68C6F3E5
P 6050 3650
F 0 "#PWR015" H 6050 3400 50  0001 C CNN
F 1 "GND" V 6050 3450 50  0000 C CNN
F 2 "" H 6050 3650 50  0001 C CNN
F 3 "" H 6050 3650 50  0001 C CNN
	1    6050 3650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 68C6ECA1
P 6050 2800
F 0 "#PWR013" H 6050 2550 50  0001 C CNN
F 1 "GND" V 6050 2600 50  0000 C CNN
F 2 "" H 6050 2800 50  0001 C CNN
F 3 "" H 6050 2800 50  0001 C CNN
	1    6050 2800
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR014
U 1 1 68C6D0A5
P 6050 3350
F 0 "#PWR014" H 6050 3200 50  0001 C CNN
F 1 "+3V3" V 6050 3550 50  0000 C CNN
F 2 "" H 6050 3350 50  0001 C CNN
F 3 "" H 6050 3350 50  0001 C CNN
	1    6050 3350
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR012
U 1 1 68C6C71F
P 6050 2500
F 0 "#PWR012" H 6050 2350 50  0001 C CNN
F 1 "+3V3" V 6050 2700 50  0000 C CNN
F 2 "" H 6050 2500 50  0001 C CNN
F 3 "" H 6050 2500 50  0001 C CNN
	1    6050 2500
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J5
U 1 1 68C66C08
P 6250 3450
F 0 "J5" H 6000 3750 50  0000 L CNN
F 1 "RS232-2" H 6150 3750 50  0000 L CNN
F 2 "0_my_footprints:RS232_Module" H 6250 3450 50  0001 C CNN
F 3 "~" H 6250 3450 50  0001 C CNN
	1    6250 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J4
U 1 1 68C63622
P 6250 2600
F 0 "J4" H 6000 2900 50  0000 L CNN
F 1 "RS232-1" H 6150 2900 50  0000 L CNN
F 2 "0_my_footprints:RS232_Module" H 6250 2600 50  0001 C CNN
F 3 "~" H 6250 2600 50  0001 C CNN
	1    6250 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 68C5F036
P 3050 2700
F 0 "#PWR06" H 3050 2550 50  0001 C CNN
F 1 "+5V" V 3065 2828 50  0000 L CNN
F 2 "" H 3050 2700 50  0001 C CNN
F 3 "" H 3050 2700 50  0001 C CNN
	1    3050 2700
	1    0    0    -1  
$EndComp
Text GLabel 3650 4800 3    50   Input ~ 0
WIND_PULSE
Wire Wire Line
	11650 3000 11900 3000
Wire Wire Line
	11650 3100 11900 3100
Text Notes 11300 3150 0    63   ~ 0
12V\nData\nGND\n
Text Notes 10900 3150 0    63   ~ 0
red\nyellow\nblack
$Comp
L Connector_Generic:Conn_01x03 J8
U 1 1 68C4B86A
P 10750 3000
F 0 "J8" H 10700 3400 50  0000 L CNN
F 1 "Seatalk" H 10500 3300 50  0000 L CNN
F 2 "0_my_footprints:myTerminalBlock_2.54x03" H 10750 3000 50  0001 C CNN
F 3 "~" H 10750 3000 50  0001 C CNN
	1    10750 3000
	1    0    0    1   
$EndComp
Wire Wire Line
	10300 2900 10300 2350
Wire Wire Line
	10550 2900 10300 2900
Text Notes 12550 3250 0    63   ~ 0
unused alarm return\nunused alarm\n12V (except it's not)\nseatalk TX\nseatalk RX (except it's not)\nGND (excpt it's not)
Text Notes 12150 2550 0    50   ~ 0
Seatalk Alarm Cable from E80\n(red not connected)
$Comp
L power:GND #PWR027
U 1 1 68BD4022
P 10300 3900
F 0 "#PWR027" H 10300 3650 50  0001 C CNN
F 1 "GND" H 10305 3727 50  0000 C CNN
F 2 "" H 10300 3900 50  0001 C CNN
F 3 "" H 10300 3900 50  0001 C CNN
	1    10300 3900
	1    0    0    -1  
$EndComp
Text GLabel 4050 2700 1    63   Input ~ 0
RX4
Text GLabel 3950 2700 1    63   Input ~ 0
TX4
Text GLabel 3850 4800 3    63   Input ~ 0
RX2
Text GLabel 3950 4800 3    63   Input ~ 0
TX2
Text GLabel 4350 2700 1    50   Input ~ 0
SCLK
$Comp
L power:+5V #PWR011
U 1 1 67B6103B
P 5750 1400
F 0 "#PWR011" H 5750 1250 50  0001 C CNN
F 1 "+5V" V 5750 1500 50  0000 L CNN
F 2 "" H 5750 1400 50  0001 C CNN
F 3 "" H 5750 1400 50  0001 C CNN
	1    5750 1400
	-1   0    0    1   
$EndComp
Text GLabel 3450 4800 3    50   Input ~ 0
T_CS
Text GLabel 4150 4800 3    50   Input ~ 0
LCD_CS
Text GLabel 4050 4800 3    50   Input ~ 0
LCD_DC
Text GLabel 4250 4800 3    50   Input ~ 0
MOSI
Text GLabel 4350 4800 3    50   Input ~ 0
MISO
Text Notes 5850 1050 0    50   ~ 0
ILI9488_T3
Text GLabel 6350 1400 3    50   Input ~ 0
MOSI
Text GLabel 6250 1400 3    50   Input ~ 0
LCD_CS
Text GLabel 6150 1400 3    50   Input ~ 0
LCD_DC
Text GLabel 6050 1400 3    50   Input ~ 0
MISO
Text GLabel 5950 1400 3    50   Input ~ 0
SCLK
Text GLabel 5850 1400 3    50   Input ~ 0
T_CS
$Comp
L power:GND #PWR019
U 1 1 6797D5D1
P 6450 1400
F 0 "#PWR019" H 6450 1150 50  0001 C CNN
F 1 "GND" V 6450 1100 50  0000 L CNN
F 2 "" H 6450 1400 50  0001 C CNN
F 3 "" H 6450 1400 50  0001 C CNN
	1    6450 1400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J3
U 1 1 679456F8
P 6150 1200
F 0 "J3" V 6250 800 50  0000 L CNN
F 1 "TE_DISPLAY" V 6250 1150 50  0000 L CNN
F 2 "0_my_footprints:myJSTx08" H 6150 1200 50  0001 C CNN
F 3 "~" H 6150 1200 50  0001 C CNN
	1    6150 1200
	0    1    -1   0   
$EndComp
Text GLabel 9000 6750 2    50   Input ~ 0
ST50_WIND_YELLOW
Connection ~ 8700 6750
Wire Wire Line
	8700 6750 9000 6750
Wire Wire Line
	8500 6750 8700 6750
Wire Wire Line
	8000 6750 8200 6750
$Comp
L Device:R R2
U 1 1 68897211
P 8350 6750
F 0 "R2" H 8420 6796 50  0001 L CNN
F 1 "220" V 8350 6750 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 8280 6750 50  0001 C CNN
F 3 "~" H 8350 6750 50  0001 C CNN
	1    8350 6750
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR020
U 1 1 68895D9D
P 8000 6750
F 0 "#PWR020" H 8000 6600 50  0001 C CNN
F 1 "+5V" V 8015 6878 50  0000 L CNN
F 2 "" H 8000 6750 50  0001 C CNN
F 3 "" H 8000 6750 50  0001 C CNN
	1    8000 6750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8000 7150 8100 7150
Wire Wire Line
	8700 6750 8700 6950
$Comp
L Device:R R1
U 1 1 68894377
P 8250 7150
F 0 "R1" H 8320 7196 50  0001 L CNN
F 1 "100" V 8250 7150 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 8180 7150 50  0001 C CNN
F 3 "~" H 8250 7150 50  0001 C CNN
	1    8250 7150
	0    1    1    0   
$EndComp
Text GLabel 8000 7150 0    50   Input ~ 0
WIND_PULSE
$Comp
L power:GND #PWR023
U 1 1 68894369
P 8700 7350
F 0 "#PWR023" H 8700 7100 50  0001 C CNN
F 1 "GND" H 8705 7177 50  0000 C CNN
F 2 "" H 8700 7350 50  0001 C CNN
F 3 "" H 8700 7350 50  0001 C CNN
	1    8700 7350
	1    0    0    -1  
$EndComp
Text Notes 7500 6500 0    50   ~ 0
ST50 Wind Manual Test\nFor speed pulse, pull up to 5V through 220 ohm resistor and \nattach yellow to that
Text GLabel 3550 4800 3    50   Input ~ 0
SPEED_PULSE
Wire Wire Line
	8450 5650 8550 5650
Wire Wire Line
	9150 5250 9150 5450
Wire Wire Line
	8300 5250 9150 5250
$Comp
L Device:R R5
U 1 1 688AFEB1
P 8700 5650
F 0 "R5" H 8770 5696 50  0001 L CNN
F 1 "100" V 8700 5650 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 8630 5650 50  0001 C CNN
F 3 "~" H 8700 5650 50  0001 C CNN
	1    8700 5650
	0    1    1    0   
$EndComp
Text GLabel 8450 5650 0    50   Input ~ 0
SPEED_PULSE
Text GLabel 8300 5250 0    50   Input ~ 0
ST50_LOG_GREEN
Text Notes 7500 4950 0    50   ~ 0
ST50 SPEED LOG PULSE CIRCUIT\nOnly needs the GREEN (log pulse pin 3) pin and common Seatalk ground.\nThe GREEN is pulled high by the instrument.  Grounding it constitutes a "pulse".\nWe output a square wave on pin 11 at various frequencies.
$Comp
L Transistor_BJT:BC547 Q2
U 1 1 68890C7D
P 9050 5650
F 0 "Q2" H 9241 5696 50  0000 L CNN
F 1 "BC547" H 9241 5605 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9250 5575 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 9050 5650 50  0001 L CNN
	1    9050 5650
	1    0    0    -1  
$EndComp
Text Notes 7600 1950 0    50   ~ 0
TRANSMIT\nTXD is normally high, and the other side is pulled up to 3.3v thru 220 ohms,\nso no current flows through opto2_diode, and thus, the yellow (bus) is NOT \npulled down to ground.   When we transmit data, TXD goes low, lights the diode\nand the yellow (bus) is pulled down to ground through opto2.\n
Text Notes 7600 1450 0    50   ~ 0
RECEIVE\nThe yellow (bus) is pulled up to 12V (idle) thru 4.7K ohms.  All devices pull the bus up. \nIf the bus is high (idle), no current flows through opto1_diode, and so RXD is pulled\nup to 3.3V through the 4.7K ohm resistor.   When another device pulls the bus low,\nthe diode lights up and RXD is pulled to ground through opto1.
Wire Wire Line
	10000 3000 10550 3000
Connection ~ 10000 3000
Wire Wire Line
	10000 3500 10000 3000
Wire Wire Line
	9250 3500 10000 3500
Wire Wire Line
	8150 3700 8650 3700
Wire Wire Line
	10300 3700 10300 3900
Connection ~ 10300 3700
Wire Wire Line
	9250 3700 10300 3700
Wire Wire Line
	10300 3200 10300 3700
Connection ~ 10300 3200
Wire Wire Line
	8500 3200 10300 3200
Wire Wire Line
	8500 3000 8500 3200
Wire Wire Line
	9400 2800 9400 2350
Wire Wire Line
	9700 3000 10000 3000
Wire Wire Line
	8150 3500 8150 3400
Wire Wire Line
	8250 3500 8150 3500
Wire Wire Line
	8650 3500 8550 3500
$Comp
L Device:R R6
U 1 1 68211A3C
P 9550 3000
F 0 "R6" H 9620 3046 50  0001 L CNN
F 1 "4.7K" V 9550 3000 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 9480 3000 50  0001 C CNN
F 3 "~" H 9550 3000 50  0001 C CNN
	1    9550 3000
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR021
U 1 1 68244B74
P 8150 3400
F 0 "#PWR021" H 8150 3250 50  0001 C CNN
F 1 "+3V3" H 8165 3573 50  0000 C CNN
F 2 "" H 8150 3400 50  0001 C CNN
F 3 "" H 8150 3400 50  0001 C CNN
	1    8150 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 68236F3F
P 8400 3500
F 0 "R3" H 8470 3546 50  0001 L CNN
F 1 "220" V 8400 3500 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 8330 3500 50  0001 C CNN
F 3 "~" H 8400 3500 50  0001 C CNN
	1    8400 3500
	0    1    1    0   
$EndComp
Text GLabel 8150 3700 0    63   Input ~ 0
TX2
$Comp
L Isolator:TLP291 U3
U 1 1 68235388
P 8950 3600
F 0 "U3" H 8950 3925 50  0001 C CNN
F 1 "TLP521-1" H 8950 3833 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 8750 3400 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 8950 3600 50  0001 L CNN
	1    8950 3600
	1    0    0    -1  
$EndComp
$Comp
L Isolator:TLP291 U2
U 1 1 6822E37B
P 8950 2900
F 0 "U2" H 8950 3225 50  0001 C CNN
F 1 "TLP521-1" H 8950 3133 50  0000 C CNN
F 2 "0_my_footprints:myDip4" H 8750 2700 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=12884&prodName=TLP291" H 8950 2900 50  0001 L CNN
	1    8950 2900
	-1   0    0    -1  
$EndComp
Connection ~ 8500 2800
Wire Wire Line
	8150 2800 8500 2800
Text GLabel 8150 2800 0    63   Input ~ 0
RX2
Wire Wire Line
	8500 2800 8500 2650
Wire Wire Line
	8650 2800 8500 2800
$Comp
L Device:R R4
U 1 1 6822159F
P 8500 2500
F 0 "R4" H 8570 2546 50  0001 L CNN
F 1 "4.7K" V 8500 2500 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 8430 2500 50  0001 C CNN
F 3 "~" H 8500 2500 50  0001 C CNN
	1    8500 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3000 8500 3000
Wire Wire Line
	9250 2800 9400 2800
Wire Wire Line
	9400 3000 9250 3000
$Comp
L power:+12V #PWR025
U 1 1 6820AAC2
P 9400 2350
F 0 "#PWR025" H 9400 2200 50  0001 C CNN
F 1 "+12V" H 9415 2523 50  0000 C CNN
F 2 "" H 9400 2350 50  0001 C CNN
F 3 "" H 9400 2350 50  0001 C CNN
	1    9400 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 3100 10300 3200
Wire Wire Line
	10550 3100 10300 3100
$Comp
L 0_my_teensy:myTeensy4.0 U1
U 1 1 681E4C83
P 3600 3700
F 0 "U1" H 4428 3703 60  0001 L CNN
F 1 "myTeensy4.0" H 3450 3600 60  0000 L CNN
F 2 "0_my_teensy:teensy40" V 4500 3750 60  0001 C CNN
F 3 "" V 4500 3750 60  0000 C CNN
	1    3600 3700
	1    0    0    -1  
$EndComp
Text GLabel 4250 2700 1    63   Input ~ 0
TX3
Text GLabel 4150 2700 1    63   Input ~ 0
RX3
$Comp
L power:+3V3 #PWR08
U 1 1 681F6BDE
P 3250 2700
F 0 "#PWR08" H 3250 2550 50  0001 C CNN
F 1 "+3V3" V 3250 2900 50  0000 C CNN
F 2 "" H 3250 2700 50  0001 C CNN
F 3 "" H 3250 2700 50  0001 C CNN
	1    3250 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 681F5B40
P 3150 2700
F 0 "#PWR07" H 3150 2450 50  0001 C CNN
F 1 "GND" V 3150 2500 50  0000 C CNN
F 2 "" H 3150 2700 50  0001 C CNN
F 3 "" H 3150 2700 50  0001 C CNN
	1    3150 2700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR024
U 1 1 681EA805
P 9150 5850
F 0 "#PWR024" H 9150 5600 50  0001 C CNN
F 1 "GND" H 9155 5677 50  0000 C CNN
F 2 "" H 9150 5850 50  0001 C CNN
F 3 "" H 9150 5850 50  0001 C CNN
	1    9150 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR022
U 1 1 681EA407
P 8500 2350
F 0 "#PWR022" H 8500 2200 50  0001 C CNN
F 1 "+3V3" H 8515 2523 50  0000 C CNN
F 2 "" H 8500 2350 50  0001 C CNN
F 3 "" H 8500 2350 50  0001 C CNN
	1    8500 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR026
U 1 1 681E9B5C
P 10300 2350
F 0 "#PWR026" H 10300 2200 50  0001 C CNN
F 1 "+12V" H 10315 2523 50  0000 C CNN
F 2 "" H 10300 2350 50  0001 C CNN
F 3 "" H 10300 2350 50  0001 C CNN
	1    10300 2350
	1    0    0    -1  
$EndComp
Text Notes 12050 3250 0    63   ~ 0
brown\nwhite\nred\nyellow\nblack\nshield
Wire Wire Line
	4250 1300 4550 1300
$Comp
L Device:D D1
U 1 1 67022BE0
P 4100 1300
F 0 "D1" H 4100 1083 50  0001 C CNN
F 1 "1N4003" H 4100 1175 50  0000 C CNN
F 2 "0_my_footprints:myZenerDiode" H 4100 1300 50  0001 C CNN
F 3 "~" H 4100 1300 50  0001 C CNN
	1    4100 1300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2150 1500 1850 1500
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 66E63795
P 2150 1700
F 0 "J1" H 2068 1917 50  0001 C CNN
F 1 "12V_TEST" V 2300 1650 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 2150 1700 50  0001 C CNN
F 3 "~" H 2150 1700 50  0001 C CNN
	1    2150 1700
	0    -1   1    0   
$EndComp
Wire Wire Line
	1850 1500 1850 1600
$Comp
L power:GND #PWR01
U 1 1 670512B6
P 1850 1600
F 0 "#PWR01" H 1850 1350 50  0001 C CNN
F 1 "GND" H 1855 1427 50  0000 C CNN
F 2 "" H 1850 1600 50  0001 C CNN
F 3 "" H 1850 1600 50  0001 C CNN
	1    1850 1600
	1    0    0    -1  
$EndComp
Text Notes 2000 1400 0    50   ~ 0
12V
Wire Wire Line
	3750 1300 3950 1300
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 66D2CE52
P 4550 1500
F 0 "J2" H 4468 1717 50  0001 C CNN
F 1 "5V_JUMP" V 4700 1450 50  0000 C CNN
F 2 "0_my_footprints2:pinHeader1x2" H 4550 1500 50  0001 C CNN
F 3 "~" H 4550 1500 50  0001 C CNN
	1    4550 1500
	0    -1   1    0   
$EndComp
Wire Wire Line
	2800 1300 3000 1300
$Comp
L Switch:SW_SPDT SW1
U 1 1 66CFD48E
P 2600 1300
F 0 "SW1" H 2600 1585 50  0001 C CNN
F 1 "ON/OFF" H 2600 1493 50  0000 C CNN
F 2 "0_my_footprints2:SW_DPDT_BLUE_LEVER" H 2600 1300 50  0001 C CNN
F 3 "~" H 2600 1300 50  0001 C CNN
	1    2600 1300
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 61DFC811
P 3000 1600
F 0 "#PWR05" H 3000 1350 50  0001 C CNN
F 1 "GND" H 3005 1427 50  0000 C CNN
F 2 "" H 3000 1600 50  0001 C CNN
F 3 "" H 3000 1600 50  0001 C CNN
	1    3000 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 61D9E980
P 3750 1600
F 0 "#PWR09" H 3750 1350 50  0001 C CNN
F 1 "GND" H 3755 1427 50  0000 C CNN
F 2 "" H 3750 1600 50  0001 C CNN
F 3 "" H 3750 1600 50  0001 C CNN
	1    3750 1600
	1    0    0    -1  
$EndComp
$Comp
L cnc3018_Library:BUCK01 M1
U 1 1 61B26C43
P 3400 1450
F 0 "M1" H 3550 1450 50  0001 C CNN
F 1 "BUCK01" H 3300 1450 50  0000 C CNN
F 2 "0_my_footprints2:buck-mini360" H 3350 1750 50  0001 C CNN
F 3 "" H 3350 1750 50  0001 C CNN
	1    3400 1450
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 61E1944A
P 2000 3000
F 0 "#PWR03" H 2000 2750 50  0001 C CNN
F 1 "GND" H 2005 2827 50  0000 C CNN
F 2 "" H 2000 3000 50  0001 C CNN
F 3 "" H 2000 3000 50  0001 C CNN
	1    2000 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 61F8466C
P 2000 2850
F 0 "C1" H 2118 2896 50  0001 L CNN
F 1 "100uf" H 1650 2850 50  0000 L CNN
F 2 "0_my_footprints2:CP_my100uf" H 2038 2700 50  0001 C CNN
F 3 "~" H 2000 2850 50  0001 C CNN
	1    2000 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 68D022F7
P 2800 3000
F 0 "#PWR04" H 2800 2750 50  0001 C CNN
F 1 "GND" H 2805 2827 50  0000 C CNN
F 2 "" H 2800 3000 50  0001 C CNN
F 3 "" H 2800 3000 50  0001 C CNN
	1    2800 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 68D022FD
P 2800 2850
F 0 "C2" H 2918 2896 50  0001 L CNN
F 1 "100uf" H 2450 2850 50  0000 L CNN
F 2 "0_my_footprints2:CP_my100uf" H 2838 2700 50  0001 C CNN
F 3 "~" H 2800 2850 50  0001 C CNN
	1    2800 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1400 2250 1400
Wire Wire Line
	2250 1500 2250 1400
Connection ~ 2250 1400
Wire Wire Line
	2250 1400 2400 1400
Wire Wire Line
	2800 2700 3050 2700
Connection ~ 3050 2700
$Comp
L power:+5V #PWR010
U 1 1 68D5E7BF
P 4650 1300
F 0 "#PWR010" H 4650 1150 50  0001 C CNN
F 1 "+5V" V 4650 1400 50  0000 L CNN
F 2 "" H 4650 1300 50  0001 C CNN
F 3 "" H 4650 1300 50  0001 C CNN
	1    4650 1300
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR02
U 1 1 68D88815
P 2000 2700
F 0 "#PWR02" H 2000 2550 50  0001 C CNN
F 1 "+3V3" V 2000 2900 50  0000 C CNN
F 2 "" H 2000 2700 50  0001 C CNN
F 3 "" H 2000 2700 50  0001 C CNN
	1    2000 2700
	1    0    0    -1  
$EndComp
Text GLabel 1850 1400 0    50   Input ~ 0
CAN_12V
$Comp
L Connector_Generic:Conn_01x04 J7
U 1 1 68DEB69F
P 6250 5450
F 0 "J7" H 5850 5750 50  0000 L CNN
F 1 "NMEA200" H 6050 5750 50  0000 L CNN
F 2 "0_my_footprints:myTerminalBlock_2.54x04" H 6250 5450 50  0001 C CNN
F 3 "~" H 6250 5450 50  0001 C CNN
	1    6250 5450
	1    0    0    -1  
$EndComp
Text GLabel 6050 5350 0    50   Input ~ 0
CAN_12V
$Comp
L power:GND #PWR018
U 1 1 68DFEA73
P 6050 5650
F 0 "#PWR018" H 6050 5400 50  0001 C CNN
F 1 "GND" V 6050 5450 50  0000 C CNN
F 2 "" H 6050 5650 50  0001 C CNN
F 3 "" H 6050 5650 50  0001 C CNN
	1    6050 5650
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 68B721B4
P 6250 6100
F 0 "J9" H 5750 6250 50  0000 L CNN
F 1 "TEST_ST50" H 6000 6250 50  0000 L CNN
F 2 "0_my_footprints:myTerminalBlock_2.54x02" H 6250 6100 50  0001 C CNN
F 3 "~" H 6250 6100 50  0001 C CNN
	1    6250 6100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC547 Q1
U 1 1 6889436F
P 8600 7150
F 0 "Q1" H 8791 7196 50  0000 L CNN
F 1 "BC547" H 8791 7105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8800 7075 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 8600 7150 50  0001 L CNN
	1    8600 7150
	1    0    0    -1  
$EndComp
Text GLabel 6050 6100 0    50   Input ~ 0
ST50_LOG_GREEN
Text GLabel 6050 6200 0    50   Input ~ 0
ST50_WIND_YELLOW
$EndSCHEMATC
