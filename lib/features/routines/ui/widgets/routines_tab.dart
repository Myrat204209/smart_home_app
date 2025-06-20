// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class RoutinesTab extends StatelessWidget {
  const RoutinesTab({
    super.key,
    this.title,
    this.icon,
    this.isSelected = false,
  });
  final String? title;
  final IconData? icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    assert(title != null || icon != null);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.black : Color(0xffe3e3e3),
          width: 1.1,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        child: Tab(
          iconMargin: EdgeInsets.zero,
          icon: icon != null ? Icon(icon, size: 24, color: Colors.black) : null,
          height: 37,
          child: title != null
              ? Text(
                  title!,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: !isSelected ? FontWeight.w400 : FontWeight.w500,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
