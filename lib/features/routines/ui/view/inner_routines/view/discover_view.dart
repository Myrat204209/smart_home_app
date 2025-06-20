import 'package:flutter/material.dart';
import 'package:smart_home_app/features/routines/ui/ui.dart';

part 'discover_view.part.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {}
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelPadding: EdgeInsets.symmetric(horizontal: 4),
          dividerColor: Colors.transparent,
          padding: EdgeInsets.zero,
          tabAlignment: TabAlignment.start,
          indicatorColor: Colors.green.withAlpha(200),
          indicatorPadding: EdgeInsets.zero,
          isScrollable: true,
          tabs: const [
            InnerRoutinesTab(
              title: 'All',
              icon: Icons.all_inclusive,
              isSelected: false,
            ),
            InnerRoutinesTab(
              title: 'Favorites',
              icon: Icons.favorite,
              isSelected: false,
            ),
            InnerRoutinesTab(
              title: 'Scheduled',
              icon: Icons.schedule,
              isSelected: false,
            ),
          ],
        ),
        // Expanded widget to fill the remaining space with the tab views
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.lightbulb_outline),
                    title: Text('Routine ${index + 1}'),
                    subtitle: Text('Description of routine ${index + 1}'),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        // Handle favorite action
                      },
                    ),
                  );
                },
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
