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
P 2500 2000
F 0 "#PWR0101" H 2500 1850 50  0001 C CNN
F 1 "+12V" H 2515 2173 50  0000 C CNN
F 2 "" H 2500 2000 50  0001 C CNN
F 3 "" H 2500 2000 50  0001 C CNN
	1    2500 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 6991CDB7
P 2500 2600
F 0 "#PWR0102" H 2500 2350 50  0001 C CNN
F 1 "GND" H 2505 2427 50  0000 C CNN
F 2 "" H 2500 2600 50  0001 C CNN
F 3 "" H 2500 2600 50  0001 C CNN
	1    2500 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0103
U 1 1 6992CD48
P 1550 1600
F 0 "#PWR0103" H 1550 1450 50  0001 C CNN
F 1 "+12V" V 1550 1850 50  0000 C CNN
F 2 "" H 1550 1600 50  0001 C CNN
F 3 "" H 1550 1600 50  0001 C CNN
	1    1550 1600
	0    1    1    0   
$EndComp
Text GLabel 1500 3350 2    50   Input ~ 0
PWMA
Text GLabel 1500 3450 2    50   Input ~ 0
PWMB
$Comp
L power:GND #PWR0104
U 1 1 6993223D
P 1500 3250
F 0 "#PWR0104" H 1500 3000 50  0001 C CNN
F 1 "GND" V 1500 2950 50  0000 L CNN
F 2 "" H 1500 3250 50  0001 C CNN
F 3 "" H 1500 3250 50  0001 C CNN
	1    1500 3250
	0    -1   -1   0   
$EndComp
Text GLabel 8800 2000 0    50   Input ~ 0
SIGNALA
Text GLabel 8800 2100 0    50   Input ~ 0
SIGNALB
$Comp
L power:GND #PWR0105
U 1 1 69961BC4
P 4300 2150
F 0 "#PWR0105" H 4300 1900 50  0001 C CNN
F 1 "GND" H 4305 1977 50  0000 C CNN
F 2 "" H 4300 2150 50  0001 C CNN
F 3 "" H 4300 2150 50  0001 C CNN
	1    4300 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 69A5051A
P 1550 1700
F 0 "#PWR0106" H 1550 1450 50  0001 C CNN
F 1 "GND" V 1550 1400 50  0000 L CNN
F 2 "" H 1550 1700 50  0001 C CNN
F 3 "" H 1550 1700 50  0001 C CNN
	1    1550 1700
	0    -1   -1   0   
$EndComp
Text GLabel 1500 3650 2    50   Input ~ 0
SPEED_SQUARE
$Comp
L power:+5V #PWR0107
U 1 1 69A6B71E
P 1500 3550
F 0 "#PWR0107" H 1500 3400 50  0001 C CNN
F 1 "+5V" V 1500 3700 50  0000 L CNN
F 2 "" H 1500 3550 50  0001 C CNN
F 3 "" H 1500 3550 50  0001 C CNN
	1    1500 3550
	0    1    1    0   
$EndComp
Text GLabel 8800 1900 0    50   Input ~ 0
WIND_SQUARE
$Comp
L Transistor_BJT:BC547 Q1
U 1 1 69A8D152
P 9150 3600
F 0 "Q1" H 9341 3646 50  0000 L CNN
F 1 "BC547" H 9341 3555 50  0000 L CNN
F 2 "0_my_footprints:myTransistor" H 9350 3525 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 9150 3600 50  0001 L CNN
	1    9150 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 69A99D2A
P 9250 3800
F 0 "#PWR0108" H 9250 3550 50  0001 C CNN
F 1 "GND" H 9255 3627 50  0000 C CNN
F 2 "" H 9250 3800 50  0001 C CNN
F 3 "" H 9250 3800 50  0001 C CNN
	1    9250 3800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0109
U 1 1 69AADA18
P 8750 3200
F 0 "#PWR0109" H 8750 3050 50  0001 C CNN
F 1 "+5V" H 8765 3373 50  0000 C CNN
F 2 "" H 8750 3200 50  0001 C CNN
F 3 "" H 8750 3200 50  0001 C CNN
	1    8750 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 69AB0D34
