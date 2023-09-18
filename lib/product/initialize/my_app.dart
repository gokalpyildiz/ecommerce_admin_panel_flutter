import 'package:ecommerce_yildiz_flutter/product/navigator/go_router/go_app_router.dart';
import 'package:flutter/material.dart';

import '../../core/utils/theme/app_style.dart';
import '../constants/app_constants.dart';
import '../constants/string_constants.dart';
import '../navigator/auto_route/app_router_handler.dart';
import '../utility/translation/translation_manager.dart';
import 'app_builder.dart';
import 'app_dependency_injection.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: AppConstants.debugShowCheckedModeBanner,
      builder: (context, child) => AppBuilder(child).build(),
      title: StringConstants.appName,
      //theme: AppTheme(context).theme.copyWith(useMaterial3: true),
      theme: AppTheme.lightTheme.copyWith(useMaterial3: true),
      darkTheme: AppTheme.darkTheme,
      // routerConfig: AppDependencyInjection.instance
      //     .locator<AppRouterHandler>()
      //     .config(),
      routerConfig: GoAppRoute.routes,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
