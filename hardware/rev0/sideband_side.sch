EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 9
Title "LUNA: Sideband USB PHY"
Date "2021-01-08"
Rev "r0"
Comp "Copyright 2019-2021 Great Scott Gadgets"
Comment1 "Katherine J. Temkin"
Comment2 ""
Comment3 "Licensed under the CERN-OHL-P v2"
Comment4 ""
$EndDescr
$Comp
L fpgas_and_processors:ECP5-BGA256 IC1
U 6 1 5DCE10A7
P 1400 2550
F 0 "IC1" H 1370 483 50  0000 R CNN
F 1 "ECP5-BGA256" H 1370 393 50  0000 R CNN
F 2 "luna:lattice_cabga256" H -1800 6000 50  0001 L CNN
F 3 "" H -2250 6950 50  0001 L CNN
F 4 "FPGA - Field Programmable Gate Array ECP5; 12k LUTs; 1.1V" H -2250 6850 50  0001 L CNN "Description"
F 5 "Lattice" H -2200 7800 50  0001 L CNN "Manufacturer"
F 6 "LFE5U-12F-6BG256C" H -2200 7700 50  0001 L CNN "Part Number"
F 7 "LFE5U-12F-*BG256*" H 1400 2550 50  0001 C CNN "Substitution"
	6    1400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2350 1550 2250
Wire Wire Line
	1650 2250 1650 2350
$Comp
L power:+3V3 #PWR057
U 1 1 5DD028F3
P 1550 2150
F 0 "#PWR057" H 1550 2000 50  0001 C CNN
F 1 "+3V3" H 1564 2323 50  0000 C CNN
F 2 "" H 1550 2150 50  0001 C CNN
F 3 "" H 1550 2150 50  0001 C CNN
	1    1550 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2150 1550 2250
Text Label 2500 5150 0    50   ~ 0
SIDEBAND_NXT
Text Label 2500 6000 0    50   ~ 0
SIDEBAND_STP
Text Label 2500 5250 0    50   ~ 0
SIDEBAND_DIR
Text Label 5250 6200 0    50   ~ 0
~SIDEBAND_RESET
NoConn ~ 2350 4300
NoConn ~ 2350 4950
NoConn ~ 2350 6350
NoConn ~ 2350 6450
NoConn ~ 2350 6550
NoConn ~ 2350 6650
$Comp
L Device:R R15
U 1 1 5E110842
P 4700 6200
F 0 "R15" V 4600 6200 50  0000 C CNN
F 1 "1K" V 4700 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 4630 6200 50  0001 C CNN
F 3 "~" H 4700 6200 50  0001 C CNN
F 4 "GENERIC-RES-0402-1K" H 4700 6200 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 4700 6200 50  0001 C CNN "Substitution"
	1    4700 6200
	0    1    1    0   
$EndComp
Text Label 2500 4550 0    50   ~ 0
SIDEBAND_DATA0
Text Label 2500 5050 0    50   ~ 0
SIDEBAND_DATA1
Text Label 2500 5900 0    50   ~ 0
SIDEBAND_CLK
Text Label 2500 4000 0    50   ~ 0
SIDEBAND_DATA4
Text Label 2500 3400 0    50   ~ 0
SIDEBAND_DATA5
Text Label 2500 3300 0    50   ~ 0
SIDEBAND_DATA6
Text Label 2500 3200 0    50   ~ 0
SIDEBAND_DATA7
Text HLabel 2450 5450 2    50   Output ~ 0
~FPGA_SELF_PROGRAM
Wire Wire Line
	2450 5450 2350 5450
