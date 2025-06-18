// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class DashboardDeviceCard extends StatefulWidget {
  const DashboardDeviceCard({super.key, required this.imageLink});
  final String imageLink;
  @override
  State<DashboardDeviceCard> createState() => _DashboardDeviceCardState();
}

class _DashboardDeviceCardState extends State<DashboardDeviceCard> {
  bool switched = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GetIt.I<Talker>().log('DashboardDeviceCard');
        context.router.pushPath('/dashboard/tab1/thermostat');
      },
      borderRadius: BorderRadius.circular(20),
      child: Card(
        color: switched ? Colors.black : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: Image.asset(widget.imageLink, fit: BoxFit.contain)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Smart speaker',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 18,
                            height: 1,
                            color: switched ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox.square(dimension: 5),
                        Text(
                          '60%',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Switch.adaptive(
                      activeColor: Colors.black,
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: Colors.white,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      trackOutlineColor: WidgetStateProperty.all(
                        Colors.transparent,
                      ),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      inactiveTrackColor: Colors.grey[300],
                      value: switched,
                      onChanged: (bool value) {
                        setState(() {
                          switched = !switched;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
