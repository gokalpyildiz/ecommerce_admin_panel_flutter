import 'package:ecommerce_yildiz_flutter/product/initialize/app_cache.dart';
import 'package:ecommerce_yildiz_flutter/product/initialize/app_dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

@immutable
class ApplicationStart {
  const ApplicationStart._();
  static Future<void> init() async {
    await WidgetsFlutterBinding.ensureInitialized();
    setPathUrlStrategy();
    await AppCache.instance.setup();
    AppDependencyInjection.instance.setupGetItLocators();
  }
}