P 8800 3600
F 0 "R13" V 8700 3600 50  0000 C CNN
F 1 "1K" V 8800 3600 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 8730 3600 50  0001 C CNN
F 3 "~" H 8800 3600 50  0001 C CNN
	1    8800 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R14
U 1 1 69AB1A0E
P 9000 3300
F 0 "R14" V 8900 3300 50  0000 C CNN
F 1 "10K" V 9000 3300 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 8930 3300 50  0001 C CNN
F 3 "~" H 9000 3300 50  0001 C CNN
	1    9000 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	9250 3400 9250 3300
Wire Wire Line
	9250 3300 9150 3300
Wire Wire Line
	8850 3300 8750 3300
Wire Wire Line
	8750 3300 8750 3200
Text GLabel 8650 3600 0    50   Input ~ 0
SPEED_SQUARE
Text GLabel 9350 3300 2    50   Input ~ 0
WIND_SQUARE
Wire Wire Line
	9350 3300 9250 3300
Connection ~ 9250 3300
$Comp
L Device:C C3
U 1 1 69AF5E7E
P 3100 2300
F 0 "C3" H 3215 2346 50  0000 L CNN
F 1 "100nf" H 3215 2255 50  0000 L CNN
F 2 "0_my_footprints:myCapCeramicSmall" H 3138 2150 50  0001 C CNN
F 3 "~" H 3100 2300 50  0001 C CNN
	1    3100 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2000 3100 2000
Wire Wire Line
	3100 2000 3100 2150
Wire Wire Line
	2500 2600 3100 2600
Wire Wire Line
	3100 2600 3100 2450
$Comp
L Amplifier_Operational:LM324A U1
U 1 1 69B1C7F0
P 5200 1900
F 0 "U1" H 5150 1900 50  0000 C CNN
F 1 "LM324A" H 5250 2100 50  0000 C CNN
F 2 "0_my_footprints:myDip14" H 5150 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 5250 2100 50  0001 C CNN
	1    5200 1900
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:LM324A U1
U 2 1 69B1D031
P 6400 2000
F 0 "U1" H 6350 2000 50  0000 C CNN
F 1 "LM324A" H 6500 1800 50  0000 C CNN
F 2 "0_my_footprints:myDip14" H 6350 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 6450 2200 50  0001 C CNN
	2    6400 2000
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:LM324A U1
U 3 1 69B1EDE6
P 5150 3600
F 0 "U1" H 5100 3600 50  0000 C CNN
F 1 "LM324A" H 5200 3800 50  0000 C CNN
F 2 "0_my_footprints:myDip14" H 5100 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 5200 3800 50  0001 C CNN
	3    5150 3600
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:LM324A U1
U 4 1 69B227B9
P 6400 3700
F 0 "U1" H 6350 3700 50  0000 C CNN
F 1 "LM324A" H 6500 3500 50  0000 C CNN
F 2 "0_my_footprints:myDip14" H 6350 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 6450 3900 50  0001 C CNN
	4    6400 3700
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:LM324A U1
U 5 1 69B23FF0
P 2600 2300
F 0 "U1" H 2558 2346 50  0000 L CNN
F 1 "LM324A" H 2558 2255 50  0000 L CNN
F 2 "0_my_footprints:myDip14" H 2550 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 2650 2500 50  0001 C CNN
	5    2600 2300
	1    0    0    -1  
$EndComp
Connection ~ 2500 2000
Connection ~ 2500 2600
$Comp
L Device:R R4
U 1 1 69B9351C
P 5300 1600
F 0 "R4" V 5200 1600 50  0000 C CNN
F 1 "12K" V 5300 1600 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 5230 1600 50  0001 C CNN
F 3 "~" H 5300 1600 50  0001 C CNN
	1    5300 1600
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 69B8BC77
P 4850 1350
F 0 "R3" V 4750 1350 50  0000 C CNN
F 1 "68K" V 4850 1350 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 4780 1350 50  0001 C CNN
F 3 "~" H 4850 1350 50  0001 C CNN
	1    4850 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0110
U 1 1 69B894E7
P 4850 1100
F 0 "#PWR0110" H 4850 950 50  0001 C CNN
F 1 "+12V" H 4865 1273 50  0000 C CNN
F 2 "" H 4850 1100 50  0001 C CNN
F 3 "" H 4850 1100 50  0001 C CNN
	1    4850 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 69B7688D
