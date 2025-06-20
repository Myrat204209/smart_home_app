part of 'my_routines_view.dart';

class MyRoutinesContents extends StatelessWidget {
  final TabController _myRoutinetabController;

  final bool isExtendable;
  const MyRoutinesContents({
    super.key,
    required TabController controller,
    required this.isExtendable,
  }) : _myRoutinetabController = controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InnerRoutinesTabBar(
          tabController: _myRoutinetabController,
          innerRoutineTabs: [
            for (int i = 0; i < _myRoutinetabController.length - 1; i++)
              InnerRoutinesTab(
                title: kRoutineTabTitles[i],
                isSelected: i == _myRoutinetabController.index,
              ),
            if (isExtendable)
              InnerRoutinesTab(
                icon: Icons.add,
                isSelected:
                    _myRoutinetabController.length - 1 ==
                    _myRoutinetabController.index,
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
              Center(child: Text('Add Routines')),
            ],
          ),
        ),
      ],
    );
  }
}
