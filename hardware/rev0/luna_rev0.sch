EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 9
Title "LUNA USB Multitool"
Date "2021-01-08"
Rev "r0"
Comp "Copyright 2019-2021 Great Scott Gadgets"
Comment1 "Katherine J. Temkin"
Comment2 ""
Comment3 "Licensed under the CERN-OHL-P v2"
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR05
U 1 1 5DCD8771
P 2350 4600
F 0 "#PWR05" H 2350 4450 50  0001 C CNN
F 1 "+5V" V 2250 4550 50  0000 L CNN
F 2 "" H 2350 4600 50  0001 C CNN
F 3 "" H 2350 4600 50  0001 C CNN
	1    2350 4600
	0    1    1    0   
$EndComp
$Sheet
S 4150 4650 1700 1400
U 5DCD9772
F0 "Sideband Section" 50
F1 "sideband_side.sch" 50
F2 "SIDEBAND_PHY_1V8" O R 5850 4850 50 
F3 "SIDEBAND_VBUS" I L 4150 4750 50 
F4 "SIDEBAND_D-" B L 4150 5350 50 
F5 "SIDEBAND_D+" B L 4150 5450 50 
F6 "~FPGA_SELF_PROGRAM" O R 5850 4750 50 
F7 "SIDEBAND_CC1" B L 4150 4950 50 
F8 "SIDEBAND_CC2" B L 4150 5050 50 
F9 "SIDEBAND_SBU2" B L 4150 5950 50 
F10 "SIDEBAND_SBU1" B L 4150 5850 50 
F11 "PMOD_B[0..7]" B R 5850 5450 50 
F12 "~SIDEBAND_RESET" I R 5850 4950 50 
$EndSheet
$Comp
L power:GND #PWR01
U 1 1 5DD6A23B
P 1150 3900
F 0 "#PWR01" H 1150 3650 50  0001 C CNN
F 1 "GND" H 1154 3728 50  0000 C CNN
F 2 "" H 1150 3900 50  0001 C CNN
F 3 "" H 1150 3900 50  0001 C CNN
	1    1150 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2200 1850 2200
Wire Wire Line
	1750 2900 1850 2900
Wire Wire Line
	2550 2800 1850 2800
$Comp
L Device:D_Schottky D1
U 1 1 5DDCCE15
P 2100 2050
F 0 "D1" H 2100 2150 50  0000 C CNN
F 1 "PMEG3050EP,115" H 2000 2200 50  0001 C CNN
F 2 "luna:SOD128" H 2100 2050 50  0001 C CNN
F 3 "~" H 2100 2050 50  0001 C CNN
F 4 "Nexperia" H 2100 2050 50  0001 C CNN "Manufacturer"
F 5 "PMEG3050EP,115" H 2100 2050 50  0001 C CNN "Part Number"
F 6 "DIODE SCHOTTKY 30V 5A SOD128" H 2100 2050 50  0001 C CNN "Description"
	1    2100 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	1950 2050 1850 2050
Wire Wire Line
	1850 2050 1850 2200
Connection ~ 1850 2200
Wire Wire Line
	1850 2200 1750 2200
$Sheet
S 9250 750  1700 950 
U 5DE77FE3
F0 "RAM Section" 50
F1 "ram_section.sch" 50
$EndSheet
Text Notes 9500 1250 0    100  ~ 0
64Mib HyperRAM
Wire Wire Line
	3200 3800 3350 3800
Wire Wire Line
	3200 3800 3200 4150
Wire Wire Line
	3200 4150 3350 4150
Connection ~ 3200 3800
$Comp
L power:GND #PWR0102
U 1 1 5E2DCA26
P 3100 3800
F 0 "#PWR0102" H 3100 3550 50  0001 C CNN
F 1 "GND" V 3104 3672 50  0000 R CNN
F 2 "" H 3100 3800 50  0001 C CNN
F 3 "" H 3100 3800 50  0001 C CNN
	1    3100 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 3800 3200 3800
$Comp
L power:+5V #PWR0113
U 1 1 5E2D79BC
P 2350 2050
F 0 "#PWR0113" H 2350 1900 50  0001 C CNN
F 1 "+5V" V 2250 2000 50  0000 L CNN
F 2 "" H 2350 2050 50  0001 C CNN
F 3 "" H 2350 2050 50  0001 C CNN
	1    2350 2050
	0    1    1    0   
