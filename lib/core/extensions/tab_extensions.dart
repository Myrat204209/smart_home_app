import 'package:flutter/material.dart';

extension TabExtensions on Tab {
  static Tab custom({
    String? text,
    required bool selected,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black,
    IconData? icon,
  }) {
    return Tab(
      icon: icon != null ? Icon(icon, color: color) : null,
      child: Text(
        text ?? '',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: selected ? fontWeight : FontWeight.w500,
          color: selected ? color : Color(0xff666666),
        ),
      ),
    );
  }
}
