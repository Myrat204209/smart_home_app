// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/features/features.dart';

const kImagesList = [
  'assets/images/speaker.png',
  'assets/images/thermostat.png',
  'assets/images/lights.png',
  'assets/images/router.png',
];

class DashboardDevicesGrid extends StatefulWidget {
  const DashboardDevicesGrid({super.key});

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
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            title: Text(
              'Devices',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            contentPadding: EdgeInsets.zero,
            trailing: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: IconButton(
                icon: Icon(Icons.more_horiz_rounded),
                onPressed: () {
                  context.router.push(LightsRoute());
                },
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
              ),
              itemCount: 4, // Example number of devices
              itemBuilder: (context, index) {
                return DashboardDeviceCard(
                  imageLink: kImagesList[index],
                  onDeviceTapped: () {
                    log(
                      '--- Button Tapped! Attempting to navigate to LightsRoute... ---',
                    );
                    final router = AutoRouter.of(context);
                    log(
                      'Router found: $router \nCurrent path: ${router.currentPath}',
                    );
                    //TODO: Fix the navigation issue
                    context.router.push(LightsRoute());
                    log(
                      'Last Router : $router \nLatest path: ${router.currentPath}',
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