$EndComp
Text Notes 9500 4300 0    50   ~ 0
All caps ceramic / rated 5 volts or\nhigher unless noted; nominal values\nare post-DC-bias degradation.
Text Notes 9500 4700 0    50   ~ 0
All resistors <=20% and >= 1/16W\nunless noted.
$Sheet
S 4150 3400 1700 900 
U 5DCAA6D2
F0 "FPGA Configuration and Dev Features" 39
F1 "fpga_configuration.sch" 39
F2 "SIDEBAND_D-" B L 4150 4100 50 
F3 "SIDEBAND_D+" B L 4150 4200 50 
F4 "SIDEBAND_PHY_1V8" I R 5850 4100 50 
F5 "HOST_PHY_1V8" I L 4150 3600 50 
F6 "TARGET_PHY_1V8" I L 4150 3500 50 
F7 "UC_TX_FPGA_RX" O R 5850 3700 50 
F8 "UC_RX_FPGA_TX" I R 5850 3800 50 
F9 "~FPGA_SELF_PROGRAM" I R 5850 4200 50 
F10 "TARGET_VBUS_C" I R 5850 3500 50 
F11 "~UC_RESET" I L 4150 3900 50 
F12 "~FORCE_DFU" I L 4150 3800 50 
F13 "~SIDEBAND_RESET" B R 5850 4000 50 
$EndSheet
$Comp
L Connector:USB_C_Receptacle_USB2.0 J1
U 1 1 5FE4B57F
P 1150 2800
F 0 "J1" H 1150 3700 50  0000 C CNN
F 1 "USB_C_Receptacle_USB2.0" H 1150 3600 50  0000 C CNN
F 2 "luna:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 1300 2800 50  0001 C CNN
F 3 "" H 1300 2800 50  0001 C CNN
F 4 "CONN RCPT USB2.0 TYPE-C 16POS" H 1150 2800 50  0001 C CNN "Description"
F 5 "XKB" H 1150 2800 50  0001 C CNN "Manufacturer"
F 6 "U262-161N-4BVC11" H 1150 2800 50  0001 C CNN "Part Number"
F 7 "HRO TYPE-C-31-M-12, GCT USB4105-GF-A, Cvilux USA CU3216SASDLR009-NH" H 1150 2800 50  0001 C CNN "Substitution"
	1    1150 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  3700 850  3800
Wire Wire Line
	850  3800 1150 3800
Wire Wire Line
	1150 3800 1150 3900
Wire Wire Line
	1150 3700 1150 3800
Connection ~ 1150 3800
Wire Wire Line
	1750 2700 1850 2700
Wire Wire Line
	1850 2700 1850 2800
Connection ~ 1850 2800
Wire Wire Line
	1850 2800 1750 2800
Wire Wire Line
	1750 3000 1850 3000
Wire Wire Line
	1850 3000 1850 2900
Connection ~ 1850 2900
Wire Wire Line
	1850 2900 2550 2900
$Comp
L Connector:USB_A J3
U 1 1 5DD6DEF2
P 9050 2350
F 0 "J3" H 8821 2339 50  0000 R CNN
F 1 "USB_A" H 8821 2249 50  0000 R CNN
F 2 "luna:USB_A_Kycon_KUSBXHT-SB-AS1N-B30-NF_Horizontal" H 9200 2300 50  0001 C CNN
F 3 " ~" H 9200 2300 50  0001 C CNN
F 4 "USB A TYPE RECEPTACLE, SHORT BODY" H 9050 2350 50  0001 C CNN "Description"
F 5 "Jing Extension of the Electronic Co." H 9050 2350 50  0001 C CNN "Manufacturer"
F 6 "C42411" H 9050 2350 50  0001 C CNN "Part Number"
F 7 "Kycon KUSBXHT-SB-AS1N-B30-NF, Würth Elektronik 614104150121, Tensility 54-00015, GCT USB1125-GF-B" H 9050 2350 50  0001 C CNN "Substitution"
	1    9050 2350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9050 2750 9050 2850
Wire Wire Line
	9150 2850 9150 2750
$Comp
L power:GND #PWR08
U 1 1 5DD6FDBE
P 9150 2950
F 0 "#PWR08" H 9150 2700 50  0001 C CNN
F 1 "GND" H 9154 2778 50  0000 C CNN
F 2 "" H 9150 2950 50  0001 C CNN
F 3 "" H 9150 2950 50  0001 C CNN
	1    9150 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2950 9150 2850
