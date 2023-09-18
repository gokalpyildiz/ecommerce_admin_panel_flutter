import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // return AuthService.isLoggedIn
    //     ? null
    //     : const RouteSettings(name: '/auth/login');
    return null;
  }
}
