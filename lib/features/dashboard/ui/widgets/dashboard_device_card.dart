// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class DashboardDeviceCard extends StatefulWidget {
  const DashboardDeviceCard({
    super.key,
    required this.onDeviceTapped,
    required this.deviceTitle,
    required this.deviceValue,
    required this.deviceIcon,
  });
  final VoidCallback onDeviceTapped;
  final String deviceTitle;
  final String deviceValue;
  final IconData deviceIcon;
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
                    widget.deviceIcon,
                    size: 50,
                    color: !switched ? Colors.black : Colors.white,
                  ),
                  DeviceCardSwitch(
                    switched: switched,
                    onSwitched: (value) {
                      setState(() {
                        switched = !switched;
                      });
                    },
                  ),
                ],
              ),
              Spacer(),
              Text(
                widget.deviceTitle,
                softWrap: true,
                style: TextStyle(
                  fontSize: 15,
                  color: switched ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox.square(dimension: 5),
              Text(
                widget.deviceValue,
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

class DeviceCardSwitch extends StatelessWidget {
  const DeviceCardSwitch({super.key, required this.switched, this.onSwitched});

  final bool switched;
  final Function(bool)? onSwitched;

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      activeColor: Colors.black,
      activeTrackColor: Colors.white,
      inactiveThumbColor: Colors.white,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      padding: EdgeInsets.all(0),

      overlayColor: WidgetStateProperty.all(Colors.transparent),
      inactiveTrackColor: Colors.grey[300],
      value: switched,
      onChanged: onSwitched,
    );
  }
}
