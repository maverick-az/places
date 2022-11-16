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

  static const double heightSearchBar = 52;
  static const double heightCursor = 24;

  /// отступы
  static const double paddingTabVertical = 6;
  static const double paddingCommon = 16;
  static const double paddingDetailContentDivider = 24;
  static const double paddingSubtitleDivider = 2;
  static const double paddingAppBarLargeTitle = 40;
  static const double paddingAppBarTopNavigation = 36;
  static const double paddingBtnNormal = 15;
  static const double paddingBtnNormalWithIcon = 12;
  static const double paddingBtnNormalHorizontal = 22;
  static const double paddingBtnSmall = 11;
  static const double paddingSpaceBetweenIconAndText = 10;
  static const double paddingSpaceBetweenFiltersAndSlider = 40;
  static const double paddingListTileVertical = 12;
  static const double paddingListTileWithIconVertical = 4;

  /// размеры отсуппа иконок
  static const double paddingIconBig = 24;
  static const double paddingIconNormal = paddingIconBig / 2;
  static const double paddingIconSmall = paddingIconBig / 3;
  static const double paddingIconExtraSmall = paddingIconSmall / 2;

  /// отступы для полей ввода
  static const double paddingTextFieldHorizontal = 16;
  static const double paddingTextFieldVertical = 10;
  static const double paddingTextFieldLabel = 12;

  /// радиусы
  static const Radius radiusNormal = Radius.circular(12);
  static const Radius radiusBtn = Radius.circular(24);
  static const Radius radiusBtnNormal = radiusNormal;
  static const Radius radiusBtnSwitch = Radius.circular(40);
  static const Radius radiusBtnTopNavigation = Radius.circular(10);
  static const Radius radiusBtnImageSlider = Radius.circular(8);

  static const Radius radiusTextField = Radius.circular(8);

  /// размеры картинок
  static const double heightImageCard = 96;
  static const double widthImageListTile = 56;
  static const Size sizeImageListTile = Size.square(widthImageListTile);
  static const Size sizeImageLogo = Size.square(160);

  /// размеры для кнопок
  static const Size sizeBtnTopNavigation = Size.square(32);
  static const Size sizeBtnFavorite = Size(20, 18);
  static const Size sizeBtnCategory = Size.square(64);
  static const Size sizeBtnAddImage = Size.square(72);

  /// размеры иконок
  static const Size sizeIcon = Size.square(24);
  static const Size sizeIconEmptyPage = Size.square(64);
  static const Size sizeIconCategory = Size.square(32);
  static const Size sizeIconSuperSmall = Size.square(16);
  static const Size constraintIconTextField = Size(48, 40);

  AppSizes._();
}
