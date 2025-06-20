// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/features/features.dart';

class DashboardDevicesGrid extends StatefulWidget {
  final int roomIndex;
  final String roomName;
  const DashboardDevicesGrid({
    super.key,
    required this.roomIndex,
    required this.roomName,
  });

  @override
  State<DashboardDevicesGrid> createState() => _DashboardDevicesGridState();
}

class _DashboardDevicesGridState extends State<DashboardDevicesGrid>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        ListTile(
          title: Text(
            '${widget.roomName} Devices',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          contentPadding: EdgeInsets.zero,
          trailing: IconButton(
            icon: Icon(Icons.more_horiz_rounded),
            onPressed: () {
              switch (widget.roomIndex) {
                case 0:
                  context.router.push(LightsRoute());
                case 1:
                  context.router.push(ThermostatRoute());

                default:
              }
            },
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 7.5,
              crossAxisSpacing: 7.5,
              childAspectRatio: 1.0883,
            ),
            itemCount: kDeviceItemCounts[widget.roomIndex],
            itemBuilder: (context, index) {
              return DashboardDeviceCard(
                deviceIcon: kDeviceIcons[index],
                deviceTitle: kDeviceTitles[index],
                deviceValue: '60%',
                onDeviceTapped: () {
                  context.router.push(LightsRoute());
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
