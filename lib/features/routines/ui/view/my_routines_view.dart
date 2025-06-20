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

    _myRoutinetabController = TabController(length: 3, vsync: this);
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
          indicatorColor: Colors.green.withAlpha(200),
          indicatorPadding: EdgeInsets.zero,
          isScrollable: true,
          tabs: const [
            RoutinesTab(
              
              title: 'All',
              icon: Icons.all_inclusive,
              isSelected: false,
            ),
            RoutinesTab(
              title: 'Favorites',
              icon: Icons.favorite,
              isSelected: false,
            ),
            RoutinesTab(
              title: 'Scheduled',
              icon: Icons.schedule,
              isSelected: false,
            ),
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
            ],
          ),
        ),
      ],
    );
  }
}
