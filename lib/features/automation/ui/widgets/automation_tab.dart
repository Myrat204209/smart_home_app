// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class AutomationTab extends StatelessWidget {
  const AutomationTab({
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
            color: !isSelected ? Colors.white : Colors.black,
          ),
          child: SizedBox.square(
            dimension: 40,
            child: Tab(
              height: 30,
              icon: Icon(
                icon,
                size: 30,
                color: isSelected ? Colors.white : Colors.grey[400],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
