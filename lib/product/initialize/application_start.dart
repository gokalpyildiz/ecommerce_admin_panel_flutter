import 'package:ecommerce_yildiz_flutter/product/initialize/app_cache.dart';
import 'package:ecommerce_yildiz_flutter/product/initialize/app_dependency_injection.dart';
import 'package:flutter/material.dart';

@immutable
class ApplicationStart {
  const ApplicationStart._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppCache.instance.setup();
    AppDependencyInjection.instance.setupGetItLocators();
  }
}
