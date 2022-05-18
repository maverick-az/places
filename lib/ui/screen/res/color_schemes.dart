import 'package:flutter/material.dart';
import 'package:places/presets/colors/colors.dart';

/// Схема цветов темы приложения
extension AppColorScheme on ColorScheme {
  Color? get customButton => brightness == Brightness.dark
      ? AppColors.blackGreen
      : AppColors.whiteGreen;

  Color? get customWarning => brightness == Brightness.dark
      ? AppColors.blackYellow
      : AppColors.whiteYellow;

  Color? get customMain =>
      brightness == Brightness.dark ? AppColors.blackMain : AppColors.whiteMain;

  Color? get customDark =>
      brightness == Brightness.dark ? AppColors.blackDark : null;

  Color? get customSecondary => AppColors.secondary;
  Color? get customSecondary2 => AppColors.secondary2;
  Color? get customInativeBlack => AppColors.inactiveBlack;
}
