import 'package:flutter/material.dart';
import 'package:smart_home_app/core/view/lights/lights.dart';

class AutomationView extends StatelessWidget {
  const AutomationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LightsScreen());
  }
}
