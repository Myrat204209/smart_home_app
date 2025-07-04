import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/features/app/app.dart';
import 'package:smart_home_app/features/dashboard/dashboard.dart';

class DashboardAllDeviceExpansibles extends StatefulWidget {
  const DashboardAllDeviceExpansibles({super.key});

  @override
  State<DashboardAllDeviceExpansibles> createState() =>
      _DashboardAllDeviceExpansiblesState();
}

class _DashboardAllDeviceExpansiblesState
    extends State<DashboardAllDeviceExpansibles>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      // mainAxisSize: MainAxisSize.max,
      children: [
        ListTile(
          title: Text(
            'All Devices',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          contentPadding: EdgeInsets.zero,
          trailing: IconButton(
            icon: Icon(Icons.more_horiz_rounded),
            onPressed: () {},
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
            itemCount: 5,
            itemBuilder: (context, index) {
              return DashboardDeviceCard(
                deviceIcon: kDeviceIcons[index],
                deviceTitle: kDeviceTitles[index],
                deviceValue: '60%',
                onDeviceTapped: () {
                  switch (index) {
                    case 0:
                      context.router.push(LightsRoute());
                    case 1:
                      context.router.push(ThermostatRoute());
                    case 2:
                      context.router.push(SpeakerRoute());
                    default:
                  }
                  log('asdasdasdj');
                },
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
