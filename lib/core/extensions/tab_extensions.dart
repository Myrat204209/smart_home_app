import 'package:flutter/material.dart';

extension TabStyled on Tab {
  static Tab text({
    required String text,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w500,
    Color color = Colors.white,
  }) {
    return Tab(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
