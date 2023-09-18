// ignore_for_file: always_use_package_imports

import 'package:get_it/get_it.dart';

import '../navigator/auto_route/app_router_handler.dart';

class AppDependencyInjection {
  AppDependencyInjection._init();
  static final AppDependencyInjection _instance =
      AppDependencyInjection._init();
  static AppDependencyInjection get instance => _instance;
  final locator = GetIt.instance;
  void setupGetItLocators() {
    //locator.registerLazySingleton<AppRouterHandler>(AppRouterHandler.new);
  }
}
