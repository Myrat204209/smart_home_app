import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xeefbfbfd),
      foregroundColor: Colors.black,
      elevation: 0,
      toolbarHeight: 70,
      leadingWidth: 78,
      actionsPadding: EdgeInsets.only(right: 18.0),
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: CircleAvatar(
          foregroundImage: const AssetImage('assets/images/momo.png'),
          backgroundColor: Color(0xFFB4B4B4),
          radius: 30,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Icon(Icons.location_on, size: 18, color: Color(0xFF00512f)),
              Text(
                'Ashgabat,',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Turkmenistan',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),

      actions: [
        IconButton.outlined(
          color: Color.fromARGB(146, 247, 247, 247),
          icon: const Icon(CupertinoIcons.bell, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
