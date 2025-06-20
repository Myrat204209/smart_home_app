part of 'discover_view.dart';

class DiscoverContents extends StatelessWidget {
  const DiscoverContents({super.key, required TabController tabController})
    : _discoverTabController = tabController;

  final TabController _discoverTabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InnerRoutinesTabBar(
          tabController: _discoverTabController,
          innerRoutineTabs: const [
            InnerRoutinesTab(title: 'All'),
            InnerRoutinesTab(title: 'Favorites', isSelected: true),
            InnerRoutinesTab(title: 'Scheduled'),
          ],
        ),

        // Expanded widget to fill the remaining space with the tab views
        Expanded(
          child: TabBarView(
            controller: _discoverTabController,
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
