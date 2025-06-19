import 'package:flutter/material.dart';

extension TextAppBarStyled on Text {
   Text titled({
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.white,
  }) {
    return Text(
      data ?? '' ,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