P 4500 1600
F 0 "R2" V 4400 1600 50  0000 C CNN
F 1 "10K" V 4500 1600 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 4430 1600 50  0001 C CNN
F 3 "~" H 4500 1600 50  0001 C CNN
	1    4500 1600
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 698BDF62
P 4300 2000
F 0 "C1" H 4415 2046 50  0000 L CNN
F 1 "100nf" H 4415 1955 50  0000 L CNN
F 2 "0_my_footprints:myCapCeramicSmall" H 4338 1850 50  0001 C CNN
F 3 "~" H 4300 2000 50  0001 C CNN
	1    4300 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 698BCB03
P 4100 1600
F 0 "R1" V 4000 1600 50  0000 C CNN
F 1 "10K" V 4100 1600 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 4030 1600 50  0001 C CNN
F 3 "~" H 4100 1600 50  0001 C CNN
	1    4100 1600
	0    1    1    0   
$EndComp
Text GLabel 3850 1600 0    50   Input ~ 0
PWMA
Wire Wire Line
	3850 1600 3950 1600
Wire Wire Line
	4250 1600 4300 1600
Wire Wire Line
	4300 1600 4300 1850
Connection ~ 4300 1600
Wire Wire Line
	4300 1600 4350 1600
Wire Wire Line
	4650 1600 4850 1600
$Comp
L Device:R R5
U 1 1 69C34D07
P 5800 1900
F 0 "R5" V 5700 1900 50  0000 C CNN
F 1 "10K" V 5800 1900 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 5730 1900 50  0001 C CNN
F 3 "~" H 5800 1900 50  0001 C CNN
	1    5800 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 69C60B13
P 6400 1600
F 0 "R6" V 6300 1600 50  0000 C CNN
F 1 "10K" V 6400 1600 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 6330 1600 50  0001 C CNN
F 3 "~" H 6400 1600 50  0001 C CNN
	1    6400 1600
	0    1    1    0   
$EndComp
Text GLabel 6900 2000 2    50   Input ~ 0
SIGNALA
Wire Wire Line
	4850 1100 4850 1200
Wire Wire Line
	4850 1500 4850 1600
Wire Wire Line
	6700 2000 6750 2000
Wire Wire Line
	5950 1900 6050 1900
Wire Wire Line
	6050 1900 6050 1600
Wire Wire Line
	6050 1600 6250 1600
Connection ~ 6050 1900
Wire Wire Line
	6050 1900 6100 1900
Wire Wire Line
	6550 1600 6750 1600
Wire Wire Line
	6750 1600 6750 2000
Connection ~ 6750 2000
Wire Wire Line
	6750 2000 6900 2000
$Comp
L power:GND #PWR0111
U 1 1 69CBDDE2
P 6050 2200
F 0 "#PWR0111" H 6050 1950 50  0001 C CNN
F 1 "GND" H 6055 2027 50  0000 C CNN
F 2 "" H 6050 2200 50  0001 C CNN
F 3 "" H 6050 2200 50  0001 C CNN
	1    6050 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2100 6050 2100
$Comp
L power:GND #PWR0112
U 1 1 69CDD00E
P 4250 3850
F 0 "#PWR0112" H 4250 3600 50  0001 C CNN
F 1 "GND" H 4255 3677 50  0000 C CNN
F 2 "" H 4250 3850 50  0001 C CNN
F 3 "" H 4250 3850 50  0001 C CNN
	1    4250 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 69CDD020
P 5250 3300
F 0 "R10" V 5150 3300 50  0000 C CNN
F 1 "12K" V 5250 3300 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 5180 3300 50  0001 C CNN
F 3 "~" H 5250 3300 50  0001 C CNN
	1    5250 3300
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 69CDD026
P 4800 3050
F 0 "R9" V 4700 3050 50  0000 C CNN
F 1 "68K" V 4800 3050 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 4730 3050 50  0001 C CNN
F 3 "~" H 4800 3050 50  0001 C CNN
	1    4800 3050
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0113
U 1 1 69CDD02C
P 4800 2800
F 0 "#PWR0113" H 4800 2650 50  0001 C CNN
F 1 "+12V" H 4815 2973 50  0000 C CNN
F 2 "" H 4800 2800 50  0001 C CNN
F 3 "" H 4800 2800 50  0001 C CNN
	1    4800 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 69CDD032
