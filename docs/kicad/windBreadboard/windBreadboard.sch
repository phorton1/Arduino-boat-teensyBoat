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
L power:+12V #PWR0101
U 1 1 698B8C47
P 2150 2600
F 0 "#PWR0101" H 2150 2450 50  0001 C CNN
F 1 "+12V" H 2165 2773 50  0000 C CNN
F 2 "" H 2150 2600 50  0001 C CNN
F 3 "" H 2150 2600 50  0001 C CNN
	1    2150 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 6991CDB7
P 2150 3200
F 0 "#PWR0102" H 2150 2950 50  0001 C CNN
F 1 "GND" H 2155 3027 50  0000 C CNN
F 2 "" H 2150 3200 50  0001 C CNN
F 3 "" H 2150 3200 50  0001 C CNN
	1    2150 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0103
U 1 1 6992CD48
P 2350 1900
F 0 "#PWR0103" H 2350 1750 50  0001 C CNN
F 1 "+12V" V 2350 2150 50  0000 C CNN
F 2 "" H 2350 1900 50  0001 C CNN
F 3 "" H 2350 1900 50  0001 C CNN
	1    2350 1900
	0    1    1    0   
$EndComp
Text GLabel 2500 4250 2    50   Input ~ 0
PWMB_BLUE
Text GLabel 7350 2500 0    50   Input ~ 0
SIGNALA_GREEN
Text GLabel 7350 2600 0    50   Input ~ 0
SIGNALB_BLUE
$Comp
L power:GND #PWR0105
U 1 1 69961BC4
P 4600 2400
F 0 "#PWR0105" H 4600 2150 50  0001 C CNN
F 1 "GND" H 4605 2227 50  0000 C CNN
F 2 "" H 4600 2400 50  0001 C CNN
F 3 "" H 4600 2400 50  0001 C CNN
	1    4600 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 69A5051A
P 2350 1800
F 0 "#PWR0106" H 2350 1550 50  0001 C CNN
F 1 "GND" V 2350 1500 50  0000 L CNN
F 2 "" H 2350 1800 50  0001 C CNN
F 3 "" H 2350 1800 50  0001 C CNN
	1    2350 1800
	0    -1   -1   0   
$EndComp
Text GLabel 2500 4050 2    50   Input ~ 0
SPEED_PULSE_YELLOW
Text GLabel 7350 2400 0    50   Input ~ 0
WIND_PULSE_YELLOW
$Comp
L Transistor_BJT:BC547 Q1
U 1 1 69A8D152
P 5100 4500
F 0 "Q1" H 5291 4546 50  0000 L CNN
F 1 "BC546" H 5291 4455 50  0000 L CNN
F 2 "0_my_footprints:myTransistor" H 5300 4425 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 5100 4500 50  0001 L CNN
	1    5100 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 69A99D2A
P 5200 4700
F 0 "#PWR0108" H 5200 4450 50  0001 C CNN
F 1 "GND" H 5205 4527 50  0000 C CNN
F 2 "" H 5200 4700 50  0001 C CNN
F 3 "" H 5200 4700 50  0001 C CNN
	1    5200 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 69AB0D34
P 4750 4500
F 0 "R7" V 4650 4500 50  0000 C CNN
F 1 "1K" V 4750 4500 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 4680 4500 50  0001 C CNN
F 3 "~" H 4750 4500 50  0001 C CNN
	1    4750 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 4300 5200 4200
Text GLabel 4600 4500 0    50   Input ~ 0
SPEED_PULSE_YELLOW
Text GLabel 5300 4200 2    50   Input ~ 0
WIND_PULSE_YELLOW
Wire Wire Line
	5300 4200 5200 4200
$Comp
L Device:C C3
U 1 1 69AF5E7E
P 2750 2900
F 0 "C3" H 2865 2946 50  0000 L CNN
F 1 "100nf" H 2865 2855 50  0000 L CNN
F 2 "0_my_footprints:myCapCeramicSmall" H 2788 2750 50  0001 C CNN
F 3 "~" H 2750 2900 50  0001 C CNN
	1    2750 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2600 2750 2600
Wire Wire Line
	2750 2600 2750 2750
Wire Wire Line
	2150 3200 2750 3200
Wire Wire Line
	2750 3200 2750 3050
$Comp
L Device:C C1
U 1 1 698BDF62
P 4450 1950
F 0 "C1" H 4550 1950 50  0000 L CNN
F 1 "100nf" H 4100 1950 50  0000 L CNN
F 2 "0_my_footprints:myCapCeramicSmall" H 4488 1800 50  0001 C CNN
F 3 "~" H 4450 1950 50  0001 C CNN
	1    4450 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 698BCB03
P 4200 1800
F 0 "R1" V 4100 1800 50  0000 C CNN
F 1 "10K" V 4200 1800 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 4130 1800 50  0001 C CNN
F 3 "~" H 4200 1800 50  0001 C CNN
	1    4200 1800
	0    1    1    0   
