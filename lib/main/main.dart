// import 'package:data_provider/data_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_home_app/features/app/app.dart';
import 'package:smart_home_app/main/bootstrap/bootstrap.dart' show bootStrap;
// import 'package:hive_ce_flutter/hive_flutter.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  final talker = TalkerFlutter.init();
  getIt.registerSingleton<Talker>(talker);
  final router = AppRouter();
  getIt.registerSingleton<AppRouter>(router);

  bootStrap(talker, () async {
    return App();
  });
}