Wire Wire Line
	7350 2150 8750 2150
$Comp
L Graphic:Logo_Open_Hardware_Large #LOGO1
U 1 1 5FCC45F6
P 10400 6000
F 0 "#LOGO1" H 10400 6500 50  0001 C CNN
F 1 "Logo_Open_Hardware_Large" H 10400 5600 50  0001 C CNN
F 2 "" H 10400 6000 50  0001 C CNN
F 3 "~" H 10400 6000 50  0001 C CNN
	1    10400 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D8
U 1 1 5DCD8026
P 2100 4600
F 0 "D8" H 2100 4700 50  0000 C CNN
F 1 "PMEG3050EP,115" H 2000 4750 50  0001 C CNN
F 2 "luna:SOD128" H 2100 4600 50  0001 C CNN
F 3 "~" H 2100 4600 50  0001 C CNN
F 4 "Nexperia" H 2100 4600 50  0001 C CNN "Manufacturer"
F 5 "PMEG3050EP,115" H 2100 4600 50  0001 C CNN "Part Number"
F 6 "DIODE SCHOTTKY 30V 5A SOD128" H 2100 4600 50  0001 C CNN "Description"
	1    2100 4600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 60532FEF
P 1150 6450
F 0 "#PWR0125" H 1150 6200 50  0001 C CNN
F 1 "GND" H 1154 6278 50  0000 C CNN
F 2 "" H 1150 6450 50  0001 C CNN
F 3 "" H 1150 6450 50  0001 C CNN
	1    1150 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 6350 850  6350
Wire Wire Line
	850  6350 850  6250
Wire Wire Line
	1150 6450 1150 6350
Wire Wire Line
	1150 6350 1150 6250
$Comp
L Connector:USB_C_Receptacle_USB2.0 J2
U 1 1 60532FE5
P 1150 5350
F 0 "J2" H 1200 6250 50  0000 C CNN
F 1 "USB_C_Receptacle_USB2.0" H 1150 6150 50  0000 C CNN
F 2 "luna:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 1300 5350 50  0001 C CNN
F 3 "" H 1300 5350 50  0001 C CNN
F 4 "CONN RCPT USB2.0 TYPE-C 16POS" H 1150 5350 50  0001 C CNN "Description"
F 5 "XKB" H 1150 5350 50  0001 C CNN "Manufacturer"
F 6 "U262-161N-4BVC11" H 1150 5350 50  0001 C CNN "Part Number"
F 7 "HRO TYPE-C-31-M-12, GCT USB4105-GF-A, Cvilux USA CU3216SASDLR009-NH" H 1150 5350 50  0001 C CNN "Substitution"
	1    1150 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2500 1750 2500
Wire Wire Line
	1750 2400 2550 2400
Wire Wire Line
	5850 1750 5950 1750
Wire Wire Line
	1750 3300 2550 3300
Wire Wire Line
	2550 3400 1750 3400
Text Notes 9500 4950 0    50   ~ 0
Maximum input VBUS voltage: 5.5 V
$Sheet
S 4150 750  1700 2300
U 5DDDB747
F0 "Target Section" 50
F1 "target_side.sch" 50
F2 "TARGET_D+" B R 5850 2350 50 
F3 "TARGET_D-" B R 5850 2450 50 
F4 "TARGET_PHY_1V8" O L 4150 2950 50 
F5 "TARGET_SBU1" B R 5850 2850 50 
F6 "TARGET_SBU2" B R 5850 2950 50 
F7 "VBUS_C_TO_A_FAULT" I R 5850 1250 50 
F8 "VBUS_5V_TO_A_FAULT" I R 5850 950 50 
F9 "TARGET_VBUS_C" I R 5850 1750 50 
F10 "VBUS_A_TO_C_FAULT" I R 5850 1550 50 
F11 "VBUS_5V_TO_A_EN" O R 5850 850 50 
F12 "VBUS_A_TO_C_EN" O R 5850 1150 50 
F13 "VBUS_C_TO_A_EN" O R 5850 1450 50 
$EndSheet
$Sheet
S 7550 750  1100 1200
U 5DA7BAF4
F0 "Power Supplies" 50
F1 "power_supplies.sch" 50
F2 "VBUS_A_TO_C_FAULT" O L 7550 1550 50 
F3 "TARGET_VBUS_A" O L 7550 1850 50 
F4 "TARGET_VBUS_C" B L 7550 1750 50 
F5 "VBUS_A_TO_C_EN" I L 7550 1450 50 
F6 "VBUS_C_TO_A_FAULT" O L 7550 1250 50 
F7 "VBUS_C_TO_A_EN" I L 7550 1150 50 
F8 "VBUS_5V_TO_A_FAULT" O L 7550 950 50 
F9 "VBUS_5V_TO_A_EN" I L 7550 850 50 
$EndSheet
Wire Wire Line
	5950 3500 5850 3500