$Comp
L Device:R R?
U 1 1 60996F81
P 3400 6900
AR Path="/60996F81" Ref="R?"  Part="1" 
AR Path="/5DD754D4/60996F81" Ref="R?"  Part="1" 
AR Path="/5DCD9772/60996F81" Ref="R34"  Part="1" 
F 0 "R34" V 3400 6900 50  0000 C CNN
F 1 "5.1K+10%" V 3300 6900 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3330 6900 50  0001 C CNN
F 3 "~" H 3400 6900 50  0001 C CNN
F 4 "GENERIC-RES-0402-5.1K" H 3400 6900 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 3400 6900 50  0001 C CNN "Substitution"
	1    3400 6900
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60996F87
P 3400 7250
AR Path="/60996F87" Ref="#PWR?"  Part="1" 
AR Path="/5DD754D4/60996F87" Ref="#PWR?"  Part="1" 
AR Path="/5DCD9772/60996F87" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 3400 7000 50  0001 C CNN
F 1 "GND" H 3404 7078 50  0000 C CNN
F 2 "" H 3400 7250 50  0001 C CNN
F 3 "" H 3400 7250 50  0001 C CNN
	1    3400 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60996F8E
P 3600 6900
AR Path="/60996F8E" Ref="R?"  Part="1" 
AR Path="/5DD754D4/60996F8E" Ref="R?"  Part="1" 
AR Path="/5DCD9772/60996F8E" Ref="R35"  Part="1" 
F 0 "R35" V 3600 6900 50  0000 C CNN
F 1 "5.1K+10%" V 3500 6900 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3530 6900 50  0001 C CNN
F 3 "~" H 3600 6900 50  0001 C CNN
F 4 "GENERIC-RES-0402-5.1K" H 3600 6900 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 3600 6900 50  0001 C CNN "Substitution"
	1    3600 6900
	1    0    0    1   
$EndComp
Wire Wire Line
	3400 7050 3400 7150
Wire Wire Line
	3400 7150 3600 7150
Wire Wire Line
	3600 7150 3600 7050
Connection ~ 3400 7150
Wire Wire Line
	3400 7150 3400 7250
Text HLabel 3700 6650 2    50   BiDi ~ 0
SIDEBAND_CC2
Text Label 2500 4100 0    50   ~ 0
SIDEBAND_DATA3
Text Label 2500 4450 0    50   ~ 0
SIDEBAND_DATA2
Wire Wire Line
	4550 6200 2350 6200
Text HLabel 3700 6100 2    50   BiDi ~ 0
SIDEBAND_SBU2
Text HLabel 3700 5550 2    50   BiDi ~ 0
SIDEBAND_SBU1
Wire Wire Line
	3700 5550 2350 5550
Wire Wire Line
	3700 6100 2350 6100
Wire Wire Line
	2350 4200 3600 4200
Text HLabel 3700 6550 2    50   BiDi ~ 0
SIDEBAND_CC1
Wire Wire Line
	2350 3100 3400 3100
Wire Wire Line
	3400 6750 3400 6550
Wire Wire Line
	3600 6750 3600 6650
Text Label 5300 1400 0    50   ~ 0
PMOD_B0
Text Label 5300 1500 0    50   ~ 0
PMOD_B1
Entry Wire Line
	5850 2050 5750 2150
Entry Wire Line
	5850 1950 5750 2050
Wire Wire Line
	2350 4650 4300 4650
Wire Wire Line
	2350 4750 4400 4750
Text HLabel 6650 1200 2    50   BiDi ~ 0
PMOD_B[0..7]
Text Label 6000 1200 0    50   ~ 0
PMOD_B[0..7]
Wire Wire Line
	3600 6650 3700 6650
Connection ~ 3600 6650
Wire Wire Line
	3600 6650 3600 4200
Wire Wire Line
	3700 6550 3400 6550
Connection ~ 3400 6550
Wire Wire Line
	3400 6550 3400 3100
Text Label 5300 1600 0    50   ~ 0
PMOD_B2
Text Label 5300 1700 0    50   ~ 0
PMOD_B3
Wire Wire Line
	2350 5650 4500 5650
Entry Wire Line
	5850 2150 5750 2250
Entry Wire Line
	5850 2250 5750 2350
Entry Wire Line
	5850 1300 5750 1400
Entry Wire Line
	5850 1400 5750 1500
Entry Wire Line
	5850 1500 5750 1600
