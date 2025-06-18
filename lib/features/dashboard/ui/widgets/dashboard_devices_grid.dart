// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class _DashboardDevicesGridState extends State<DashboardDevicesGrid> {
  int selectedGrid = 0;
  @override
  Widget build(BuildContext context) {
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
            contentPadding: EdgeInsets.all(0),
            trailing: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: IconButton(
                icon: Icon(Icons.more_horiz_rounded),
                onPressed: () {
                  // Navigate to add device page
                },
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
              ),
              itemCount: 4, // Example number of devices
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedGrid = index;
                    });
                  },
                  child: Card(
                    color: index == selectedGrid ? Colors.black : Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            kImagesList[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Smart Speaker',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoSwitch(
                                value: false,
                                onChanged: (value) {
                                  setState(() {
                                    value = !value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
