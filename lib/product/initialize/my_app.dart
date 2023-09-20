import 'package:ecommerce_yildiz_flutter/product/navigator/getx_router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/theme/theme_customizer.dart';
import '../utility/translation/translation_manager.dart';

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
      // child: MaterialApp.router(
      //   debugShowCheckedModeBanner: AppConstants.debugShowCheckedModeBanner,
      //   builder: (context, child) => AppBuilder(child).build(),
      //   title: StringConstants.appName,
      //   //theme: AppTheme(context).theme.copyWith(useMaterial3: true),
      //   theme: AppTheme.lightTheme.copyWith(useMaterial3: true),
      //   darkTheme: AppTheme.darkTheme,
      //   routerConfig: AppDependencyInjection.instance
      //       .locator<AppRouterHandler>()
      //       .config(),
      // ),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        themeMode: ThemeCustomizer.instance.theme,
        //navigatorKey: NavigationService.navigatorKey,
        initialRoute: "/splash",
        getPages: AppPages.routes,
        // onGenerateRoute: (_) => generateRoute(context, _),
        // builder: (_, child) {
        //   NavigationService.registerContext(_);
        //   return Directionality(
        //       textDirection: AppTheme.textDirection, child: child ?? Container());
        // },
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
