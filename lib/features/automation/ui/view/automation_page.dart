import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_ojak/features/automation/automation.dart';

@RoutePage()
class AutomationPage extends StatelessWidget {
  const AutomationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutomationView();
  }
}