$EndComp
Text GLabel 3800 1800 0    50   Input ~ 0
PWMA_GREEN
Wire Wire Line
	3950 1800 4050 1800
Text GLabel 5650 1900 2    50   Input ~ 0
SIGNALA_GREEN
Text GLabel 2500 4150 2    50   Input ~ 0
PWMA_GREEN
$Comp
L power:GND #PWR0104
U 1 1 6993223D
P 2500 3950
F 0 "#PWR0104" H 2500 3700 50  0001 C CNN
F 1 "GND" V 2500 3650 50  0000 L CNN
F 2 "" H 2500 3950 50  0001 C CNN
F 3 "" H 2500 3950 50  0001 C CNN
	1    2500 3950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 69B9351C
P 5200 2250
F 0 "R3" V 5100 2250 50  0000 C CNN
F 1 "22K" V 5200 2250 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 5130 2250 50  0001 C CNN
F 3 "~" H 5200 2250 50  0001 C CNN
	1    5200 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 1800 4450 1800
$Comp
L Device:R R2
U 1 1 69B7688D
P 4750 2150
F 0 "R2" V 4650 2150 50  0000 C CNN
F 1 "10K" V 4750 2150 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 4680 2150 50  0001 C CNN
F 3 "~" H 4750 2150 50  0001 C CNN
	1    4750 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 1900 5650 1900
Wire Wire Line
	5500 1900 5500 2250
Wire Wire Line
	4450 2100 4450 2300
Wire Wire Line
	4450 2300 4600 2300
Wire Wire Line
	4600 2300 4600 2400
Connection ~ 4600 2300
Wire Wire Line
	4600 2300 4750 2300
Wire Wire Line
	4900 2000 4900 2250
Wire Wire Line
	4900 2250 5050 2250
Wire Wire Line
	5350 2250 5500 2250
Wire Wire Line
	4900 2000 4750 2000
Wire Wire Line
	4450 1800 4900 1800
Connection ~ 4450 1800
$Comp
L Amplifier_Operational:LM358 U1
U 1 1 69A85945
P 5200 1900
F 0 "U1" H 5200 2267 50  0000 C CNN
F 1 "LM358" H 5200 2176 50  0000 C CNN
F 2 "0_my_footprints:myDip8" H 5200 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 5200 1900 50  0001 C CNN
	1    5200 1900
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM358 U1
U 2 1 69A865F3
P 5200 3150
F 0 "U1" H 5200 3517 50  0000 C CNN
F 1 "LM358" H 5200 3426 50  0000 C CNN
F 2 "0_my_footprints:myDip8" H 5200 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 5200 3150 50  0001 C CNN
	2    5200 3150
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM358 U1
U 3 1 69A88239
P 2250 2900
F 0 "U1" H 2208 2946 50  0000 L CNN
F 1 "LM358" H 2208 2855 50  0000 L CNN
F 2 "0_my_footprints:myDip8" H 2250 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 2250 2900 50  0001 C CNN
	3    2250 2900
	1    0    0    -1  
$EndComp
Connection ~ 2150 2600
Connection ~ 2150 3200
Connection ~ 4900 2000
Connection ~ 5500 1900
$Comp
L power:GND #PWR0110
U 1 1 69AA1202
P 4600 3650
F 0 "#PWR0110" H 4600 3400 50  0001 C CNN
F 1 "GND" H 4605 3477 50  0000 C CNN
F 2 "" H 4600 3650 50  0001 C CNN
F 3 "" H 4600 3650 50  0001 C CNN
	1    4600 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 69AA1208
P 4450 3200
F 0 "C2" H 4550 3200 50  0000 L CNN
F 1 "100nf" H 4100 3200 50  0000 L CNN
F 2 "0_my_footprints:myCapCeramicSmall" H 4488 3050 50  0001 C CNN
F 3 "~" H 4450 3200 50  0001 C CNN
	1    4450 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 69AA120E
P 4200 3050
F 0 "R4" V 4100 3050 50  0000 C CNN
F 1 "10K" V 4200 3050 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 4130 3050 50  0001 C CNN
F 3 "~" H 4200 3050 50  0001 C CNN
	1    4200 3050
	0    1    1    0   
$EndComp
Text GLabel 3800 3050 0    50   Input ~ 0
PWMB_BLUE
Wire Wire Line
	3950 3050 4050 3050
Text GLabel 5650 3150 2    50   Input ~ 0
SIGNALB_BLUE
$Comp
L Device:R R6
U 1 1 69AA1217
P 5200 3500
F 0 "R6" V 5100 3500 50  0000 C CNN
F 1 "22K" V 5200 3500 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 5130 3500 50  0001 C CNN
F 3 "~" H 5200 3500 50  0001 C CNN
	1    5200 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 3050 4450 3050