Entry Wire Line
	5850 1600 5750 1700
Wire Wire Line
	4600 5750 2350 5750
Text Label 5300 2350 0    50   ~ 0
PMOD_B4
Text Label 5300 2250 0    50   ~ 0
PMOD_B5
Text Label 5300 2050 0    50   ~ 0
PMOD_B6
Text Label 5300 2150 0    50   ~ 0
PMOD_B7
Wire Wire Line
	2350 3850 4200 3850
Wire Wire Line
	4100 3750 2350 3750
Wire Wire Line
	2350 3650 4000 3650
Wire Wire Line
	3900 3550 2350 3550
$Comp
L Device:R_Pack04 RN?
U 1 1 60DD013F
P 5000 1600
AR Path="/60DD013F" Ref="RN?"  Part="1" 
AR Path="/5DF88884/60DD013F" Ref="RN?"  Part="1" 
AR Path="/5DCD9772/60DD013F" Ref="RN3"  Part="1" 
F 0 "RN3" V 4583 1600 50  0000 C CNN
F 1 "33" V 4674 1600 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0402" V 5275 1600 50  0001 C CNN
F 3 "~" H 5000 1600 50  0001 C CNN
F 4 "RES ARRAY 4 RES 33 OHM 0804" H 5000 1600 50  0001 C CNN "Description"
F 5 "Yageo" H 5000 1600 50  0001 C CNN "Manufacturer"
F 6 "YC124-JR-0733RL" H 5000 1600 50  0001 C CNN "Part Number"
F 7 "any equivalent" H 5000 1600 50  0001 C CNN "Substitution"
	1    5000 1600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 60DD0149
P 5000 2250
AR Path="/60DD0149" Ref="RN?"  Part="1" 
AR Path="/5DF88884/60DD0149" Ref="RN?"  Part="1" 
AR Path="/5DCD9772/60DD0149" Ref="RN4"  Part="1" 
F 0 "RN4" V 4583 2250 50  0000 C CNN
F 1 "33" V 4674 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0402" V 5275 2250 50  0001 C CNN
F 3 "~" H 5000 2250 50  0001 C CNN
F 4 "RES ARRAY 4 RES 33 OHM 0804" H 5000 2250 50  0001 C CNN "Description"
F 5 "Yageo" H 5000 2250 50  0001 C CNN "Manufacturer"
F 6 "YC124-JR-0733RL" H 5000 2250 50  0001 C CNN "Part Number"
F 7 "any equivalent" H 5000 2250 50  0001 C CNN "Substitution"
	1    5000 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 2050 5750 2050
Wire Wire Line
	5750 2150 5200 2150
Wire Wire Line
	5200 2250 5750 2250
Wire Wire Line
	5750 2350 5200 2350
Wire Wire Line
	5750 1700 5200 1700
Wire Wire Line
	5200 1600 5750 1600
Wire Wire Line
	5750 1500 5200 1500
Wire Wire Line
	5200 1400 5750 1400
Wire Bus Line
	5850 1200 6650 1200
Wire Wire Line
	4400 4750 4400 1700
Wire Wire Line
	4400 1700 4800 1700
Wire Wire Line
	4800 1600 4300 1600
Wire Wire Line
	4300 1600 4300 4650
Wire Wire Line
	4500 1400 4500 5650
Wire Wire Line
	4600 5750 4600 1500
Wire Wire Line
	4500 1400 4800 1400
Wire Wire Line
	4800 1500 4600 1500
Wire Wire Line
	4000 3650 4000 2150
Wire Wire Line
	3900 2050 3900 3550
Wire Wire Line
	4200 3850 4200 2250
Wire Wire Line
	4100 3750 4100 2350
Wire Wire Line
	3900 2050 4800 2050
Wire Wire Line
	4800 2150 4000 2150
Wire Wire Line
	4200 2250 4800 2250
Wire Wire Line
	4100 2350 4800 2350
