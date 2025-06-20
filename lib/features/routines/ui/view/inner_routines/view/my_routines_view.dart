import 'package:flutter/material.dart';
import 'package:smart_home_app/features/routines/ui/ui.dart';


class MyRoutinesView extends StatefulWidget {
  const MyRoutinesView({super.key});

  @override
  State<MyRoutinesView> createState() => _MyRoutinesViewState();
}

class _MyRoutinesViewState extends State<MyRoutinesView>
    with SingleTickerProviderStateMixin {
  late final TabController _myRoutinetabController;

  @override
  void initState() {
    super.initState();

    _myRoutinetabController = TabController(length: 4, vsync: this);
    _myRoutinetabController.addListener(() {
      if (_myRoutinetabController.indexIsChanging) {}
      setState(() {});
    });
  }

  @override
  void dispose() {
    _myRoutinetabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        TabBar(
          controller: _myRoutinetabController,
          labelPadding: EdgeInsets.symmetric(horizontal: 4),
          dividerColor: Colors.transparent,
          padding: EdgeInsets.zero,

          tabAlignment: TabAlignment.start,
          indicatorColor: Colors.transparent,
          indicatorPadding: EdgeInsets.zero,
          isScrollable: true,
          tabs: [
            for (int i = 0; i < 3; i++)
              RoutinesTab(
                title: kRoutineTabTitles[i],
                isSelected: i == _myRoutinetabController.index,
              ),
            RoutinesTab(icon: Icons.add),
          ],
        ),
        // Expanded widget to fill the remaining space with the tab views
        Expanded(
          child: TabBarView(
            controller: _myRoutinetabController,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyRoutinesCollapsibleView(title: 'Manually run routines'),
                    MyRoutinesCollapsibleView(title: 'Automatic routines'),
                  ],
                ),
              ),

              Center(child: Text('Favorite Routines')),
              Center(child: Text('Scheduled Routines')),
              Center(child: Text('Add Routines')),
            ],
          ),
        ),
      ],
    );
  }
}
