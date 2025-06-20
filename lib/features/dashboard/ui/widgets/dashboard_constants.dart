
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

///@Template Constants for DashboardView classa
///
const kDashboardTabIcons = <IconData>[
  Icons.list_alt_outlined,
  CupertinoIcons.bed_double,
  Icons.chair_outlined,
  Icons.kitchen_outlined,
  Icons.bathroom_outlined,
  Icons.child_care_outlined,
  Icons.door_front_door_outlined,
];
const kDashboardTabTitles = <String>[
  'All Devices',
  'Bedroom',
  'Living Room',
  'Kitchen',
  'Bathroom',
  'Kids Room',
  'Front Door',
];

/////////////////////////////////////////////////////////////////////////////////


/// Constants for DashboardDevicesGrid class
const kDeviceTitles = <String>[
  'Smart Lights',
  'Smart Thermostat',
  'Smart Wifi Router',
  'Smart Speaker',
  'Smart Tv',
];
const kDeviceItemCounts = <int>[5, 3, 2, 1, 3, 1, 2];

const kDeviceIcons = <IconData>[
  Icons.light_outlined,
  Icons.thermostat_outlined,
  Icons.router_outlined,
  Icons.speaker_outlined,
  Icons.tv_outlined,
];
