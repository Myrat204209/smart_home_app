import 'package:flutter/material.dart';

class AutomationView extends StatelessWidget {
  const AutomationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Automation View',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}