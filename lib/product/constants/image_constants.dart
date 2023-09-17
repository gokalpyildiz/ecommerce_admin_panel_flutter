import 'package:ecommerce_yildiz_flutter/core/extensions/string_extension.dart';

// enum ImageConstants {
//   microphone('ic_microphone'),
//   appIcon('ic_app_logo'),
//   loginImage('login_logo');

//   final String value;
//   const ImageConstants(this.value);

//   String get toPng => 'assets/image/$value.png';
//   String get toJpg => 'assets/image/$value.jpg';
//   Image get toImage => Image.asset(toPng);
// }

class ImagePath {
  ImagePath._init();
  static final ImagePath _instance = ImagePath._init();
  static ImagePath get instance => _instance;

  final appIcon = 'ic_app_logo'.toPng;
  final loginImage = 'login_logo'.toJpg;
}