$Comp
L Connector:TestPoint TP?
U 1 1 61C7E424
P 5150 6300
AR Path="/5DA7BAF4/61C7E424" Ref="TP?"  Part="1" 
AR Path="/5DDDB747/61C7E424" Ref="TP?"  Part="1" 
AR Path="/5DCD9772/61C7E424" Ref="TP15"  Part="1" 
F 0 "TP15" V 5105 6487 50  0000 L CNN
F 1 "TestPoint" V 5195 6487 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5350 6300 50  0001 C CNN
F 3 "~" H 5350 6300 50  0001 C CNN
F 4 "DNP" H 5150 6300 50  0001 C CNN "Note"
	1    5150 6300
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 61C7E42B
P 4950 6300
AR Path="/5DA7BAF4/61C7E42B" Ref="TP?"  Part="1" 
AR Path="/5DDDB747/61C7E42B" Ref="TP?"  Part="1" 
AR Path="/5DCD9772/61C7E42B" Ref="TP2"  Part="1" 
F 0 "TP2" V 4905 6487 50  0000 L CNN
F 1 "TestPoint" V 4995 6487 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5150 6300 50  0001 C CNN
F 3 "~" H 5150 6300 50  0001 C CNN
F 4 "DNP" H 4950 6300 50  0001 C CNN "Note"
	1    4950 6300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2350 5900 4950 5900
Wire Wire Line
	4850 6200 5150 6200
Wire Wire Line
	4950 6300 4950 5900
Connection ~ 4950 5900
Wire Wire Line
	5150 6200 5150 6300
Connection ~ 5150 6200
Entry Wire Line
	6200 6200 6300 6100
Entry Wire Line
	6200 5900 6300 5800
Wire Wire Line
	9250 5600 9250 4350
Wire Wire Line
	6400 5600 9250 5600
Entry Wire Line
	6300 5700 6400 5600
Wire Wire Line
	6800 4550 7750 4550
Wire Wire Line
	6800 4550 6400 4550
Connection ~ 6800 4550
Wire Wire Line
	6800 4700 6800 4800
Wire Wire Line
	6800 4550 6800 4700
Entry Wire Line
	6300 4650 6400 4550
Wire Bus Line
	6500 6300 6300 6300
Text Label 6500 6300 0    50   ~ 0
SIDEBAND_ULPI
Wire Wire Line
	5150 6200 6200 6200
Wire Wire Line
	4950 5900 6200 5900
Wire Wire Line
	10150 3500 10250 3500
Connection ~ 10150 3500
Wire Wire Line
	10150 3400 10150 3500
$Comp
L Connector:TestPoint TP?
U 1 1 61C39500
P 10150 3400
AR Path="/5DA7BAF4/61C39500" Ref="TP?"  Part="1" 
AR Path="/5DCD9772/61C39500" Ref="TP16"  Part="1" 
F 0 "TP16" V 10105 3587 50  0000 L CNN
F 1 "TestPoint" V 10195 3587 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 10350 3400 50  0001 C CNN
F 3 "~" H 10350 3400 50  0001 C CNN
F 4 "DNP" H 10150 3400 50  0001 C CNN "Note"
	1    10150 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 4600 10350 4600
Connection ~ 10250 4600
Wire Wire Line
	10250 4800 10250 4600
Wire Wire Line
	10350 4800 10250 4800
$Comp
L Connector:TestPoint TP?
U 1 1 61BEA6BD
P 10350 4600
AR Path="/5DA7BAF4/61BEA6BD" Ref="TP?"  Part="1" 
AR Path="/5DCD9772/61BEA6BD" Ref="TP17"  Part="1" 
F 0 "TP17" V 10305 4787 50  0000 L CNN
F 1 "TestPoint" V 10395 4787 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 10550 4600 50  0001 C CNN
F 3 "~" H 10550 4600 50  0001 C CNN
F 4 "DNP" H 10350 4600 50  0001 C CNN "Note"
	1    10350 4600
	0    1    1    0   
$EndComp
Connection ~ 6800 4700
Wire Wire Line
	9850 3500 10150 3500
