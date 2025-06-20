part of 'my_routines_view.dart';

class MyRoutinesContents extends StatelessWidget {
  final TabController _myRoutinetabController;

  const MyRoutinesContents({super.key, required TabController controller})
    : _myRoutinetabController = controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InnerRoutinesTabBar(
          tabController: _myRoutinetabController,
          innerRoutineTabs: [
            for (int i = 0; i < _myRoutinetabController.length; i++)
              InnerRoutinesTab(
                title: kRoutineTabTitles[i],
                isSelected: i == _myRoutinetabController.index,
              ),
            InnerRoutinesTab(icon: Icons.add),
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
