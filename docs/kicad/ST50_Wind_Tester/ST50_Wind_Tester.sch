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
Text Notes 950  1050 0    50   ~ 0
The direction test is done by connecting the 8V (red) through two pots and a 3.3K ohm divider network and manually twidling the pots
$Comp
L Device:R_POT RV?
U 1 1 6889AADC
P 1750 1750
F 0 "RV?" H 1681 1796 50  0001 R CNN
F 1 "10K" V 1750 1750 50  0000 C CNN
F 2 "" H 1750 1750 50  0001 C CNN
F 3 "~" H 1750 1750 50  0001 C CNN
	1    1750 1750
	1    0    0    -1  
$EndComp
Text GLabel 1450 1400 0    50   Input ~ 0
RED_(8V)
$Comp
L power:GND #PWR?
U 1 1 688B4437
P 1750 2200
F 0 "#PWR?" H 1750 1950 50  0001 C CNN
F 1 "GND" H 1755 2027 50  0000 C CNN
F 2 "" H 1750 2200 50  0001 C CNN
F 3 "" H 1750 2200 50  0001 C CNN
	1    1750 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 688B50E1
P 1750 2050
F 0 "R?" H 1820 2096 50  0001 L CNN
F 1 "3.3K" V 1750 2050 50  0000 C CNN
F 2 "" V 1680 2050 50  0001 C CNN
F 3 "~" H 1750 2050 50  0001 C CNN
	1    1750 2050
	1    0    0    -1  
$EndComp
Text GLabel 1900 1750 2    50   Input ~ 0
GREEN_(Sine)
$Comp
L Device:R_POT RV?
U 1 1 688B7216
P 3000 1750
F 0 "RV?" H 2931 1796 50  0001 R CNN
F 1 "10K" V 3000 1750 50  0000 C CNN
F 2 "" H 3000 1750 50  0001 C CNN
F 3 "~" H 3000 1750 50  0001 C CNN
	1    3000 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 688B721C
P 3000 2200
F 0 "#PWR?" H 3000 1950 50  0001 C CNN
F 1 "GND" H 3005 2027 50  0000 C CNN
F 2 "" H 3000 2200 50  0001 C CNN
F 3 "" H 3000 2200 50  0001 C CNN
	1    3000 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 688B7222
P 3000 2050
F 0 "R?" H 3070 2096 50  0001 L CNN
F 1 "3.3K" V 3000 2050 50  0000 C CNN
F 2 "" V 2930 2050 50  0001 C CNN
F 3 "~" H 3000 2050 50  0001 C CNN
	1    3000 2050
	1    0    0    -1  
$EndComp
Text GLabel 3150 1750 2    50   Input ~ 0
BLUE_(Cosine)
Wire Wire Line
	1450 1400 1750 1400
Wire Wire Line
	3000 1400 3000 1600
Wire Wire Line
	1750 1600 1750 1400
Connection ~ 1750 1400
Wire Wire Line
	1750 1400 3000 1400
$EndSCHEMATC
