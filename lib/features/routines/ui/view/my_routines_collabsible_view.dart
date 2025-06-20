// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyRoutinesCollapsibleView extends StatefulWidget {
  const MyRoutinesCollapsibleView({super.key, required this.title});

  final String title;
  @override
  State<MyRoutinesCollapsibleView> createState() =>
      _MyRoutinesCollapsibleViewState();
}

class _MyRoutinesCollapsibleViewState extends State<MyRoutinesCollapsibleView> {
  late final ExpansibleController _myCustomExpansibleController;

  @override
  void initState() {
    super.initState();
    _myCustomExpansibleController = ExpansibleController();
    _myCustomExpansibleController.addListener(() {
      if (_myCustomExpansibleController.isExpanded) {
        // Handle expanded state
      } else {
        // Handle collapsed state
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _myCustomExpansibleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expansible(
      controller: _myCustomExpansibleController,
      headerBuilder: (BuildContext context, Animation<double> animation) {
        return GestureDetector(
          onTap: () {
            if (_myCustomExpansibleController.isExpanded) {
              _myCustomExpansibleController.collapse();
            } else {
              _myCustomExpansibleController.expand();
            }
          },
          child: ListTile(
            title: Text(
              widget.title,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            trailing: RotationTransition(
              turns: Tween(begin: 0.0, end: 0.5).animate(animation),
              child: Icon(
                _myCustomExpansibleController.isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.deepPurple,
                size: 28,
              ),
            ),
            // ),
          ),
        );
      },
      bodyBuilder: (BuildContext context, Animation<double> animation) {
        return SizedBox(
          height: 300,
          child: GridView.builder(
            itemCount: 3,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.5,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_circle_fill,
                      size: 50,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Routine ${index + 1}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      expansibleBuilder:
          (
            BuildContext context,
            Widget header,
            Widget body,
            Animation<double> animation,
          ) {
            return Column(children: [header, body]);
          },
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutQuad,
      reverseCurve: Curves.easeOutCubic,
      maintainState: true,
      // Keep state even when collapsed,
    );
  }
}