Connection ~ 9850 3500
Wire Wire Line
	9850 3400 9850 3500
$Comp
L power:PWR_FLAG #FLG?
U 1 1 60985856
P 9850 3400
AR Path="/5DA7BAF4/60985856" Ref="#FLG?"  Part="1" 
AR Path="/5DCD9772/60985856" Ref="#FLG0105"  Part="1" 
F 0 "#FLG0105" H 9850 3475 50  0001 C CNN
F 1 "PWR_FLAG" H 9850 3573 50  0000 C CNN
F 2 "" H 9850 3400 50  0001 C CNN
F 3 "~" H 9850 3400 50  0001 C CNN
	1    9850 3400
	1    0    0    -1  
$EndComp
Entry Wire Line
	6200 6000 6300 5900
Wire Wire Line
	2350 5250 6200 5250
Entry Wire Line
	6300 5150 6200 5250
Wire Wire Line
	9250 3800 9150 3800
$Comp
L power:+3V3 #PWR0126
U 1 1 6083CB46
P 9250 3800
AR Path="/5DCD9772/6083CB46" Ref="#PWR0126"  Part="1" 
AR Path="/5DD754D4/6083CB46" Ref="#PWR?"  Part="1" 
AR Path="/5DDDB747/6083CB46" Ref="#PWR?"  Part="1" 
F 0 "#PWR0126" H 9250 3650 50  0001 C CNN
F 1 "+3V3" V 9250 4000 50  0000 C CNN
F 2 "" H 9250 3800 50  0001 C CNN
F 3 "" H 9250 3800 50  0001 C CNN
	1    9250 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	6800 5100 6800 5200
$Comp
L power:GND #PWR0101
U 1 1 5ECCE017
P 6800 5200
F 0 "#PWR0101" H 6800 4950 50  0001 C CNN
F 1 "GND" V 6805 5072 50  0000 R CNN
F 2 "" H 6800 5200 50  0001 C CNN
F 3 "" H 6800 5200 50  0001 C CNN
	1    6800 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 4700 9550 4700
Wire Wire Line
	10000 4600 10250 4600
Wire Wire Line
	2350 5150 6200 5150
Entry Wire Line
	6200 5150 6300 5050
Entry Wire Line
	6200 3400 6300 3300
Entry Wire Line
	6200 3300 6300 3200
Entry Wire Line
	6200 3200 6300 3100
Wire Wire Line
	2350 3200 6200 3200
Wire Wire Line
	2350 3300 6200 3300
Wire Wire Line
	2350 3400 6200 3400
Entry Wire Line
	6200 4100 6300 4000
Entry Wire Line
	6200 4000 6300 3900
Wire Wire Line
	2350 4000 6200 4000
Wire Wire Line
	2350 4100 6200 4100
Entry Wire Line
	6200 4550 6300 4450
Wire Wire Line
	2350 4550 6200 4550
Entry Wire Line
	6200 4450 6300 4350
Wire Wire Line
	2350 4450 6200 4450
Entry Wire Line
	6300 3900 6400 3800
Entry Wire Line
	6300 3800 6400 3700
Entry Wire Line
	6300 3700 6400 3600
Entry Wire Line
	6300 3600 6400 3500
Entry Wire Line
	6300 3500 6400 3400
Entry Wire Line
	6300 3400 6400 3300
Entry Wire Line
	6300 3300 6400 3200
Wire Wire Line
	7850 3800 6400 3800
Wire Wire Line
	7850 3700 6400 3700
Wire Wire Line
	7850 3600 6400 3600
Wire Wire Line
	7850 3500 6400 3500
Wire Wire Line
	7850 3400 6400 3400
Wire Wire Line
	7850 3300 6400 3300
Wire Wire Line
	7850 3200 6400 3200
Entry Wire Line
	6400 3100 6300 3200
Wire Wire Line
	7850 3100 6400 3100