$Sheet
S 2550 2100 1100 1400
U 5DD754D4
F0 "Host Section" 50
F1 "host_side.sch" 50
F2 "HOST_D+" B L 2550 2900 50 
F3 "HOST_D-" B L 2550 2800 50 
F4 "HOST_VBUS" I L 2550 2200 50 
F5 "HOST_PHY_1V8" O R 3650 3100 50 
F6 "HOST_CC1" B L 2550 2400 50 
F7 "HOST_CC2" B L 2550 2500 50 
F8 "HOST_SBU1" B L 2550 3300 50 
F9 "HOST_SBU2" B L 2550 3400 50 
F10 "USER_IO0" B R 3650 2200 50 
F11 "USER_IO1" B R 3650 2300 50 
$EndSheet
Wire Wire Line
	1750 4950 4150 4950
Wire Wire Line
	1750 5050 4150 5050
Wire Wire Line
	1750 5350 1850 5350
Wire Wire Line
	1750 5250 1850 5250
Wire Wire Line
	1850 5250 1850 5350
Connection ~ 1850 5350
Wire Wire Line
	1750 5450 1850 5450
Wire Wire Line
	1850 5450 1850 5550
Wire Wire Line
	1850 5550 1750 5550
Connection ~ 1850 5450
Wire Wire Line
	1850 5450 4050 5450
Wire Wire Line
	1750 5850 4150 5850
Wire Wire Line
	4150 5950 1750 5950
Wire Wire Line
	1750 4750 1850 4750
Wire Wire Line
	1950 4600 1850 4600
Wire Wire Line
	1850 4600 1850 4750
Connection ~ 1850 4750
Wire Wire Line
	1850 4750 4150 4750
Wire Wire Line
	1850 5350 3950 5350
Wire Wire Line
	4050 5450 4050 4200
Wire Wire Line
	4050 4200 4150 4200
Connection ~ 4050 5450
Wire Wire Line
	4050 5450 4150 5450
Wire Wire Line
	4150 4100 3950 4100
Wire Wire Line
	3950 4100 3950 5350
Connection ~ 3950 5350
Wire Wire Line
	3950 5350 4150 5350
Wire Wire Line
	5850 4750 5950 4750
Wire Wire Line
	5950 4750 5950 4200
Wire Wire Line
	5950 4200 5850 4200
Wire Wire Line
	5850 4100 6050 4100
Wire Wire Line
	6050 4100 6050 4850
Wire Wire Line
	6050 4850 5850 4850
Wire Wire Line
	5850 4950 6150 4950
Wire Wire Line
	6150 4000 5850 4000
Wire Wire Line
	4050 3500 4150 3500
Wire Wire Line
	4150 3600 3950 3600
Wire Wire Line
	5950 3500 5950 2650
Wire Wire Line
	8750 2350 7250 2350
Wire Wire Line
	7550 850  5850 850 
Wire Wire Line
	5850 950  7550 950 
Wire Wire Line
	7550 1150 5850 1150
Wire Wire Line
	5850 1250 7550 1250
Wire Wire Line
	7550 1450 5850 1450
Wire Wire Line
	5850 1550 7550 1550
Wire Wire Line
	7350 2150 7350 1850
Wire Wire Line
	7350 1850 7550 1850
Wire Wire Line
	8750 2450 7350 2450
Wire Wire Line
	4050 3500 4050 2950
Wire Wire Line
	4050 2950 4150 2950
Wire Wire Line
	3650 3100 3950 3100
Wire Wire Line
	3950 3100 3950 3600
Wire Wire Line
	4150 3800 3750 3800
$Comp
L Connector:Conn_Coaxial J8
U 1 1 6068021D
P 3050 1200
AR Path="/6068021D" Ref="J8"  Part="1" 
AR Path="/5DD754D4/6068021D" Ref="J?"  Part="1" 
F 0 "J8" H 3150 1174 50  0000 L CNN
F 1 "Conn_Coaxial" H 3150 1084 50  0001 L CNN
F 2 "luna:SMA-EDGE" H 3050 1200 50  0001 C CNN
F 3 " ~" H 3050 1200 50  0001 C CNN
F 4 "DNP" H 3150 1250 50  0000 L CNN "Note"
	1    3050 1200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2900 1400 3050 1400
