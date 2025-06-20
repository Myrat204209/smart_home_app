import 'package:flutter/material.dart';
import 'package:smart_home_app/core/core.dart';

class SpeakerView extends StatelessWidget {
  const SpeakerView({super.key});

  @override
  Widget build(BuildContext context) {
    return EnergyConsumptionWidget(
      currentConsumption: 0.45,
      totalPossible: 1.0,
      outsideConsumption: 0.85,
    );
  }
}
