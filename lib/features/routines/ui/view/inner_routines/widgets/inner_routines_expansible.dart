// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InnerRoutinesExpansible extends StatefulWidget {
  const InnerRoutinesExpansible({super.key, required this.title});

  final String title;
  @override
  State<InnerRoutinesExpansible> createState() =>
      _InnerRoutinesExpansibleState();
}

class _InnerRoutinesExpansibleState extends State<InnerRoutinesExpansible> {
  late final ExpansibleController _innerExpansibleController;

  @override
  void initState() {
    super.initState();
    _innerExpansibleController = ExpansibleController();
    _innerExpansibleController.addListener(() {
      if (_innerExpansibleController.isExpanded) {
        // Handle expanded state
      } else {
        // Handle collapsed state
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _innerExpansibleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Expansible(
        controller: _innerExpansibleController,
        headerBuilder: (BuildContext context, Animation<double> animation) {
          return GestureDetector(
            onTap: () {
              if (_innerExpansibleController.isExpanded) {
                _innerExpansibleController.collapse();
              } else {
                _innerExpansibleController.expand();
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                RotationTransition(
                  turns: Tween(begin: 0.0, end: 0.5).animate(animation),
                  child: Icon(
                    _innerExpansibleController.isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ],
            ),
          );
        },
        bodyBuilder: (BuildContext context, Animation<double> animation) {
          return Column(
            children: [
              InnerRoutine(),
              InnerRoutine(),
              InnerRoutine(),
              InnerRoutine(),
            ],
          );
        },
        expansibleBuilder:
            (
              BuildContext c,
              Widget head,
              Widget bd,
              Animation<double> animation,
            ) => Column(children: [head, bd]),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutQuad,
        reverseCurve: Curves.easeOutCubic,
        maintainState: true,
        // Keep state even when collapsed,
      ),
    );
  }
}

class InnerRoutine extends StatelessWidget {
  const InnerRoutine({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.1)),
      color: Colors.white,
      shadowColor: Colors.black.withValues(alpha: 0.3),
      margin: EdgeInsets.all(2),
      elevation: 10,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 13.5, horizontal: 15),
        isThreeLine: true,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Light Bulbs',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(
              'Philips Hue 2',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff222222),
              ),
            ),
            Text(
              'Living Room',

              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xffa4a4a4),
              ),
            ),
          ],
        ),
        minTileHeight: 69,
        leading: IconButton(
          icon: Icon(
            Icons.lightbulb_outline,
            // size: 24,
            color: Colors.white,
          ),
          onPressed: () {},

          style: IconButton.styleFrom(
            backgroundColor: Colors.black,

            minimumSize: Size(70, 90),

            iconSize: 32,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.1),
            ),
          ),
        ),
        trailing: Switch.adaptive(value: false, onChanged: (value) {}),
      ),
    );
  }
}
