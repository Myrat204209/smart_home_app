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
            borderRadius: BorderRadius.circular(10),
            color: !isSelected ? Colors.white : Colors.black,
          ),
          child: SizedBox.square(
            dimension: 67,
            child: Tab(
              height: 50,
              icon:  Icon(
                icon,
                size: 30,
                weight: 300,
                color: isSelected ? Colors.white : Color(0xFF6f7ea8),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,

            color: Color(0xFF6f7ea8),
          ),
        ),
      ],
    );
  }
}
