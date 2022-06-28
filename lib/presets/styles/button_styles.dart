import 'package:flutter/material.dart';
import 'package:places/presets/styles/app_sizes.dart';

/// Стили кнопак
class AppButtonStyle {
  /// Стиль стандартной кнопки ElevatedButton
  static final ButtonStyle elevatedButton = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingBtnNormalHorizontal,
        vertical: AppSizes.paddingBtnNormal,
      ),
    ),
    shape: MaterialStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(AppSizes.radiusBtnNormal),
      ),
    ),
  );

  AppButtonStyle._();
}
