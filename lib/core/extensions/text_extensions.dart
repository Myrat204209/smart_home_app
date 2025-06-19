import 'package:flutter/material.dart';

extension TextExtensions on Text {
   Text titled({
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.white,
  }) {
    return Text(
      data ?? 'Title',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
