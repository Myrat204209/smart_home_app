import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/core/core.dart';

@RoutePage()
class SpeakerPage extends StatelessWidget {
  const SpeakerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeakerView();
  }
}