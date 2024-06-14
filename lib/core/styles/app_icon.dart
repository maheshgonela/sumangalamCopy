import 'package:flutter/material.dart';

// raw image
// with default size
// with custom size
class AppIcons {
  static const String _basePath = 'assets';
  static const String _imagesPath = '$_basePath/images';
  static AppIcon get login => AppIcon('$_imagesPath/login.svg');


  static AppIcon get appLogo => AppIcon('$_imagesPath/app_logo.png');
}

class AppIcon {
  final String path;

  AppIcon(this.path);

  Widget toImage([double? width, double? height]) =>
      Image.asset(path, width: width, height: height);

  Widget toWidget({
    double? width,
    double? height,
    Color? color,
  }) =>
      Image.asset(path, width: width, height: height, color: color);
}
