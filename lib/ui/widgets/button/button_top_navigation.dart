import 'package:flutter/material.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/app_sizes.dart';

/// Кнопка навигатора из AppBar
class ButtonTopNavigation extends StatelessWidget {
  const ButtonTopNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.sizeBtnTopNavigation.width,
      height: AppSizes.sizeBtnTopNavigation.height,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.all(
          AppSizes.radiusBtnTopNavigation,
        ),
      ),
    );
  }
}