Text Notes 2750 1000 0    50   ~ 0
Trigger I/O
Wire Wire Line
	2900 1800 3050 1800
$Comp
L power:GND #PWR0104
U 1 1 60680226
P 2900 1800
AR Path="/60680226" Ref="#PWR0104"  Part="1" 
AR Path="/5DD754D4/60680226" Ref="#PWR?"  Part="1" 
F 0 "#PWR0104" H 2900 1550 50  0001 C CNN
F 1 "GND" H 3000 1650 50  0000 R CNN
F 2 "" H 2900 1800 50  0001 C CNN
F 3 "" H 2900 1800 50  0001 C CNN
	1    2900 1800
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 6068022C
P 2900 1400
AR Path="/6068022C" Ref="#PWR0106"  Part="1" 
AR Path="/5DD754D4/6068022C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0106" H 2900 1150 50  0001 C CNN
F 1 "GND" H 3000 1250 50  0000 R CNN
F 2 "" H 2900 1400 50  0001 C CNN
F 3 "" H 2900 1400 50  0001 C CNN
	1    2900 1400
	0    1    -1   0   
$EndComp
$Comp
L Connector:Conn_Coaxial J9
U 1 1 60680233
P 3050 1600
AR Path="/60680233" Ref="J9"  Part="1" 
AR Path="/5DD754D4/60680233" Ref="J?"  Part="1" 
F 0 "J9" H 3149 1529 50  0000 L CNN
F 1 "Conn_Coaxial" H 3150 1484 50  0001 L CNN
F 2 "luna:SMA-EDGE" H 3050 1600 50  0001 C CNN
F 3 " ~" H 3050 1600 50  0001 C CNN
F 4 "DNP" H 3150 1600 50  0000 L CNN "Note"
	1    3050 1600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3650 2200 3750 2200
Wire Wire Line
	3750 2200 3750 1200
Wire Wire Line
	3750 1200 3250 1200
Wire Wire Line
	3250 1600 3850 1600
Wire Wire Line
	3850 1600 3850 2300
Wire Wire Line
	3850 2300 3650 2300
$Comp
L Switch:SW_SPST SW2
U 1 1 5E2B35A7
P 3550 4150
F 0 "SW2" H 3800 4200 50  0000 C CNN
F 1 "BTN_RESET" H 3550 4050 50  0000 C CNN
F 2 "luna:SW_Tactile_SPST_Angled_TC-1109DE-B-F" H 3550 4150 50  0001 C CNN
F 3 "~" H 3550 4150 50  0001 C CNN
F 4 "SWITCH TACTILE SPST-NO 0.05A 12V" H 3550 4150 50  0001 C CNN "Description"
F 5 "XKB" H 3550 4150 50  0001 C CNN "Manufacturer"
F 6 "TC-1109DE-B-F" H 3550 4150 50  0001 C CNN "Part Number"
F 7 "" H 3550 4150 50  0001 C CNN "Substitution"
	1    3550 4150
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 5E0E6B65
P 3550 3800
F 0 "SW1" H 3800 3850 50  0000 C CNN
F 1 "BTN_DFU" H 3550 3650 50  0000 C CNN
F 2 "luna:SW_Tactile_SPST_Angled_TC-1109DE-B-F" H 3550 3800 50  0001 C CNN
F 3 "~" H 3550 3800 50  0001 C CNN
F 4 "SWITCH TACTILE SPST-NO 0.05A 12V" H 3550 3800 50  0001 C CNN "Description"
F 5 "XKB" H 3550 3800 50  0001 C CNN "Manufacturer"
F 6 "TC-1109DE-B-F" H 3550 3800 50  0001 C CNN "Part Number"
F 7 "" H 3550 3800 50  0001 C CNN "Substitution"
	1    3550 3800
	-1   0    0    -1  
$EndComp
Text Label 5550 6550 0    50   ~ 0
PMOD_B1
Text Label 5550 6750 0    50   ~ 0
PMOD_B3
Text Label 5550 6650 0    50   ~ 0
PMOD_B2
Text Label 5550 6850 0    50   ~ 0
PMOD_B4
Text Label 5550 6950 0    50   ~ 0
PMOD_B5
Text Label 5550 7050 0    50   ~ 0
PMOD_B6
Text Label 5550 7150 0    50   ~ 0
PMOD_B7
Connection ~ 1150 6350
Text Label 5550 6450 0    50   ~ 0
PMOD_B0
Wire Wire Line
	5850 2350 7250 2350
