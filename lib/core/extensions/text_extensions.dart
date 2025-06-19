import 'package:flutter/material.dart'
    show Text, TextStyle, FontWeight, Color, Colors;

extension TextAppBarStyled on Text {
  static Text titled({
    required String text,
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.white,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
