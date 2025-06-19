import 'package:flutter/material.dart'
    show
        IconButton,
        Icon,
        Colors,
        VoidCallback,
        VisualDensity,
        EdgeInsets,
        IconData;

extension IconButtonSmall on IconButton {
  static IconButton small({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      icon: Icon(icon, size: 30, color: Colors.white),
      onPressed: onPressed,
    );
  }
}