Text Label 6900 4200 0    50   ~ 0
SIDEBAND_DIR
Text Label 6900 4100 0    50   ~ 0
SIDEBAND_NXT
Text Label 6900 4000 0    50   ~ 0
SIDEBAND_STP
Entry Wire Line
	6400 4200 6300 4300
Wire Wire Line
	6400 4200 7850 4200
Entry Wire Line
	6400 4100 6300 4200
Wire Wire Line
	6400 4100 7850 4100
Wire Wire Line
	6400 4000 7850 4000
Entry Wire Line
	6300 4100 6400 4000
Entry Wire Line
	6200 5050 6300 4950
Wire Wire Line
	2350 5050 6200 5050
NoConn ~ 9150 4250
$Comp
L Device:R R?
U 1 1 5E1591E2
P 6800 4950
AR Path="/5DD754D4/5E1591E2" Ref="R?"  Part="1" 
AR Path="/5DCD9772/5E1591E2" Ref="R22"  Part="1" 
F 0 "R22" V 6900 4950 50  0000 C CNN
F 1 "15K" V 6800 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 6730 4950 50  0001 C CNN
F 3 "~" H 6800 4950 50  0001 C CNN
F 4 "GENERIC-RES-0402-15K" H 6800 4950 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 6800 4950 50  0001 C CNN "Substitution"
	1    6800 4950
	1    0    0    -1  
$EndComp
Text HLabel 6900 4700 2    50   Input ~ 0
~SIDEBAND_RESET
Wire Wire Line
	7850 4300 7750 4300
Wire Wire Line
	2350 6000 6200 6000
Wire Wire Line
	6800 4700 6900 4700
Wire Wire Line
	8750 2150 8750 2250
Wire Wire Line
	8250 2150 8250 2250
Wire Wire Line
	8250 1750 8250 1850
Wire Wire Line
	8750 1750 8750 1850
$Comp
L power:GND #PWR068
U 1 1 5DD410FE
P 8750 2250
F 0 "#PWR068" H 8750 2000 50  0001 C CNN
F 1 "GND" H 8754 2078 50  0000 C CNN
F 2 "" H 8750 2250 50  0001 C CNN
F 3 "" H 8750 2250 50  0001 C CNN
	1    8750 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR066
U 1 1 5DD40C56
P 8250 2250
F 0 "#PWR066" H 8250 2000 50  0001 C CNN
F 1 "GND" H 8254 2078 50  0000 C CNN
F 2 "" H 8250 2250 50  0001 C CNN
F 3 "" H 8250 2250 50  0001 C CNN
	1    8250 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR067
U 1 1 5DD40800
P 8750 1750
F 0 "#PWR067" H 8750 1600 50  0001 C CNN
F 1 "+3V3" H 8764 1923 50  0000 C CNN
F 2 "" H 8750 1750 50  0001 C CNN
F 3 "" H 8750 1750 50  0001 C CNN
	1    8750 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR065
U 1 1 5DD40529
P 8250 1750
F 0 "#PWR065" H 8250 1600 50  0001 C CNN
F 1 "+5V" H 8264 1923 50  0000 C CNN
F 2 "" H 8250 1750 50  0001 C CNN
F 3 "" H 8250 1750 50  0001 C CNN
	1    8250 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C39
U 1 1 5DD3FB40
P 8750 2000
F 0 "C39" H 8865 2045 50  0000 L CNN
F 1 "0.1uF" H 8865 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8788 1850 50  0001 C CNN
F 3 "~" H 8750 2000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 8750 2000 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 8750 2000 50  0001 C CNN "Substitution"
	1    8750 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C38
U 1 1 5DD3F3AE
P 8250 2000
F 0 "C38" H 8365 2045 50  0000 L CNN
F 1 "0.1uF" H 8365 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8288 1850 50  0001 C CNN
F 3 "~" H 8250 2000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 8250 2000 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 8250 2000 50  0001 C CNN "Substitution"
	1    8250 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 3500 9850 3500
Wire Wire Line
	9350 3500 9150 3500