P 4450 3300
F 0 "R8" V 4350 3300 50  0000 C CNN
F 1 "10K" V 4450 3300 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 4380 3300 50  0001 C CNN
F 3 "~" H 4450 3300 50  0001 C CNN
	1    4450 3300
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 69CDD038
P 4250 3700
F 0 "C2" H 4365 3746 50  0000 L CNN
F 1 "100nf" H 4365 3655 50  0000 L CNN
F 2 "0_my_footprints:myCapCeramicSmall" H 4288 3550 50  0001 C CNN
F 3 "~" H 4250 3700 50  0001 C CNN
	1    4250 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 69CDD03E
P 4050 3300
F 0 "R7" V 3950 3300 50  0000 C CNN
F 1 "10K" V 4050 3300 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 3980 3300 50  0001 C CNN
F 3 "~" H 4050 3300 50  0001 C CNN
	1    4050 3300
	0    1    1    0   
$EndComp
Text GLabel 3800 3300 0    50   Input ~ 0
PWMB
Wire Wire Line
	3800 3300 3900 3300
Wire Wire Line
	4200 3300 4250 3300
Wire Wire Line
	4250 3300 4250 3550
Connection ~ 4250 3300
Wire Wire Line
	4250 3300 4300 3300
Wire Wire Line
	4600 3300 4800 3300
$Comp
L Device:R R11
U 1 1 69CDD052
P 5800 3600
F 0 "R11" V 5700 3600 50  0000 C CNN
F 1 "10K" V 5800 3600 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 5730 3600 50  0001 C CNN
F 3 "~" H 5800 3600 50  0001 C CNN
	1    5800 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 69CDD058
P 6400 3300
F 0 "R12" V 6300 3300 50  0000 C CNN
F 1 "10K" V 6400 3300 50  0000 C CNN
F 2 "0_my_footprints:myResistor" V 6330 3300 50  0001 C CNN
F 3 "~" H 6400 3300 50  0001 C CNN
	1    6400 3300
	0    1    1    0   
$EndComp
Text GLabel 6900 3700 2    50   Input ~ 0
SIGNALB
Wire Wire Line
	4800 2800 4800 2900
Wire Wire Line
	6700 3700 6750 3700
Wire Wire Line
	5950 3600 6050 3600
Wire Wire Line
	6050 3600 6050 3300
Wire Wire Line
	6050 3300 6250 3300
Connection ~ 6050 3600
Wire Wire Line
	6050 3600 6100 3600
Wire Wire Line
	6550 3300 6750 3300
Wire Wire Line
	6750 3300 6750 3700
Connection ~ 6750 3700
Wire Wire Line
	6750 3700 6900 3700
$Comp
L power:GND #PWR0114
U 1 1 69CDD06B
P 6050 3900
F 0 "#PWR0114" H 6050 3650 50  0001 C CNN
F 1 "GND" H 6055 3727 50  0000 C CNN
F 2 "" H 6050 3900 50  0001 C CNN
F 3 "" H 6050 3900 50  0001 C CNN
	1    6050 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3800 6050 3800
Wire Wire Line
	6050 3800 6050 3900
$Comp
L power:GND #PWR0115
U 1 1 69D1115A
P 4800 3850
F 0 "#PWR0115" H 4800 3600 50  0001 C CNN
F 1 "GND" H 4805 3677 50  0000 C CNN
F 2 "" H 4800 3850 50  0001 C CNN
F 3 "" H 4800 3850 50  0001 C CNN
	1    4800 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3700 4800 3700
Wire Wire Line
	4850 1600 5150 1600
Connection ~ 4850 1600
Wire Wire Line
	5450 1600 5550 1600
Wire Wire Line
	5550 1600 5550 1900
Wire Wire Line
	5550 1900 5650 1900
Wire Wire Line
	4850 1600 4850 1800
Wire Wire Line
	4850 1800 4900 1800
Wire Wire Line
	5500 1900 5550 1900
