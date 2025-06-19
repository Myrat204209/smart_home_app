import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_home_app/features/app/app.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final AppRouter _router;
  late final Talker _talker;

  @override
  void initState() {
    super.initState();
    _talker = GetIt.I<Talker>();
    _router = GetIt.I<AppRouter>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // theme: AppTheme().themeData,
      themeMode: ThemeMode.system,
      routerConfig: _router.config(

        navigatorObservers: () => [
          TalkerRouteObserver(_talker),
          // SentryNavigatorObserver(),
        ],
      ),
    );
  }
}