$Comp
L Device:R R17
U 1 1 5DD3B600
P 9500 3500
F 0 "R17" V 9450 3300 50  0000 C CNN
F 1 "20K" V 9500 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 9430 3500 50  0001 C CNN
F 3 "~" H 9500 3500 50  0001 C CNN
F 4 "RES SMD 20K OHM 5% 1/16W 0402" H 9500 3500 50  0001 C CNN "Description"
F 5 "Yageo" H 9500 3500 50  0001 C CNN "Manufacturer"
F 6 "RC0402JR-0720KL" H 9500 3500 50  0001 C CNN "Part Number"
F 7 "any equivalent" H 9500 3500 50  0001 C CNN "Substitution"
	1    9500 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	9800 4050 9600 4050
$Comp
L power:GND #PWR063
U 1 1 5DD39A7C
P 9800 4050
F 0 "#PWR063" H 9800 3800 50  0001 C CNN
F 1 "GND" V 9805 3922 50  0000 R CNN
F 2 "" H 9800 4050 50  0001 C CNN
F 3 "" H 9800 4050 50  0001 C CNN
	1    9800 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9300 4050 9150 4050
$Comp
L Device:R R16
U 1 1 5DD37F86
P 9450 4050
F 0 "R16" V 9400 3850 50  0000 C CNN
F 1 "8.06k+1%" V 9350 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 9380 4050 50  0001 C CNN
F 3 "~" H 9450 4050 50  0001 C CNN
F 4 "RES SMD 8.06K OHM 1% 1/10W 0402" H 9450 4050 50  0001 C CNN "Description"
F 5 "Panasonic" H 9450 4050 50  0001 C CNN "Manufacturer"
F 6 "ERJ-2RKF8061X" H 9450 4050 50  0001 C CNN "Part Number"
F 7 "any equivalent" H 9450 4050 50  0001 C CNN "Substitution"
	1    9450 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	9550 3200 9150 3200
Wire Wire Line
	9550 2850 9550 3200
$Comp
L power:+3V3 #PWR061
U 1 1 5DD36515
P 9550 2850
F 0 "#PWR061" H 9550 2700 50  0001 C CNN
F 1 "+3V3" H 9564 3023 50  0000 C CNN
F 2 "" H 9550 2850 50  0001 C CNN
F 3 "" H 9550 2850 50  0001 C CNN
	1    9550 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR060
U 1 1 5DD35DC7
P 9350 2850
F 0 "#PWR060" H 9350 2700 50  0001 C CNN
F 1 "+5V" H 9364 3023 50  0000 C CNN
F 2 "" H 9350 2850 50  0001 C CNN
F 3 "" H 9350 2850 50  0001 C CNN
	1    9350 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 3100 9350 2850
Wire Wire Line
	9150 3100 9350 3100
$Comp
L power:GND #PWR059
U 1 1 5DD345C7
P 9300 3300
F 0 "#PWR059" H 9300 3050 50  0001 C CNN
F 1 "GND" V 9305 3172 50  0000 R CNN
F 2 "" H 9300 3300 50  0001 C CNN
F 3 "" H 9300 3300 50  0001 C CNN
	1    9300 3300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9150 3300 9300 3300
Wire Wire Line
	9150 3700 10250 3700
Text HLabel 10250 3700 2    50   BiDi ~ 0
SIDEBAND_D+
Text HLabel 10250 3600 2    50   BiDi ~ 0
SIDEBAND_D-
Wire Wire Line
	9150 3600 10250 3600
Text HLabel 10250 3500 2    50   Input ~ 0
SIDEBAND_VBUS
Connection ~ 10000 4600
Wire Wire Line
	10000 4800 10000 4600
Wire Wire Line
	9150 4600 10000 4600
Wire Wire Line
	10000 5200 10000 5100
$Comp
L power:GND #PWR064
U 1 1 5DD280D5
P 10000 5200
F 0 "#PWR064" H 10000 4950 50  0001 C CNN
F 1 "GND" H 10004 5028 50  0000 C CNN
F 2 "" H 10000 5200 50  0001 C CNN
F 3 "" H 10000 5200 50  0001 C CNN
	1    10000 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C37