Connection ~ 5550 1900
$Comp
L power:GND #PWR0116
U 1 1 69D666B3
P 4850 2150
F 0 "#PWR0116" H 4850 1900 50  0001 C CNN
F 1 "GND" H 4855 1977 50  0000 C CNN
F 2 "" H 4850 2150 50  0001 C CNN
F 3 "" H 4850 2150 50  0001 C CNN
	1    4850 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2000 4850 2000
Wire Wire Line
	4850 2000 4850 2150
Wire Wire Line
	6050 2100 6050 2200
Wire Wire Line
	4800 3700 4800 3850
Wire Wire Line
	4800 3200 4800 3300
Connection ~ 4800 3300
Wire Wire Line
	4800 3300 4800 3500
Wire Wire Line
	5550 3300 5550 3600
Wire Wire Line
	4800 3500 4850 3500
Wire Wire Line
	4800 3300 5100 3300
Wire Wire Line
	5400 3300 5550 3300
Wire Wire Line
	5450 3600 5550 3600
Wire Wire Line
	5650 3600 5550 3600
Connection ~ 5550 3600
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 698CF9AE
P 9000 1900
F 0 "J3" H 9080 1896 50  0000 L CNN
F 1 "Conn_01x01" H 9080 1851 50  0001 L CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 9000 1900 50  0001 C CNN
F 3 "~" H 9000 1900 50  0001 C CNN
	1    9000 1900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 698D02C3
P 9000 2000
F 0 "J4" H 9080 1996 50  0000 L CNN
F 1 "Conn_01x01" H 9080 1951 50  0001 L CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 9000 2000 50  0001 C CNN
F 3 "~" H 9000 2000 50  0001 C CNN
	1    9000 2000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 698D1753
P 9000 2100
F 0 "J5" H 9080 2096 50  0000 L CNN
F 1 "Conn_01x01" H 9080 2051 50  0001 L CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 9000 2100 50  0001 C CNN
F 3 "~" H 9000 2100 50  0001 C CNN
	1    9000 2100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J6
U 1 1 698E845F
P 1300 3250
F 0 "J6" H 1380 3246 50  0000 L CNN
F 1 "Conn_01x01" H 1380 3201 50  0001 L CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 1300 3250 50  0001 C CNN
F 3 "~" H 1300 3250 50  0001 C CNN
	1    1300 3250
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 698E8465
P 1350 1700
F 0 "J2" H 1430 1696 50  0000 L CNN
F 1 "Conn_01x01" H 1430 1651 50  0001 L CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 1350 1700 50  0001 C CNN
F 3 "~" H 1350 1700 50  0001 C CNN
	1    1350 1700
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J1
U 1 1 698E846B
P 1350 1600
F 0 "J1" H 1430 1596 50  0000 L CNN
F 1 "Conn_01x01" H 1430 1551 50  0001 L CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 1350 1600 50  0001 C CNN
F 3 "~" H 1350 1600 50  0001 C CNN
	1    1350 1600
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J9
U 1 1 698EE329
P 1300 3550
F 0 "J9" H 1380 3546 50  0000 L CNN
F 1 "Conn_01x01" H 1380 3501 50  0001 L CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 1300 3550 50  0001 C CNN
F 3 "~" H 1300 3550 50  0001 C CNN
	1    1300 3550
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J8
U 1 1 698EE32F
P 1300 3450
F 0 "J8" H 1380 3446 50  0000 L CNN
F 1 "Conn_01x01" H 1380 3401 50  0001 L CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 1300 3450 50  0001 C CNN
F 3 "~" H 1300 3450 50  0001 C CNN
	1    1300 3450
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J7
U 1 1 698EE335
P 1300 3350
F 0 "J7" H 1380 3346 50  0000 L CNN
F 1 "Conn_01x01" H 1380 3301 50  0001 L CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 1300 3350 50  0001 C CNN
F 3 "~" H 1300 3350 50  0001 C CNN
	1    1300 3350
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J10
U 1 1 698EFD6B
P 1300 3650
F 0 "J10" H 1380 3646 50  0000 L CNN
F 1 "Conn_01x01" H 1380 3601 50  0001 L CNN
F 2 "0_my_footprints:myPinHeader_1x01" H 1300 3650 50  0001 C CNN
F 3 "~" H 1300 3650 50  0001 C CNN
	1    1300 3650
	-1   0    0    1   
$EndComp
$EndSCHEMATC
