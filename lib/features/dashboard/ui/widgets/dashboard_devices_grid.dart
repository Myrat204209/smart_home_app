// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

const kImagesList = [
  'assets/images/speaker.png',
  'assets/images/thermostat.png',
  'assets/images/lights.png',
  'assets/images/router.png',
];

class DashboardDevicesGrid extends StatelessWidget {
  const DashboardDevicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.65,
              ),
              itemCount: 4, // Example number of devices
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          kImagesList[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Device ${index + 1}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
