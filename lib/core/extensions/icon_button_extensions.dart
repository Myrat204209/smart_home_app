import 'package:flutter/material.dart';

extension IconButtonSmall on IconButton {
  static IconButton small({
    required IconData icon,
    Color? color = Colors.white,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      icon: Icon(icon, size: 26, color: color),
      onPressed: onPressed,
    );
  }
}
