import 'package:flutter/material.dart';

/// Размеры для приложения
class AppSizes {
  /// размеры для AppBar
  static const double heightAppBar = 56;
  static const double heightAppBarLargeTitle = 128;
  static const double heightAppBarImage = 360;

  /// размеры для TabBar
  static const double heightTabBarStandard = 52;
  static const double heightTabStandard = 40;

  /// отступы
  static const double paddingTabVertical = 6;
  static const double paddingCommon = 16;
  static const double paddingDetailContentDivider = 24;
  static const double paddingSubtitleDivider = 2;
  static const double paddingAppBarLargeTitle = 40;
  static const double paddingAppBarTopNavigation = 36;
  static const double paddingBtnNormal = 15;
  static const double paddingBtnNormalWithIcon = 12;
  static const double paddingBtnSmall = 11;
  static const double paddingSpaceBetweenIconAndText = 10;

  /// радиусы
  static const Radius radiusNormal = Radius.circular(12);
  static const Radius radiusBtn = Radius.circular(24);
  static const Radius radiusBtnNormal = radiusNormal;
  static const Radius radiusBtnSwitch = Radius.circular(40);
  static const Radius radiusBtnTopNavigation = Radius.circular(10);
  static const Radius radiusBtnImageSlider = Radius.circular(8);

  /// размеры картинок
  static const double heightImageCard = 96;

  /// размеры для кнопок
  static const Size sizeBtnTopNavigation = Size.square(32);
  static const Size sizeBtnFavorite = Size(20, 18);

  /// размеры иконок
  static const Size sizeIcon = Size.square(24);
  static const Size sizeIconEmptyPage = Size.square(64);

  AppSizes._();
}
