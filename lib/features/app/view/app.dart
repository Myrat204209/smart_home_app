// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smart_home_app/features/app/app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: AppView());
    // MultiBlocProvider(
    //   providers: [
    //   ],
    //   child: SafeArea(child: AppView()),
    // );
  }
}
