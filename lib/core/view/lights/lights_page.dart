import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/core/view/lights/lights_view.dart';

@RoutePage()
class LightsPage extends StatelessWidget {
  const LightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lights'), centerTitle: true),
      body: Column(
        children: [
          Expanded(child: AutoRouter()),
          LightsView(),
        ],
      ),
    );
  }
}