U 1 1 5DD280CB
P 10000 4950
F 0 "C37" H 10115 4995 50  0000 L CNN
F 1 "1uF" H 10115 4905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10038 4800 50  0001 C CNN
F 3 "~" H 10000 4950 50  0001 C CNN
F 4 "GENERIC-CAP-0603-1uF" H 10000 4950 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 10000 4950 50  0001 C CNN "Substitution"
	1    10000 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 5200 9550 5100
$Comp
L power:GND #PWR062
U 1 1 5DD25634
P 9550 5200
F 0 "#PWR062" H 9550 4950 50  0001 C CNN
F 1 "GND" H 9554 5028 50  0000 C CNN
F 2 "" H 9550 5200 50  0001 C CNN
F 3 "" H 9550 5200 50  0001 C CNN
	1    9550 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C36
U 1 1 5DD2517F
P 9550 4950
F 0 "C36" H 9665 4995 50  0000 L CNN
F 1 "1uF" H 9665 4905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9588 4800 50  0001 C CNN
F 3 "~" H 9550 4950 50  0001 C CNN
F 4 "GENERIC-CAP-0603-1uF" H 9550 4950 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 9550 4950 50  0001 C CNN "Substitution"
	1    9550 4950
	1    0    0    -1  
$EndComp
Text HLabel 10350 4800 2    50   Output ~ 0
SIDEBAND_PHY_1V8
Text Label 6900 4550 0    50   ~ 0
~SIDEBAND_RESET
Text Label 6900 3800 0    50   ~ 0
SIDEBAND_DATA7
Text Label 6900 3700 0    50   ~ 0
SIDEBAND_DATA6
Text Label 6900 3600 0    50   ~ 0
SIDEBAND_DATA5
Text Label 6900 3500 0    50   ~ 0
SIDEBAND_DATA4
Text Label 6900 5600 0    50   ~ 0
SIDEBAND_CLK
Wire Wire Line
	9150 4350 9250 4350
Text Label 6900 3400 0    50   ~ 0
SIDEBAND_DATA3
Text Label 6900 3300 0    50   ~ 0
SIDEBAND_DATA2
Text Label 6900 3200 0    50   ~ 0
SIDEBAND_DATA1
Text Label 6900 3100 0    50   ~ 0
SIDEBAND_DATA0
$Comp
L power:+3V3 #PWR058
U 1 1 5DD09124
P 7750 4300
F 0 "#PWR058" H 7750 4150 50  0001 C CNN
F 1 "+3V3" V 7765 4428 50  0000 L CNN
F 2 "" H 7750 4300 50  0001 C CNN
F 3 "" H 7750 4300 50  0001 C CNN
	1    7750 4300
	0    -1   -1   0   
$EndComp
$Comp
L usb:USB3343 U8
U 1 1 5DCDAEF5
P 7850 3000
F 0 "U8" H 8450 3163 50  0000 C CNN
F 1 "USB3343" H 8450 3073 50  0000 C CNN
F 2 "Package_DFN_QFN:VQFN-24-1EP_4x4mm_P0.5mm_EP2.45x2.45mm" H 7850 3000 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/334x.pdf" H 7850 3000 50  0001 C CNN
F 4 "IC TRANSCEIVER 1/1 24QFN" H 7850 3000 50  0001 C CNN "Description"
F 5 "Microchip" H 7850 3000 50  0001 C CNN "Manufacturer"
F 6 "USB3343-CP" H 7850 3000 50  0001 C CNN "Part Number"
	1    7850 3000
	1    0    0    -1  
$EndComp
Connection ~ 1550 2250
Wire Wire Line
	1550 2250 1650 2250
Wire Wire Line
	9550 4700 9550 4800
Wire Bus Line
	5850 1200 5850 2450
Wire Bus Line
	6300 3000 6300 6300
$EndSCHEMATC
