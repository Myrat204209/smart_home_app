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
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: !isSelected ? Colors.white : Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Tab(height: 30, text: title),
      ),
    );
  }
}
