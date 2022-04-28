import 'package:flutter/material.dart';

/// Размеры для приложения
class AppSizes {
  /// размеры для AppBar
  static const double heightAppBar = 56;
  static const double heightAppBarLargeTitle = 128;

  /// отступы
  static const double paddingCommon = 16;
  static const double paddingAppBarLargeTitle = 40;

  /// радиусы
  static const Radius radiusNormal = Radius.circular(12);
  static const Radius radiusBtn = Radius.circular(24);
  static const Radius radiusBtnNormal = radiusNormal;
  static const Radius radiusBtnSwitch = Radius.circular(40);
  static const Radius radiusBtnNavigation = Radius.circular(10);

  static const double heightImageCard = 96;

  AppSizes._();
}
