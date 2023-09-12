class SvgConstants {
  SvgConstants._init();
  static final SvgConstants _instance = SvgConstants._init();
  static SvgConstants get instance => _instance;
  String toPng(String name) => 'assets/image/$name.png';
  String get testPng => toPng('test');
}
