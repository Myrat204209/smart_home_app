import 'package:flutter/material.dart';

extension TabExtensions on Tab {
  static Tab custom({
    String? text,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.white,
    IconData? icon,
  }) {
    return Tab(
      icon: icon != null ? Icon(icon, color: color) : null,
      child: Text(
        text ?? '',

        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