Connection ~ 7250 2350
Wire Wire Line
	7350 2450 5850 2450
Connection ~ 7350 2450
Entry Wire Line
	6150 6350 6050 6450
Entry Wire Line
	6150 6450 6050 6550
Entry Wire Line
	6150 6550 6050 6650
Wire Bus Line
	5850 5450 6150 5450
Entry Wire Line
	6150 7050 6050 7150
Entry Wire Line
	6150 6950 6050 7050
Entry Wire Line
	6150 6850 6050 6950
Entry Wire Line
	6150 6750 6050 6850
Text Label 6150 5600 3    50   ~ 0
PMOD_B[0..7]
Entry Wire Line
	6150 6650 6050 6750
$Comp
L Connector_Generic:Conn_02x06_Top_Bottom J11
U 1 1 60C61CD0
P 5100 7050
F 0 "J11" H 5150 6650 50  0000 C CNN
F 1 "PMOD_B" H 5150 6550 50  0000 C CNN
F 2 "luna:PinSocket_2x06_P2.54mm_PMOD" H 5100 7050 50  0001 C CNN
F 3 "~" H 5100 7050 50  0001 C CNN
F 4 "DNP" H 5150 6450 50  0000 C CNN "Note"
	1    5100 7050
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0130
U 1 1 60F43DA8
P 5500 7350
F 0 "#PWR0130" H 5500 7200 50  0001 C CNN
F 1 "+3V3" V 5515 7478 50  0000 L CNN
F 2 "" H 5500 7350 50  0001 C CNN
F 3 "" H 5500 7350 50  0001 C CNN
	1    5500 7350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 60F58BD3
P 5500 7250
F 0 "#PWR0134" H 5500 7000 50  0001 C CNN
F 1 "GND" V 5500 7050 50  0000 C CNN
F 2 "" H 5500 7250 50  0001 C CNN
F 3 "" H 5500 7250 50  0001 C CNN
	1    5500 7250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5500 7250 5400 7250
Wire Wire Line
	5500 7350 5400 7350
Wire Wire Line
	4900 7250 4800 7250
Wire Wire Line
	4900 7350 4800 7350
Wire Wire Line
	5400 7150 6050 7150
Wire Wire Line
	6050 7050 5400 7050
Wire Wire Line
	5400 6950 6050 6950
Wire Wire Line
	6050 6850 5400 6850
Wire Wire Line
	4900 6850 4800 6850
Wire Wire Line
	4800 6850 4800 6450
Wire Wire Line
	4800 6450 6050 6450
Wire Wire Line
	4900 6950 4700 6950
Wire Wire Line
	4700 6950 4700 6550
Wire Wire Line
	4700 6550 6050 6550
Wire Wire Line
	4900 7050 4600 7050
Wire Wire Line
	4600 7050 4600 6650
Wire Wire Line
	4600 6650 6050 6650
Wire Wire Line
	6050 6750 4500 6750
Wire Wire Line
	4500 6750 4500 7150
Wire Wire Line
	4500 7150 4900 7150
Wire Wire Line
	3250 7350 3350 7350
Wire Wire Line
	3350 7250 3250 7250
$Comp
L power:+3V3 #PWR0120
U 1 1 615BA7DC
P 3250 7350
F 0 "#PWR0120" H 3250 7200 50  0001 C CNN
F 1 "+3V3" V 3265 7478 50  0000 L CNN
F 2 "" H 3250 7350 50  0001 C CNN
F 3 "" H 3250 7350 50  0001 C CNN
	1    3250 7350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5E2A54E0
P 3250 7250
F 0 "#PWR0110" H 3250 7000 50  0001 C CNN
F 1 "GND" V 3250 7050 50  0000 C CNN
F 2 "" H 3250 7250 50  0001 C CNN
F 3 "" H 3250 7250 50  0001 C CNN
	1    3250 7250
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_02x06_Top_Bottom J7
U 1 1 615ABEB3
P 3550 7050
F 0 "J7" H 3600 6650 50  0000 C CNN
F 1 "PMOD_A" H 3600 6550 50  0000 C CNN
F 2 "luna:PinSocket_2x06_P2.54mm_PMOD" H 3550 7050 50  0001 C CNN
F 3 "~" H 3550 7050 50  0001 C CNN
F 4 "DNP" H 3600 6450 50  0000 C CNN "Note"
	1    3550 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 7250 3850 7250
