import 'package:flutter/material.dart';

enum ImageConstants {
  microphone('ic_microphone'),
  appIcon('ic_app_logo');

  final String value;
  const ImageConstants(this.value);

  String get toPng => 'assets/image/$value.png';
  Image get toImage => Image.asset(toPng);
}
