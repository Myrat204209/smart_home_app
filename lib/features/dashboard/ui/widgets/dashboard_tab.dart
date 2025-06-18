// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
  });
  final String title;
  final IconData icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          child: SizedBox.square(
            dimension: 80,
            child: Tab(
              height: 60,
              icon: Icon(icon, size: 40, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: isSelected ? Colors.white : Colors.black),
        ),
      ],
    );
  }
}
