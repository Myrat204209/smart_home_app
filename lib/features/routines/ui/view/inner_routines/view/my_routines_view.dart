import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smart_home_app/features/routines/ui/ui.dart';


part 'my_routines_view.part.dart';

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
      if (_myRoutinetabController.indexIsChanging) {
        log('----------------------------');
        log(_myRoutinetabController.previousIndex.toString());

        log(_myRoutinetabController.index.toString());
      }
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
    return MyRoutinesContents(
      controller: _myRoutinetabController,
      isExtendable: true,
    );
  }
}
