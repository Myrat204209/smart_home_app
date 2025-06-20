// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class DashboardDeviceCard extends StatefulWidget {
  const DashboardDeviceCard({
    super.key,
    required this.onDeviceTapped,
  });
  final VoidCallback onDeviceTapped;
  @override
  State<DashboardDeviceCard> createState() => _DashboardDeviceCardState();
}

class _DashboardDeviceCardState extends State<DashboardDeviceCard> {
  bool switched = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onDeviceTapped,
      borderRadius: BorderRadius.circular(20),
      child: Card(
        color: switched ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.light_outlined,
                    size: 30,
                    color: !switched ? Colors.black : Colors.white,
                  ),
                  Switch.adaptive(
                    activeColor: Colors.black,
                    activeTrackColor: Colors.white,
                    inactiveThumbColor: Colors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    trackOutlineColor: WidgetStateProperty.all(
                      Colors.transparent,
                    ),
                    padding: EdgeInsets.all(0),

                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    inactiveTrackColor: Colors.grey[300],
                    value: switched,
                    onChanged: (bool value) {
                      setState(() {
                        switched = !switched;
                      });
                    },
                  ),
                ],
              ),
              Spacer(),
              Text(
                'Smart Lights',
                softWrap: true,
                style: TextStyle(
                  fontSize: 15,
                  color: switched ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