Wire Wire Line
	3850 7350 3950 7350
Wire Wire Line
	3950 6850 3850 6850
Wire Wire Line
	3850 6950 4050 6950
Wire Wire Line
	4150 7050 3850 7050
Wire Wire Line
	3850 7150 4250 7150
Text Label 2900 6850 0    50   ~ 0
PMOD_A0
Text Label 2900 6950 0    50   ~ 0
PMOD_A1
Text Label 2900 7050 0    50   ~ 0
PMOD_A2
Text Label 2900 7150 0    50   ~ 0
PMOD_A3
Text Label 2900 6750 0    50   ~ 0
PMOD_A7
Wire Wire Line
	4250 6750 4250 7150
Wire Wire Line
	4150 6650 4150 7050
Wire Wire Line
	4050 6950 4050 6550
Wire Wire Line
	3950 6450 3950 6850
Text Label 2900 6450 0    50   ~ 0
PMOD_A4
Text Label 2900 6550 0    50   ~ 0
PMOD_A5
Text Label 2900 6650 0    50   ~ 0
PMOD_A6
$Sheet
S 1250 7000 1200 450 
U 5DF88884
F0 "Clock and Pmod" 50
F1 "clock_pmod.sch" 50
F2 "PMOD_A[0..7]" B R 2450 7350 50 
$EndSheet
Text Label 2650 6500 3    50   ~ 0
PMOD_A[0..7]
Entry Wire Line
	2650 6550 2750 6450
Entry Wire Line
	2650 6650 2750 6550
Entry Wire Line
	2650 6750 2750 6650
Entry Wire Line
	2650 6850 2750 6750
Entry Wire Line
	2650 6950 2750 6850
Entry Wire Line
	2650 7050 2750 6950
Entry Wire Line
	2650 7150 2750 7050
Entry Wire Line
	2650 7250 2750 7150
Wire Wire Line
	2750 6450 3950 6450
Wire Wire Line
	4050 6550 2750 6550
Wire Wire Line
	2750 6650 4150 6650
Wire Wire Line
	4250 6750 2750 6750
Wire Wire Line
	2750 6850 3350 6850
Wire Wire Line
	3350 6950 2750 6950
Wire Wire Line
	2750 7050 3350 7050
Wire Wire Line
	3350 7150 2750 7150
Wire Bus Line
	2450 7350 2650 7350
Wire Wire Line
	6150 4950 6150 4000
Wire Wire Line
	6400 3800 5850 3800
Wire Wire Line
	5850 3700 6500 3700
Wire Wire Line
	6650 2950 5850 2950
Wire Wire Line
	5850 2850 6750 2850
Wire Wire Line
	5950 1750 7550 1750
Connection ~ 5950 1750
Text Notes 4200 7650 0    50   ~ 0
User I/O
Wire Wire Line
	7450 2900 7450 2650
Wire Wire Line
	7450 2650 5950 2650
Connection ~ 5950 2650
Wire Wire Line
	5950 2650 5950 1750
Wire Wire Line
	7550 2900 7450 2900
Wire Wire Line
	6750 4000 7550 4000
Wire Wire Line
	6750 2850 6750 4000
Wire Wire Line
	6650 4100 6650 2950
Wire Wire Line
	7550 4100 6650 4100
Wire Wire Line
	6900 3100 7550 3100
Wire Wire Line
	7550 3200 7000 3200
Wire Wire Line
	7350 2450 7350 3500
Wire Wire Line
	7350 3500 7450 3500
Wire Wire Line
	7250 3600 7450 3600
Wire Wire Line
	7250 2350 7250 3600
Connection ~ 7450 3600
Connection ~ 7450 3500
Wire Wire Line
	7550 3500 7450 3500
Wire Wire Line
	7450 3700 7550 3700
Wire Wire Line
	7450 3400 7550 3400
Wire Wire Line
	7550 3600 7450 3600
Connection ~ 8150 4500
Wire Wire Line
	8150 4500 8150 4400
Wire Wire Line
	8150 4600 8150 4500
Wire Wire Line
	8450 4500 8450 4400
Wire Wire Line
	8150 4500 8450 4500
