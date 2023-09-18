import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'product/initialize/app_cache.dart';
import 'product/initialize/app_dependency_injection.dart';
import 'product/initialize/application_start.dart';
import 'product/initialize/my_app.dart';

Future<void> main() async {
  //await ApplicationStart.init();
  await WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await AppCache.instance.setup();
  AppDependencyInjection.instance.setupGetItLocators();
  runApp(const MyApp());
}
