import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../constants/string_constants.dart';
import '../navigator/app_router_handler.dart';
import '../utility/translation/translation_manager.dart';
import 'app_builder.dart';
import 'app_dependency_injection.dart';
import 'app_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return TranslationManager(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: AppConstants.debugShowCheckedModeBanner,
        builder: (context, child) => AppBuilder(child).build(),
        title: StringConstants.appName,
        theme: AppTheme(context).theme,
        routerConfig: AppDependencyInjection.instance
            .locator<AppRouterHandler>()
            .config(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
