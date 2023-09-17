import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/theme/app_style.dart';
import '../../core/utils/theme/theme_customizer.dart';
import '../constants/app_constants.dart';
import '../constants/string_constants.dart';
import '../navigator/app_router_handler.dart';
import '../navigator/silincecek.dart';
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
    // return TranslationManager(
    //   child: MaterialApp.router(
    //     debugShowCheckedModeBanner: AppConstants.debugShowCheckedModeBanner,
    //     builder: (context, child) => AppBuilder(child).build(),
    //     title: StringConstants.appName,
    //     //theme: AppTheme(context).theme.copyWith(useMaterial3: true),
    //     theme: AppTheme.lightTheme.copyWith(useMaterial3: true),
    //     darkTheme: AppTheme.darkTheme,
    //     // routerConfig: AppDependencyInjection.instance
    //     //     .locator<AppRouterHandler>()
    //     //     .config(),
    //   ),
    // );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeCustomizer.instance.theme,
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: "/splash",
      getPages: getPageRoute(),
      // onGenerateRoute: (_) => generateRoute(context, _),
      builder: (_, child) {
        NavigationService.registerContext(_);
        return Directionality(
            textDirection: AppTheme.textDirection, child: child ?? Container());
      },
      localizationsDelegates: [
        // AppLocalizationsDelegate(context),
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      //supportedLocales: Language.getLocales(),

      // home: ButtonsPage(),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

class NavigationService {
  static BuildContext? globalContext;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void registerContext(BuildContext context, {bool update = false}) {
    if (globalContext == null || update) {
      globalContext = context;
    }
  }
}