$Comp
L power:GND #PWR09
U 1 1 5DD6B00F
P 8150 4600
F 0 "#PWR09" H 8150 4350 50  0001 C CNN
F 1 "GND" H 8154 4428 50  0000 C CNN
F 2 "" H 8150 4600 50  0001 C CNN
F 3 "" H 8150 4600 50  0001 C CNN
	1    8150 4600
	-1   0    0    -1  
$EndComp
$Comp
L Connector:USB_C_Receptacle_USB2.0 J4
U 1 1 60048A13
P 8150 3500
F 0 "J4" H 8200 4400 50  0000 C CNN
F 1 "USB_C_Receptacle_USB2.0" H 8150 4300 50  0000 C CNN
F 2 "luna:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 8300 3500 50  0001 C CNN
F 3 "" H 8300 3500 50  0001 C CNN
F 4 "CONN RCPT USB2.0 TYPE-C 16POS" H 8150 3500 50  0001 C CNN "Description"
F 5 "XKB" H 8150 3500 50  0001 C CNN "Manufacturer"
F 6 "U262-161N-4BVC11" H 8150 3500 50  0001 C CNN "Part Number"
F 7 "HRO TYPE-C-31-M-12, GCT USB4105-GF-A, Cvilux USA CU3216SASDLR009-NH" H 8150 3500 50  0001 C CNN "Substitution"
	1    8150 3500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7450 3600 7450 3700
Wire Wire Line
	7450 3500 7450 3400
Wire Wire Line
	6500 3700 6500 5450
Wire Wire Line
	6400 5550 6400 3800
Wire Wire Line
	6900 5250 6900 3100
Wire Wire Line
	7100 5250 6900 5250
Wire Wire Line
	7000 5150 7100 5150
Wire Wire Line
	7000 3200 7000 5150
Wire Wire Line
	6500 5450 7100 5450
Wire Wire Line
	6400 5550 7100 5550
$Sheet
S 7100 5050 1100 600 
U 5DEF5588
F0 "Right side indicators" 50
F1 "right_side_indicators.sch" 50
F2 "UC_RX_FPGA_TX" O L 7100 5550 50 
F3 "UC_TX_FPGA_RX" I L 7100 5450 50 
F4 "TARGET_CC2" B L 7100 5150 50 
F5 "TARGET_CC1" B L 7100 5250 50 
$EndSheet
$Comp
L power:+3V3 #PWR0123
U 1 1 60F428B4
P 4800 7350
F 0 "#PWR0123" H 4800 7200 50  0001 C CNN
F 1 "+3V3" V 4815 7478 50  0000 L CNN
F 2 "" H 4800 7350 50  0001 C CNN
F 3 "" H 4800 7350 50  0001 C CNN
	1    4800 7350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 60F567E2
P 4800 7250
F 0 "#PWR0132" H 4800 7000 50  0001 C CNN
F 1 "GND" V 4800 7050 50  0000 C CNN
F 2 "" H 4800 7250 50  0001 C CNN
F 3 "" H 4800 7250 50  0001 C CNN
	1    4800 7250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 61A2BE78
P 3950 7250
F 0 "#PWR0111" H 3950 7000 50  0001 C CNN
F 1 "GND" V 3950 7050 50  0000 C CNN
F 2 "" H 3950 7250 50  0001 C CNN
F 3 "" H 3950 7250 50  0001 C CNN
	1    3950 7250
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0121
U 1 1 615C2D28
P 3950 7350
F 0 "#PWR0121" H 3950 7200 50  0001 C CNN
F 1 "+3V3" V 3965 7478 50  0000 L CNN
F 2 "" H 3950 7350 50  0001 C CNN
F 3 "" H 3950 7350 50  0001 C CNN
	1    3950 7350
	0    1    1    0   
$EndComp
Connection ~ 9150 2850
Wire Wire Line
	9050 2850 9150 2850
Wire Wire Line
	3750 4150 3850 4150
Wire Wire Line
	3850 4150 3850 3900
Wire Wire Line
	3850 3900 4150 3900
Wire Wire Line
	2350 2050 2250 2050
Wire Wire Line
	2350 4600 2250 4600
Wire Bus Line
	2650 6350 2650 7350
Wire Bus Line
	6150 5450 6150 7250
Text Label 6000 3800 0    50   ~ 0
FPGA_TMS
Text Label 6000 3700 0    50   ~ 0
FPGA_TDI
$EndSCHEMATC
