// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ProfileTab(
              icon: Icons.light_mode,
              title: 'Mode',
              subtitle: 'Bright',
            ),
            ProfileTab(
              icon: Icons.control_camera_outlined,
              title: 'Control',
              subtitle: 'Directions',
            ),
            ProfileTab(
              icon: Icons.alarm_on_outlined,
              title: 'Set',
              subtitle: 'Timer',
            ),
          ],
        ),
      ],
    );
    // ClimateControlScreen();
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(18.7),
        ),
        child: SizedBox(
          width: 120.61,
          height: 146.79,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Icon(icon, color: Colors.white, size: 32)),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffd4e2f7),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffd4e2f7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
