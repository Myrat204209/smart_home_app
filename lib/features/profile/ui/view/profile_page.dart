import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_ojak/features/profile/profile.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileView();
  }
}
