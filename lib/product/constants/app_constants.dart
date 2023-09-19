import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@immutable
final class AppConstants {
  AppConstants._();
  static const bool debugShowCheckedModeBanner = false;
  static DateFormat dateFormatter = DateFormat('dd/MM/yyyy');
  static DateFormat timeFormatter = DateFormat('jms');
}