$Comp
L Device:R R5
U 1 1 69AA121E
P 4750 3400
F 0 "R5" V 4650 3400 50  0000 C CNN
F 1 "10K" V 4750 3400 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 4680 3400 50  0001 C CNN
F 3 "~" H 4750 3400 50  0001 C CNN
	1    4750 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3150 5650 3150
Wire Wire Line
	5500 3150 5500 3500
Wire Wire Line
	4450 3350 4450 3550
Wire Wire Line
	4450 3550 4600 3550
Wire Wire Line
	4600 3550 4600 3650
Connection ~ 4600 3550
Wire Wire Line
	4600 3550 4750 3550
Wire Wire Line
	4900 3250 4900 3500
Wire Wire Line
	4900 3500 5050 3500
Wire Wire Line
	5350 3500 5500 3500
Wire Wire Line
	4900 3250 4750 3250
Wire Wire Line
	4450 3050 4900 3050
Connection ~ 4450 3050
Connection ~ 4900 3250
Connection ~ 5500 3150
$Comp
L Connector_Generic:Conn_01x01 J1
U 1 1 69915F29
P 2150 1800
F 0 "J1" H 2300 1800 50  0000 C CNN
F 1 "ST_GND" H 2500 1800 50  0000 C CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 2150 1800 50  0001 C CNN
F 3 "~" H 2150 1800 50  0001 C CNN
	1    2150 1800
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 699212B5
P 2150 1900
F 0 "J2" H 2300 1900 50  0000 C CNN
F 1 "ST_12V" H 2500 1900 50  0000 C CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 2150 1900 50  0001 C CNN
F 3 "~" H 2150 1900 50  0001 C CNN
	1    2150 1900
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J6
U 1 1 69926F4E
P 2300 3950
F 0 "J6" H 2450 3950 50  0000 C CNN
F 1 "GP8_GND" H 2700 3950 50  0000 C CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 2300 3950 50  0001 C CNN
F 3 "~" H 2300 3950 50  0001 C CNN
	1    2300 3950
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J7
U 1 1 699280D0
P 2300 4050
F 0 "J7" H 2450 4050 50  0000 C CNN
F 1 "GP8_PULSE_YELLOW" H 2900 4050 50  0000 C CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 2300 4050 50  0001 C CNN
F 3 "~" H 2300 4050 50  0001 C CNN
	1    2300 4050
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J8
U 1 1 699288B0
P 2300 4150
F 0 "J8" H 2450 4150 50  0000 C CNN
F 1 "GP8_PWMA_GREEN" H 2900 4150 50  0000 C CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 2300 4150 50  0001 C CNN
F 3 "~" H 2300 4150 50  0001 C CNN
	1    2300 4150
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J9
U 1 1 6992919D
P 2300 4250
F 0 "J9" H 2450 4250 50  0000 C CNN
F 1 "GP8_PWMB_BLUE" H 2850 4250 50  0000 C CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 2300 4250 50  0001 C CNN
F 3 "~" H 2300 4250 50  0001 C CNN
	1    2300 4250
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 6992B7C2
P 7550 2400
F 0 "J3" H 7700 2400 50  0000 C CNN
F 1 "WIND_PULSE_YELLOW" H 8200 2400 50  0000 C CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 7550 2400 50  0001 C CNN
F 3 "~" H 7550 2400 50  0001 C CNN
	1    7550 2400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 6992C0E2
P 7550 2500
F 0 "J4" H 7700 2500 50  0000 C CNN
F 1 "SIGNALA_GREEN" H 8100 2500 50  0000 C CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 7550 2500 50  0001 C CNN
F 3 "~" H 7550 2500 50  0001 C CNN
	1    7550 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 6992CB12
P 7550 2600
F 0 "J5" H 7700 2600 50  0000 C CNN
F 1 "SIGNALB_BLUE" H 8050 2600 50  0000 C CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 7550 2600 50  0001 C CNN
F 3 "~" H 7550 2600 50  0001 C CNN
	1    7550 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 699B524A
P 3950 2050
F 0 "R8" V 3850 2050 50  0000 C CNN
F 1 "10K" V 3950 2050 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 3880 2050 50  0001 C CNN
F 3 "~" H 3950 2050 50  0001 C CNN
	1    3950 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1900 3950 1800
Wire Wire Line
	3950 2200 3950 2300
Wire Wire Line
	3950 2300 4450 2300
Connection ~ 4450 2300
Wire Wire Line
	3800 1800 3950 1800
Connection ~ 3950 1800
$Comp
L Device:R R9
U 1 1 699BB495
P 3950 3300
F 0 "R9" V 3850 3300 50  0000 C CNN
F 1 "10K" V 3950 3300 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 3880 3300 50  0001 C CNN
F 3 "~" H 3950 3300 50  0001 C CNN
	1    3950 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3150 3950 3050
Wire Wire Line
	3950 3450 3950 3550
Wire Wire Line
	3950 3550 4450 3550
Wire Wire Line
	3800 3050 3950 3050
Connection ~ 3950 3050
$EndSCHEMATC
